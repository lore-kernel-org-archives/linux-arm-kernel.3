Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6573BCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKC3PTkwWrrt7PYEQQ0B4ZjpL8QByGd23QV939tztOg=; b=VdKmnFm8xX/YwbXnCMcWFiy21U
	2rkRPS9fosGXjIJmGUoeOxsgmwLF5Xu8IUqSL5fowWxlq1WC0Hse9RFqYo1u0u8rZLLIkdBFeC/CX
	WUxPWpoVulHKsHA3cypMemFibgNp+x07o3/dIDTnzr2GRx/z9/2g7OFQY/b/wdsQFPYl1anJGQZZA
	MfXdDDU09glZf+jAmJJn5/7uKYYrFMCz/ibDZRXY9DYaLz1cy7ZRFuBEIauRcwsOXWK6bY/UgJHkr
	/y6KRAXYvd8ZGjIrt9U9lrc1+vhF2ITFSpx6+ymJT1yNYfmTPfQFP3MpBbYzPER8NpGvjVCrBJN/w
	1hutw0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7bq-00000008oI4-3yJg;
	Sat, 02 May 2026 10:30:06 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7bn-00000008oG4-0hAX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 10:30:05 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1777717788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKC3PTkwWrrt7PYEQQ0B4ZjpL8QByGd23QV939tztOg=;
	b=TvAbHW2veUJcqZme81cx/GGP21R4PHW48Vdw9zFZVYz7lCULM0oYq8uZZ7Ra4+LV09brVr
	fAxK4DBv+MX5wbEMbSxiS1cjcjoSfHRiR08qh468IM4CjCYgwY84JKB6OfstJ7+gqrnE2k
	pD3knfHjk5ly0w8/ukaBdUTNmJ7gGf94gnpXEUNl3fov/xCCdWABF2f1J9p9I+d68sTFI6
	Ip1ZA7X45ylF88PIs+mnGL1GDFTGMIWXjakszAleSQpi1J5R6xmeKp+XXkXRyd4cWUeArB
	9RmD0PbQyU6MB6OKBhx6SbGUUbRNFWCqc7Ev8l5DNhOcI6Z00JdNGehMPsnTPA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 May 2026 12:29:40 +0200
Message-Id: <DI84CXWVJPXB.1OG0PYJ5L31TX@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nick@khadas.com>
Subject: Re: [PATCH v2 2/7] arm64: dts: rockchip: Add HYM8563 RTC for Khadas
 Edge 2L
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Gray Huang" <gray.huang@wesion.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <heiko@sntech.de>
References: <20260429063712.2150938-1-gray.huang@wesion.com>
 <20260429063712.2150938-3-gray.huang@wesion.com>
In-Reply-To: <20260429063712.2150938-3-gray.huang@wesion.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_033003_909430_62EDFC5C 
X-CRM114-Status: GOOD (  14.68  )
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

On Wed Apr 29, 2026 at 8:37 AM CEST, Gray Huang wrote:
> The Khadas Edge 2L uses an on-board HYM8563 RTC connected to
> I2C2. Enable it and expose its 32.768kHz clock output so later
> board-level patches can reference it as the LPO clock source for
> the AP6275P wireless module.
>
> Mark the RTC as a wakeup source as well.
>
> Signed-off-by: Gray Huang <gray.huang@wesion.com>
> ---
>  .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts     | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 5781deae00d9..c85b219fe409 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -46,8 +46,6 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
>  		regulator-max-microvolt =3D <2000000>;
>  		vin-supply =3D <&vcc_sys>;
>  	};
> -
> -
>  };

You're removing unneeded empty lines (good), but you introduced them in
patch 1 of this series ... thus fix patch 1? That also means you're no
longer adding an unrelated change in this patch.

Cheers,
  Diederik
 =20
>  &cpu_l0 {
> @@ -431,6 +429,17 @@ regulator-state-mem {
>  	};
>  };
> =20
> +&i2c2 {
> +	status =3D "okay";
> +
> +	hym8563: hym8563@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "hym8563";
> +		wakeup-source;
> +	};
> +};
> =20
>  &sdhci {
>  	bus-width =3D <8>;


