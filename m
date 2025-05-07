Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A98C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfrGUW9NBtW0VgcqDQQ8pkaMk6ew8J6ADJ5IyHGPeNY=; b=VSXbM5kPFuuc5cWoI+ETmHxuy5
	oPlstv4Em8azvXUGaRxy/ENIbIOesGY4VQj4nU6W9CIfVp/f67m9IjRXVxBF4r40vXdwKmpd+XSBZ
	kYA6Mc4me75ge+gEmGcB5in84olhI8QW7jzPvTjFAWU3aLkSq68TCS7iipG+BgzfUFi+EakixseQi
	D/r4cv611j3qE9ra7FR8pV2hIsKmr7XFhlVessm6TsqYUX+nwSZh1aoRJwUIPYXbf3NLRVtazIzGI
	TxraEmL6VMKLTjKIFZV3MjaLHhGYNQNgf2/NdUa7/Ydl77kAP6328Yv5mvVm5YyMX/zcY2nJ/Nxeq
	Qc7leU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXW-0000000GJiO-3CdT;
	Wed, 07 May 2025 17:26:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChkv-0000000GB9G-0RDa;
	Wed, 07 May 2025 16:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69E31629E5;
	Wed,  7 May 2025 16:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5089C4CEE2;
	Wed,  7 May 2025 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746635784;
	bh=cjO4ygzINjwIC1ncU+oe4aI5LkAeIM5Tar8FVF/MIo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4xVl3aSH4fNvgokVYKqSMtjFz8SUI1ZllOCWtTjUmLBm+mzmmK79sTUQgS/Z7/8h
	 vUR24xkBtrdqW6gDOYL/p/7PhStwZupg3enNxZoAiEfJ5rrfJHqKjElqf1+gxfbxOC
	 sklrsBJ7ynRb7IfS6eHq0aWNLlqY1MiE4ngk6mhc8wBhQUVbhihA7ZiMdIqKl7lbbE
	 jnhNQvqZJrEqEdsTzAzoTgKh+HWWiWn65umxq8q4ezBMENpkAyX5bx0vAAP3LT/W1c
	 YXGglVvg3MoiU+ZDLlk+bOZXdsT+CLuWhLATlFRubj/lFyAqFngYhVzmu+7i06CAO/
	 lSfNYb9vACEQA==
Received: by pali.im (Postfix)
	id 8C20E5F1; Wed,  7 May 2025 18:36:20 +0200 (CEST)
Date: Wed, 7 May 2025 18:36:20 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org,
	yue.wang@Amlogic.com, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <20250507163620.53v5djmhj3ywrge2@pali>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
User-Agent: NeoMutt/20180716
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

On Wednesday 07 May 2025 23:06:51 Hans Zhang wrote:
> On 2025/5/7 23:03, Hans Zhang wrote:
> > On 2025/5/7 01:41, Pali Rohár wrote:
> > > On Wednesday 07 May 2025 01:34:39 Hans Zhang wrote:
> > > > The Aardvark PCIe controller enforces a fixed 512B payload size via
> > > > PCI_EXP_DEVCTL_PAYLOAD_512B, overriding hardware capabilities and PCIe
> > > > core negotiations.
> > > > 
> > > > Remove explicit MPS overrides (PCI_EXP_DEVCTL_PAYLOAD and
> > > > PCI_EXP_DEVCTL_PAYLOAD_512B). MPS is now determined by the PCI core
> > > > during device initialization, leveraging root port configurations and
> > > > device-specific capabilities.
> > > > 
> > > > Aligning Aardvark with the unified MPS framework ensures consistency,
> > > > avoids artificial constraints, and allows the hardware to operate at
> > > > its maximum supported payload size while adhering to PCIe
> > > > specifications.
> > > > 
> > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > ---
> > > >   drivers/pci/controller/pci-aardvark.c | 2 --
> > > >   1 file changed, 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/pci-aardvark.c
> > > > b/drivers/pci/controller/pci-aardvark.c
> > > > index a29796cce420..d8852892994a 100644
> > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct
> > > > advk_pcie *pcie)
> > > >       reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > >       reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
> > > >       reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> > > > -    reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
> > > >       reg &= ~PCI_EXP_DEVCTL_READRQ;
> > > > -    reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
> > > >       reg |= PCI_EXP_DEVCTL_READRQ_512B;
> > > >       advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
> > > > -- 
> > > > 2.25.1
> > > > 
> > > 
> > > Please do not remove this code. It is required part of the
> > > initialization of the aardvark PCI controller at the specific phase,
> > > as defined in the Armada 3700 Functional Specification.
> > > 
> > > There were reported more issues with those Armada PCIe controllers for
> > > which were already sent patches to mailing list in last 5 years. But
> > > unfortunately not all fixes were taken / applied yet.
> > 
> > Hi Pali,
> > 
> > I replied to you in version v2.
> > 
> > Is the maximum MPS supported by Armada 3700 512 bytes?

IIRC yes, 512-byte mode is supported. And I think in past I was testing
some PCIe endpoint card which required 512-byte long payload and did not
worked in 256-byte long mode (not sure if the card was not able to split
transaction or something other was broken, it is quite longer time).

> > What are the default values of DevCap.MPS and DevCtl.MPS?

Do you mean values in the PCI-to-PCI bridge device of PCIe Root Port
type?

Aardvark controller does not have the real HW PCI-to-PCI bridge device.
There is only in-kernel emulation drivers/pci/pci-bridge-emul.c which
create fake kernel PCI device in the hierarchy to make kernel and
userspace happy. Yes, this is deviation from the PCIe standard but well,
buggy HW is also HW.

And same applies for the pci-mvebu.c driver for older Marvell PCIe HW.

> > Because the default value of DevCtl.MPS is not 512 bytes, it needs to be
> > configured here, right?
> > 
> > If it's my guess, RK3588 also has the same requirements as you, just
> > like the first patch I submitted.
> > 
> > Please take a look at the communication history:
> > https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
> And this:
> https://patchwork.kernel.org/project/linux-pci/patch/20250425095708.32662-2-18255117159@163.com/

These changes are referring the to root ports PCI devices, which are not
applicable for aardvark PCIe controller.

> > 
> > Please test it using patch 1/3 of this series. If there are any
> > problems, please let me know.
> > 
> > 
> > Best regards,
> > Hans
> 

Sorry, but I stopped doing any testing of the aardvark driver with the
mainline kernel after PCI maintainers stopped taking fixes for the
driver and stopped responding.

I'm not going to debug same issues again, which I have analyzed,
prepared fixes, sent patches and see no progress there.

Seems that there is a status quo, and I'm not going to change it.

