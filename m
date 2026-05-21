Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563A6CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPiUBM1CCh4+fwupCgXGj12p6AUKJ3ii5aw/UejUZUA=; b=TQ5b12hxhU6yyPiiWKTlidRC5a
	4epruTnCCeN6wIIfSZGDfP+Xc94mgzb/qJx7Dd+H8uloUrGidN+PRp2RGWF43h6abEykUgcLXIsrk
	JsGLoeZnivAPZ8J8rkG8gS4GEh7FFrNeL9lpWsnAJGNPjqKu8Z9kxvKgt28tYwz+IYzkLqicuBviJ
	VP93/bardTQ4SkExc7/n/Qvtps461V0Z1Wt8tQvFjkFBQ0XWD1LiqYFc2GGifSPD74rbBUbJWOSvT
	2MQcr+C6v8o4s1ykHIdyqFu+o/q1n72zMxoqg37KX7dzXBj/Q85bE27NGLk3ZkC1tLgGQcGKUqKCx
	gd2rdo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6fP-00000008YDe-0jcu;
	Thu, 21 May 2026 16:54:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6fN-00000008YDK-3yeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:54:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A542601F4;
	Thu, 21 May 2026 16:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724C71F000E9;
	Thu, 21 May 2026 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382476;
	bh=CPiUBM1CCh4+fwupCgXGj12p6AUKJ3ii5aw/UejUZUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ccZrLQhOqQ0tJYohaZqVI+HkRDzD8MClngR4ibpzHfdxbrTHjvuDld5kc9Sm05d1A
	 7A9ILnAX6gVNepqnmZutIezRg2vmEADM8h7xdBUHUsXKXWOW2LJlmYATKRxqLq7GGW
	 wO2+DTys2qrOWtjdSoTr7eBfvR1e3l2yBhUP52jQTHa9eLoMr69OiQm/bsavKgLTEy
	 cox8gCehzyV2UnZip5uZosgbGld0JDjw5ChOFP4NV96F/3jFWVAIYZQrPCI+x89qpb
	 7xkqubQv5rak0NWj73sNGQurQdb9Njmv3hmCrzZKeDpvu035qMP67jWldAuZWXscvp
	 CkLlWrsW5rThg==
Date: Thu, 21 May 2026 17:54:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 04/15] dt-bindings: vendor-prefixes: Add Riverdi
Message-ID: <20260521-contest-paralegal-cc088842405d@spud>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-21-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bdKBY2K+SjDfXSwL"
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-21-ivitro@gmail.com>
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


--bdKBY2K+SjDfXSwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bdKBY2K+SjDfXSwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag84xgAKCRB4tDGHoIJi
0gcFAQC4LpPl3BGoUACGvb8sFxOPR84XXJPFojWht4l7o5Cb4wD7BfeIUT2pXyx3
DETSdDP6P7I10GKFgqHRfxIZzz9P+gY=
=rwt5
-----END PGP SIGNATURE-----

--bdKBY2K+SjDfXSwL--

