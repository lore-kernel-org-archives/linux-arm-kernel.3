Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63256CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=h6gMhIo47d9WsNfxBpcLs07zyXs6dnFVGGnce8aevz8=; b=3usVKVcRAFYz51
	61u1HQWporOVARtLRizQrfRAe+zM56it80bsvqF/+GMRrHss6EBkb9juD19oRyHdbFEeSuhvSpE6N
	ocKYj4rLvR45DvTGsXzSyWQ3Wgc9x8T1G0CrIIhgvLehk4CLXy8cJiAIxO5g4GK9R5BhNYrfhvd+6
	3L2KoLMcPIep0q9qCx2QDrs6Rin1EA9hR3wc2ZaZdPvVodKT3N38iMq1RaSBReGhOXpF9ZODHxsPB
	OS72iNkInBrlZMQ3SDsRgIk6te++3vfx0kJE+KLx2AUZXVnEgU7zEUAUStsXhHmkgbfah+wHywuhR
	xDs2XFdo4AIARByyT64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzXq-0000000Epzl-1R5M;
	Wed, 17 Sep 2025 21:18:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzXo-0000000Epxb-2oOB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB1B060055;
	Wed, 17 Sep 2025 21:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A0DC4CEE7;
	Wed, 17 Sep 2025 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758143907;
	bh=Dkf08spIxA201bgB3U6VQQ/RiMff9Y1iizvcrMd6Ipw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eAFvS4Ajgc6dGXw+wpqk+89BbU6NxbLokTy88t5guS8V8kgaePfP/jBJ9cMNWnzG/
	 91uRTY7+56XLBLzDMi+MfWFAb3cKziHq8Op1EUnuPj7A5jt0cIc3zH1+MaH0t2bxoy
	 M74PI70kJJ7TH38wdUF0G+WuPgFK81TNHc4Iypc1a+5+uKmFR4i3hTg55ScwFiEZ3j
	 ZKFZaL31t7v6IGmdDn6taTUJugECvKCNJL3iIt0iPM53wtdsq9KCFY/mBl0oRNGXmD
	 1SXJ1JaF5aAGcpUWX6X2mSPDX1qEd4rjAiduq1luH+E/zBu70acdYR1EGl4uJaJIga
	 SwMvK40TkXXpg==
Date: Wed, 17 Sep 2025 16:18:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
Message-ID: <20250917211825.GA1874549@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912141436.2347852-2-vincent.guittot@linaro.org>
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

Suggest following convention for subject lines (run "git log --oneline
Documentation/devicetree/bindings/pci/"), e.g.,

  dt-bindings: PCI: s32g: Add NXP PCIe controller

On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> Describe the PCIe controller available on the S32G platforms.

> +        pcie0: pcie@40400000 {
> +            compatible = "nxp,s32g3-pcie",
> +                         "nxp,s32g2-pcie";
> +            dma-coherent;
> +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> +                  /* RC configuration space, 4KB each for cfg0 and cfg1
> +                   * at the end of the outbound memory map
> +                   */
> +                  <0x5f 0xffffe000 0x0 0x00002000>,
> +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> +                  reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> +                              "config", "addr_space";

Looks like an indentation error.  Shouldn't "reg-names" and subsequent
properties be aligned under "reg"?

> +                  #address-cells = <3>;
> +                  #size-cells = <2>;
> +                  device_type = "pci";
> +                  ranges =
> +                  /* downstream I/O, 64KB and aligned naturally just
> +                   * before the config space to minimize fragmentation
> +                   */
> +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> +                  /* non-prefetchable memory, with best case size and
> +                  * alignment
> +                   */
> +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> +
> +                  nxp,phy-mode = "crns";

If "nxp,phy-mode" goes with "phys", should it be adjacent to it?

> +                  bus-range = <0x0 0xff>;
> +                  interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +                                <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +                  interrupt-names = "link_req_stat", "dma", "msi",
> +                                    "phy_link_down", "phy_link_up", "misc",
> +                                    "pcs", "tlp_req_no_comp";
> +                  #interrupt-cells = <1>;
> +                  interrupt-map-mask = <0 0 0 0x7>;
> +                  interrupt-map = <0 0 0 1 &gic 0 0 0 128 4>,
> +                                  <0 0 0 2 &gic 0 0 0 129 4>,
> +                                  <0 0 0 3 &gic 0 0 0 130 4>,
> +                                  <0 0 0 4 &gic 0 0 0 131 4>;
> +                  msi-parent = <&gic>;
> +
> +                  num-lanes = <2>;
> +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> +        };
> +    };

