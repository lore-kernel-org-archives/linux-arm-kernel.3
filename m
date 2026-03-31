Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82170109B46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjsI+u5xJcmg+SDnTy5KP8QuCT4a49LMwipOJil1A94=; b=VRGcEwkCJ1kOJhNwQwIQz9JAvy
	ECudL86kA91VXKjj9VMe9f0EHIz4Bhgto95C6fsjOXaXkQGht+bmziQQgXa5JlHgWi8fdl26ZaA/p
	rIKmoUxyvIu2K6F//PLaF4P1xE01dN0UXMuKbxQ4Wg94f4O0IAJ+Qq0HX3ReLX45jaMhJCHoJffDK
	8+ngPv8yXyNKAyDb41pMpGtGMZDcjAVHfS0DMk6WHWhiuxBsuR+AsuTn6P1ywDXabrav0LYndgEJ/
	D2L0T3T5VL3yQiN4O9lGVlEiDrgE7AeHQDURzA/WB8g0u7q6IqEPJm5XJHNhThUtjGKHEdSKG1jEp
	9XsM+HBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a8h-0000000D6eH-2w3e;
	Tue, 31 Mar 2026 14:32:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a8e-0000000D6db-2Pzt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:32:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3F1E497F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 07:32:07 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9736A3F641
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774967533; bh=iNxOjW15bAhGECqyOpje5IdokDrygM3OjbtlLkrF2ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkeWSNXlzMbwutLuJumoqPRO78axTcXl2UVT5saypjR3xZnQnVNMRFMQqiuYkoDR+
	 fV6q7vYHIax06Yoy66vbHKEDwAzN49j3TMpuXev4ZKXV+aiJ2BsNRl9JF3bt+dhfDB
	 05yShG13QAcjJNC1pQ/FpQDIZojRyQ/Ywe2ve6Vg=
Date: Tue, 31 Mar 2026 15:31:49 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jiyu Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX952
 support
Message-ID: <acva1Xt8V4k9-uG8@e142607>
References: <20260331-master-v1-0-65c8e318d462@nxp.com>
 <20260331-master-v1-1-65c8e318d462@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331-master-v1-1-65c8e318d462@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_073216_679752_825D863C 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, Mar 31, 2026 at 06:12:38PM +0800, Guangliu Ding wrote:
> Add compatible string of Mali G310 GPU on i.MX952 board.
> 
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> Reviewed-by: Jiyu Yang <jiyu.yang@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 8eccd4338a2b..6a10843a26e2 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -20,6 +20,7 @@ properties:
>            - enum:
>                - mediatek,mt8196-mali
>                - nxp,imx95-mali            # G310
> +              - nxp,imx952-mali           # G310

Can you explain why this is needed? Can it not be covered by the existing compatible?

Best regards,
Liviu

>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>  
> 
> -- 
> 2.34.1
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

