Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686EFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMwrIHSesSwBeH6rt0sJESP8Af/ZauXLbklgi13pmLA=; b=UBHIs6Gsz+52nSYvzhfd2uvdC/
	y/S4zrarvhzgyuPtN1PH7WQtnedQTvCpgBAfuL038sFefOmNYUTqi0S2dQoabtvuSA/cqbtxsK0kJ
	nUAKBPUizn9oxzUkZnXozpWePdxm2KUnOdzUWAb+seIMi2LuIfGkBfyyd9W9Vzibejvu0f93MwWVP
	MQUfatrqM3J8/Hk7Ko2OyWqopMMUu+WfTTa6pP+Z/e5NYfQTQV15O8lAsRBMgt+TlwB0WvdmjgX03
	SjsXVUOBQm7rMY9sgJ1ESWdB6aOPeBPTkm/ijdl5rzlD/FB7tzWcEros6VsUCmy+sUME35GLF1nz/
	fL9HVgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfM4e-00000005Ftt-1pDx;
	Thu, 02 Jul 2026 18:23:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfM4b-00000005FtO-31Mj;
	Thu, 02 Jul 2026 18:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HMwrIHSesSwBeH6rt0sJESP8Af/ZauXLbklgi13pmLA=; b=NfmR94NelT+fa24vbw3X4cZSHb
	QvuasTkKBv7nIffde1TU80ZGRZNMujgsv/nuoVr3pIcjqDy7UPTdzPhtTHRVAuRk7JhYoTg9uHII1
	OXSywskLhP2W95jLSdoQhIR2fZTrye+LU2vzfa9Etb5OTfmJFQ6XHFQfu1sZlbRxoktutEE7P9SoB
	ArPm6ocKSke0tRI7ISqWohmMBzfpnbFQkUclzfS5GijvvmpVyKhpm6aoK5HSe/bsdsJEIDkx8WO8d
	ugD7ymSrVdM9xlSDc9/rOOCWLEx468ifdBKwzJAo50QBqnSdERWYx4IwvokZQ4i5enrACjARLo8IU
	wX/8jIZA==;
From: Heiko Stuebner <heiko@sntech.de>
To: oklopfer37@gmail.com, Oren Klopfer <oklopfer37@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: rockchip: Further describe the WiFi for the
 Pinephone Pro"
Date: Thu, 02 Jul 2026 20:23:38 +0200
Message-ID: <6745357.1oUyQt6lIG@phil>
In-Reply-To: <20260615225014.219115-1-oklopfer37@gmail.com>
References: <20260615225014.219115-1-oklopfer37@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_112341_780174_99044C8A 
X-CRM114-Status: GOOD (  15.25  )
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

Hi Oren,

Am Dienstag, 16. Juni 2026, 00:50:13 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Oren Klopfer:
> This reverts commit 096bd8c679185f898cae9933c6a68650fa26ea4f.
>=20
> Just as with the Pinebook Pro, there are multiple chipset variants for th=
e Pinephone Pro, and multiple firmware binaries for different distributions=
=2E The change causes issues with some of these combinations, and reverting=
 it resolves the issues. See the Closes below for the full report.
>=20
> Similarly with the Pinebook Pro adjustment, the original commit only indi=
cates "further description" and not indicative of fixing any existing issue=
s, so reverting should not kick any back up.

The commit message did not get any line breaks, 72 character
is the preferred line length.

Also the patch contents itself got mangled.
All the indentation is set as spaces, so that patch won't apply.

Please try using b4 or at least git send-email for sending patches.

Thanks a lot
Heiko


> Fixes: 096bd8c67918 ("arm64: dts: rockchip: Further describe the WiFi for=
 the Pinephone Pro")
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/r/20260607225901.64019-1-oklopfer37@gmail=
=2Ecom/
> Signed-off-by: Oren Klopfer <oklopfer37@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts | 18 ------------------
>  1 file changed, 18 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 8d26bd9b7500..d46cdfe3f784 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -734,12 +734,6 @@ light_int_l: light-int-l {
>          };
>      };
> =20
> -    wifi {
> -        wifi_host_wake_l: wifi-host-wake-l {
> -            rockchip,pins =3D <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
> -        };
> -    };
> -
>      wireless-bluetooth {
>          bt_wake_pin: bt-wake-pin {
>              rockchip,pins =3D <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -766,19 +760,7 @@ &sdio0 {
>      pinctrl-names =3D "default";
>      pinctrl-0 =3D <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
>      sd-uhs-sdr104;
> -    #address-cells =3D <1>;
> -    #size-cells =3D <0>;
>      status =3D "okay";
> -
> -    brcmf: wifi@1 {
> -        compatible =3D "brcm,bcm4329-fmac";
> -        reg =3D <1>;
> -        interrupt-parent =3D <&gpio4>;
> -        interrupts =3D <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
> -        interrupt-names =3D "host-wake";
> -        pinctrl-names =3D "default";
> -        pinctrl-0 =3D <&wifi_host_wake_l>;
> -    };
>  };
> =20
>  &pwm0 {
>=20





