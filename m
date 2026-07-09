Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxbdaaWxpr16WNk35CrzdmbV8r7MBy1PuvbOHdfmxDE=; b=rTQQzSkHhzYLZqis/TQaauEUC9
	OXJxLWUK1CSvS/MudmMfmWCG0rSJYqDvN8S1XK2GPu/EOYjUMbCH9Ozj2GO2tD2qYo2oJrTqvMUIr
	siUCnpqWm7zCaLWqEwlUDrBaMXelaqABXpJx6Ly7HxTndbmDlZjWxOm57iUgJ/oILJkefMrCcaXdK
	IuuREn6xAFSW+qcoSfgEASH9Z+6Xuzft4TQYCwEtlYf/dZy33hv3Un9kGeSF9ihbil0uLRmj/94Ce
	THqhy/JTOCFau3yHFk2ap5FzuSmEaXNWsPSDp+RS9OhnYi9LXfdrHj6KlXnM6qSTZvlMOQDC0Jkiv
	DEk20kxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnj8-00000002Nzb-19Vq;
	Thu, 09 Jul 2026 12:19:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnj7-00000002Nz8-09y5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:19:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F026001A;
	Thu,  9 Jul 2026 12:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99FD1F000E9;
	Thu,  9 Jul 2026 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599575;
	bh=gxbdaaWxpr16WNk35CrzdmbV8r7MBy1PuvbOHdfmxDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OBUR1DGwpGFYcbqf0LlDuPPlLYUTgZvfuO5U6Ul/MnY4wx0OBCbaIyS958hgXIYQG
	 K3HyWh9Y84+xfOKpEaJhGRzvHqiItFCexfHA+pSGdHlXhZciC3L2cfVf9qbx4JceWy
	 YBovMQRpd8h8XhMCf/+oCvIa75iStdsgTUnQ3TJrH4YcsNwjLTud6dXAvg0OlXAd+L
	 gwjJfuv3x9oPyJ9zGYNSbp+XSBA4qzthNNE/oLdkz3bagqc/Xp196k1RKx56yjt7et
	 apjnSUESOnPia+q48p/WW3GU1rQT6yzxATz4Lrt3TbnFds9+jUD/nxLrh+cPUmVmrn
	 ACdrFZmlY6HkQ==
Date: Thu, 9 Jul 2026 14:19:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Message-ID: <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
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

On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> case MSI are enabled and disabled.
> 
> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> configured to 32-bit address width for AXI or APB interface.
> 
> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> implementation cacheable and shareable limitations.
> 
> Marek Vasut (5):
>   PCI: dwc: Determine whether iMSI is used before calling .init
>   PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>   irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>   irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround

Is there a functional dependency between irqchip and PCI patches? Since the
irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
through PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

