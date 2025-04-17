Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE43EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzqP7Yl5tziBRehIHygQPOzt4W+nYsdx+tIOVpIyPaY=; b=fpSKQViWY11Iw7o5GNd6irFNh1
	JKEpZfFjS6k2bjkBQWPeSewaF6sn2NmvzWavxSf3ju7d2eqrKZXNJ5T9v8SgeUGgjM7GVl/tB/Y2H
	G4KJp7J6fLfs+mPmflSnhRO5+ZJ+CTtZ8His8Oytcvr90PpBpofJcBvpJOZPZMI1z2e3Nsry+0BhH
	YZ2ykRVNptGGM82tWxYQcwLXgHvLR1ouf1Ulx5wV0dFeIjy2A+JdkQrrVxWExZZXhcOawb8Hoe6Y1
	xs1UjbpZv1Wu3NYXV4a9L8nizl8FFNXdaQAzK3m/JXBp3BL/yYH3vt2xlO7twko4cLAx4f1Sg67Nc
	cjmM84JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Jba-0000000C4w2-2IOP;
	Thu, 17 Apr 2025 07:24:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JZi-0000000C4QE-3NSN;
	Thu, 17 Apr 2025 07:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B0845C038E;
	Thu, 17 Apr 2025 07:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4F0C4CEE4;
	Thu, 17 Apr 2025 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744874537;
	bh=njd0Ctie5/NJ/u0nIFo0b6CFaL7VXTbcT9S6B/AcLZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpvjqSLwnO5P4oov6RnrAJXFvg5T2B5X5w7SVvL3sYujMH5bf0IpFDTcWNfIXY8sH
	 ISYUjs240LTbyzWxSlvk3SclXPnsjL3106pN+tJLAWjKmn3VHFF7Dkv7sLwEFGnaQL
	 jbPsZicrvOsj6AzaMl8u9RifyRNNSY+vQLaAqOVjKE6IaSyVRqwQKv1FBYREQLvizv
	 6Qlexqzlh8L17ECPL6ZfzNikEUw2Vq+xekJevwisVsuJUZ75bXsBYkN4RMqBao9HPu
	 XjXV4gJprVmX3DLafD6kKfmLB3oyRheCLo9FBevmpnsY5IZ2zaxzsMPIxv3HYCxZNi
	 xjti22U8Axj/Q==
Date: Thu, 17 Apr 2025 09:22:12 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, kw@linux.com,
	bhelgaas@google.com, heiko@sntech.de,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <aACsJPkSDOHbRAJM@ryzen>
References: <20250416151926.140202-1-18255117159@163.com>
 <aACoEpueUHBLjgbb@ryzen>
 <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_002218_932667_942D9BED 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, Apr 17, 2025 at 03:08:34PM +0800, Shawn Lin wrote:
> 在 2025/04/17 星期四 15:04, Niklas Cassel 写道:
> > Hello Hans,
> > 
> > On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
> > > The RK3588's PCIe controller defaults to a 128-byte max payload size,
> > > but its hardware capability actually supports 256 bytes. This results
> > > in suboptimal performance with devices that support larger payloads.
> > 
> > Patch looks good to me, but please always reference the TRM when you can.
> > 
> > Before this patch:
> > 		DevCap: MaxPayload 256 bytes
> > 		DevCtl: MaxPayload 128 bytes
> > 
> > 
> > As per rk3588 TRM, section "11.4.3.8 DSP_PCIE_CAP Detail Registers Description"
> > 
> > DevCap is per the register description of DSP_PCIE_CAP_DEVICE_CAPABILITIES_REG,
> > field PCIE_CAP_MAX_PAYLOAD_SIZE.
> > Which claims that the value after reset is 0x1 (256B).
> > 
> > DevCtl is per the register description of
> > DSP_PCIE_CAP_DEVICE_CONTROL_DEVICE_STATUS, field PCIE_CAP_MAX_PAYLOAD_SIZE_CS.
> > Which claims that the reset value is 0x0 (128B).
> > 
> > Both of these match the values above.
> > 
> > As per the description of PCIE_CAP_MAX_PAYLOAD_SIZE_CS:
> > "Permissible values that
> > can be programmed are indicated by the Max_Payload_Size
> > Supported field (PCIE_CAP_MAX_PAYLOAD_SIZE) in the Device
> > Capabilities (DEVICE_CAPABILITIES_REG) register (for more
> > details, see section 7.5.3.3 of PCI Express Base Specification)."
> > 
> > So your patch looks good.
> > 
> > I guess I'm mostly surprised that the e.g. pci_configure_mps() does not
> > already set DevCtl to the max(DevCap.MPS of the host, DevCap.MPS of the
> > endpoint).
> > 
> > Apparently pci_configure_mps() only decreases MPS from the reset values?
> > It never increases it?
> > 
> 
> Actually it does:
> 
> https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt#L4757

If that is the case, then explain the before/after with Hans lspci output here:
https://lore.kernel.org/linux-pci/bb40385c-6839-484c-90b2-d6c7ecb95ba9@163.com/

His patch changes the default value of DevCtl.MPS (from 128B to 256B), but if
pci_configure_mps() can bump DevCtl.MPS to a higher value, his patch should not
be needed, since the EP (an NVMe SSD in his case) has DevCap.MPS 512B, and the
RC itself has DevCap.MPS 256B.

Seems like we are missing something here.


Kind regards,
Niklas

