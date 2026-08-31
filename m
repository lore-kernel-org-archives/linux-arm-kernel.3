Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FDAC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Vynq3eyR9D6otlOg1mCxMi4f6PjR1A45mbH0owAWkk=; b=WmlfTWEbKr1c5K0ArXT4DIbmhZ
	WI+5QUqvRgR/lUfMCK/3QYGoA7QRaq3m8zxGg/fPdIWv5Ri9/Uivg90ktKg19wZMCUs4XTe8cOHRf
	6xWXB7bHb0715Xs2+8CXpTkyqzvINSDMyRqEgNgyahxakwSjdIEkmvquJymxZbK8ivPLMES5QLh63
	5dLF/Qt0CyKhi6dzcrLV04Gr9J8MZtiSZoX5/kDeo0fwgNhT/kFjHZjx1Uvi9ot7FdVd4gzYrXAgb
	200fISAEM9+S/8B71EvmshXZcPqU4TYi3LDQyRsmJxEq4lMdjwJFcIAi0CUTmiVto0i34dFoeAMC8
	9Kg8iAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14YI-00000009y23-0ZzU;
	Mon, 31 Aug 2026 16:08:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14YH-00000009y1g-0603
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C549447DB;
	Mon, 31 Aug 2026 16:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE6E1F00A3E;
	Mon, 31 Aug 2026 16:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192484;
	bh=3Vynq3eyR9D6otlOg1mCxMi4f6PjR1A45mbH0owAWkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IvJj6/3aqBrI/QT35/fpcVZRyOfWItH0VXOAoZZ6GqV4XsstFm0+dp7If9yxbTH1B
	 njAzDPqL2TcX7bJ+zRiFgmjX+lhmsbGzeEU2g33IprSQsxpd4IELWiHZqsruYG1iaW
	 2VW9UHnSw5JQ9tRK/0AKbpJNHXuSYD/9Rfcz9R0OwklldWttlaHk47X6QaxV2Dg+Bb
	 wvuXilK2kjdTj+gaXRlWttu6hnIzQrZjS6DE9sWAugAwVGTQHpr/qoa2+sUHkHHx2/
	 QobotARceuOkaJP94FXYGEEcJWVLw1VRe7tsJm8s/A+02Yp9UPfvIqlXx0xMRBRwv1
	 CPigM4OsfJSZQ==
Date: Mon, 31 Aug 2026 17:07:59 +0100
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
Subject: Re: [PATCH v2 4/6] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <20260831-pushchair-empirical-034396da2f0e@spud>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwXx4DOOFbxIx9RZ"
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
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

--pwXx4DOOFbxIx9RZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pwXx4DOOFbxIx9RZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWm3wAKCRB4tDGHoIJi
0ou7AQCfQdXvM1TibmA0/BN+SjYPRIakJo2dh19uu/ch4xXz/QD9F4AbjzK2IupS
KOH1B7ezgchdWNPN3EfZ2Jt3qde19wQ=
=G8I8
-----END PGP SIGNATURE-----

--pwXx4DOOFbxIx9RZ--

