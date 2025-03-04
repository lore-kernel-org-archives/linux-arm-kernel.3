Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55984C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElnzQ303PfA4B5g1gtMvm2zchjHj9gy7dIO2NLrF/qY=; b=xqw5L0Uv76BsbDaPncFCNg1b4W
	1Qd+nddg1rZ5CoJbG/an/JfJLMmv3cHTBEJlJLqZrxDqqxNDhbyq8Ibe/Jez+IU4jYUg8EqEcizIW
	dKFFVwFMoEOMG/JkY4RLHROQZ+OmO1fB37+2SezjWi92Pj2mrUksYLB5pBEUwsG6xFbGCFnbEENBr
	CdoQ09HpYkKlR4eZxHjzuCvFCZK5CtuCmEq+G4m89qC0KI+0Ui/iEcyXJMe4XKgb11TuqFl3M0o/B
	zbZRNcKOiwEiKn04PNJXUnb8nt5B5i6azdy4Zs1r9XVLL7cyz0TW5Vu7aXJYs07TFxtDAMNbkVFuH
	K8sKAUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaIl-00000006M3X-2FGL;
	Tue, 04 Mar 2025 21:59:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZ89-00000006DPu-3IDU;
	Tue, 04 Mar 2025 20:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ElnzQ303PfA4B5g1gtMvm2zchjHj9gy7dIO2NLrF/qY=; b=khGMv6sWor2meFhrfpWQII3ocu
	ZXfiolYMgsDqacRYWeZl5MtbzdCNfGtkktEW/NFF1DiCtSDEzOGchuf95/yQi+DHh2rXm0jV7IC+k
	2wLuKL8yhHVYV/JqEHYwuXNUwkn4NH4waYjTygagq2IGpWuO8GVYvlnCVTTy9jh0UmAyvReBOOMA4
	jOAxBWDSwdUUojUo4NCjl8z2h0TNPhdZSexKVRPnD2tuolCf/sdY0yncROnq4kHbj4q3lbGkUqUL/
	BZA3aY7aFEqnrtbvr7YR7TYuvtRLfCmZuAOwxuVyKFuwMSGvO7DlJT5h14ObWcUt3lD3KPSdeFftX
	4WVLGh7Q==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpZ82-00062P-7p; Tue, 04 Mar 2025 21:44:38 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: rockchip: add regulator dependency
Date: Tue, 04 Mar 2025 21:44:37 +0100
Message-ID: <3938258.QJadu78ljV@diego>
In-Reply-To: <20250304142803.689201-1-arnd@kernel.org>
References: <20250304142803.689201-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_124445_839197_648CADF7 
X-CRM114-Status: GOOD (  10.54  )
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

Am Dienstag, 4. M=C3=A4rz 2025, 15:27:59 MEZ schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When CONFIG_REGULATOR is disabled, this pmdomain driver fails to build:
>=20
> drivers/pmdomain/rockchip/pm-domains.c:653:30: error: implicit declaratio=
n of function 'devm_of_regulator_get'; did you mean 'devm_regulator_get'? [=
=2DWimplicit-function-declaration]
>   653 |                 pd->supply =3D devm_of_regulator_get(pmu->dev, pd=
=2D>node, "domain");
>       |                              ^~~~~~~~~~~~~~~~~~~~~
>       |                              devm_regulator_get
> drivers/pmdomain/rockchip/pm-domains.c:653:28: error: assignment to 'stru=
ct regulator *' from 'int' makes pointer from integer without a cast [-Wint=
=2Dconversion]
>   653 |                 pd->supply =3D devm_of_regulator_get(pmu->dev, pd=
=2D>node, "domain");
>       |                            ^
>=20
> Add a Kconfig dependency.
>=20
> Fixes: db6df2e3fc16 ("pmdomain: rockchip: add regulator support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



