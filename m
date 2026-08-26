Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5A6C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkQzmfhiFZsMxRF9Cb3MCLGs1cVtJ4PnTkFGQmnTaxw=; b=siVJrqflFJQoZw3tHf+fGyafrO
	Md9PYSTxSGnbnmScCCkwvNsVh+Vxt2SAtUQhtDpeZ/6c0Nku359qJj/Sey1scuaRPhU3xCp/7OXxO
	udPRqYLgwH7gbrUu3jOHS2ef9RDw8pw65A39AQ7S7KGVh5Z68o/Mq45ngXFQpsiANgt41UGKCtIln
	16LO1NpcvCsl38vv2dg0z9XdcnC6+Z0d7PcVucpd3dJBjjxTlQCSee89/7lbWa3oaObWX6uGkJk+w
	+wbw1QDaHxljokBTX6rwiTCphWbb5DNNoZN/PHMAOeOnkghnSz+8EBh5pkwXYSFSTxSIY75nPsmDG
	ANrbBAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGKx-00000002jXh-3gPx;
	Wed, 26 Aug 2026 16:18:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGKw-00000002jXM-1HrT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 16:18:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83F0D6011F;
	Wed, 26 Aug 2026 16:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4811B1F000E9;
	Wed, 26 Aug 2026 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787761129;
	bh=UkQzmfhiFZsMxRF9Cb3MCLGs1cVtJ4PnTkFGQmnTaxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A5dWDGwwf4wzryBtm8finbJPqUfCar3ieVla0jpTFxCO16gNA4V8BjMkBHF/V6wb8
	 vDTIHka7cxtkCoUlLDyhjcxWiCTJmeBQhvYhsehYPfX4ETZBdhhxTrm22G08t7BNxJ
	 dgWrhB15FXa0pxJbSegP5FBO/RrJHx9zznjqLhqLEIqA+kffD9mwwMfg+Bwv7cWrnz
	 sTZX5zZJaCpMhYAgOzhow7hFkmBViSMKpAxGITd0YM9eE0X4C8UoeH6lb4lKO0R4lC
	 xsC01ncV+yc2+zauQfL4fyhkSVa/UsBZvUel6JR7i+vxNIaPJ/90+3gItD9Ctd1FcQ
	 TgEhpeUSZwqgw==
Date: Wed, 26 Aug 2026 17:18:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <20260826-chief-constant-cac08f294cb0@spud>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
 <20260826-isi_imx952-v1-3-cbfaaa3f0000@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NoOQJ3UMHdED26Zq"
Content-Disposition: inline
In-Reply-To: <20260826-isi_imx952-v1-3-cbfaaa3f0000@oss.nxp.com>
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

--NoOQJ3UMHdED26Zq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 12:55:44PM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
> primarily addressing RAW data alignment. The core functionality
> remains identical, so the i.MX952 ISI shares the same DT binding
> constraints as the i.MX95 ISI.
>=20
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

pw-bot: changes-requested
(See driver re fallback)

--NoOQJ3UMHdED26Zq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8R5AAKCRB4tDGHoIJi
0kLWAQCiCZUrIRfhrpLA0m+ZMq608jz7v48VMGIeNjfPdnKWBQD/cSfuQwfSySEo
MfhBPakmQDsiMCK+tW2gZmqy0zgJdwc=
=rnvV
-----END PGP SIGNATURE-----

--NoOQJ3UMHdED26Zq--

