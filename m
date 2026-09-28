Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C0CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BqCHNPPTdYFXoy1hk5TULMVIsNOW76LwKuERLplq/o=; b=Ofm+SY8RUgm2Ek6WhC4mzh202M
	lidWbdjfxsCvbS4hh/tj2bltpaOy8XpTft3H1s9Xky03gauvwn0uFrn2zhttZjUtj9B6gVkezr8w6
	xDRXRxXRYfCRnb8vb6s8e4yeCETFBYpuHPTXQrZa1+0mzLQLZOYpqp7cjIa6yIYz1Uw6G/5pxNhKU
	Igh/QU0esEZdnBu7RC4QlQ3QTDdIHYnyxNsrpVp+/euij+iedRMqL8KEQG/NCFaQM0NNRtjIljyIZ
	smZu297WsmeY1vpXqH6Ncj03PMqrAowLq+nc6PJ6y0XcXBYOcGwIBXh1p0WNzjXYpMmpN1F7qfO6J
	1DxxdZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEQt-000000013tE-0woZ;
	Mon, 28 Sep 2026 16:42:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEQs-000000013t2-33nu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5403D429EC;
	Mon, 28 Sep 2026 16:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0481F000FF;
	Mon, 28 Sep 2026 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613746;
	bh=9BqCHNPPTdYFXoy1hk5TULMVIsNOW76LwKuERLplq/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cl2TgGCxWBo2PJMF4CaE/O9zxGyfo4l/Lm0fjWSFJpMhq/2plrMhF6QJUeoVhpYha
	 xaLQZwvKfuy8r94GbzTRmXeaNvKgAMB4IpiQRA0GvRzM/baWysgEc2WpoNiV6p4/nS
	 M3bQPe9bCFXzgqiOjRMgzqMbZG+3Y5yIW9t17veM/1n6j+01bDUGCoGhBjb1icU40P
	 wpVskLCgWj0OgxSYfCGhMnxWlXBDK5b/OF4vsmNWgKhHbamZ5Dw09Qopn2v7msvchK
	 xbQjai5f6k3AyYxtZhLhUZ6PaeDqloEB/P/h2JZSay7FK+kmV1EDokCCRPFbWwxY1p
	 dXj+I8Ncn9g3w==
Date: Mon, 28 Sep 2026 17:42:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
Cc: sre@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, daniel.baluta@nxp.com,
	shawnguo@kernel.org, agx@sigxcpu.org, angus@akkea.ca,
	Vincent Cloutier <vincent@cloutier.co>
Subject: Re: [PATCH v1 2/4] dt-bindings: power: supply: bq25890: Add input
 voltage limit
Message-ID: <20260928-smilingly-reliance-200690971794@spud>
References: <20260927145538.233548-1-vincent.cloutier@icloud.com>
 <20260927145538.233548-3-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1zONAhv5n6jgA1PY"
Content-Disposition: inline
In-Reply-To: <20260927145538.233548-3-vincent.cloutier@icloud.com>
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

--1zONAhv5n6jgA1PY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--1zONAhv5n6jgA1PY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqY7AAKCRB4tDGHoIJi
0qtRAP4t/U8p4EyBjwU095f1YrvSRY3s6+rbhV2BOUxhNwdiKQD47xy8p8NL7N1+
/5gY9vQzht780ZeVMy17zcN/Po6AAA==
=MnFc
-----END PGP SIGNATURE-----

--1zONAhv5n6jgA1PY--

