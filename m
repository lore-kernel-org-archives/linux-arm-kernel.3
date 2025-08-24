Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AD1CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvhkTLwnsyU6LHTKXKMHL524UpqTw6jFMLYcBdGhtHU=; b=vTTChKSA3aayt52HULnG8bjRyW
	au9DJvb0eQ+kMGXBez2IEzX9q+hmVTKGhqBYWBxjxB6PPgOmvHPBihqJMYbtjkaZWu2d7f+n69/88
	hVVqon/Ofb63nD+xwDeBlM8hfH0Igtv8IPfl3HS25VdCdfvp5CBa16a4JrRpEDKU2+bZCfvUoub7E
	UMysAzDKTpduqkbVG+hjrOyu6YeJE3Xm4Uat4lkj385/40VWsjha9ivrkn2ACB9forURRxqzVsVi1
	rBzhKD4blr1ese5fFKh4T1gFsHlTMMUT/qyper9WdwdjnrYMEpo9zYPLQlygj4wTHDWOlkamaQPJ3
	SQTahIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8hs-000000063gf-3fno;
	Sun, 24 Aug 2025 11:16:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8PL-000000061se-1wxl;
	Sun, 24 Aug 2025 10:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SvhkTLwnsyU6LHTKXKMHL524UpqTw6jFMLYcBdGhtHU=; b=a4kTDiris9yS3x12O7/dXFjzBQ
	mNtLHCnN4WqJdpm+eNdWPbTyLsNyWsRq5b8cslO5gYhxfU0jQtFdSC6WqV1Cyw4ZPbqe+LKXAE+5K
	r7HRh4OjrJ4n7PJM6X0GEvHjddsnMTGyqC7LPYN48Xzmr7j0gBDchFpMNscsM8ghogIMeIWIELLc5
	/IDma2X/PeG/q/HJ5V7J/nL/2zHIxXGyumfeeQVjwWgpHIX2qd6KIP1eRc6ZNh0xzRDbpZpx5u9Jg
	1c8Ffu4QhIKVDJSwpnh0TgGvs/Vv7lGJfyC56s9sNpPs+deAnQM/w8VEd2BTuaQhVJayOm0yQf5pJ
	b/GPTOZQ==;
Received: from [62.245.128.201] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8PJ-0005c9-Ne; Sun, 24 Aug 2025 12:57:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hsun Lai <i@chainsx.cn>,
 Alex Bee <knaerzche@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable+noautosel@kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: Fix wifi interrupts flag on
 Sakura Pi RK3308B
Date: Sun, 24 Aug 2025 12:57:05 +0200
Message-ID: <16812972.uLZWGnKmhe@phil>
In-Reply-To: <175603280229.3445205.18144135063810636432.b4-ty@sntech.de>
References: <20250818090445.28112-3-krzysztof.kozlowski@linaro.org>
 <175603280229.3445205.18144135063810636432.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035707_499868_D7F2D46C 
X-CRM114-Status: GOOD (  12.86  )
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

Am Sonntag, 24. August 2025, 12:54:43 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Heiko Stuebner:
>=20
> On Mon, 18 Aug 2025 11:04:46 +0200, Krzysztof Kozlowski wrote:
> > GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> > These are simple defines so they could be used in DTS but they will not
> > have the same meaning: GPIO_ACTIVE_HIGH =3D 0 =3D IRQ_TYPE_NONE.
> >=20
> > Correct the interrupt flags, assuming the author of the code wanted same
> > logical behavior behind the name "ACTIVE_xxx", this is:
> >   ACTIVE_HIGH  =3D> IRQ_TYPE_LEVEL_HIGH
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [2/2] arm64: dts: rockchip: Fix Bluetooth interrupts flag on Neardi LBA33=
68
>       commit: c9f986a54d4031a9b9dff1eb616b0796aa28c730

Waiting a bit more for patch1, to possibly get some testing.


Heiko




