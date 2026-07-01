Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD993C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQjO0POpW5npv7gePynnmnZhFEpgwRLzhnQyTwlih9E=; b=lx1XUO46E9NARViVDXglme7G0V
	O5+iUHOcibUA49+NnSZNYWTX+8TNcTivPwKmPqKrm8IW8O27LgmDQ4uM6RTYw1/+18h4eErvGpzYp
	VkJ7DfvjNjwFwrFuf5leE3WXZMpQCovwmFlPfJr3EUrLJlnZeLpfqbUIwoVx6nyGL5bM5wACWEO77
	nWUmIEIANngihMRxBJERKIAC7mkvqCI9SrIiIpRijkf1xQoP28j7RD4bpNITuXgPnaMIt3LU+zmBr
	e0+o6jzvEwDT+VPiTeDIWqd838IKhSRSpb0zIYZ8lonopP9kx22BsEM9AIDNag5B25XJZDHP03ac7
	hUuhSCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyPD-00000002fXu-1YrS;
	Wed, 01 Jul 2026 17:07:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyPC-00000002fXg-1Gew
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:07:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3221413BC;
	Wed,  1 Jul 2026 17:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E291F000E9;
	Wed,  1 Jul 2026 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925641;
	bh=jQjO0POpW5npv7gePynnmnZhFEpgwRLzhnQyTwlih9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d4C6p94JW+TBVhPikzZjIEPEzISzz+e4aGhdMTzu8fjimtFMF5ANFijXKXsbMI5m3
	 4b64KGe2iAMmj7T9XmkS02AlhwA/TIHGhP7eaoQYqsDwBjYwnEsDK5ZhdAnZDXWiD9
	 SvhN+RUFoYRF718u6rSzZbRUXP/zd0jOCaW6OEsD3d4ascqQzTT7EnqLhJKvJ2bEY7
	 YpqqlcAws1S9ihtwO6F7ZAxVr9MOHn9e1XpFprKMb7KMUg4vTW4A5Tt8elReYyDTKD
	 Wp9WQBQ/0x1SOs6H/Zyu0aY0UMA3rSjANO4Ygpg33g9a8QGiba3pZLDfEDAw272Fo0
	 c7gOl4Dba8a5A==
Date: Wed, 1 Jul 2026 18:07:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add compatible for new
 Skov I.MX8MP variant
Message-ID: <20260701-tingly-splendor-490c985bb91f@spud>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
 <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-1-d74f7e3f8293@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nTvnn+3qjdlH96h"
Content-Disposition: inline
In-Reply-To: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-1-d74f7e3f8293@pengutronix.de>
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

--2nTvnn+3qjdlH96h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2nTvnn+3qjdlH96h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVJRQAKCRB4tDGHoIJi
0pNVAPwNAlfWYnCiw8kwj89N3eXDVY04B4SiP+XAAonRzhCV0AEAtSursEhGx4D1
IRD7ENVrg8nW3zpXj2penFbCtfIjIAE=
=4KXq
-----END PGP SIGNATURE-----

--2nTvnn+3qjdlH96h--

