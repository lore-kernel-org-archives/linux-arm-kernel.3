Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E708C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sw3okeo1ZKyL78EaeP3XZIOldIpii7SYHJp6EOjxzc=; b=xNlmC5Ri3flsBbaoGodam/xDhx
	t1/OVRCHqAf/VwqlyN84HMlLBXqdSDhNce2BBQfHMxxAjByxSz/r2uresu6Y8VstREmk6CbDKCFjQ
	jijcJjs5NITSJ/WODXgZc51zNa91ZdgPcGMSyWHnsllyvpmsdc7fKEJIVOPYjzarbumvTymxHKonA
	lQKFPWVRwGZIJ8hOMefne7nPxozLyUm2z7ND2OR23kgXb1aiphj3nhytafoumvG7U/QbVhlxU+PYS
	9NFeLSf5hIuBfluNypgadnMF6DxiGXqqBDibgdXwzmOUrtKIQh/uML9hNFaPkmfCbHU295AEg2KkC
	5WXRlVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzVL-0000000Auyn-0nFO;
	Fri, 28 Feb 2025 12:30:11 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzTi-0000000AuTq-1JIW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22C6E60008;
	Fri, 28 Feb 2025 12:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39577C4CEEC;
	Fri, 28 Feb 2025 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740745709;
	bh=mTxyB5LfIETi+uJvOVDQqxXR+KxU8npM8MnbMmEt/n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvCon2GxURZLGP41UlqCFBsm/k6EHWKtK8TKpZwIps0xE3JxVpXYPf6Idk0a1xcxm
	 OMwKPb5n2jzmPix3DVoA5xuVJkSxqzhK/zcoYynXQP1WMZh5MKWITEmC1bvVnMvUFb
	 jBUV46WR0Tdekr+Mme41JFuwt+PyAumTEjJ1pUkw75nbpfEAwjmeEF1TgJJZ28JvRa
	 6XrfTi4203h9GmQYf0apk3u1o9TZYhPbyV9/tTaYwXwDQ2sm9rENEEczzL3J+fz37f
	 aJzzs3zRkqn1JKGlRIhGK+QpPEfUXq8vipSlLS7fPPTXE71U4uZDKx81xyCEsloq/F
	 WJtfQ2NhJOctg==
Date: Fri, 28 Feb 2025 06:28:22 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
	Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
Message-ID: <20250228122822.GA2321092-robh@kernel.org>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <174068152164.3906545.6393185343383919273.robh@kernel.org>
 <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
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

On Thu, Feb 27, 2025 at 09:31:48PM +0100, Marek Vasut wrote:
> On 2/27/25 7:38 PM, Rob Herring (Arm) wrote:
> > 
> > On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
> > > The instance of the GPU populated in Freescale i.MX95 is the
> > > Mali G310, document support for this variant.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Sebastian Reichel <sre@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > >   Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de
> It seems there are no errors in this list ?

That's an artifact that a prior patch in this series failed.

Rob

