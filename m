Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD61DF43826
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL7mCvK+q0xGQs3fJVfkD8uIV04NWks6Q4iAT/RCikU=; b=wu45tslRV9+XKRMszaQA3DDToH
	SpTPD86Pvg61JpaA6+IOOqIVh79YlGg55tYh0b7DpXKBXUWM2KEsUwFJkBgTqYdqHQ6hq5hfqTTb7
	GDj8Hb6va45qYCRdPUvOCFoOtgHCOpogFRWfDhCZjabIYNrqypsdyPRUW1sKU24vdzW2wCxOPQeAp
	11SzIFA2VKpzxSS13jDKB923k/oVmvnpb8inMaWhOqP12yqWrxxJ1sM6u1fS4C+FWy2JKMwbHC/XU
	F2QcA1uv/NcfZ16NL0LICO+gtteIKlX10JOsYkxdPFGpIWn5OktQZsqYjofJB6bZb1GVfMQ+u+DTr
	IvZ+ej6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD19l-00000001EOt-0VZk;
	Wed, 15 Apr 2026 14:23:53 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD19i-00000001EOF-2Avh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:23:52 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1776263024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lL7mCvK+q0xGQs3fJVfkD8uIV04NWks6Q4iAT/RCikU=;
	b=PPHL3fohQaJmiY4FQ3bGdoLlnkxD3DisK+130lYMNRBUr9ElwIamQCUE8La68uEnzBM9ll
	Ez9FAtf7bXKW1YLoUZj3crkEVO5b9gunKXpt4z3HN23XsFJ/repsr5s0Qc78hxFvogqE1R
	cF1nPBz/cCsp9zaBAu2oba32v+2j4yHKzLuiAL77aqjiDdZcIJuesxvIyKjN+Nn6kFnCpZ
	vwqUzBhXnf+Bv/tWItCWac1wUOFmqa6ih3jzxcbL2qke2xl374U4NftWpEBUn/8oDX+8LC
	KmBqOC4QwmROWCuofnsiizJBZBK1pvMI5aWI+6vsn0/hSXw2Q2+MZbIPL1YJ0g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 16:23:41 +0200
Message-Id: <DHTSOV43O2EX.38TGASN7SQEZL@cknow-tech.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Quentin Schulz" <quentin.schulz@cherry.de>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Tianling Shen" <cnsztl@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Replace deprecated snps,*
 props for NanoPi R5S
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260401131551.734456-1-diederik@cknow-tech.com>
 <20260401131551.734456-3-diederik@cknow-tech.com>
In-Reply-To: <20260401131551.734456-3-diederik@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_072351_017949_CC975567 
X-CRM114-Status: GOOD (  14.30  )
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

On Wed Apr 1, 2026 at 3:11 PM CEST, Diederik de Haas wrote:
> The various snps,reset-* properties are deprecated, so convert them into
> their replacements.
>
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/ar=
m64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
> index 90ce6f0e1dcf..92d044ec696b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
> @@ -85,10 +85,6 @@ &gmac0_tx_bus2
>  		     &gmac0_rx_bus2
>  		     &gmac0_rgmii_clk
>  		     &gmac0_rgmii_bus>;
> -	snps,reset-gpio =3D <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
> -	snps,reset-active-low;
> -	/* Reset time is 15ms, 50ms for rtl8211f */
> -	snps,reset-delays-us =3D <0 15000 50000>;
>  	tx_delay =3D <0x3c>;
>  	rx_delay =3D <0x2f>;
>  	status =3D "okay";
> @@ -100,6 +96,9 @@ rgmii_phy0: ethernet-phy@1 {
>  		reg =3D <1>;
>  		pinctrl-0 =3D <&gmac0_rstn_gpio0_c5_pin>;
>  		pinctrl-names =3D "default";
> +		reset-assert-us =3D <15000>;
> +		reset-deassert-us =3D <50000>;
> +		reset-gpios =3D <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
>  	};
>  };
> =20

Please disregard/drop this patch.

I was recently made aware of 'sashiko.dev' and checked whether it had
also checked my patch, which it did:
https://sashiko.dev/#/patchset/20260401131551.734456-1-diederik%40cknow-tec=
h.com

And it turns out that the concern raised is valid (thanks Quentin!), so
this patch could introduce a regression.
So it looks like staying with the deprecated properties is actually
better (in this case?).

Cheers,
  Diederik

