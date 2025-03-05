Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1178AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bf7yQwmSVHSL8dT9g+S0ac77udwZW3g7PxEag2XDX/I=; b=gGyy/B8Rse1c/ymM7JU+fAO2HV
	I7qKmIANWfg5M7NxJiJzN+72+Q9d5WMQgtxZ08n9jYbNr1B8TFTy778atMVv0jaI/kceqOQCB/TsI
	kKcjjEiIPGdvzqVxN52BvsOLuaFs0nCNAQwcjF6gQWsxZY5TtCQLu68yhMAamMw6J3FayFWyow+bc
	HzkucQ0N6ad6rjtfGw5U6ZpnI7stZzZLiGX3fP2XTrcnuTARE9NQz1HwDUW0NeHbH2GWWY7W7lFB5
	Qgn7R8/VCEQAILl4uM1Gezu4LeKspqknvya5px9SRSQuJPkD7e3fRVNRLBCcwWmRAvcNy18DgBy/B
	FYXb0wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxBf-00000009TqJ-24hU;
	Wed, 05 Mar 2025 22:25:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx9N-00000009TQl-2hLF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 22:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A13FA4491C;
	Wed,  5 Mar 2025 22:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949EDC4CEE8;
	Wed,  5 Mar 2025 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741213416;
	bh=am2QtQAbUka0EU00ofGO9S5CBbuQtg1K0zlpNhYg8BE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A9tWZpGe/oAzeCBY2QFymhr1bXB78nkfrJBA202yTlt4sSyKEohB1ChecPRHddDB2
	 TVgY6xD6mfD38OX1vxzI4KsyT0MWPY5DBaJ1ZgfesxGLTIAmp0OchK5Ht2oA2i4iV2
	 7d/M33ECAMC/Re1rj8EO6W59H4qnuFeg/eKeWqEYcjHJ7wGLIxxD+YgeIa27i7PapR
	 ZsmrbSxw4C0j8ko1mydUFstCi5nIwawW3SF6Lm6fDXMUprV/yb9oVLE5eplO+F1EG3
	 aIGtkKX+YrNiPFgwwYuOhybcNuERcpSCw02TDRtXAckqEdCutSsXAFtVY3qX70SXDf
	 FnQxIGB9WZGIw==
Date: Wed, 05 Mar 2025 16:23:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
References: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
Message-Id: <174121293051.2932459.11282638089781621289.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f4: Add UFS tuning
 parameters in E-FUSE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_142337_747434_B0FF79B6 
X-CRM114-Status: GOOD (  11.74  )
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


On Wed, 05 Mar 2025 14:35:13 +0100, Geert Uytterhoeven wrote:
> Describe the location in the E-FUSE block of the PLL and AFE tuning
> parameters for the Universal Flash Storage controller.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Updated DT bindings and driver code are available in "[PATCH v3 0/7]
> scsi: ufs: renesas: Add support for R-Car S4-8 ES1.2"
> https://lore.kernel.org/cover.1741179611.git.geert+renesas@glider.be
> ---
>  arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be:

arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: ufs@e6860000: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/ufs/renesas,ufs.yaml#






