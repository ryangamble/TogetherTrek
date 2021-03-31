import React from 'react'
import { Card, CardColumns, CardDeck } from 'react-bootstrap'
import { useSelector } from 'react-redux'
import MessageBoard from '../components/MessageBoard'

const MessagesScreen = () => {
  const { userInfo } = useSelector((state) => state.userLogin)
  const { messageBoardsInfo } = useSelector((state) => state.getMyMessageBoards)
  console.log(messageBoardsInfo)
  return (
    <>
      <h2>MessageBoards</h2>
      <CardColumns>
        {messageBoardsInfo.map((msb) => (
          <MessageBoard messageBoardInfo={msb} key={msb._id} />
        ))}
      </CardColumns>
    </>
  )
}

export default MessagesScreen
