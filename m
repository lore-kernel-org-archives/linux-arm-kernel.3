Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBEFC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exYdzTr4+NWvsrzI0HCrzsAolBJs/Wj6nsb3B8MSpIs=; b=ye/mCaRJUDzu2w3KchL1Glid3T
	N1zBXBeyVNdsdLXFSK+iJ+cjaXB+ToqXuvH+lypnbeGTZdyJc5281eoHmRf6lh8/CgLtQjx/cnjZg
	Urqj09P57W48ulcYhYggu5cceqt1U5t/qBIBvBiDIihBh7F4/Pbz57WjNOAX0Z/GqBroe/sV7IpCW
	eBVXs0myeNmCCn4l5BmEUlft4e8O9i/QLIlwBsF3691/8OTAmuCWo2e7sXCNkBtGFEix7A8RnA6Ep
	rL7OxKNZwJ447uhFfdPaNAMFToW8lAJHPt6PzQjxSQX2yOMsxRgcyimh+7XeHVfKhas0qja0Dw+78
	EdN0n33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfvz-00000001dF2-0E1M;
	Mon, 07 Jul 2025 07:06:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfsu-00000001cVB-01Au
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:03:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74F1B44DD2;
	Mon,  7 Jul 2025 07:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6986C4CEE3;
	Mon,  7 Jul 2025 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751871807;
	bh=C7uOTK0k8vI5Rytb4z6FYorlHJkqS3b6pXeuWrE6ydE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juhvhw3WpehmoYS3yhMSeHhbSJHFjabaH4UVU914nbBJLsczWs9I2wPEtRq7olY08
	 GBWxYeU16OKlR1EM0xg8BB3VCqWUb9XFoKeQbr6akcK9u64d1pOZz6Q1rmHNp0UD1A
	 e4OhC/sgy/PkTEEDoUx/++7WBvepuiev5p8MQCQW6ARuHVB8GS2efXl+1B9Ca1lPBy
	 uDeqS9LQp3gV5dlacwuw5wjPp0dHhTws7+EoXVlbwgxCWzdjeFlInMwoK1HD/E1ijt
	 h/N9XfUMi9P4+zsKrjoq7EvZdfR/PLOs1d9UFJ6yx9DHTNE3ZaErPgmlyY6mCSOFQq
	 lXAKKtP1vrbqg==
Date: Mon, 7 Jul 2025 09:03:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: imx8: add parallel CSI node
Message-ID: <20250707-authentic-jellyfish-of-tact-ef6f0d@krzk-bin>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
 <20250703-imx8qxp_pcam-v2-3-188be85f06f1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-imx8qxp_pcam-v2-3-188be85f06f1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_000328_060938_889BEB01 
X-CRM114-Status: GOOD (  14.33  )
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

On Thu, Jul 03, 2025 at 02:33:08PM -0400, Frank Li wrote:
> Add parallel CSI nodes.

CSI is serial. How this can be a parallel serial? Binding speaks nothing
about CSI, so this is just confusing. About which MIPI standard are we
talking here?

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - update compatible string to match binding's change
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> index 2cf0f7208350a416d77b11140279d2f66f41498f..1f7bf9efdbca266fbda82d2bc84acd9a27ed0bd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
>  		status = "disabled";
>  	};
>  
> +	parallel_csi: csi@58261000 {

And here it is called csi, not cpi, although binding calls pcif. Decide.

Best regards,
Krzysztof


