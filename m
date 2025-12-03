Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212EAD15DB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 22:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/zLXkCGNMS7ABEdNCrwNcvEFJNVr9yXdOENULewN4U=; b=A3RYMNnzBrl/6dMTm4xCBw3nGz
	KiLNiv5myxWAoXwVN/2Ct1Y23FVPHFI7rAKpH263mNojZAxniP4+LPWm6jSQGkmWLAavAUAQrbA6/
	96QAkyBc7LPbWacShA1s++XWhRu/dcKf9JYYNFgyFL/9G1cEoaxTd9WCMvNG4n5EYiWnKMCH2hb9Q
	4bIIM2HeMqPyN4sjtS5v/PcMdTQ9CtIBVrubDkkz+Cze0GuzBYLVA6YD5Z1tMfGV7n8bCsRFKyQQ2
	ADPXm6CAp62dfQput2a1OzPyjB2X06pgXGSyQ6QkcQIRJMuvaDBIOr4q6PDR5dL+HuHYNP8Dxz4CG
	uPOyeqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvi9-00000007EFh-11xs;
	Wed, 03 Dec 2025 22:52:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQvi8-00000007EFT-1gqX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 22:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 576CA60179;
	Wed,  3 Dec 2025 22:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F34C4CEF5;
	Wed,  3 Dec 2025 22:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764802355;
	bh=sI020P7qBWnq5Hq6FRxOGSZbde2bx3Zr3sKIJs+/pIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NW+GTFvC0+oEcgbGRDu7WA0iwVy92MJ3dFIQsXlAWyCID8DnLoJ9dx946maZhUFWl
	 SK5U04QG6D6jRDVUJr8CmLPyCnG+5goV7jVBdiwOkUcU5QsChUoQjCuUkByn61+3Oj
	 EhjCoenHT2iHXMaKV2ZSshxaI81kVEcAB6hKntwHNHRPTuVHEtyr1xGkVMhW7VMC33
	 pqvEyOer0oTpMgGZClIP9yX/jlF1Mi4Inr9BL3tFsIgnRZX1GTDAdZMNIBgL7wo9qS
	 pk3TSaHoIpi+Rzzpdt12w3tbbceh+ji2BkO/q0i13Fm+heSXLZ32UmzNmlIMXwsUSR
	 vjKwlX4WfpuWA==
Date: Wed, 3 Dec 2025 16:52:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Michael Tretter <m.tretter@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Harini Katakam <harini.katakam@amd.com>,
	dri-devel@lists.freedesktop.org,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-mmc@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/ti: Simplify dma-coherent
 property
Message-ID: <176480235071.4159178.4317055893040212478.robh@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
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


On Sat, 15 Nov 2025 13:21:21 +0100, Krzysztof Kozlowski wrote:
> Common boolean properties need to be only allowed in the binding
> (":true"), because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 3 +--
>  Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

Applied, thanks!


