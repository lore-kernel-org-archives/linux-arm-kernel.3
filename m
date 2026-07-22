Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5E3C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/jEUlSOlMTPAXncWOP9Efk1rF2z5f3nT6juyMPsE9k=; b=yvDYZkqquOUQzLef4h1EB9BfD5
	YbNLR9I0DNIUC5hJ7pad6+qCcPudYg9sKfH0qxJJXOLMdKNBO6iE1dcsGl16xMaF5a5Rr3LMOFs7b
	cD4hFYTASJAP0nTxRQdQPY5sI2/IEFjbwKUA9QUn/wZ3feQ9mfC6d2KDVRSqwg3dYqRr2+UgCTKEi
	dBdoHXLAx5C3Ix4n5kvpkpNml08LCOv2i60rxBY+9VgjjTsI1VLUWjAitHJkXRiz+iqBg53GBSC3K
	/eYkAO6dHfV2Vi1QvTJlWOKcj2I/rsJYBlxR7XX66IC5X0yx1EZaXL3LAWEOBJfYZ5vdwvjLEX18u
	NSPXFGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmck3-0000000CeZf-2r4Y;
	Wed, 22 Jul 2026 19:36:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmck2-0000000CeZP-1oeT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3A2A42BA6;
	Wed, 22 Jul 2026 19:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B79C1F000E9;
	Wed, 22 Jul 2026 19:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748989;
	bh=X/jEUlSOlMTPAXncWOP9Efk1rF2z5f3nT6juyMPsE9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e653/8oKStnMB2iXpiVBVtU3r5sNFtcL5A2y9jK+RXJ7AFCG1jMXJry2AWZx3NjSb
	 l+uQTSmneRCFGDGmyVYJ5QgbKEGoN2ewFa4Wwv33P080EVtHNrSHJM/r6Sma6dBKTu
	 930PdEj1o0hsnDOKCL9XFsoqrQabSRlBu4ngw/V2mDZ7dlOpLWd8r086natFxF4jv7
	 ojuU3r6ZbtIWzMH23gTlrCbNNHgld4WjrtoVQMWiPM5mmSBbeBT0i7ZkEOXFBcyYB2
	 tnDD0xYV/IpVyd/Nsjf+NXu6Yg17S4sZI9HV9L+KdvD6jU3iTE1a05vgdpWv+HstFh
	 f1wq38ZSDUsOg==
Date: Wed, 22 Jul 2026 14:36:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
	David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: display: lcdif: Allow display0 child
 node for i.MX6UL
Message-ID: <178474898849.1558828.15144971025208605122.robh@kernel.org>
References: <20260718-arm_dts_ldb-v2-0-f5669571aa2b@nxp.com>
 <20260718-arm_dts_ldb-v2-3-f5669571aa2b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-arm_dts_ldb-v2-3-f5669571aa2b@nxp.com>
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


On Sat, 18 Jul 2026 10:45:34 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The legacy i.MX6UL LCDIF binding uses a display0 child node to describe
> the attached display. Update the binding schema to allow this child node
> for fsl,imx6ul-lcdif.
> 
> Fixes the following CHECK_DTBS warning:
>   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> A follow-up patch renames the child node from disp0 to display0 to match
> the updated binding.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> sashiko report problem and allow dma/dma-names for i.MX6ul. which should
> be fine for this kinds of old platform.
> 
> Ideally it should use port. but platform is too old to avoid break back
> compatiblity and leave as it. Needn't complex if-else branch.
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


