Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5710CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC2acnFnmwo/4Tl6+PMH7KGVe0jhXd9oaswIFcUK8kM=; b=LPxmFmmx+I1RtAtefhyUhiZ6Ux
	DicLXCb4ywZ0agGBNc34Z6x37jVL1sdLICH0GiCTUxLgcA910ycPOGyaBCeLYSyf0GRdaLjCYp0RF
	NfO6BuBDe/a8Ja4em9DuT+kIhaCC7qHAF0Gnm37TPVTeQG8LrqkfauQTWmM/3CI0CjYDU944n/VGl
	ZKvUSpYL7CXFHNnkG7xWVRsnm1Ey70XdlVOSx3AKIcqNUxeDXjdqlTQ8D944+lge4Fd/7/U4QEm+L
	l8Y3MwhIBjvk6z7WP8tZbbw5fWdC23pTIyVNg6zjMd3iDSaeQd1liEqCiPi434AlKyvkIlPYC5+k9
	p3yjxBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLbs-0000000HJke-1FBa;
	Tue, 05 May 2026 19:39:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLbq-0000000HJkN-05Ju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01CD260181;
	Tue,  5 May 2026 19:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83637C2BCB4;
	Tue,  5 May 2026 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009948;
	bh=K5AwDX7FfPa71rodjgfq618inTJ4hiG1ghywEeULFwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gP1GZCu9X50ZuXhRtGDWUVXBVTMV2ayTF2kNCKe1eWmdfAPlu7bROwmmJ7b7pXaDb
	 adXkDCUs/VZwJmWjN0Aa5mwfkgciSk/ucjM5XOlP4ZsEVKtl6KepahPCsykVS8uiJB
	 NFmzPhKq8sdyDVUQK0RXOUKX8Bx2xyeAoCK4grr7Z/7LNYTa6l+0N9ndSifq1tMXTy
	 i2Q5XZfwLJIYWBB+BHZ53hlp0RTJN7JmY+ptZ0WUsvvBmKrxMF5R7QVLbGtdQ09xL+
	 ThgmwkUQ50U+2+nQnCUpyHB1hDC2yGK1CT+rUg58e+O1NGRSN3QGQOAXV8yWUqGRDj
	 jp9F65J3cttwA==
Date: Tue, 5 May 2026 14:39:06 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/15] dt-bindings: display: ti,am625-oldi: Add optional
 power-domain for OLDI
Message-ID: <20260505193906.GA3796761-robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-4-f628543dfd14@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-4-f628543dfd14@ideasonboard.com>
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

On Mon, Apr 20, 2026 at 03:54:11PM +0300, Tomi Valkeinen wrote:
> On some SoCs the OLDI blocks belong to the same power-domain as the main
> DSS block, but on some more recent SoCs the OLDI blocks have a
> controllable power-domain.
> 
> Add the power-domain to the DT binding.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> index 8203ec5e5bb3..61c3eb0a0776 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> @@ -29,6 +29,10 @@ properties:
>    clock-names:
>      const: serial
>  
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain

Drop generic descriptions.

> +
>    ti,companion-oldi:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> 
> -- 
> 2.43.0
> 

