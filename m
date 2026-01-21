Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E06D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfisx39MoKyL9c3tUxQTaTOyIEsGPjfK03MuLUniLRw=; b=phgFsvsAcVW7B6xy1O+js9iRHV
	7h5fbQTCbCDWYrMoCNB3fGOkub6k6HjYAWx5/XlgewOj3orFouATiWEu10IZZh3tpX/v7QePAU2hH
	SWjeYdtSBdxiQvVHQ/9xYQdmrytcejCJFRiLqHQvuLj6181tEb+ZgGa7kufnIHKUE84gFQsCuy6LJ
	Z5yF+MRikwRIlFy5Upt7PptLLTeLixxqUt4lOcAd7zn/qPIK2N2p8yQdxeLRbXvKTDkOu+jxqQers
	TsLcgPQ3Q3Mgk5RIEMZ/0gZ/UovZMhEfn0ORdJCf/TEJ6NWOvZ6QRoMPjQjCJM62ApBIA/+S529Nf
	9DKAWvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTM4-000000054EA-28k6;
	Wed, 21 Jan 2026 08:14:20 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTM1-000000054Dc-0YDb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:14:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768983252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yfisx39MoKyL9c3tUxQTaTOyIEsGPjfK03MuLUniLRw=;
	b=IHDluf3rviNEt+6PbCXoDsnMOzMhg8Q409a5vnXpMoZ7pLPnF52xoRtpuHQmx5bqU6huWm
	EeTvW4Q2PdpEic7wbdZLwVvj18ZhLDbsEO0tqI3cqjGSO3Hq6phrfPXYjIjzb11HvW7FTO
	iqy8bPi3hQcyLWztQrH/XsHtdOU6hauOBk6R0YppA1h2NeQKtGc+dgxVgMtInY4OFlREGH
	xWgfgixUu2uQzUKl5k7HquVn/UtfI02RpfpqgNDWTtBtR0qMCDeKNkom2rWklTa81z3lEA
	8MS8e+cuS+3kM/fVMrlYlaUGsf5MYM4gAdnUli2Lah2z1a8WAhAc0cC6lOouxw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 09:14:05 +0100
Message-Id: <DFU4845TDZMC.1JL1V5A9FWWEL@cknow-tech.com>
To: "Chaoyi Chen" <kernel@airkyi.com>, "Andrew Lunn" <andrew@lunn.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 "Alexey Charkov" <alchark@gmail.com>, "Shawn Lin"
 <shawn.lin@rock-chips.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Chaoyi Chen"
 <chaoyi.chen@rock-chips.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Stephen Chen" <stephen@radxa.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 evb1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20260121031548.402-1-kernel@airkyi.com>
 <20260121031548.402-2-kernel@airkyi.com>
In-Reply-To: <20260121031548.402-2-kernel@airkyi.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_001417_915951_867D5D94 
X-CRM114-Status: GOOD (  15.71  )
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

On Wed Jan 21, 2026 at 4:15 AM CET, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>
> According to the description in the net documentation, PHY modes
> "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
> to be delayed on the PCB.
>
> The Rockchip platform has long used the above mentioned PHY modes and
> private delay prop to describe the internal IO delay settings of the
> chip, which is inconsistent with what is described in the documentation.
>
> Let's describe this part of the delay in the PHY and use the more
> reasonable "rgmii-id" mode.
>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm6=
4/boot/dts/rockchip/rk3576-evb1-v10.dts
> index c5584c26db52..3ee76bafafb5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> @@ -266,7 +266,7 @@ &combphy1_psu {
> =20
>  &gmac0 {
>  	clock_in_out =3D "output";
> -	phy-mode =3D "rgmii-rxid";
> +	phy-mode =3D "rgmii-id";
>  	phy-handle =3D <&rgmii_phy0>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&eth0m0_miim
> @@ -275,14 +275,13 @@ &eth0m0_rx_bus2
>  		     &eth0m0_rgmii_clk
>  		     &eth0m0_rgmii_bus
>  		     &ethm0_clk0_25m_out>;
> -	tx_delay =3D <0x21>;

This being '0x21' (not '0x20') ...

>  	status =3D "okay";
>  };
> =20
>  &gmac1 {
>  	clock_in_out =3D "output";
>  	phy-handle =3D <&rgmii_phy1>;
> -	phy-mode =3D "rgmii-rxid";
> +	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&eth1m0_miim
>  		     &eth1m0_tx_bus2
> @@ -290,7 +289,6 @@ &eth1m0_rx_bus2
>  		     &eth1m0_rgmii_clk
>  		     &eth1m0_rgmii_bus
>  		     &ethm0_clk1_25m_out>;
> -	tx_delay =3D <0x20>;
>  	status =3D "okay";
>  };
> =20
> @@ -721,6 +719,7 @@ rgmii_phy0: ethernet-phy@1 {
>  		reset-assert-us =3D <20000>;
>  		reset-deassert-us =3D <100000>;
>  		reset-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
> +		tx-internal-delay-ps =3D <1950>;

... shouldn't this be higher?
0.0579 * 0x21 + 0.105 =3D 2.0157 (not sure how the rounding goes)

Cheers,
  Diederik

>  	};
>  };
> =20
> @@ -737,6 +736,7 @@ rgmii_phy1: ethernet-phy@1 {
>  		reset-assert-us =3D <20000>;
>  		reset-deassert-us =3D <100000>;
>  		reset-gpios =3D <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
> +		tx-internal-delay-ps =3D <1950>;
>  	};
>  };
> =20


