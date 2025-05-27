Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8844DC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkhC4UgjPuQVaDzWVls8hkO6XTDFrLoAmVdIcxrQuac=; b=MgttUPDixzx+rjRImL7lsgkiF2
	3oD//2yZybk4ulhrFaeW6YkwQj/7GhITFv8ia7x6HtfwTd1s5vPNyyrfl+5r206Xtx/th0XFWCI2G
	9+ZKH95OPC+c4b0xz2I9NObbw3uIXANjmMd5hKRqW783eH35LPyRQK9gXv/hx6RESpf2BnawXkASo
	b8TDSgIToOXPNVjYsvCOAC+EOgKl8FIK3W+z0w39csXtd53FcrlbU9kHfA94cW7OsijbhRDuBtvm9
	j3iBr9agAa2u4KF2yymIcrvdlb69fjDvrtbsGfFsmav9Z6trGUvdNnAm1tLLhY8OlK1dWgWH111jc
	S2Lv4PSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr6x-0000000AQNn-3EMA;
	Tue, 27 May 2025 10:00:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr4n-0000000AQ69-1i0U;
	Tue, 27 May 2025 09:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CkhC4UgjPuQVaDzWVls8hkO6XTDFrLoAmVdIcxrQuac=; b=zdyPE/6FYF0B9hHYOcyAJQSQVb
	v5p2PtNxurf+8p3BwNCAmbsiWZt75jOct2i6rviYg7cuSxRIJMtJLKN+NASU9Oo66Djpdjp4wjfEm
	m0IwHZ8ZVzTGe770tvvY2YWklQCYcQBuQw38CgwAkZpu0e3lAIH4gUiUICPcvh03Q666yjHPzeCNu
	e63o+lEPFgUfnMU19+gIuQSh+XsjmE3UK9ZYLFPVTC7Q4sj3pQzcYDP9Y/R3x5iT9hPP8Z6fVHuM+
	PdZyny0o+QjDlJp124lzkh06v5yuaeiXkjwMVh0o3Jn15L7JVjC/0BDKhqrsJq8PmNGgFGa2J466h
	gcnPF5dA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uJr4i-0007Bf-FG; Tue, 27 May 2025 11:58:24 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter for
 RK3588 Jaguar
Date: Tue, 27 May 2025 11:58:23 +0200
Message-ID: <2600723.TLnPLrj5Ze@diego>
In-Reply-To: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_025829_470646_8A499E40 
X-CRM114-Status: GOOD (  12.03  )
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

Am Freitag, 23. Mai 2025, 18:48:42 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> This adds support for the Ethernet Switch adapter connected through the
> mezzanine connector on RK3588 Jaguar.
>=20
> This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
> connectors, two user controllable LEDs, and an M12 12-pin connector
> which exposes the following signals:
>  - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
>  - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
>  - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
>    GPIO3_D1)
>  - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

> +&i2c1 {
> +	#address-cells =3D <1>;
> +	/* ADS1015 can handle high-speed (HS) mode (up to 3.4MHz) on I2C bus,
> +	   but SOC can handle only up to 400kHz. */

Multi-line comment style would be
	/*
	 * ADS1015 can handle high-speed (HS) mode (up to 3.4MHz) on I2C bus,
	 * but SOC can handle only up to 400kHz
	 */

> +	clock-frequency =3D <400000>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +

other than that, looks fine


Heiko



