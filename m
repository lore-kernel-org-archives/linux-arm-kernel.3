Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7ECCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2FRGMlxd9tgVpfTpwsYr77CFhNxdgbIysHxh+1mUNs=; b=DQzrYtwC5Zt7n6VrYoRbYYEkXb
	VTN8TF6HQqNVZOxLt/zjOHaSBHgF1N4hR2ccZRPW3xea0Ep8H/NMOiKOjyXpJKfQ061qhprkUPKgi
	yfmljPn3YDo2AEUNZZqMWY9wdSFCQp/L3DLlaBy2f+c5z/Cvm6rIpHx62vyxFLeOha0Mn/AR5xZvW
	DdBIC6oG4LC/Ja4796iXhXbGbEL/M/r6m5cDGj4veExmLAn5TvOD6E64lhjNvajJ+kOsCk4kkN5hH
	hA7QdWiCjOMl3dZxKYzAu6tMwKLMN+ue2OESUvT81en0npbv7KdKOZpXIJdPdAiM4YvSg1iw1is8C
	nn+nTxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFve6-0000000A1t9-3n4l;
	Mon, 03 Nov 2025 14:34:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFve4-0000000A1sj-1x5O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7A182A6B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 06:34:45 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B8CB3F694
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 06:34:53 -0800 (PST)
Date: Mon, 3 Nov 2025 14:34:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/2] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX95 support
Message-ID: <aQi9i32HjFKarZ2J@e110455-lin.cambridge.arm.com>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251102160927.45157-1-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_063456_646388_93E42F53 
X-CRM114-Status: GOOD (  20.11  )
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

On Sun, Nov 02, 2025 at 05:09:06PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
> 
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

I've pushed the series to drm-misc-next.

Best regards,
Liviu

> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xianzhong Li <xianzhong.li@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Add RB from Frank and Alexander
>     - Make resets: mandatory on i.MX95
>     - Switch from fsl, to nxp, vendor prefix
> V3: - Add RB from Rob
>     - Drop the reset part, this is now unnecessary
> V4: - No change
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 613040fdb4448..8da8ceb0308d8 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8196-mali
> +              - nxp,imx95-mali            # G310
>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>  
> -- 
> 2.51.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

