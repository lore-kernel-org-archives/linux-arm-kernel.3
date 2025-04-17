Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AFFC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhjvZ2JRR5EyoY0B1vtxKVPb3zuD+k++ITAMYs8q1PE=; b=SCUbeUi34GfH2maEwK6je3rDwP
	w5nZwQDs18BiMdPSjulXMv1YkcpfytMPkfwYaInnY4XykWHm3Gwp1fLF9PfUAObi+/XBbu9414995
	24cum34bBOauK8iquilBxOGgCLyP6aXCibKM2NlyJhak7DF6ZWNVzNdLYNmNIX/Y5ALT/VP1233H5
	DqO5nZ6rYwhE9CBf/U6VeYVqBk/TU7WfN003QSEd9eH8lvTd0yAlWmsDJyqUB8Mn/Io6/GTmJ3FEg
	eaJ/JND2bqKGVYfOHLkcBdgjMxwqgqulUYSJR3W+kNaG7sYY5NQRw/7XixTWeSjqWXltW9AVzQOf6
	84xqdXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JOw-0000000C2S4-44ry;
	Thu, 17 Apr 2025 07:11:10 +0000
Received: from mail-m1973188.qiye.163.com ([220.197.31.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JN5-0000000C2BK-2L6P;
	Thu, 17 Apr 2025 07:09:17 +0000
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1232f7211;
	Thu, 17 Apr 2025 15:09:09 +0800 (GMT+08:00)
Message-ID: <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
Date: Thu, 17 Apr 2025 15:08:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, heiko@sntech.de, manivannan.sadhasivam@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, thomas.richard@bootlin.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
To: Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>
References: <20250416151926.140202-1-18255117159@163.com>
 <aACoEpueUHBLjgbb@ryzen>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <aACoEpueUHBLjgbb@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1PS1YdTh9MTR0YHxlPHR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9642947cc309cckunm1232f7211
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxA6Dgw6LTJWGhBPTThCVige
	SEhPCxdVSlVKTE9PQ0xITE5KSE5CVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlDSE03Bg++
DKIM-Signature: a=rsa-sha256;
	b=Bru4i23kQYP97Nux3LeWYaNmKGGkZOkOZHQ0UKzubnL1kmVrx40dZe9StL44MeqBGjDHQsj/p2arOdsfDLIMDj7XsnYJaSq8EMu/yUacpIEFeqa5MGha3wpPB1oztmJIUtu4dZy5cnd8M4RGAKe/Stpn69AXKrNpf617Id0ZB04=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=NhjvZ2JRR5EyoY0B1vtxKVPb3zuD+k++ITAMYs8q1PE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_000916_051484_5763B5EA 
X-CRM114-Status: GOOD (  13.53  )
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

在 2025/04/17 星期四 15:04, Niklas Cassel 写道:
> Hello Hans,
> 
> On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
>> The RK3588's PCIe controller defaults to a 128-byte max payload size,
>> but its hardware capability actually supports 256 bytes. This results
>> in suboptimal performance with devices that support larger payloads.
> 
> Patch looks good to me, but please always reference the TRM when you can.
> 
> Before this patch:
> 		DevCap: MaxPayload 256 bytes
> 		DevCtl: MaxPayload 128 bytes
> 
> 
> As per rk3588 TRM, section "11.4.3.8 DSP_PCIE_CAP Detail Registers Description"
> 
> DevCap is per the register description of DSP_PCIE_CAP_DEVICE_CAPABILITIES_REG,
> field PCIE_CAP_MAX_PAYLOAD_SIZE.
> Which claims that the value after reset is 0x1 (256B).
> 
> DevCtl is per the register description of
> DSP_PCIE_CAP_DEVICE_CONTROL_DEVICE_STATUS, field PCIE_CAP_MAX_PAYLOAD_SIZE_CS.
> Which claims that the reset value is 0x0 (128B).
> 
> Both of these match the values above.
> 
> As per the description of PCIE_CAP_MAX_PAYLOAD_SIZE_CS:
> "Permissible values that
> can be programmed are indicated by the Max_Payload_Size
> Supported field (PCIE_CAP_MAX_PAYLOAD_SIZE) in the Device
> Capabilities (DEVICE_CAPABILITIES_REG) register (for more
> details, see section 7.5.3.3 of PCI Express Base Specification)."
> 
> So your patch looks good.
> 
> I guess I'm mostly surprised that the e.g. pci_configure_mps() does not
> already set DevCtl to the max(DevCap.MPS of the host, DevCap.MPS of the
> endpoint).
> 
> Apparently pci_configure_mps() only decreases MPS from the reset values?
> It never increases it?
> 

Actually it does:

https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt#L4757

> 
> Kind regards,
> Niklas
> 
> 

