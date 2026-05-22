Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D29CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoaYTpOtS/f83LSZSUS371YpKZ7Va1WFwiD79VpLxU8=; b=lsmZuxEwgW1PRRuBxS6rJqA3vh
	v9bhbdz/u5ADza+WW/HZtSdXsAFFMRDgQSbyEylNjhw86CNFjHbYynqT2Sg1wBaypPTvK5s2wf/9R
	m6IVx09VV4guTgwIMoSrx4kfK/dZRj5GHGg3nIUbj5J4sLDAiH5RPM5ZYNPpkVYs+7an1Z64uf5oI
	0aNbgbb30Nkz1bNegPwdePnL/q+BMgJOmgZxs5YQRYWcOzdidNQFdFPHF3rnGpz0Ab0lYkLjlgFYM
	XHOUPm/VtV6SI88O20l66oHIydqpRzqIUick2rt9yGO0lD7AXOgAwbVOHNJ6/RiII5kt6ATbkLrHb
	hs7O9c+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJmv-0000000A1Ej-3jvX;
	Fri, 22 May 2026 06:55:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJmt-0000000A1E5-39Qr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 06:55:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 780FF438E3;
	Fri, 22 May 2026 06:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE28A1F000E9;
	Fri, 22 May 2026 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432915;
	bh=PoaYTpOtS/f83LSZSUS371YpKZ7Va1WFwiD79VpLxU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HECtbDQVIxKupYOYPtJ9nH5KpRerCWP9jZT6Z0tI2nxzCe0ssvS4EbeIrd7Vk0fu/
	 ssnOF1WHE+xRA/dcBJNI1coWs91fN3yZfSTRMdfMzzRVJ1+JujNd+gnHwOz1KezRBq
	 9unUp/HHECrB8zDvoRyl+S94rc6gUMQo6+eju+fm0rVePR3EAxVFvDexmztyeGNxWK
	 IjBDtXfA5SRdvQ2IJlSMQIpMz65DsntubMq/DIUcmGOzA6/JSHBWisndMh1a/Z/LQD
	 hwojgvvbXTFowz99CyUMRy5FKJxnYIh7xYPImQJFQRs5kw+qI2sJBIP6M7SVXbWDVm
	 8GzuYxJJR/HdA==
Date: Fri, 22 May 2026 08:55:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Vitor Soares <vitor.soares@toradex.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add
 dual-channel LVDS support
Message-ID: <20260522-vehement-kangaroo-of-penetration-de8d99@quoll>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-30-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-30-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_235515_810281_1D442763 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 21, 2026 at 04:00:49PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The panel-lvds binding only supports single-channel panels.

On purpose, no?

> Extend it to support dual-channel LVDS panels by referencing the
> lvds-dual-ports schema when a ports container is present.

You now changed existing panels to dual channel.

> 
> Assisted-by: Claude:claude-sonnet-4.6

Using assisted by is not permission to send us unreviewed code.

Best regards,
Krzysztof


