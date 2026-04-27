Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70555FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeePnVv+YslUA1tdZWBh3CRQb3jVb+oSpxOE0TqYCFo=; b=TMrklWJQr7rsGYlJVSsamVVVxX
	oCt3jhIFoinKEcD4FykncRkBW0uKpU6bHkHieWxe8S+LXY3Yw7o1q3nQqnzHR1+9ZoepXRxhMV2BI
	T5kCRG4nLN5bxXNUM5XhGLycY+k3TcrhBrRRuAiaoiajIluFJd/+HEpUE65mhTyIE3xBMJuFJRQrJ
	ylhNrPe/+DsxGOzclftniv+WEZGJhZLNWP1Eo3FlCqm+KqIHLy+aZNglBWnkESoSAWj3SAwY+6Vhb
	ZhPGwi4xU2q0U5L/6IhSoa9e21tMdAxuPhaKFxCxpSzVi1UfBDm9sJBuOQnC0MwIW4ymYPW+YT/So
	+rK9zHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKLH-0000000GohT-2K37;
	Mon, 27 Apr 2026 11:41:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKLF-0000000Gogl-0o68;
	Mon, 27 Apr 2026 11:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eeePnVv+YslUA1tdZWBh3CRQb3jVb+oSpxOE0TqYCFo=; b=DG3hGznGy33YluhslljvE9HRgx
	6LCBBDX1MCOA+cThYGvqf7VHFGm24WvhEBb0GIEauW74rHzWqbgQa0KyfrY3GIHcfB/jdZQfuASkY
	9noS6ydajlQOjwuOpewAm+GYATxNCl2vw8DHUDyaOOWWkCQ1swnKdlxmEbozDVA4n+dJjvY+KRWC5
	XfVDimk6F4g3U9KNCo5yJUL2kHovw7mrIejEGgCD4FkMwC9r4EjOnL61p/eN2JAR0rXEuBTQfMfXW
	7iSAszUY55zOofrwoyhCYbLaC6ywLRT2bd8VQR2k6NyKualnHTkXYouQjqQLpFQKDabRrvG4W6Rhc
	W0CqMA7Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: guoweix <2298701336@qq.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.kardame@manjaro.org, pgwipeout@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, guoweix <2298701336@qq.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Mon, 27 Apr 2026 13:41:24 +0200
Message-ID: <26138973.6Emhk5qWAg@phil>
In-Reply-To: <tencent_CF3170E7191769F8FB22C55A0F952E82E105@qq.com>
References: <tencent_CF3170E7191769F8FB22C55A0F952E82E105@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_044133_326991_5AB011E2 
X-CRM114-Status: GOOD (  15.75  )
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

Hi,

Am Mittwoch, 8. April 2026, 17:09:44 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb guoweix:
> The RK809 PMIC interrupt pin on the Firefly ROC-RK3566-PC (Station M2)
> is physically connected to GPIO0_A3 (RK_PA3) according to the board's
> schematic.
>=20
> Currently, the PMIC node incorrectly specifies RK_PA7 for the interrupt,
> which prevents the PMIC from correctly signaling interrupts. (Note that
> the pinctrl node 'pmic_int' correctly configures RK_PA3).
>=20
> Fix this by updating the interrupts property to use RK_PA3.
>=20
> Fixes: 30ac9b4e25d8 ("arm64: dts: rockchip: add dts for Firefly Station M=
2 rk3566")
>=20
> Signed-off-by: guoweix <2298701336@qq.com>

Could you use the more standard naming of "given name + surname" please?
=46or example with:
	git commit --amend --author=3D"givenname surname <2298701336@qq.com>"

Or setting user.name in your .gitconfig.

Patch otherwise looks good.


Thanks a lot
Heiko


> ---
>  arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts b/arch/arm64/=
boot/dts/rockchip/rk3566-roc-pc.dts
> index 7e499064e035..985770e3a5e2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
> @@ -245,7 +245,7 @@ rk809: pmic@20 {
>  		compatible =3D "rockchip,rk809";
>  		reg =3D <0x20>;
>  		interrupt-parent =3D <&gpio0>;
> -		interrupts =3D <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts =3D <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
>  		clock-output-names =3D "rk808-clkout1", "rk808-clkout2";
>  		assigned-clocks =3D <&cru I2S1_MCLKOUT_TX>;
>  		assigned-clock-parents =3D <&cru CLK_I2S1_8CH_TX>;
>=20





