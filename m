Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952E5C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI9g/83wQuRlE20xbmtztKEXow3I/W3/zdS8wd9zbR0=; b=VsNa6jGgqz+B5mOUk1K9DxEmUK
	roGkTYMUjolWx5yF8r3AovPkS9LVE55J0iuoviICSiNWTxVrmsZzEeC61BAxlpD36GfD7XbWumkJj
	SoTXn6bnIQMJX2tLCKKqdK8zhoD/jVhHr+XSHlZgaXMJGvXqn3/o5UrIBd4+deMK/sI7OmWcms4+s
	BZSMoW+NWzlEH6xp7tCrO7r0AFPv83ZiGBIAR+f/AKpcBT2fgHFzNz80rZFSYCRiYxm/+nMF9Gypx
	MAlJaLLk8zW5EPBfPfCygcfOV4Z4RWtXuhHHKnbmM1RDoWKyDYkHN1kRcTgqFv+vEvD+O4WrzaG5y
	dBtEvpdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPe6-00000003bVF-34z9;
	Fri, 23 May 2025 10:28:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPbw-00000003bHn-1e5P;
	Fri, 23 May 2025 10:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zI9g/83wQuRlE20xbmtztKEXow3I/W3/zdS8wd9zbR0=; b=cPIOZIXVnZooNycm1nmR+tEub7
	RM7HKAZ1JA9hBl9dxOu2Rbu7Hgj6IC2fc6ubzLf+kBmBOdpmZ1+0JAqeUE8H2ZDbc2NUt5lA7bB81
	ExuIcDfCKNmMaGVKESUdToFJKPddP1PyoRqSoQhEXNS0MfbtniBFZfl4Q9Jy7CE4zvUuMovDu7Tka
	uYbV/lVWBd/drDmB3zE2c6VuufJOOjApaFRv7rQh+vdE1VfpNp58fnUa2pbCHjECrvdYI89ihVQO4
	6unT9SHDFuS3yvN3Q1lU3VYOatDIcIHuxiFw49JDuh67L0dJXu1LYc63JSlXf39az3ssSt8D8WtLY
	WIwiPKcA==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uIPbb-0007tg-9D; Fri, 23 May 2025 12:26:23 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, i@chainsx.cn,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
Date: Fri, 23 May 2025 12:26:22 +0200
Message-ID: <5989180.zQ0Gbyo6oJ@diego>
In-Reply-To: <65f95a57-64cb-4815-8ff2-9021ab7b7ae3@linaro.org>
References: <20250519075432.2239713-3-i@chainsx.cn>
 <20250523070026.50263-1-amadeus@jmu.edu.cn>
 <65f95a57-64cb-4815-8ff2-9021ab7b7ae3@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032644_447663_2575FD0D 
X-CRM114-Status: GOOD (  12.50  )
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

Am Freitag, 23. Mai 2025, 09:12:08 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Krzysztof Kozlowski:
> On 23/05/2025 09:00, Chukun Pan wrote:
> >=20
> >> +&gmac1 {
> >> +	clock_in_out =3D "output";
> >> +	phy-handle =3D <&rgmii_phy1>;
> >> +	phy-mode =3D "rgmii-id";
> >> +	pinctrl-0 =3D ...
> >> +	pinctrl-names =3D "default";
> >=20
> > pinctrl-names should be placed before pinctrl-0
>=20
> That's unusual - not inline with common coding style and with most of
> SoCs. Is this some kind of known rule valid in Rockchip?

nope it isn't any sort of rule :-) .


I _think_ in the past we generally had
pinctrl-names =3D "defaule", "whatever"
pinctrl-0 =3D
pinctrl-1 =3D

but that was more a "looking somewhat nice" thing from before we had the
more generic dts coding style .


So if in doubt nowadays, please follow the general coding style as written
down in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/dts-coding-style.rst


Heiko



