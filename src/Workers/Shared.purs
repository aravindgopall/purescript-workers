module Workers.Shared
  ( class SharedWorkerEff, port
  , module Workers
  , module MessagePort
  ) where

import MessagePort (class MessagePortEff, MessagePort, close, onMessage, onMessageError, postMessage, postMessage', start)
import Workers     (class AbstractWorkerEff, Credentials(..), SharedWorker, Location, Navigator, WORKER, WorkerOptions, WorkerType(..), new, new', onError)


class (AbstractWorkerEff worker) <= SharedWorkerEff worker where
  -- | Returns sharedWorker’s MessagePort object which can be used
  -- | to communicate with the global environment.
  port
    :: worker
    -> MessagePort


instance sharedWorker :: SharedWorkerEff SharedWorker where
  port = _port


foreign import _port
  :: SharedWorker
  -> MessagePort
