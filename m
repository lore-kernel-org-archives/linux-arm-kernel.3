Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38975E7AD42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdmlUX0xonMzpVWoLTlsGAMgYz9cCmlRJGC9GYpT5a8=; b=V7/4/K4IZBe8o4/N+ieowq/dS+
	iQcqDPI3JwUEVTLY2Yeee6+03eclWx7gzD5haScHSSxLTWerO/1ANqK6zUw3qKofeTZyXTmAj0O1I
	rZ9OTF6/rCMtXTrdRbe1Fwg8riaRrWATmM01PcahNqMQsDH4a0qcSnNUHqKItcE1wo+5TzB1RbYMf
	iF5dFFZ8JvX6Am2dZRosUxNP5PWtK4QGsnowMG3dtfCpA1HL/FOqJRIKc6eXN6F6wgzKIKAqfr1OK
	6smiwR6EavBHbg9PI3Pvr1HMnl90TVy/tIWkVe3gkn1gzhPs82CYOAI9m572GH+x2VEtVWoam3n20
	CkAXTtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhEl-00000000FpU-3FfD;
	Thu, 25 Dec 2025 09:02:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhEi-00000000Fp4-3fBp;
	Thu, 25 Dec 2025 09:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D234F41AB0;
	Thu, 25 Dec 2025 09:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2303C4CEF1;
	Thu, 25 Dec 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653339;
	bh=ie7EaaBeEo6gHzNYGikN9tQMfrEcChNEiwfKvqsQdU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xy5mwcxZUR4UGgHnzMTecy/ESJza9JQUJkzQ/lgEHFZDijfuv1ePM91IpmtJvyRmC
	 CfHscNawRqNJDgAi1a5Lpt3zRx9H1mxWZWniqZ1XxwxlIrbtrQNcCyeWTpFNjiXCGV
	 ux5FK8OByykYzNp9u8HLAlVuJ4dWcuD+2+PsdCqQVQTpLpz2pt35NTtp0Z3+t8Sh6O
	 GBx+zDs8d1G+/JOcblkZjM+KsMMluL1br0vV7/EzqHCHtorh6pheZiHVWXjF/Rm1OS
	 taCESfjpoNXJlzHLKwaJeYVEIrR+5IrhvRAVVnKNyH3pr2Oz16zwwRytLuRc6DYMuT
	 mGZqTd8/8IEsg==
Date: Thu, 25 Dec 2025 10:02:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 2/5] virt: add Bao IPC shared memory driver
Message-ID: <20251225-nippy-umber-inchworm-ced095@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-3-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224135217.25350-3-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_010221_022879_9D717D3B 
X-CRM114-Status: GOOD (  34.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 24, 2025 at 01:52:14PM +0000, joaopeixoto@osyx.tech wrote:
> From: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
>=20
> Add a new driver providing an interface for communication with guests
> hosted by the Bao hypervisor using shared-memory channels. The driver
> exposes read/write regions defined in device tree and notifies the
> hypervisor via an architecture-specific hypercall (SMC/HVC on ARM and
> SBI ecall on RISC-V).
>=20
> The patch introduces:
>   - drivers/bao/ with the initial Bao IPC shared-memory implementation
>   - Kconfig entry enabling BAO_SHMEM
>   - Makefile integration for building the driver
>   - A character device interface supporting mmap(), read(), and write()
>   - Platform driver support using DT properties for channel layout
>=20
> Each device instance maps its assigned shared-memory region, validates
> read/write channel configuration, and exposes a /dev/baoipc<N> node
> used by user space to exchange data with Bao guests.
>=20
> Signed-off-by: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> ---
>  drivers/virt/Kconfig                 |   2 +
>  drivers/virt/Makefile                |   1 +
>  drivers/virt/bao/Kconfig             |   3 +
>  drivers/virt/bao/Makefile            |   3 +
>  drivers/virt/bao/ipcshmem/Kconfig    |   9 +
>  drivers/virt/bao/ipcshmem/Makefile   |   3 +
>  drivers/virt/bao/ipcshmem/ipcshmem.c | 539 +++++++++++++++++++++++++++
>  7 files changed, 560 insertions(+)
>  create mode 100644 drivers/virt/bao/Kconfig
>  create mode 100644 drivers/virt/bao/Makefile
>  create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
>  create mode 100644 drivers/virt/bao/ipcshmem/Makefile
>  create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
>=20
> diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
> index 52eb7e4ba71f..cb98c4c52fd1 100644
> --- a/drivers/virt/Kconfig
> +++ b/drivers/virt/Kconfig
> @@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
> =20
>  source "drivers/virt/acrn/Kconfig"
> =20
> +source "drivers/virt/bao/Kconfig"
> +
>  endif
> =20
>  source "drivers/virt/coco/Kconfig"
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index f29901bd7820..623a671f8711 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -10,3 +10,4 @@ obj-y				+=3D vboxguest/
>  obj-$(CONFIG_NITRO_ENCLAVES)	+=3D nitro_enclaves/
>  obj-$(CONFIG_ACRN_HSM)		+=3D acrn/
>  obj-y				+=3D coco/
> +obj-$(CONFIG_BAO_SHMEM)		+=3D bao/
> diff --git a/drivers/virt/bao/Kconfig b/drivers/virt/bao/Kconfig
> new file mode 100644
> index 000000000000..4f7929d57475
> --- /dev/null
> +++ b/drivers/virt/bao/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source "drivers/virt/bao/ipcshmem/Kconfig"
> diff --git a/drivers/virt/bao/Makefile b/drivers/virt/bao/Makefile
> new file mode 100644
> index 000000000000..68f5d3f282c4
> --- /dev/null
> +++ b/drivers/virt/bao/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_BAO_SHMEM) +=3D ipcshmem/
> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshme=
m/Kconfig
> new file mode 100644
> index 000000000000..42690073e819
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config BAO_SHMEM
> +	tristate "Bao hypervisor shared memory support"
> +
> +	help
> +	This enables support for Bao shared memory communication.
> +	It allows the kernel to interface with guests running under
> +	the Bao hypervisor, providing a character device interface
> +	for exchanging data through dedicated shared-memory regions.
> diff --git a/drivers/virt/bao/ipcshmem/Makefile b/drivers/virt/bao/ipcshm=
em/Makefile
> new file mode 100644
> index 000000000000..e027dcdb06aa
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_BAO_SHMEM) +=3D bao.o
> +bao-objs +=3D ipcshmem.o
> diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcs=
hmem/ipcshmem.c
> new file mode 100644
> index 000000000000..cadb79bfca6e
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
> @@ -0,0 +1,539 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Bao Hypervisor IPC Through Shared-memory Driver
> + *
> + * Copyright (c) Bao Project and Contributors. All rights reserved.
> + *
> + * Authors:
> + *	David Cerdeira <davidmcerdeira@osyx.tech>
> + *	Jos=C3=A9 Martins <jose@osyx.tech>
> + *	Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/uaccess.h>
> +#include <linux/fs.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/io.h>
> +#include <linux/mutex.h>
> +#include <linux/poll.h>
> +#include <linux/platform_device.h>
> +#include <linux/ioctl.h>
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/spinlock.h>
> +#include <linux/mutex.h>
> +#include <linux/wait.h>
> +#include <linux/mm.h>
> +
> +#if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
> +#include <linux/arm-smccc.h>
> +#include <asm/memory.h>
> +#elif CONFIG_RISCV
> +#include <asm/sbi.h>
> +#endif
> +
> +#define DEV_NAME "baoipc"
> +#define MAX_DEVICES 16
> +#define NAME_LEN 32
> +
> +static dev_t bao_ipcshmem_devt;
> +struct class *cl;
> +
> +/**
> + * struct bao_ipcshmem - Bao IPC shared memory device
> + * @cdev: Character device interface
> + * @dev: Device structure
> + * @id: Device instance ID
> + * @label: Name/label of the device
> + * @read_base: Base address of the read channel
> + * @read_size: Size of the read channel
> + * @write_base: Base address of the write channel
> + * @write_size: Size of the write channel
> + * @physical_base: Physical memory base address
> + * @shmem_size: Total size of the shared memory region
> + */
> +struct bao_ipcshmem {
> +	struct cdev cdev;
> +	struct device *dev;
> +	int id;
> +	char label[NAME_LEN];
> +	void *read_base;
> +	size_t read_size;
> +	void *write_base;
> +	size_t write_size;
> +	phys_addr_t *physical_base;
> +	size_t shmem_size;
> +};
> +
> +#ifdef CONFIG_ARM64

No ifdefs. Read Linux coding style first.

> +/**
> + * bao_ipcshmem_notify - Notify the Bao hypervisor of an IPC shared memo=
ry event (ARM64)
> + * @dev: IPC shared memory device
> + *
> + * Executes a fast SMC hypercall to notify the hypervisor of an event
> + * associated with the given IPC shared memory device.
> + *
> + * Return: Hypercall return value.
> + */
> +static uint64_t bao_ipcshmem_notify(struct bao_ipcshmem *dev)
> +{
> +	register uint64_t x0 asm("x0") =3D
> +		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
> +				   ARM_SMCCC_OWNER_VENDOR_HYP, 1);
> +	register uint64_t x1 asm("x1") =3D dev->id;
> +	register uint64_t x2 asm("x2") =3D 0;
> +
> +	asm volatile("hvc 0\t\n" : "=3Dr"(x0) : "r"(x0), "r"(x1), "r"(x2));
> +
> +	return x0;
> +}
> +#elif CONFIG_ARM
> +/**
> + * bao_ipcshmem_notify - Notify the Bao hypervisor of an IPC shared memo=
ry event (ARM)
> + * @dev: IPC shared memory device
> + *
> + * Executes a fast SMC hypercall to notify the hypervisor of an event
> + * associated with the given IPC shared memory device.
> + *
> + * Return: Hypercall return value.
> + */
> +static uint32_t bao_ipcshmem_notify(struct bao_ipcshmem *dev)
> +{
> +	register uint32_t r0 asm("r0") =3D
> +		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
> +				   ARM_SMCCC_OWNER_VENDOR_HYP, 1);
> +	register uint32_t r1 asm("r1") =3D dev->id;
> +	register uint32_t r2 asm("r2") =3D 0;
> +
> +	asm volatile("hvc #0\t\n" : "=3Dr"(r0) : "r"(r0), "r"(r1), "r"(r2));
> +
> +	return r0;
> +}
> +#elif CONFIG_RISCV
> +/**
> + * bao_ipcshmem_notify - Notify the Bao hypervisor of an IPC shared memo=
ry event (RISC-V)
> + * @dev: IPC shared memory device
> + *
> + * Executes an SBI call to notify the Bao hypervisor of an IPC shared me=
mory event.
> + *
> + * Return: SBI call error code.
> + */
> +static uint64_t bao_ipcshmem_notify(struct bao_ipcshmem *dev)
> +{
> +	struct sbiret ret =3D sbi_ecall(0x08000ba0, 1, dev->id, 0, 0, 0, 0, 0);
> +
> +	return ret.error;
> +}
> +#endif
> +
> +/**
> + * bao_ipcshmem_mmap_fops - mmap handler for IPC shared memory
> + * @filp: File pointer
> + * @vma: Virtual memory area
> + *
> + * Maps the physical shared memory of the Bao IPC device into
> + * userspace using remap_pfn_range.
> + *
> + * Return: 0 on success, -EFAULT on failure.
> + */
> +static int bao_ipcshmem_mmap_fops(struct file *filp, struct vm_area_stru=
ct *vma)
> +{
> +	struct bao_ipcshmem *bao =3D filp->private_data;
> +	unsigned long vsize =3D vma->vm_end - vma->vm_start;
> +	unsigned long offset =3D vma->vm_pgoff << PAGE_SHIFT;
> +	phys_addr_t paddr;
> +
> +	if (WARN_ON_ONCE(!bao))
> +		return -ENODEV;
> +
> +	if (!vsize)
> +		return -EINVAL;
> +
> +	if (offset >=3D bao->shmem_size)
> +		return -EINVAL;
> +
> +	if (vsize > bao->shmem_size - offset)
> +		return -EINVAL;
> +
> +	paddr =3D (phys_addr_t)bao->physical_base + offset;
> +
> +	if (!PAGE_ALIGNED(paddr))
> +		return -EINVAL;
> +
> +	if (remap_pfn_range(vma, vma->vm_start,
> +			    paddr >> PAGE_SHIFT,
> +			    vsize, vma->vm_page_prot))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +/**
> + * bao_ipcshmem_read_fops - read handler for IPC shared memory
> + * @filp: File pointer
> + * @buf: Userspace buffer
> + * @count: Number of bytes to read
> + * @ppos: File offset
> + *
> + * Copies data from the Bao IPC read buffer to userspace.
> + *
> + * Return: Number of bytes read, or 0 if EOF.
> + */
> +static ssize_t bao_ipcshmem_read_fops(struct file *filp, char __user *bu=
f,
> +				      size_t count, loff_t *ppos)
> +{
> +	struct bao_ipcshmem *bao =3D filp->private_data;
> +	size_t available;
> +
> +	if (WARN_ON_ONCE(!bao || !buf || !ppos))
> +		return -EINVAL;
> +
> +	if (*ppos >=3D bao->read_size)
> +		return 0;
> +
> +	available =3D bao->read_size - *ppos;
> +	if (count > available)
> +		count =3D available;
> +
> +	if (copy_to_user(buf, bao->read_base + *ppos, count))
> +		return -EFAULT;
> +
> +	*ppos +=3D count;
> +	return count;
> +}
> +
> +/**
> + * bao_ipcshmem_write_fops - write handler for IPC shared memory
> + * @filp: File pointer
> + * @buf: Userspace buffer
> + * @count: Number of bytes to write
> + * @ppos: File offset
> + *
> + * Copies data from userspace to the Bao IPC write buffer and
> + * notifies the hypervisor of the update.
> + *
> + * Return: Number of bytes written.
> + */
> +static ssize_t bao_ipcshmem_write_fops(struct file *filp, const char __u=
ser *buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	struct bao_ipcshmem *bao =3D filp->private_data;
> +	size_t avail;
> +
> +	if (WARN_ON_ONCE(!bao || !buf || !ppos))
> +		return -EINVAL;
> +
> +	if (*ppos >=3D bao->write_size)
> +		return 0;
> +
> +	avail =3D bao->write_size - *ppos;
> +	if (count > avail)
> +		count =3D avail;
> +
> +	if (copy_from_user(bao->write_base + *ppos, buf, count))
> +		return -EFAULT;
> +
> +	*ppos +=3D count;
> +
> +	/* Notify any listeners that new data is available */
> +	bao_ipcshmem_notify(bao);
> +
> +	return count;
> +}
> +
> +/**
> + * bao_ipcshmem_open_fops - open handler for IPC shared memory
> + * @inode: Inode pointer
> + * @filp: File pointer
> + *
> + * Associates the file with the Bao IPC device and increments
> + * the kobject reference.
> + *
> + * Return: 0 on success.
> + */
> +static int bao_ipcshmem_open_fops(struct inode *inode, struct file *filp)
> +{
> +	struct bao_ipcshmem *bao;
> +
> +	if (WARN_ON_ONCE(!inode || !filp))
> +		return -EINVAL;
> +
> +	bao =3D container_of(inode->i_cdev, struct bao_ipcshmem, cdev);
> +	filp->private_data =3D bao;
> +
> +	kobject_get(&bao->dev->kobj);
> +
> +	return 0;
> +}
> +
> +/**
> + * bao_ipcshmem_release_fops - release handler for IPC shared memory
> + * @inode: Inode pointer
> + * @filp: File pointer
> + *
> + * Disassociates the file from the Bao IPC device and decrements
> + * the kobject reference.
> + *
> + * Return: 0 on success.
> + */
> +static int bao_ipcshmem_release_fops(struct inode *inode, struct file *f=
ilp)
> +{
> +	struct bao_ipcshmem *bao;
> +
> +	if (WARN_ON_ONCE(!inode || !filp))
> +		return -EINVAL;
> +
> +	bao =3D container_of(inode->i_cdev, struct bao_ipcshmem, cdev);
> +	filp->private_data =3D NULL;
> +
> +	kobject_put(&bao->dev->kobj);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations bao_ipcshmem_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D bao_ipcshmem_read_fops,
> +	.write =3D bao_ipcshmem_write_fops,
> +	.mmap =3D bao_ipcshmem_mmap_fops,
> +	.open =3D bao_ipcshmem_open_fops,
> +	.release =3D bao_ipcshmem_release_fops
> +};
> +
> +/**
> + * bao_ipcshmem_register - Register a Bao IPC shared memory device
> + * @pdev: Platform device
> + *
> + * Maps the shared memory region, validates channel layout, initializes
> + * the read/write buffers, registers the character device, and creates
> + * the sysfs device entry.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int bao_ipcshmem_register(struct platform_device *pdev)

NAK, where did you get it from? Probe functions are ABSOLUTELY NEVER
called register.

> +{
> +	int ret =3D 0, id =3D -1;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct module *owner =3D THIS_MODULE;
> +	struct resource *r;
> +	dev_t devt;

No, read Linux coding style.

> +	resource_size_t shmem_size;
> +	u32 write_offset, read_offset, write_size, read_size;
> +	bool rd_in_range, wr_in_range, disjoint;
> +	void *shmem_base_addr =3D NULL;
> +	struct bao_ipcshmem *bao;

This is really poor coding style, barely readable and maintainable. You
need to rewtite this driver completely to match what we expect in Linux
kernel, for example base your work on last, reviewed code.

I am not even looking at rest of this - please prove that you value our
time by sending something following Linux kernel style.

Best regards,
Krzysztof


