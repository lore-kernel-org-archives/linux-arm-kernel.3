Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EF3106288E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYbMM0oV4uJZ5DTlaHqKUjK6IwMF60wu71++mK95U8E=; b=OCCAP+cpeDfV5IFwEb3WNbnYoo
	5ls1WNFBeBOT2rCPQMoXeeIJduJfoErMP8Cia9tufe7XWANcwtOjaL50AwZY5qe9q4KNcmsWGy284
	yMjbl9qRYpRT02QaAifVgxMiawlgIW0WpgVmano44mny8YBZnnWipfxCDKEICfiTq0ft+ASNM9rXe
	dhPMZBX6pVBSWf27zQBcukl/8O1IOqds0n4Qgd6N30FVfUDnGvxQZymjjAa3Z96n+rzcND9M5AK05
	EKB4jlWd+P5Br0LMF1Kk+5rYJw32Z5WmlU5hdDdO/aI6nS3FR6lU2oREqOEYYG1CqCgIQq5H8x7S5
	EBGnOs1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Il0-0000000BZ7O-0pdY;
	Wed, 11 Mar 2026 12:33:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Iky-0000000BZ6i-217X;
	Wed, 11 Mar 2026 12:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEB4E444A6;
	Wed, 11 Mar 2026 12:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A80C4CEF7;
	Wed, 11 Mar 2026 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773232423;
	bh=+J1EgSs3yVorF0G+jb94JiobSJNb8UX0YbEzR1remQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJvRthEmWqz76nsAf972JnvXxTWFbzxueKgKXgL7xDkHyW36BBSCIQBATnuxbCAoK
	 SeqYc3bhQbkREYqkHDivdLSaYwVM4egN56Yi+5kg/wQ/KHMMzwJiz7Pcj2NVl0MyZ2
	 YFfJfEZXb0Q2YM+vGnhARKXtYTMs/21KFX1C6uzstcfz+yQzFjWlY2DNTr2xKhkCTb
	 aLGPXXb38lVwC1kGY0L7o2/DYp2fEeATbHcr51XRe1l+J6Md51ncGhQmJZY/VMX5vf
	 yqgVLSB6dG9tNkwD4ghuSmm/PENZBdFaBOGP8rq8RNTIRPkGALY18ptSLZssx+asCP
	 H5AuroHcT7P3w==
Date: Wed, 11 Mar 2026 18:02:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <pvef2ck2xpmq6amueka25odt6wjd3usmkjspf3mvlmfzsd7lyz@5eraltok22tq>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_053344_574739_4338752E 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, Mar 04, 2026 at 12:18:59PM +0530, Manivannan Sadhasivam wrote:
> 
> On Thu, 26 Feb 2026 15:40:23 +0530, Anand Moon wrote:
> > Rockchip DWC PCIe driver currently performs synchronous link training for
> > combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> > the link to be fully established, adding several milliseconds to the boot
> > sequence. To optimize boot time, this change enables asynchronous probing,
> > allowing link establishment to proceed in the background while the kernel
> > continues probing other devices.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] PCI: dw-rockchip: Enable async probe by default
>       commit: ec392abc95932838bf7e3d659d358f4df9ff5a0a
> 

Dropped the patch from controller/dwc-rockchip branch due to concerns with the
potential deadlock in the phylib. When Bjorn updates the pci/next branch, this
will get dropped from linux-next as well.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

