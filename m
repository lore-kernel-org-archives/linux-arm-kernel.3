Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34040C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55b2MXHN1ae6ZgEcDHzWaK1s3f7kfPOhMW8piFdTCOg=; b=nvMVnIAiwJ15tOx/oKO50ZqRH5
	kKZZpsKK7uzSBOkxoy8cORwHcB01ANDhs3j+pgLUVxqZLDg27uAMuE892m61LWqaccPimgEjlL9SN
	M9Emb1iNKiuHY5mD0XXvF09YgL5A+yYMNku7fA35TSlwe0swdS9BXVog8TbVgm9Kf55xW6R5T9KEg
	+fu1FI+VQsJahqY/fDWAl2I/jc8aDzxZAydtbeWmY8wrtTs3ecGmFyWIb0kFddl9LEE2RBLdLQjen
	a3XfSJQh091t8Gf6t9ezmSA6NhcaHj/eOf/NtxO08se+f5E/wXf94L2VvZsvt8JD0ilXC7jgoAG+j
	TjOYekIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE75G-00000007KAe-0oUb;
	Sun, 11 May 2025 13:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE73G-00000007K2l-2WtB;
	Sun, 11 May 2025 13:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=55b2MXHN1ae6ZgEcDHzWaK1s3f7kfPOhMW8piFdTCOg=; b=nMFf7eH0gPU3ic2dclNS6ebPgT
	c/KZegaChJKyc0wNIT/rTd5U2v9678Lk7YKQLeMTII8UEtQ41cs950jqd+Y9K1I8XmsaIJsikkM2k
	Xl/JeBhlDRT/TN1g0X+TXVv+MwSlDGh9cjK5HJmjGoHf+z9ihN4GA42snq3SEc49cTZA9LkYKZGE3
	2NAVcNWLH6FVAsLXJgOl/qa+87tlsSj9zdpBjfEBwlnwoh9WpyWRB/KXThA8YBxWBWO19RtEMByV+
	wSK628/bDBydPp8iRVvOhQElLXiif0usvl6ialV1PlIXempeT6gSnhWak7jVa+rzuNvrfy0xFJFxT
	Zzo/2tmA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE73A-0000000GcKy-1wWi;
	Sun, 11 May 2025 13:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=55b2MXHN1ae6ZgEcDHzWaK1s3f7kfPOhMW8piFdTCOg=; b=tMYYoGuqY+aLskzruhSEzrfhYm
	3updh2wCSjrXhRH9dN+KBGTlti7qmJnNuWpzgDA730IaYf3gPQHCRbDaDHqY1qdG1sIgusibybcWC
	gkZDZC1T3MlB1L/6awN2g5mVWY96XAH4LPZ2UuIXear5YZPwpRwL0rOkvLRSMPAYUpXL3aVrxzRhw
	wYK1SwbwyWmnAYirxa32HA9ROzvYhGtoVBF/MlQC6mKUwdXqX0BL8X5fzZvAKod9YKe3IX1FrQOWy
	Un7Zz5plT/hyr5IMxk5kVq5KZ7ybIm6dzFn/ug48j/cFhCxTQ+3zW5t/6TOZhKiH3mZqnDZDXE6LS
	OyLjqY3A==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uE72j-0006vF-1j; Sun, 11 May 2025 15:48:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, andyshrk@163.com, conor+dt@kernel.org,
 damon.ding@rock-chips.com, devicetree@vger.kernel.org, didi.debian@cknow.org,
 dsimic@manjaro.org, jbx6244@gmail.com, jing@jing.rocks, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com,
 ziyao@disroot.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 15:48:35 +0200
Message-ID: <3317829.AJdgDx1Vlc@diego>
In-Reply-To: <20250511120009.37031-1-amadeus@jmu.edu.cn>
References: <13758471.dW097sEU6C@diego> <20250511120009.37031-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144905_390169_A07B8900 
X-CRM114-Status: GOOD (  17.75  )
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

Am Sonntag, 11. Mai 2025, 14:00:09 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Chukun Pan:
> > First of all, thanks for noticing all the bits and pieces to improve.
> > I di think I have now fixed up all the "regular" pieces you mentioned
> > and amended the commit accordingly:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D1d2f65fa98ddcafdfd1ebcdb87105141861b584a
>=20
> Thanks a lot for the quick fix! It seems there is still a little problem:
>=20
> > <snip>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > <snip>
> +	gpu_opp_table: opp-table-gpu {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-microvolt =3D <825000 825000 1000000>;
> +		};
> +		opp-400000000 {
> +		opp-hz =3D /bits/ 64 <400000000>;
>=20
> This line is missing a tab.

fixed :-) .

> +			opp-microvolt =3D <825000 825000 1000000>;
> +		};
> > <snip>
> +		spi0: spi@ff220000 {
> +			compatible =3D "rockchip,rk3562-spi", "rockchip,rk3066-spi";
> +			reg =3D <0x0 0xff220000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
>=20
> Also needed here.

I might be blind, but I don't see a tab missing here? #adress-cells and
#size-cells are in the same level of indentation as the other properties
of spi0? I did move the -cells down though now.


> > <snip>
> > +		pwm3: pwm@ff230030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff230030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
>=20
> Missed here.

adapted like the other pwm-nodes

> > <snip>
> > +				power-domain@12 {
> > +					reg =3D <12>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > ...
> > +				power-domain@13 {
> > +					reg =3D <13>;
> > +					#power-domain-cells =3D <1>;
>=20
> Does #power/#address/#size need to be put under pm_qos?

moved

> > <snip>
> > +		spi1: spi@ff640000 {
> > +			compatible =3D "rockchip,rk3066-spi";
> > +			reg =3D <0x0 0xff640000 0x0 0x1000>;
> > +			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > ...
> > +		spi2: spi@ff650000 {
> > +			compatible =3D "rockchip,rk3066-spi";
> > +			reg =3D <0x0 0xff650000 0x0 0x1000>;
> > +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
>=20
> Same here.

moved

>=20
> > <snip>
> > +		pwm4: pwm@ff700000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm5: pwm@ff700010 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700010 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm6: pwm@ff700020 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700020 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm7: pwm@ff700030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm8: pwm@ff710000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm9: pwm@ff710010 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710010 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm10: pwm@ff710020 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710020 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm11: pwm@ff710030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm12: pwm@ff720000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm13: pwm@ff720010 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720010 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm14: pwm@ff720020 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720020 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm15: pwm@ff720030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
>=20
> pinctrl and #pwm-cells forgot to change.

hopefully caught all pwms now


> > <snip>
> > +		sdmmc0: mmc@ff880000 {
> > +			compatible =3D "rockchip,rk3562-dw-mshc",
> > +				     "rockchip,rk3288-dw-mshc";
> > +			reg =3D <0x0 0xff880000 0x0 0x10000>;
> > +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency =3D <200000000>;
> > ...
> > +		sdmmc1: mmc@ff890000 {
> > +			compatible =3D "rockchip,rk3562-dw-mshc",
> > +				     "rockchip,rk3288-dw-mshc";
> > +			reg =3D <0x0 0xff890000 0x0 0x10000>;
> > +			interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency =3D <200000000>;
>=20
> max-frequency should be placed below clock

moved and also moved fifo-depth upwards between clock-names
and max-frequency


> > <snip>
> > +		saradc0: adc@ff730000 {
> > +			compatible =3D "rockchip,rk3562-saradc";
> > +			reg =3D <0x0 0xff730000 0x0 0x100>;
> > +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			#io-channel-cells =3D <1>;
> > ...
> > +		saradc1: adc@ffaa0000 {
> > +			compatible =3D "rockchip,rk3562-saradc";
> > +			reg =3D <0x0 0xffaa0000 0x0 0x100>;
> > +			interrupts =3D <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> > +			#io-channel-cells =3D <1>;
>=20
> `#io-channel-cells` should be put above `status =3D "disabled";`

moved now :-)

Hopefully this now caught all the smallish issues.


Thanks a lot
Heiko



