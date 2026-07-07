Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgLExI0ZuL5DFxT5uluj7rr7PhbjkL77u6MZZR5PtbI=; b=0LAnmnH9e+m1lMb/v6rEhU1Icb
	c3Ezb9v1rEqDDZTs7MIWQmtV2bNml3CRNVjj3m3tSaIy2VKnglFgfIXFOwp2x6qofNtLOmHgw4x49
	MdRPmuW3lZi9Kkc7q3uujT+AynNxGbscbtCFVwOcs04JSFgFsYS4qR3YjuFQ+JaoDnOxruWO16MUb
	NwDZY6Hx6zDtLt0fYFkL/+6zkYur8JpRMw+butGMeO1ZwWdMXeywfq0qVuqwsVfh7J4faBRenbrhF
	iot/ulOne4cO8IdVEtQ1nblLXD2eql/LqUTe+0Z5+dLs1lhVIu6FfKh5SyhRXWkPzyhmNAHQ76RW3
	z6SOL4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8UA-0000000FRQw-3vCN;
	Tue, 07 Jul 2026 16:17:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8U9-0000000FRQn-2grX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:17:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E750360018;
	Tue,  7 Jul 2026 16:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33B31F000E9;
	Tue,  7 Jul 2026 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441044;
	bh=xgLExI0ZuL5DFxT5uluj7rr7PhbjkL77u6MZZR5PtbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b17ecv03MbfTVaSpEzLG6tQCe0ajEsjzdNtBF5yFEw/xPJ9mPRLmTOQXzIj7xi5rl
	 5L+BXGRiEEFdKGSBkxo8EEtDk3rXdY8rSN8ZE0u5JMqCc+rWqYA/LtDNYOo6To3uXs
	 feJg2WMJard4Bb1WAOF5R9F0YffjOaq9AGBgNSbwXYK8kzTwaq8P1Gchj5EaqxZAu/
	 eUA2qKVCfT2e9eljFA8jolj9IN409SZLQnbi/E0MjVb3ygyX2wr2/yisVbDhqVGuWF
	 dTNhqfICrvYN/KYsCjks5axFkmWfvYOtvPQreo7yB6o7lUPiyG0fhzAsMnMgr5YvEQ
	 lvIkg6FCHDCLQ==
Date: Tue, 7 Jul 2026 17:17:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for
 TQMa91xxCA and TQMa91xxLA SOM
Message-ID: <20260707-shriek-pogo-92d37cd50a0f@spud>
References: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
 <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzecNQfsPEZxdUFH"
Content-Disposition: inline
In-Reply-To: <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
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

--bzecNQfsPEZxdUFH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bzecNQfsPEZxdUFH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0mjwAKCRB4tDGHoIJi
0ngXAP4weMhA+W5ND8F/QU6x2I5O9/BMKIggo/2x2S9gYoOMJQEA/2wqCmFM7+6V
Mrx0WZSCsLtoqqQ56pFvzD7qbnF9pwE=
=KS78
-----END PGP SIGNATURE-----

--bzecNQfsPEZxdUFH--

