Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ED1F54AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tj72oMxFPd8BDjOQIhw3pFVHq+x9Q3/gFhunxx6AeaU=; b=QpNYXMoceBHq5DHh3DIkMK9odQ
	I1fpI+hrwt9z6wSn3TXSwOdRQMRIOrZ5GfV053nDF9RdwEHgHZryIvz9lj87YxBaFA+MuFuF8T3NQ
	jywlo/Bt7coFMc8s1ITHJvg4Oylyn+6jtiIhdJniL5EFYHC72VJXFFb7MnvYB9bAtS3s0ALJ6piKe
	0iOOnZ7oxDYBUNVZvHtHy7baf16XkeFiCclj8h4eu+pVBUEzOxnqB5X2UXvAJz7UYCzYUKFnhnuWR
	oxbmVGuDVYk4YcJjtpvn/sKimcxzb64AxXChdoEViKNN0+mt7csvRisTfaSb7fCQ0+ts3jSt8jjK6
	DTSNdP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b0-00000001cfl-0ghQ;
	Tue, 24 Mar 2026 14:19:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52ax-00000001cel-02uB;
	Tue, 24 Mar 2026 14:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Tj72oMxFPd8BDjOQIhw3pFVHq+x9Q3/gFhunxx6AeaU=; b=M9T0AEfPSQjpFAicz9fDQ/X1bO
	Fdz87jpmyW3A+DWWP4PuV0SmiqTeE8igeNuGGkXWPLsHGzry54rBX9U4aFMqJr7kNnc3MbXep3F0P
	E95WrLW7NwR4wGu0ndWSlnvqIu4WwVhusiJRD3SvFjWgQP+P3dYbj7CsEzKqTlNBYByPcOZg87iNi
	nOEG6iL0erSUfi/DkWxxNn9B1X0of9KxCLRswaxaWJcNfPF1sWy/z0EqWjAfXquEECX6DDAPeaoNS
	w/u7m8go2vKekYRq0S86LarASuVTtLK8bTdedEQKOUfURzLNQqDZQYRcAj0IE1YmXs9/DXqOwricK
	wkQVCvMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Pedro Alves <pta2002@pta2002.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pedro Alves <pta2002@pta2002.com>
Subject: Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Tue, 24 Mar 2026 15:18:55 +0100
Message-ID: <3407927.44csPzL39Z@phil>
In-Reply-To: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071859_108870_57BF38FE 
X-CRM114-Status: GOOD (  21.80  )
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

Am Montag, 23. M=C3=A4rz 2026, 10:25:33 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Pedro Alves:
> The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
> the Rock 5B, but this was not reflected in its DTS.
>=20
> Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
> and hdmi_receiver_cma nodes.
>=20
> The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
> the hdmirx_hpd name used in other boards since that is what matches the
> official schematics (HDMIIRX_DET_L).
>=20
> The configurations were confirmed to be identical on the downstream
> Radxa kernel, and this has been tested to work on a Rock 5 ITX board
> running kernel 6.19.3.
>=20
> Signed-off-by: Pedro Alves <pta2002@pta2002.com>
> ---
> Tested with the following commands:
>=20
> v4l2-ctl --verbose -d /dev/video4 \
>   --set-fmt-video=3Dwidth=3D3840,height=3D2160,pixelformat=3D'BGR3' \
>   --stream-mmap=3D4 --stream-skip=3D3 --stream-count=3D20 \
>   --stream-to=3Dhdmiin.raw --stream-poll
>=20
> ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt bgr24 \
>   -i hdmiin.raw output.mp4
> ---
> Changes in v2:
> - Updated dts spacing to match coding style
> - Reverted pin naming to hdmirx_det to match schematics
>   - Didn't end up changing other boards to match. There are quite a few
>     others, so I'll probably send a separate patch for that.
>=20
> - Link to v1: https://lore.kernel.org/r/20260304-radxa-r5-itx-hdmirx-v1-1=
=2Df77bf1f7ce03@pta2002.com
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> index 172aeabba72a..8e0eead7d223 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> @@ -349,6 +349,18 @@ &hdmi1_sound {
>  	status =3D "okay";
>  };
> =20
> +&hdmi_receiver_cma {
> +	status =3D "okay";
> +};
> +
> +&hdmi_receiver {
> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_r=
x_sda &hdmirx_det>;
> +	pinctrl-names =3D "default";
> +	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;

as said before, please also add a pinctrl setting for this pin.

gpio1_c6 is not part of the main hdmirx set of pins, hence needs an
additional pinctrl entry to configure it as gpio and possibly set any
additional pull settings.

And yes the pinctrl-driver does "implcitly" set the gpio-mode when
a gpio is requested, but our more modern approach is to always have
a real pinctrl entry even for gpios.


Heiko



