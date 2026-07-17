Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0178C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku8ol6I2GNj8amr+d2Px6BPLZyxkkAZ51ZvVoBjHDw4=; b=KNy0wmakNl+h6K7ZpugDASYGSx
	g58/41RDWO6mVXIXdPEAuWnPQVKGRpC9gfgRNMtHGbrr5dH7cvArCYL2D0pUPCnBl770YhYG6WqQE
	kNbATSRTYqDYdBuJBJzOZrImAouZpDVOyeAosamHFmxUb+EhI+33gS3uCjn3tcrjHKmPMp17QLYnb
	STifdY+SoMo6n5KdpLH9hffMOU/hGhvlSVktQBs4CYTZR5zH7zLUUWi6NhNQGUfz9YJCZ8XFvGKjz
	VJHP9Tfs0cRQOd6RyfK1Lyietekc2aEqEOu62Ce+lNSS0K70A8RS6fbgwWs2QbBaHQLv+lggFJsrk
	IPW3eV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkj4q-00000002Rl6-3zyK;
	Fri, 17 Jul 2026 13:58:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkj4p-00000002Rky-30Tt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5405C60204;
	Fri, 17 Jul 2026 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A521F000E9;
	Fri, 17 Jul 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296685;
	bh=Ku8ol6I2GNj8amr+d2Px6BPLZyxkkAZ51ZvVoBjHDw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuehBKMNwG1Z8PCSI4dvXGpYCjybkvEAlRP0p9Umzzcp4xgaplJbCVTI+m3y6MB/u
	 lSA/L09u88ejFOTtTd5GDDyualgbWeJf6EtTu1psxb2zeJ4RfwxLo4zemhTZ75M1Qv
	 zCWL2lLYwQeNo0aE+oBPBwjz27F54qm5cnR4N0rVVIKpTVNfna2YzfP2dpM5FStCZQ
	 u8fUYrQdAO9O1KxkAfVAZmfnrhop0HJrh9XqGwza06ryY/CV2z1+bl+58AfXuMDArf
	 KmyIE8oXhJ2QDClDiTgVVyRcI3hIL9QP4Op8USxFQ8Kzn118Vck+ViiSEzaLawfKfv
	 244dVDCJxacXg==
Date: Fri, 17 Jul 2026 08:58:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: linux-arm-kernel@lists.infradead.org, Alison Wang <alison.wang@nxp.com>,
	vladimir.oltean@nxp.com, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, ioana.ciornei@nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add deprecated property
 display and display0
Message-ID: <178429668300.558362.15410591849658624332.robh@kernel.org>
References: <20260708-ls-dts-display-v1-0-1986b2611895@nxp.com>
 <20260708-ls-dts-display-v1-1-1986b2611895@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-ls-dts-display-v1-1-1986b2611895@nxp.com>
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


On Wed, 08 Jul 2026 15:39:51 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add deprecated property display and display0 to allow old platform lx1021a
> (>10 years) to put display timing under dcu node.
> 
> Following patch rename display@0 to display0 and mode0 to timing0. Fix
> below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: dcu@2ce0000 (fsl,ls1021a-dcu): 'display', 'display@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/fsl,ls1021a-dcu.yaml          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


