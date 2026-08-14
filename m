Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F74C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0l1bX0P5bF/3uYea5/qCNJ8xdsZ091OoFQroj+MxKg=; b=C3c+liOar+TLtKj7H1keT92sys
	355Kmtfg6yWnmjMU8DLhfhV9veorNrdLUtZZ95O0mD0aJUVQv6NKz+bKD2UOd4wMQYWJhPrTDU0R0
	E39HLpQWnUOyG9HsvNSr4Bd7r6mW1iou3OnORDlJBVTdUuOmtVdkAKbs7X9M/2NuXqHmUCMQCTlVQ
	KqysWXJ7Zps5IPk5wk5bCFK+3P3G8VtoWN0mdA2PEhbHlzg1HRfqlaip03KOpgjtes+2PIIJbiueg
	NwYuVWOD0mPB+o/p/ZJAByBBsyC8KWEwKrgfMXGOFM1RsfCXTHhjRUpAMVRY9qgtsLaRm2ZlO6U3q
	Vop8pwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoYq-00000002RxB-0Hz4;
	Fri, 14 Aug 2026 09:50:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoYp-00000002Rx2-1xFm;
	Fri, 14 Aug 2026 09:50:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C67234357D;
	Fri, 14 Aug 2026 09:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 275B81F000E9;
	Fri, 14 Aug 2026 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701046;
	bh=H0l1bX0P5bF/3uYea5/qCNJ8xdsZ091OoFQroj+MxKg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=mD7JoOGg+bCqUwWzQx+ixQedBeOVQjanfMooqc1zfcQ6jIy8gcx7WoB/8K5rkoF2l
	 t7UKFlHx00P899tgTWaG80iIdvkztAeeyecOtwcV4REH+kpeaMXuLJoe5zkanE1TkK
	 k8YmAU6Zd0Qq4U8FQKbApMKxYT3f1/sgOUo9Q1h3n73ju++5go2Uo8SnAR5QxVv27G
	 u1DGJba2odaNjCfmjGo0uQjgJGCrQcw1tm07eJIJLhcxyc5vvBd/qUB20GAj5uKrpL
	 lZBaQzgXYTMufhVJ1HMwQeL8adKkv0zpzHHlZGecNpRF0LiqIA5yTWTQ04XDyW+m4X
	 rgTnXICsfksxg==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:50:42 +0200
Message-Id: <DKOKNRVNIE82.3SO99KA3HJ3TT@kernel.org>
Subject: Re: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
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

--eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision between the JV and RV families. Both chips are
> very similar in practice, it is mostly a matter of electrical
> differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> The new SFDP (rev F) field which forces an alternate write SR2 opcode
> (0x31).
>
> Since they share the IDs but not the names, we must hide the names using
> a fixup.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7k8xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hpuAF8C29KVtaU3EHuv/+cbDPwhdKI1sPD/5To
uAiMO+bgZdygmwbTX2ytZg2/MQnE4jxMAYDw/epGxqDoLw1bXO660VuEMFb6kofV
67B++mdpvZubIKKYRCrJyotWvjO0+JX7DmA=
=ZmIc
-----END PGP SIGNATURE-----

--eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9--

