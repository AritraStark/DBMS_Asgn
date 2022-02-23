import React, { useState } from 'react';
import logo from './logo.svg';
import './App.css';
import { StudentTable } from './components/studentTable';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import ButtonGroup from '@mui/material/ButtonGroup';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import TextField from '@mui/material/TextField';
import { HandleTable } from './components/handleTable';

function App() {
  const [open, setOpen] = useState(false);
  const [addOpen, setAddOpen] = useState(false);
  const [editOpen, setEditOpen] = useState(false);
  const [actionState, setActionState] = useState();
  const [data, setData] = useState([])
  const [name, setName] = useState('')
  const [roll, setRoll] = useState('')
  const [dept_code, setDept_code] = useState('')
  const [address, setAddress] = useState('')
  const [phone, setPhone] = useState('')
  const [showData, setShowData] = useState([])
  const [error, setError] = useState(false)
  const [rolls, setRolls] = useState([])

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleAddClickOpen = () => {
    setAddOpen(true);
  };

  const handleAddClose = () => {
    setAddOpen(false);
    setError(false)
  };

  const wipe = () =>{
    setName('')
    setRoll('')
    setDept_code('')
    setAddress('')
    setPhone('')
  }

  const handleAdd = () => {
    if(!rolls.includes(roll)) 
      setData(prev=>[...prev, {name, roll, dept_code, address, phone}])
      setRolls(prev=>[...prev, roll])
  }

  const handleEdit =()=>{
    if(rolls.includes(roll)){
      const newData = data.filter(item=>item.roll!==roll)
      setData(newData)
      const newRolls = rolls.filter(item=>item!==roll)
      setRolls(newRolls)
      setData(prev=>[...prev, {name, roll, dept_code, address, phone}])
      setRolls(prev=>[...prev, roll])
    }
  }

  const handleEditClose = () => {
    setEditOpen(false)
  }

  const handleDelete = () =>{
    const newData = data.filter(item=>item.roll!==roll)
    setData(newData)
    const newRolls = rolls.filter(item=>item!==roll)
    setRolls(newRolls)
  }

  const handleSearch = () =>{
    const s = data.filter(i=>i.roll===roll)
    setShowData(s)
  }

  const handleAction = () => {
    switch (actionState) {
      case 'add':
        handleAdd()
        break;
      case 'edit':
        handleEdit()
        break;
      case 'delete':
        handleDelete()
        break;
      case 'search':
        handleSearch()
        break;
      case 'showAll':
        console.log('showAll');
        break;
      default:
        break;
    }
    wipe()
    handleAddClose()
    handleEditClose()
    handleClose()
  }
  return (
    <div className="App">
      <div className="main">
        <Typography variant="h4" component="div" gutterBottom>
          Student Actions
        </Typography>
        <ButtonGroup variant="outlined" aria-label="outlined button group" sx={{p:2}}>


{/* BUTTON GROUP START */} 

          <Button onClick={()=>{
            handleAddClickOpen()
            setActionState("add")
          }}>Add</Button>
          <Button onClick={()=>{
            setEditOpen(true)
            setActionState("edit")
          }}>Edit</Button>
          <Button onClick={()=>{
            handleClickOpen()
            setActionState("search")
            }}>Search</Button>
          <Button onClick={()=>{
            handleClickOpen()
            setActionState("delete")
          }}>Delete</Button>
          <Button onClick={()=>{
            setActionState("showAll")
          }}>Show All</Button>
        </ButtonGroup>

{/* ONLY ROLL FORM START */}

        <Dialog open={open} onClose={handleClose}>
          <DialogTitle>Roll Number</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Enter Roll Number for subsequent actions
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="roll"
              label="Roll Number"
              type="number"
              fullWidth
              variant="standard"
              value={roll}
              onChange={(e)=>{setRoll(e.target.value)}}
            />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button onClick={handleAction}>Execute</Button>
          </DialogActions>
        </Dialog>

{/* ADD DATA START */}

        <Dialog open={addOpen} onClose={handleAddClose}>
          <DialogTitle>Roll Number</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Enter Roll Number for subsequent actions
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="roll"
              label="Roll Number"
              type="number"
              fullWidth
              variant="standard"
              value={roll}
              onChange={(e)=>{setRoll(e.target.value)}}
            />
            <TextField
              
              margin="dense"
              id="dept_code"
              label="Dept Code"
              type="text"
              fullWidth
              variant="standard"
              value={dept_code}
              onChange={(e)=>{setDept_code(e.target.value)}}
            />
            <TextField
              
              margin="dense"
              id="name"
              label="Name"
              type="name"
              fullWidth
              variant="standard"
              value={name}
              onChange={(e)=>{setName(e.target.value)}}
            />
            <TextField
              
              margin="dense"
              id="address"
              label="Address"
              type="name"
              fullWidth
              variant="standard"
              value={address}
              onChange={(e)=>{setAddress(e.target.value)}}
            />
            
          </DialogContent>
          <DialogActions>
            <Button onClick={handleAddClose}>Cancel</Button>
            <Button onClick={handleAction}>Execute</Button>
          </DialogActions>
        </Dialog>

{/* EDIT DATA START */}

        <Dialog open={editOpen} onClose={handleEditClose}>
          <DialogTitle>Edit Data</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Enter Data to replace selected data
            </DialogContentText>
            <TextField
              autoFocus
              margin="dense"
              id="roll"
              label="Roll Number"
              type="number"
              fullWidth
              variant="standard"
              value={roll}
              onChange={(e)=>{setRoll(e.target.value)}}
            />
            <TextField
              
              margin="dense"
              id="dept_code"
              label="Dept Code"
              type="text"
              fullWidth
              variant="standard"
              value={dept_code}
              onChange={(e)=>{setDept_code(e.target.value)}}
            />
            <TextField
              
              margin="dense"
              id="name"
              label="Name"
              type="name"
              fullWidth
              variant="standard"
              value={name}
              onChange={(e)=>{setName(e.target.value)}}
            />
            <TextField
              
              margin="dense"
              id="address"
              label="Address"
              type="name"
              fullWidth
              variant="standard"
              value={address}
              onChange={(e)=>{setAddress(e.target.value)}}
            />
            
          </DialogContent>
          <DialogActions>
            <Button onClick={handleEditClose}>Cancel</Button>
            <Button onClick={handleAction}>Execute</Button>
          </DialogActions>
        </Dialog>

        <HandleTable type={actionState} data={data} showData={showData}/>
      </div>
    </div>
  );
}

export default App;
