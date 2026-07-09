Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqMttItt0pf+IcTJhIeWNZ9VHmFvWCzWLjBMEsf634s=; b=E0IfdpaN7SYmEVWPZUDU1BciXe
	K2UdeKVYaBbVDl/0MpHpZ8Vhm9Z8TVpl6qz4+fmSEyvVg2kdYKBbD860Ooq8/kTunD9NQ6iK31YVu
	5e6I0pblft3TumyLO9SSM49M991OMDBmO03QVMWNPjqdiKoELtmrLwfNuk3dVcSrXfLjA/Sx/r15c
	uzykmHoHMINOOKNSwEjA64a1yn8t4ulpB80VCxPjj6KpoOOLf+KritH1Y94eXp6zEK2zvr4KInSwJ
	66z0UFX+q6MOQviG1l/ronfTo5OW74aHcGICfBiOn3XsJFVW5h0jhVBq7eafVRXN67DDDdd0/g/Vm
	CzHjUZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoLo-00000002U9R-0M0a;
	Thu, 09 Jul 2026 12:59:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoLn-00000002U9G-015p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:59:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76DA9601D9;
	Thu,  9 Jul 2026 12:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0781F000E9;
	Thu,  9 Jul 2026 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783601974;
	bh=tqMttItt0pf+IcTJhIeWNZ9VHmFvWCzWLjBMEsf634s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJyPhLvbi/hb55SdQlQjgiAAGpUqF6UxSc83CCFPtEGvMQF4U+r8x+5gLWf1o0zM5
	 gKmlmZUTLqW9tPTtw2gJ5XaqppVjixK+Q7YggF8Gx8Y08nNVkWGuSylILlwyEzFxBe
	 woYOsUKB98S+3f10X9FsekSMOAHjw+NgdsDkoam9UzUplgv1CY1cVr8SB9YuSMj5ez
	 FIOGpXszWaKItE/VjbvXHdi/joeTcx/VpLXAZb4ysEMB3g9TXnh/Hnd4Ld/XodmSYr
	 w3uv+b4k4k7UaU2901kIiMBcU26pgR7xFOXHjSrjYT8rP0VflsPs9dBC7/idsB6JDM
	 iM5yzV3n+XWXw==
Date: Thu, 9 Jul 2026 14:59:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle
 GIC ITS
Message-ID: <ael3rodbevow3q7r4y6zavouh3pvoljmyaev5it6dknyaw7vcb@szfampjit4ds>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <178360186732.755595.3582150626313807959.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178360186732.755595.3582150626313807959.b4-ty@b4>
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

On Thu, Jul 09, 2026 at 02:57:47PM +0200, Manivannan Sadhasivam wrote:
> 
> On Tue, 07 Jul 2026 22:35:38 +0200, Marek Vasut wrote:
> > Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> > case MSI are enabled and disabled.
> > 
> > Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> > configured to 32-bit address width for AXI or APB interface.
> > 
> > Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> > implementation cacheable and shareable limitations.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [3/5] irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>       commit: 96b193897fd374fcb63a782c52f8b079134d0222
> [4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>       commit: 14e8394423ffd4fd28884ec8b4d5ba15be6e7e0d

B4 got confused here. I applied all 4 patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

