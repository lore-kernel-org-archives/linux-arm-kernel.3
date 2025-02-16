Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38317C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JuodrbTqt2kISAe95cYUvufIOl8Fb0pi3tva7a0oDw=; b=Do+4LklWSp9QCW0qe2Lm1lpn3D
	jwR2iQ8l5CPOUxQ+sMRG+hWQLOQqrYfOHWuk9eamvge4tJf6nnQ1TQc580ukb8gklgPJkfu+7g1ZD
	kKUUUBfGQ4+eQOHAtz9El8mAClYPRTo0F/a9EIyxmU2FCmtCBF231OfKJM0z3UjS8IFCnHlAsYi0N
	abc2h75/nu6dP0VFurg7AqT2GL7YC1Tulf/e1HSQfBpAXym7HUh8AaNwDoYtPhGwN4Kl3nF5TfJUs
	+8u+dw8vVCnGhYU3elsNKEWaIGlF90ZlS4yPxSrx+5CJYGABL+ehO9wNgHOoRBus+MTIN78sVCH1t
	QXdAtwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdvA-00000001miA-1HIi;
	Sun, 16 Feb 2025 12:38:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdth-00000001mZ5-16qa;
	Sun, 16 Feb 2025 12:37:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so321100a12.3;
        Sun, 16 Feb 2025 04:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709439; x=1740314239; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JuodrbTqt2kISAe95cYUvufIOl8Fb0pi3tva7a0oDw=;
        b=A3irjoZlv/xNW+LcPpwLAaR6Pkqim4aNNzosORcdJ09PVd6Q9vV0OFn5ey9zNT92ss
         GCEbjUo5tGXmmu2c1aJAMsIhqC2YVjlRxItRqCZb8mhSSfJvRXtkXbYpdv27JglbWyH3
         4MRa2rj9TCIlhKCmbi0o8wE0DYvZ0SVvgW+Onzs3njfRMcoSfNjUYp5+pdREJnG+P8nB
         tGR6NAKrs7qPao3Q5tM2fLKMWuGN4mWEdmCvlY9FqiAk65t5pVIsgV31uwLf6ccaAqEh
         9EkMHrfgQVMHRZAcMS6pRM4imFfNxLZI3uEwqG3zpbAMdaWI4IC70fhX48SMrLub0cVZ
         Nx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709439; x=1740314239;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JuodrbTqt2kISAe95cYUvufIOl8Fb0pi3tva7a0oDw=;
        b=aRrsQXBd9rF8E1qFiV8jfN/WBkbT4BMu86e0AhRhqsVw7REnDY+cFcW+b24KF2KlJK
         tarpsyVZjJI4LbHHSIbpxAXVIk48Z8eHFh/kAtw20luX9kFuvYxaATnriIvANCmgzK0+
         YahZto8+v87hXG0CSWl+/fXpYn3vm38yL1luQeS7/M7aJeREfT9Wlk3hmhtHV7LoWvnk
         Uu5ABm1Cii5oUiys970Fbee5hS7KrKIXBpei8+DEmfm/znA/qm5IJ8iT0HC90Rwfl7ib
         38euGUy4tRXtqv2fl2Z5UwuX/hdd1g9I6Odj/m6EveuWbDpIF1EKPeVTdpW9Feq4Wdw0
         O06g==
X-Forwarded-Encrypted: i=1; AJvYcCWs6tbTUv+eko8sukF8Yxr/o4MSzQwL3UbntPQ5UXvfHuNHGqESOH6ICokj2pySyOIAmt1dIpGgn/E5y7h4ZIf4@lists.infradead.org
X-Gm-Message-State: AOJu0YwnWNXD6OXuzfMrEQoZKQzEmaFiI6IyQVkizgZNIo0WLPtGU9Mr
	GBKE7yBEbsnwPOsmboUSY56vu2Qgp+Ji5FyfbhFIO7LzDcCqveIX
X-Gm-Gg: ASbGncuM34AQxi7eU8MGmNaRmSfeY/ww25JD5FmrEbED4aqy2hrG6fnLW1EsJkbdTuC
	gpafQviB7L+ToGJF+4LCzQZPS5xV5POHGE3sFLLzURT6GuTaZ+IRuDtA3gAuDrxVIv8JehOxjCz
	NnSbqMHJ1cxnNCUCEdoLF7nPjeF2JBOkK5Z7iEW7/JVAPy+a+fXRiND8Z1wXg1dFqcbRocFzFUg
	JdDDWgIbn01/QuOO0a9bE7+4FQaSEPoiRfBDx3xUpLGpJ0gUQsmAc1xz3dUugdaKtY1XVF9+Rqc
	Yt7cAPqAexCBpJcKmjYH6TUyiJGqfo983dX+MBhu2jCpV2XIHac4MTib1arV2p/DZpLmoYCD
X-Google-Smtp-Source: AGHT+IF7Li7Lm7POp1hY1DOd+YXcUFGnt79PSyFeoLFF1fqoqNga9gqKiKlCsi70OcwAnvjg618OOA==
X-Received: by 2002:a17:907:7244:b0:ab7:d6c:5781 with SMTP id a640c23a62f3a-abb70b35452mr579701566b.24.1739709438780;
        Sun, 16 Feb 2025 04:37:18 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb67732cd5sm343423666b.183.2025.02.16.04.37.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Feb 2025 04:37:17 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250215152550.3975614-1-liujianfeng1994@gmail.com>
Date: Sun, 16 Feb 2025 13:37:05 +0100
Cc: linux-rockchip@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <566E6F11-765C-4415-8805-55DFD3C2BD4D@gmail.com>
References: <20250215152550.3975614-1-liujianfeng1994@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_043721_305148_C14FB39B 
X-CRM114-Status: GOOD (  16.72  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Jianfeng Liu =
<liujianfeng1994@gmail.com> w dniu 15 lut 2025, o godz. 16:25:
>=20
> Enable the HDMI port next to ethernet port.
>=20
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>=20
> .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 53 +++++++++++++++++++
> 1 file changed, 53 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts =
b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> index 6d68f70284e..a4fdced052c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> @@ -11,6 +11,7 @@
> #include <dt-bindings/leds/common.h>
> #include <dt-bindings/pinctrl/rockchip.h>
> #include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> #include "dt-bindings/usb/pd.h"
> #include "rk3588.dtsi"
>=20
> @@ -89,6 +90,17 @@ fan0: pwm-fan {
> pwms =3D <&pwm14 0 10000 0>;
> };
>=20
> + hdmi1-con {
> + compatible =3D "hdmi-connector";
> + type =3D "a";
> +
> + port {
> + hdmi1_con_in: endpoint {
> + remote-endpoint =3D <&hdmi1_out_con>;
> + };
> + };
> + };
> +
> /* M.2 E-KEY */
> sdio_pwrseq: sdio-pwrseq {
> compatible =3D "mmc-pwrseq-simple";
> @@ -261,6 +273,32 @@ &gpu {
> status =3D "okay";
> };
>=20
> +&hdmi1 {
> + pinctrl-0 =3D <&hdmim0_tx1_cec &hdmim0_tx1_hpd
> +     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
> + status =3D "okay";
> +};
> +
> +&hdmi1_in {
> + hdmi1_in_vp1: endpoint {
> + remote-endpoint =3D <&vp1_out_hdmi1>;
> + };
> +};
> +
> +&hdmi1_out {
> + hdmi1_out_con: endpoint {
> + remote-endpoint =3D <&hdmi1_con_in>;
> + };
> +};
> +
> +&hdptxphy_hdmi0 {
> + status =3D "okay";
> +};
> +
> +&hdptxphy1 {
> + status =3D "okay";
> +};
> +
> &i2c0 {
> pinctrl-names =3D "default";
> pinctrl-0 =3D <&i2c0m2_xfer>;
> @@ -1209,3 +1247,18 @@ &usbdp_phy1 {
> rockchip,dp-lane-mux =3D <2 3>;
> status =3D "okay";
> };
> +
> +&vop {
> + status =3D "okay";
> +};
> +
> +&vop_mmu {
> + status =3D "okay";
> +};
> +
> +&vp1 {
> + vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
> + reg =3D <ROCKCHIP_VOP2_EP_HDMI1>;
> + remote-endpoint =3D <&hdmi1_in_vp1>;
> + };
> +};
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Jianfeng,

Is there anywhere repo with this patch applied to test it on rock5 itx =
hw?

(asking as I can=E2=80=99t get it working; even with hdmi1 only vop =
clocks like here: =
https://gist.github.com/warpme/49feadbe1f53ea31fca76f41d5bb3ee4)



