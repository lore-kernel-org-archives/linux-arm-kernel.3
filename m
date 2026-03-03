Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7EEE67A6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/RFpWvNSWm4gvUOP4EQPrWEP6P8l3OH6DdngJS1ijY=; b=eemftWCZiw6dWby2rHBb8uvmpO
	bCc9x96wsoc1f5G/wvAG2eu35mxvNkh5NLPckTCpOBJMCV2l5sTiouiuX1VIwIQTjwA4LwfyeDIHQ
	RggQhIUHIB6eTIVhRWF0ivOnJYyqf2VS8VB784xwObquI/ludNsPpdAlcib4aJmI5HyNhQQRU+JRO
	H+2yjRIQ88sRnFFkME/znbgY6Q49MGWfPE+RT/UMncjnq+OuUz/t9IU/2ymAdTSkvEz5dOWLp7TYP
	HduMHbRN2TpIEqy0VG9i45d9+zQ9q+eka4xDPv/u8JV/Ld8dg+/69SU2o9V7tAaKUYOe8jGTOpRQ8
	WA3AkquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJc8-0000000EdN5-3V4M;
	Tue, 03 Mar 2026 06:52:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJc7-0000000EdMm-3DGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 06:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C966560126;
	Tue,  3 Mar 2026 06:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF898C116C6;
	Tue,  3 Mar 2026 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520734;
	bh=Owqa1+BkD4lML8DGZaHaxD/+Qjdb8XC9nOLsnGsYOZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYaKW9JmjNm6gflUdX7wNc1usXBX8vu6crMoN3Xs5bGrChZp1dJx/xfwLRY0MBE5r
	 yaMHxZvE7mOBsITAKzrnhQSVFLyFyoPW3SPgE4rnEod9YGrZUjAd4WDfUhKnA0Z2EA
	 T8UgwEgMwjVtS/8gYrdsW/XbTKmM2HUl7qFNYJVDcGkHuZ2DorC55fqvbaZsNffAdk
	 kNCPOKOdnm9/AUIcMw93VIMiV1iAYemIPIjfmhQaFcBJF1go0VyiY5Uh0vOSOlOW7A
	 2jaMBImXFc7b5pyGuS8Os6t38An5ePscxnMil1n9G+5/rDV2/Wp8AKYTnO1avLF4kw
	 a68aUtP4GWZpw==
Date: Tue, 3 Mar 2026 07:52:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 13/14] dt-bindings: display/lvds-codec: add ti,sn65lvds93
Message-ID: <20260303-solemn-umber-loon-6e4bb7@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-14-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-14-hugo@hugovil.com>
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

On Mon, Mar 02, 2026 at 02:03:49PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add compatible string for TI SN65LVDS93. Similar to
> SN65LVDS83 but with an industrial temperature range.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


