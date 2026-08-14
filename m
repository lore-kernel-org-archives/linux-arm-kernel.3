Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC2BC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zo9sxbBLmwRt2AyGVz8Dgdllov4byoOwzEtt6rHrTk=; b=aCIuOWvB2IvoE67lCVNufO2vgj
	ZzDj8ORj8+YXyMQLA6smoyTXB5VOnEYnwSmdcn906KWGevWMlU8wUyhfIP9xelfgkhbzR04MOqMW0
	opxVc5jMKA3c2PVm+luwQZ/LnRoIeTOR5wBiE8XXrvTSuiZhecufVaYLQqsSZ2EKJGvrd8hChvkAn
	6aQTlyfQLwh2oyYWTijy3mbZuaoyeirmExXyqcQgArdgjQ1bjCtzzK8cHQTH1SZvy2P8ZWVpbXN+h
	krN45x1uWR6agcJXEtChQwXgJV4+hcOqjwKtSRvhrXWOBcgdo8WlPM1AmISQIVHme+PfEw3a1jp6i
	WJuCYYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumNo-000000029fd-3PO4;
	Fri, 14 Aug 2026 07:31:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumNj-000000029eJ-0nad;
	Fri, 14 Aug 2026 07:31:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id B69F541572;
	Fri, 14 Aug 2026 07:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 19E4A1F000E9;
	Fri, 14 Aug 2026 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692670;
	bh=0zo9sxbBLmwRt2AyGVz8Dgdllov4byoOwzEtt6rHrTk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=X12yDsDiMbHtt/bGkdH7XJbOzteI/GIR+Iphjvc/5cc1RT2hOIdu2YtPDYIIuUG54
	 9Jl8eBRWsRXt8FDcncFIAWD8XFoQaJDpuW9zOBEKaZV+AP7rc+OTS99/pyL9fkvr4S
	 ZVgrJ/NW0Qo94bRE7XOQ3yRq8i46lUHUl7h/UBu68dVT2Qq9Nc0bLnG2qUq9nZP5FR
	 8IjKCd4aayIgB1ovqwm1DZAuRGVDfZIVMl6vxZy6K+MMkDHTQc6xUUvfulQJZW08+J
	 kiROBAk20PClPRt283tjTFruK0No25mgiWjTKedxJt4b+qrwsevJ1dIDSoFmLb4vfq
	 FQzRMHChb6KpA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 09:31:06 +0200
Message-Id: <DKOHOVZ9UJ41.2FS5JYPQ2WBTU@kernel.org>
Subject: Re: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing
 the flash opcodes
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
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

--946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> Create a structure named opcodes in the flash parameters structures to
> store all the flash specific opcodes. They are typically discovered
> dynamically through SFDP parsing. Move the die_erase opcode
> inside. Later on we will add new fields there, like the supported
> opcodes for accessing the status registers, which are almost vendor
> specific.
>
> No fonctional change.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7EOxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iv9AF/ei4fT00bM+8IDv0p1cB10M3pfUjHCZXi
Me21vMHQevWnoKPF0AzJwAPkSJX6wafWAYCdNi+JduCcouDow6Sv/VLow6gV401L
Vxa7jGZI+EUS2H30EglWavMyaqa5pHsJyHw=
=xrLA
-----END PGP SIGNATURE-----

--946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371--

