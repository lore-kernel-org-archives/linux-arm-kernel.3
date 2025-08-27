Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7484CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAZ6kW+urfpJVrbmmVHyScLCZdUx7Khi8HxkOyhlNCw=; b=h9GitvsqKlq0k3odYX/o4asC6F
	kLOi/ckE2o9AJ3ooKoOTjRhLdnJtPRzoxjZR7lZtz0vcNUJXWkcpQ1DoAMYZ4OjFVKE67SdOwb/cf
	rXl5EJvZc1iP+4kcknfO3nknRfODKDg0GPr7kAfviEpVwmvkcNwwOUaRrAkydVWGQG4GYGKAr+xRS
	KDVj0tXKBn/AJt/DBTTPadbhEu5+DOCP2Rn6fiXFcmIl4Ymf1gsfFuyvprqF4wB8jUWJm6lduqSZd
	IR1rhV8hMoIJZd8S22HB6pvdv6k2YVec7m/V9VxxdGBvxvciRBO+2N6dRzlpowurSf0Ex8KIFwyGB
	2qM+0AeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQf-0000000G0wd-0TR1;
	Wed, 27 Aug 2025 15:51:17 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urF7B-0000000FPHz-1rfJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:18:58 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EDA853B5;
	Wed, 27 Aug 2025 14:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1756297125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=BAZ6kW+urfpJVrbmmVHyScLCZdUx7Khi8HxkOyhlNCw=;
	b=z9zv6kIQFoN2PsmzULXqbyFV4INj7xiF/R3wu5k7KzkFZ/Yy4dv7xMoA9IGDTNv6o2bCOJ
	khCF+QlpsciCiL6qil5OGsIFmU+lgeHoZStyNJpaqi9GJwRigWWzze2R3aJ9CfPJ2oDL9g
	0KJSbA8JbzQiVH6VUd27HYIFwkyR9uIXymFlNFoZ6alDxpRX7E1zyuQixVHfXxNGoC7bhK
	Ksc4nhICEp4UnwtquAgnrUojEd9wif3qgWbr/Ly/VZnYzgtjTVch4yPrkK3pLCWkgExWt7
	n5F2R+0cFZfrVmtLPFic9F+nt22eNHqqDw4n0rvdvWvnz/SvWK18S1XZdi1G3w==
Content-Type: multipart/signed;
 boundary=25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 27 Aug 2025 14:18:42 +0200
Message-Id: <DCD7DBPZMCSI.1516QNLWGT6FP@walle.cc>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>, "Lee Jones"
 <lee@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Michael Walle" <mwalle@kernel.org>, "Nishanth Menon" <nm@ti.com>
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822152313.vjzjtzik2q5ek5kq@sadly>
 <DCBBY4827XAZ.11UHI6NWP7RT0@kernel.org>
In-Reply-To: <DCBBY4827XAZ.11UHI6NWP7RT0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_051857_656924_6FCEDF99 
X-CRM114-Status: UNSURE (   6.06  )
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

--25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I'd expect that Lee is picking up the first 6 patches after they got
> an ACK. Please correct me if I'm wrong, Lee.

Ah my bad, patches 2-6, i.e. everything belonging to the MFD driver.

-michael

--25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaK73oxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+NPvAYDV89x/w4W9hx/fkMchHZt5GuIDMb82EdyH
GzA6TiGytphiSsatpAK5+CjxCG5h+BYBfje+9JS6ChAetWdIq0skCvlLswe9Gdkr
XEQfnTuzXkZMTxp99sjE7obqH0FpmSfssQ==
=HTIU
-----END PGP SIGNATURE-----

--25eabf0cb9a9a7b93c31748f8706f21d7f3e417daa07d5fb9c4f9131d56c--

