Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D5ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGFUg9ijUTADId0/fo0ctlotT9wTjo7n10fjv9YaXNc=; b=XvFYQs+RLtbBDjQa+jAKDqHt20
	o059lrkOIhc8LMSsFrZt4CjhBhPAPGs4mP9A8ZjKEJXgM2hJiw9s8hpCq9xMwM3VwYXFW5bzUwzSC
	MeNQ5inoJj/HGhnzy20rv4Jbqb1A28pau1n2h3WRb8wdXhyGo2hnYGMGEvkNnXLUuVavZQjc/uQlI
	zL5PtiG98viRNb+GN6vfx1oR15wZYPTpGWi8Fch9RAG/BZET2q2/Fq4g6jURHkI/TL1BnoucWgndH
	hbPTxMX9Srg+GZDl2bq+TuC8oRh3gqb/pGzuZxmvWA+WZCnHaVIXuu7Ys+xgBEmv7H55ftXKFUn2M
	E5y6q22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHLw-0000000GpPY-0i8v;
	Fri, 07 Nov 2025 07:57:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHLu-0000000GpPJ-2w0x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F9A46013B;
	Fri,  7 Nov 2025 07:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F47C4CEF8;
	Fri,  7 Nov 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502265;
	bh=xM6b+hhLff+TvwOs6RF++4PTmGDEuvRO5iMSfFtRhTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIgbO3bu1JxVbD8WoPHAv7Hp9H/BLfgVlz9TcoFrefdlJwNMfVEla+LywVc2LpKsu
	 MvoGpOAvR5+L+MVLH7LkmGGUYzEtvjjZ/py29ZREf9NDhlCU9CGIB/UYRiYbLWQ1/8
	 Yiwi0ZehhnMaWuwlN/J1td0rHL51c1xlmdKkERBkeIoaZYWKIyC1sori0ZgJYgzQwJ
	 SBwWc8F1kBMJYvhy48+UvxYWXJp8jxFP3xEG5TlKZOJmivSRxsgNYrXVe35YsM6C/f
	 tyduoIqijZ9QRzMNhFnbfVnMtYCMs4mqMXmzFh94Ptp9bgTeSegwUNxn7rKpyGWVqf
	 TqBSizwwDZ2wQ==
Date: Fri, 7 Nov 2025 08:57:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, louis.chauvet@bootlin.com, 
	aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 3/5] arm64: dts: ti: k3-am62-main: Add tidss
 clk-ctrl property
Message-ID: <20251107-honored-moth-of-opportunity-eecef9@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-4-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-4-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:25PM +0530, Swamil Jain wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> For am62 processors, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in the main
> device tree.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index a290a674767b..2b6c033ae393 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -77,6 +77,11 @@ audio_refclk1: clock-controller@82e4 {
>  			#clock-cells = <0>;
>  		};
>  
> +		dss_clk_ctrl: dss-clk-ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;

Same problem as last time. Nothing improved.

NAK

Best regards,
Krzysztof


