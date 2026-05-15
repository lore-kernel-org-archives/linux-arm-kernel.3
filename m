Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6875FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8J8mKJBX/AzovJoD5kncW8F2mq8qm1lZ7K/3OpAaig=; b=k9sNBQQPjkouBC2vJqXwv/ZC1K
	T2hTMeC5Usb5tmwkZ8YptMVQzAeGdrSRiJBTGDZ7KyaUgfy4qJaEGzmyoZ1hykVQRqpvPkATQd/m/
	jOjvMImOKQmE/wGIqIhjoHd7dex4qDZRWnO6RZECSMP2Rt8keK3Pp+5kobIcR/iGexVtVeB947N6K
	mCQeuQlAwa5Q1b18eY9Hg6yf0xueitaWJqmwS/U1XTMu4Fjn1j2nNwzLp6OXxrLMe86V2HHGyc0wA
	iCAvA0rGLhZcmN0/GDw9jAPAqUeH4r4ziPiwxEhtyB6B99O3fwA75bXcDIsiCd2MyzrbxBceRkmWE
	Hv7ASabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmOW-00000007Y5O-1jEB;
	Fri, 15 May 2026 06:51:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmOU-00000007Y51-2so2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 06:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AC346091C;
	Fri, 15 May 2026 06:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5B0C2BCB0;
	Fri, 15 May 2026 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827893;
	bh=pYzVa5nM9Ddh1bPK5+yxiL/X4VA1ysn4pX2lUE9O3i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9DMQ8mlte1O6488J8Gt6MJ/XatOpSBgRIchxwq2lA7KqXBVuRl7m75uaKhLeMZuX
	 hw0fb62gEou6iU9tE0YmgwoEJYsgoG6cfhzTc3T+jKrDfEJTqu4T8F9wxT9pDWx/e4
	 CUykAC3bjdX02GXKAnXSZph0ki4rYGZN48ghOLKfGOKRd7n55kExvvv069JmInJ+ha
	 OFHPH67Em7+zFpeNib9EUVxkB6WMFxO1nAHHBSc55VguzwaBf7wZHoVsiW459LsqPn
	 xaZyll6Z2i7VroKVhGRndhkLGJThR0+rwAh3bupAZniupnJ944IIqpkABP7VoXCOlG
	 7gI1BHCwVKd8g==
Date: Fri, 15 May 2026 08:51:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/16] dt-bindings: display: ti: Move ti,am62l-dss
 binding to a new binding file
Message-ID: <20260515-mahogany-snake-from-atlantis-c2d1e9@quoll>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-1-9e9bcefde6bc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-beagley-ai-display-v2-1-9e9bcefde6bc@ideasonboard.com>
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

On Wed, May 13, 2026 at 04:17:23PM +0300, Tomi Valkeinen wrote:
> We currently have two binding files for different TI K3 DSS versions:
> ti,j721e-dss.yaml which contains bindings for the "full" DSS version,
> with four planes and outputs, and ti,am65x-dss.yaml which used to
> contain bindings for the "lite" DSS version, with two planes and
> outputs.
> 
> ti,am62l-dss binding was added recently to the ti,am65x-dss.yaml file,
> which only has a single plane and a single output. To keep with the
> above "binding file per DSS model" style, and to simplify the
> ti,am65x-dss.yaml file, let's move the ti,am62l-dss to a separate, new
> file.
> 
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>

Drop quotes

> Tested-by: Swamil Jain <s-jain1@ti.com>

Drop

Best regards,
Krzysztof


