Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5600AFD875E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vtt/U7sSfzeS/r32wUfiJFnwToAP8w1/XgLk+CXBqeA=; b=bAWZjhzHek3B2bbanyaViAr1ea
	v5eLXICK+QxyROzbz6XpnjKq2rqteSOdfbDJPHFRMHL9bAvT02l4e3GwYvo40Gey9AdhPkM1LXepU
	AbkU5Ei/jy/schmFHGL7p9Ly8rDS6y8l9Lds3nY1JHOHhP5gWScb+M5gkMLX/o3jHTZBut02rTOzr
	hodQeW2IKWj24anWk8Bhuz87TObDDO9VkbzFpvGkMWL3C6spSnbxCnUMIyRcKro07ESZVZ9jVhGTm
	keI4a8Bgx2VukbDOBV0ZuwRLvS6ZQB0ADoCc9hn9OgfPua5Vtymx86qCrFH2aamK76NrnWa7Zf9MA
	5KN0V7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tsw-00000006KfZ-2i9M;
	Tue, 17 Mar 2026 12:50:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tsu-00000006KfO-1rmu;
	Tue, 17 Mar 2026 12:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6C45600AD;
	Tue, 17 Mar 2026 12:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AF8C4CEF7;
	Tue, 17 Mar 2026 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773751855;
	bh=Vtt/U7sSfzeS/r32wUfiJFnwToAP8w1/XgLk+CXBqeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i65qh+m+DgtsIm7IJNzh7BXh6vipXU1S1ACGgpCRFiTvb2eMxcbSzBazIIa4X4Tuh
	 t/gWVx1l4gyVJwJJlW9Q6jFuqG3rVZTahiTQ5Mwz+ckv9PWlo+/qP3v9Vs8TNrCARz
	 6DSbUdXf+tABYMskrXVOSVWXJTtpAjaSMQJpHGCz9LFOGst45goCEsHcw9f/qPvaYj
	 sVVcoBVtoHWgAHHkDkHALxcjTgVxdivYUwdvB9s5NqdHJaYOyvwtrqlWYzFYZcOydd
	 X6jB1fYzoXcsAhEq9//8PBR6bmBflVb+OMgJEBvf1RRi70SDLUIZc3PCdI1PJUk70L
	 hwxTJMO5tbLoA==
Date: Tue, 17 Mar 2026 12:50:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v4 2/8] dt-bindings: pincfg-node: Add
 input-threshold-voltage-microvolt property
Message-ID: <20260317-greedily-cubicle-ad9918435683@spud>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
 <20260317115411.2154365-3-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+/i1VKYMMVnYoRr"
Content-Disposition: inline
In-Reply-To: <20260317115411.2154365-3-eleanor.lin@realtek.com>
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


--W+/i1VKYMMVnYoRr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--W+/i1VKYMMVnYoRr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCablOKgAKCRB4tDGHoIJi
0qpLAQCCK51rdo+7R6324+RMHQPBgCTJ0dTEMw0rCBcMPEQ8TAD/VJFAQG4K6FDo
+czkMtYwJOqpdSLLYewNU/p/0a/yhQ4=
=gbGl
-----END PGP SIGNATURE-----

--W+/i1VKYMMVnYoRr--

