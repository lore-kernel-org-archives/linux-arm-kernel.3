Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D17BFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2Cr26LAuCrqLg1Hny+ypX+Am0Ky/eMd+gY1trdJd7A=; b=p4BLg7WeMrwj4c6lUXpEvTaCTT
	pwoK0WrSs5GO5FWhhV2mJqGzMnnJMn4dXLaWOw8lXXiRX1ERQu4oDRGu0pPQpWoFUEWzSeo6fS7O9
	Tpjk8FqMswoAXVN2f3NzsqmqloFO33EdlNBJtakTH2JDhKbSciaA6k2kkWcAdO91AWlsMYwHTvMox
	QLbChWghlZsgvjN3ZcEQLlCwyiwmccSM02ldu0aVKZI89YwyCMJ/ZX60b6G/dZ1vbmmLPk6wETS0b
	4OiYuSlokfSL3v1/+hUtybAy5PczisfDClCYKmizYIQ6rn5f1P+k1VYEwW4p2nZeze8dXUPFCII9i
	lKIdfnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL47-0000000Guca-44mv;
	Mon, 27 Apr 2026 12:27:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL45-0000000Gubo-0Y2X;
	Mon, 27 Apr 2026 12:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N2Cr26LAuCrqLg1Hny+ypX+Am0Ky/eMd+gY1trdJd7A=; b=WKY9HC5fsXD6rXYzZo+QcOk10U
	k8m2IYOWUqQDOsZAiYVzEUVY6pxyimRdVjBY4wUxFvAcx1pcMcUTUd0anXC8RU3u7QE3RF3EItV/h
	SmOqB8VhxjKBVPEMx8ksdH1kjrAi5UHETGvIV0NMc8ZwzzUvVVYrtK0dapBOG6I8kavnDNwkuqXCq
	MlvT3q6mxHAHGQxUxYgNucDi0ZKFMyOKaeJjaccwr/sFD1iQvk7EbdXFR4xzMu5bxuIeegxFrFNTf
	q6vlw9KMnJHdZ3eA3Nn1cnx2hvx4GOZayPlOkBiZP/SrBB3uduOHzXMkzoXM4X9ooaL+L4VC1rUMY
	QhPjRBqQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Gray Huang <gray.huang@wesion.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, Gray Huang <gray.huang@wesion.com>
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Add Bluetooth support for Khadas Edge
 2L
Date: Mon, 27 Apr 2026 14:27:51 +0200
Message-ID: <3716011.atdPhlSkOF@phil>
In-Reply-To: <20260325054614.1497147-7-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-7-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052753_169622_881CCC71 
X-CRM114-Status: GOOD (  13.06  )
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

Am Mittwoch, 25. M=C3=A4rz 2026, 06:46:14 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Gray Huang:
> Enable Bluetooth support for the Ampak AP6275P module on the
> Khadas Edge 2L. This involves enabling the UART5 interface for
> HCI communication and defining the required regulators and
> power-sequence pins.
>=20
> Signed-off-by: Gray Huang <gray.huang@wesion.com>
> ---
>  .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 8ecd00f6645d..345dc4c981c1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -560,6 +560,20 @@ usb_host_pwren: usb-host-pwren {
>  		};
>  	};
> =20
> +	bluetooth {
> +		bt_reg_on: bt-reg-on {
> +			rockchip,pins =3D <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		bt_wake_host: bt-wake-host {
> +			rockchip,pins =3D <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		host_wake_bt: host-wake-bt {
> +			rockchip,pins =3D <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};

same sorting problem with bluetooth between usb-foo and wifi-foo.

> +
>  	wifi {
>  		wifi_reg_on: wifi-reg-on {
>  			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;

Heiko



