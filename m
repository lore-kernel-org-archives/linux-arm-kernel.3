Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7186E9B368
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJ6Fp+6ND9bT9YLc0KTOaJB8aEFzkS2JdOdry7EMlC0=; b=qXVkAT7yFh24G3ZDV113t8vCrB
	3TKN6hJhHmpkkYy/yxl+TrQIxsZPZmPZrimARNTdFDfXCB6Vn3xJOL79YY62OqcaXKGucpEGwTxHZ
	nYu3lzQNS4C+ltNhawXc8EthVgivg0WjKKzqc4JHJ5OzelXEu6kdvEBldqpYTa/5WYmxiXoqpDu2a
	8BxCue8FAYlORSh/gk8jY/mDq/HZORrw88gIZnT3uiZo2kl6YHr4tikQMyoho/MexpUAsUBhuWBHi
	deYJeFSf9msY9Hfh3VnwHuy9ilYViBsy7+Jp1v5TO8vP0dIzungcXHfMDp7+z/OV7J6VT5TMwNB/M
	if8BLNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx18N-0000000CmQs-1qQo;
	Mon, 02 Mar 2026 11:08:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx18L-0000000CmQS-0bAv;
	Mon, 02 Mar 2026 11:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WJ6Fp+6ND9bT9YLc0KTOaJB8aEFzkS2JdOdry7EMlC0=; b=Ksmu/junNI891rI+Ldwlu8ZOJY
	USTaEE9SRmuxDtB7tw1boBq1aKDP9VOpYkyP1KF8JJ8W0bsTfqSl+oFOoYEeT7netLIqrKUViXeOg
	s/WIYF7opi46e4TX8s0ltxDLp42GZL1CIygKM1hHpk2ksDaxM3hjdpjDRH/zQkuuOwB1QBmNKF2V3
	xuh33WUrtEjXPVYQ7V014Qpx1ssy/hUE3qPNvnjNSsWrSMJZnw/x1gvTr8+rjaQ0+vMcJGncIGLKp
	fms8+QIHeP7QE3LBFcXiCgZ1Jxnq0YwXUaZnhZ/FOO8gtFWVz68oy1alLKIHf/iWkFq2GHrTkvQhv
	Zcc/KD4Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Filla <freebsd@sysctl.cz>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix PCIe v3 pinctrl for BPI-R2-Pro
Date: Mon, 02 Mar 2026 12:08:14 +0100
Message-ID: <3404271.44csPzL39Z@phil>
In-Reply-To: <20260301-rk3568-bri-r2-pro-fix-pcie-v1-1-b9ed318b4a77@ixit.cz>
References: <20260301-rk3568-bri-r2-pro-fix-pcie-v1-1-b9ed318b4a77@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_030817_179580_A8F9342B 
X-CRM114-Status: GOOD (  14.93  )
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

Hi David,

Am Sonntag, 1. M=C3=A4rz 2026, 16:54:41 Mitteleurop=C3=A4ische Normalzeit s=
chrieb David Heidelberg via B4 Relay:
> From: David Heidelberg <david@ixit.cz>
>=20
> Add missing pinctrl for PD4 (PI6C PCIe clock enable,
> PCIE_CLKEN_H_GPIO0_D4) and set output high.
>=20
> This does fix freeze at initialization due pinctrl being in input
> state.
>=20
> Reported-by: Martin Filla <freebsd@sysctl.cz> # reported by private messa=
ge
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> index 4d3ebe50b90ba..b4c8abe37d1f3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> @@ -121,6 +121,8 @@ vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
>  		regulator-max-microvolt =3D <3300000>;
>  		enable-active-high;
>  		gpios =3D <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&pi6cpcie_enable_h>;
> +		pinctrl-names =3D "default";

please model hardware not how you want to use it.

The pi6c in the pin-name suggests, that this is a Diodes clock-generator
that creates the 100MHz frequency for PCIe [0] .

Please see [1] for one possible variant to model this.


Heiko

[0] https://www.diodes.com/part/view/PI6CG33602C or some variant of it
[1] http://lore.kernel.org/all/20260210080303.680403-1-heiko@sntech.de




