Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC6ACA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=; b=S6AO4ICb4xwy4Lonq7pfLoQkM9
	J1t9qk/Fh1pNnVuFamMeg0ubVIMGYihyblY124fqfyCRv8d5TeBxucvv1CDSTCgOW8J/EG7ugYxHY
	FBT0PDg4mfXQ3tjxrI8e109ZutBQ9XGdaafKoXTZQ542IQGOyUPsrQ6GHa93NH0Bf+jcGoyu+LOAP
	RHxfvME8SSIKcLywt8Vmx1fahPokfy1XwC+O5slqbT4GIC9cJMFaFUQZWRaX2flaNDGQe4IlUkLzx
	BsJyJ99ts3oSlGDObzu6FyJ/O/yuYrZmUg8c9SXWMcwC852JVIwTArDU5IvrB3moSnLfJJfW3iKcw
	53Sksqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJs-000000070oO-1Sxv;
	Wed, 30 Sep 2026 18:46:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzJm-000000070lU-3PBo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 18:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=; b=P5HBWyI7f5B4ZIG86CBSlWabLA
	ZNBzMzC1Qk06u/9Je0hIq4UHsXPMp/fMLHii1jQoiHXeo56BYXZrOYUSTAIU41lkbpXMkFJb7ulVw
	5DMP5eEhkQhDgJmyJ8FHgzkmtzSwgmA3jVM3WhqUKm0E15nLmwBnzxx9o3gvo9DZuDCzsi3/FC1mn
	6JvW5fovJsgX8pFTxM6nAuBPOui5fb+2AQVAcGo4Gg75ho434otGgLjsOLL+R45FvN/HfHhCKqKmC
	Evs/xoBx7qeFqBCICHykQvtaJ5yApiVKyIkxNr61MMoihdD43EbzulzjvYrBw9O5fXAac6cFCnuSe
	83UIIvhQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBzJj-00000004DFF-3gcg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:46:13 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f91so3358319f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793970; x=1791398770; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=;
        b=JIPCelF8JUK5RCXRPraCZUTwxQDdVwtpcr+5Ry8Bk7lTkwBwwgOBqLjmJFdWQa7trV
         YleKLvYnf7RDsOOEtiBNy3t7iXHk3j2yq6K3VifEqNZbJXS5irzCeHOk6tWNykK9/pgi
         KA+bsBnxoUfFkyOCoAtICNE+Bz4IfS7vwJnHIzk0wgMx5+ECyTQzp5P1TM/Gr+v1KBv8
         vNGk7aGeInCsExvsVFx7yvNYtIVTDYyckSQRlwEDTBjYfhIj4oDEcrPdqGFEoxk6XQEu
         xZzF/pyFnEy74ydIJ++tIU6eGM/j2NGZG/sTJFaoR5NWcjKUvrNQmK0kN4LCwBpD0b+O
         jkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793970; x=1791398770;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXR+cYfmkTxJIBdyHijL4ukoiH3E+7bXnRJxpGUMSOA=;
        b=DUNqAaJCKMIyknIIAn/zYOlkVwqjMZKLKwDrA177/zGuIFP5bbVNK44jCt3f9RFRWh
         lmoxQAMHFi68j/VCrNbgBfK26Z1BMfzCdWxYbpw/z3bxQo3Zn6TPTCjB7iaYfBnkYHMG
         gtq5huTrwIL4vBmosszgWIY0JXvicNFBKZ/+Omt07pth8iOJdIKVs6AFOAQvR9rPnTaA
         1GuZ+uW/uMF9qhQOyWDBeZqGt1gmXv1jsu9xYjoHbrV8BVqb7cHl05cpEFQlDc4x/19n
         Ds8aP93ion3x6fnohoq7mUB9vVTU4niL+KFVbrjAWEnMx9/JYYzo5ngy1ie8pHauC965
         DD/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxP+5YB95xZNbsgNkcoLv2mehlXvU7IuJK/K/Y4uBsWzOrPvRy5vS0DQr7oiNFc7jcUoM+klVhgNieyeZp4wFoT@lists.infradead.org
X-Gm-Message-State: AFq9FYIHrAl6BTAgljBBtCWdvWpTmub9kAlz2bNZeAqBHqLvtvzjye8y
	cBDFStagJaQiwYdVj2zUrY3n3NL8B0gahrKqXcEB4P4vcAyGzakDlGLW
X-Gm-Gg: AYBFou1O8+XPizlZGV3er4vhiHw9b1YIIzP2ubLqYhaWj0h9CFr72TKjXAHaQ1TQuzv
	y2sez5AZfySs4p0s7yX81aNRrNMVzpWKs9e1viG6tgY4EBClzCIVP1LoBbkemnOHCytC5PfAd9B
	UaXxq+cx29tPzLHB4feM1491uMhiExWzA4xqnPUQignC+w+Nv5nYZqyjek1rOlIbtcs2n6uBDo7
	puVuy9jStSpaZCzMBN3RHbCjf7Z+CQzdF/OWUAZdlZIYqWgR4oL7eUknDYYeLUC4FG6QGyN4N06
	Hfc4Fcbd7wX3LKmCCHRIUw5KHCavZXvX+jtJSx2/iPj6sswO+88LYmFvoELYt+BhaAAydpQblcB
	Ywc1fMa6iOSAtwjrTmNIl85QSQQlCXLWPN6U0ah65eFHWr8bAJ23zdDHeFwJ7YcdabppzuWo5WN
	Yg2KBHO5wqEJhKiNdTWnlkXvfNOyY3rAYffoPz4bnijgCOIX87mDFrpqMhcSdU2n/PADOyzscm3
	XsuZw/UwQ==
X-Received: by 2002:a05:6000:4914:b0:487:1646:8740 with SMTP id ffacd0b85a97d-48b02525c39mr4664720f8f.29.1790793969529;
        Wed, 30 Sep 2026 11:46:09 -0700 (PDT)
Received: from strix.localnet ([197.250.96.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a360c2sm858825f8f.36.2026.09.30.11.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:46:08 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:45:58 +0300
Message-ID: <btFKzO4uRMyc-9MtgwEq8g@gmail.com>
In-Reply-To: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
References: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartsPKDCllISYmd3lCo26IFKw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_194611_924807_F46AD12F 
X-CRM114-Status: GOOD (  15.63  )
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

--nextPartsPKDCllISYmd3lCo26IFKw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:45:58 +0300
Message-ID: <btFKzO4uRMyc-9MtgwEq8g@gmail.com>
In-Reply-To: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
References: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 30. September 2026, 21:40:12 Ostafrikanische Zeit schrieb Stef=
an=20
D=C3=B6singer:
> Hi,
>=20
> This pull request contains the device tree bindings and clock driver for =
ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and adding
> drivers for its PLLs and clock tree.
>=20
> The patches have been reviewed and carry appropriate R-B tags by Krzysztof
> Kozlowski (bindings) and Conor Dooley (clk driver).

My apologies for the name confusion: The clk part has been reviewed by Bria=
n=20
Masney of course, not Conor Dooley.

Best regards,
Stefan

--nextPartsPKDCllISYmd3lCo26IFKw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq9WOYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi0vkP/R8TftVhmpOKvKtkCGcF
4ZtAmaTgZDo368Ob58bGJwjcPcIIQ5zq2NGbYUmEOAwv4cgjizL65aUsbrRruv7q
Nvwq3G1ME/X1DzxqGzvTPnSF1TOn3wlGgwVOUDyhdABmcKcj/yVUAz0MTbGIoHhA
3cBXmIUxge9lFEfvAjA4/4sc0VchClI7VkqMExb+OMLhnLL7Pz6iiDL8nq4YrTqG
FiN8wmVSAfSpoeDd3+JWJVoxpc67pIrSs/sJdUogr8mT7OQ1l8Rq6i7cBaPpMhe0
4Bs7kJfUm6InymbNlNLmN38qaYvX91zNqLVQUJ4mstasx+vSHIr+VrOpu7RQ7mIO
DzBC/tDGB36rVfehgbtCrvmq/F89WzLCAjq8jfmAiWoQjG4EQTZkUFEQgozTAZy8
gjvUozvVVv6zHWh6qrf7er1UffZedQQO6onl+OrDyaJaXcZGulacm0qwxYVpG508
DNWSWKChqM0x1iO7W3a1WLKz96H0pAdRAm/ZqKKT0P9X/1dPCLB6DvJJYzLYmsFG
JE7yeEcQ6Mv54NXTcOkbMq4awIBR8GzwhHeU61K7zC49COrFbBQTvR791IdsX5TE
fVae2s63wZ0LEm9RFZtMf222Js8igqxVObRucgDghF8tO+WgipmsaDW2HWUdXaRP
bkYvTz+t5nqEAikxecJo7pTU
=bBGZ
-----END PGP SIGNATURE-----

--nextPartsPKDCllISYmd3lCo26IFKw--




