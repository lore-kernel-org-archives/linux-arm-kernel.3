Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F7EC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TR16N+4ADKrFb2rQCDGPtxGouDfb08VqJfQdDPg1AHY=; b=AGnYFj6SFzOILzDPTi51lbfLYC
	DuE4xZoQQkspkEu7/IP6cxT0kPErRuk/q3U+9omBSYvRVsINRWribJkkF+FabFmfwMbVb+hFS5mcH
	rpiVzDUZl361il1vEJA3jKG3wfJZ6s51ZRgh9nDeXe/nxpPcLP09ybdn+sD2cC83BGdysB8N1DP7d
	OMM0eXCxVoZM7RkMebKCn8fqXp3t2KT6WVW16XtBEpWvRB+OLiHKOHkniPq8AobhXfhpQNJ5a7T/U
	TB/RnL2nSH1kBnvCbXtpcSX5BuUeRpfZwgx7Hhy7LBtOONpDq4fA86Bi3vbGoAyHF+nAoxMHkgLur
	fQajI45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yDb-0000000GKw0-3Y92;
	Fri, 11 Sep 2026 10:10:51 +0000
Received: from mail-24425.protonmail.ch ([109.224.244.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yDY-0000000GKvJ-0fDr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789121442; x=1789380642;
	bh=TR16N+4ADKrFb2rQCDGPtxGouDfb08VqJfQdDPg1AHY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z5RSvMEKdVV48+7XYNH7tcrORPbnewIZTKfKlcC8ybImIlghjfTx6vAJeaaBCdEPh
	 RDotQMQQWKj2gLXqU05EyW+lqe6P7gWsA0WihbKJotPYk9D6XyvFD9U8UP4Oj58lVC
	 GknWEAVeXUUICmnAdU2DNwH/4soaNdTKigYLIgaZ3ZzFU9vDPxAhRNOVpzl7M2knZA
	 IhUySoVrKsiyiYETYgbywxlwzRz5REjbkTGrUvhm9SU/pCZxiXkjwEm0L6/ETlA6AS
	 mgcnWTr5Nb+bWEPJjwBPIEvRjFEl89w4eqxuCau7D9FoiCd6qPWmyJKy7eO8F7H4Gb
	 4YYsKu1TdHMQQ==
Date: Fri, 11 Sep 2026 10:10:37 +0000
To: Chukun Pan <amadeus@jmu.edu.cn>
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Cc: Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "diederik@cknow-tech.com" <diederik@cknow-tech.com>, Heiko Stuebner <heiko@sntech.de>, jensen <jensenhuang@friendlyarm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Message-ID: <8wGuvZ3pQ9BL5NIu1j8OzFUTjHePGJcrftcKEe0xkosyORLPJUmdHI7nOCC8o187x1s8ev84HLiBKdNjqQvu3U3upIeSp2A4AImHdD4DOuw=@proton.me>
In-Reply-To: <20260911065500.3145846-1-amadeus@jmu.edu.cn>
References: <20260909225002.976-1-razor1702@gmail.com> <20260911065500.3145846-1-amadeus@jmu.edu.cn>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: ca164b9d304b3858ce2f8f1bdc7902d6623f2398
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031048_804094_ABCDA9A7 
X-CRM114-Status: GOOD (  10.03  )
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

Oh, sorry. You are right, and so was Jonas in his review of the identical H=
28K patch. I should think twice that thread before doing it. I was too hast=
y and failed to reflect the suggestion I had received. GPIO4_C2 resets the =
PHY, not the bus, and describing it under &mdio1 also breaks U-Boot, which =
reads `reset-gpios` from the PHY node ( `drivers/net/phy/phy.c` ) and lacks=
 support for bus-level resets.

I had only tested generic-rk3528 and didn't check whether a nanopi-zero2-rk=
3528 target existed. Checking my own setup afterward, the R28S I develop on=
 has indeed been booting a board-specific U-Boot target with the PHY-node r=
eset all along, exactly as you pointed out.

I have droped this patch. And the remaining four only add R28S support. Tha=
nk you for you sharp point of view.


On Friday, September 11, 2026 at 2:55 PM, Chukun Pan <amadeus@jmu.edu.cn> w=
rote:

> Hi,
>=20
> >  &mdio1 {
> > +=09reset-delay-us =3D <20000>;
> > +=09reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> > +=09reset-post-delay-us =3D <100000>;
>=20
> This is an incorrect change, see also: [1]
> Since you are using mainline U-Boot 2026.07, you should have
> already noticed that nanopi-zero2-rk3528 is available.
> Therefore, the nanopi-zero2-rk3528 target should be used
> instead of generic-rk3528.
>=20
> [1] https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwi=
boo.se/
> 

