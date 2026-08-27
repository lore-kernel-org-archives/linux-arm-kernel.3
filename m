Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9DBC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzaEaww3RehmTxZoTFC0+nmKVn2a5jG0MJBF8jSy9E8=; b=0dhAkwRorg0zqbZsB9QJ9Sv7KL
	+LLye0OLo8sz464vkmiLrBz2rG3XbfJWr40st36PPwp2yg5Xue5+cGVSvRNMOUXZJrnqpZs8iG0OS
	KMGWslHdOmFICLr7doKv1Gplp+GVqu67J9i4+DLvP4nNTqKoDiZV1woELwhY0Rc11I/z3hAZWxYPG
	E4dSxWJA6vPXBsa1ky1wIIczgvTRYLSoWsOqZVGHe6/FcDX3YTMBbprWFmV17cfGqAJUA1uyO0Ewu
	HlGL5tu8Vg9USWj4WnwEUYQNxlZPFtd/KhhsPVIH3NiCJFhvAxhDpnRsDhtkFsK1H5gaUeC0r5IQr
	ksMURJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZzm-000000042PY-0Bqc;
	Thu, 27 Aug 2026 13:18:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZzb-000000042Oi-2Q0x;
	Thu, 27 Aug 2026 13:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CzaEaww3RehmTxZoTFC0+nmKVn2a5jG0MJBF8jSy9E8=; b=agEWkwM+QabT/9AAY9/u8DTOi/
	Q6bkFcme660Fid9hG/hflDOPqSksKYMgmA+mj9zY7Lzyn2MN7bbsf/QF8gGzNCiovwqtE5C+PT3DP
	liPPghPC8DgNQNpY+JQIMv/IyaQJez2XAVDT2VwPMgpsUibLemZAufRoGZPcZkoNeRMsaqtBPMjzv
	1/nc3uX+lNIriOAWkRM/6cennlMzOUUDvXBob473Fjl2KAKwbK57QcmSJZW316y+AGX+J2a6ECVoq
	hycitnTJFFloj932b4/3a3shegCHcdFaMvNemgfO2WISwXjLjOm6zbPNjDuZG1RGlqoIj1iJsz1Zb
	EFzTtsgg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rudi@heitbaum.com
Subject: Re: [PATCH] arm64: dts: rockchip: rk3399pro-vmarc-som: add i2c2 scl timing
Date: Thu, 27 Aug 2026 15:18:01 +0200
Message-ID: <6298523.lOV4Wx5bFT@phil>
In-Reply-To: <aou1Q5-hdF7kRVpe@0d3a7a881997>
References: <aou1Q5-hdF7kRVpe@0d3a7a881997>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_061807_666576_8CF284B4 
X-CRM114-Status: GOOD (  15.54  )
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

Hi Rudi,

Am Montag, 24. August 2026, 05:06:43 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rudi Heitbaum:
> The hym8563 on i2c2 does not ack:
>=20
>   rtc-hym8563 2-0051: could not init device, -6
>=20
> It is also the ext_clock for sdio-pwrseq, so wifi does not come up
> either.
>=20
> i2c2 runs at 400 kHz with no scl edge times. The core defaults both to
> 300 ns and rk3x-i2c calculates a 900 ns high period, which is short for
> this bus - it acks at 100 kHz. Set the edges to the values i2c3 already
> uses, giving 1050 ns at 400 kHz.
>=20
> Tested on a Radxa ROCK Pi N10: rtc0 registers and keeps time across a
> reboot, and wifi activates.

You tested on a Radxa Rock PI N10, but are changing the vmarc-som?
I'm not really understanding this.


Heiko

>=20
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> index 64e6ba345739..074f09c6d11c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> @@ -296,6 +296,8 @@ &i2c1 {
> =20
>  &i2c2 {
>  	clock-frequency =3D <400000>;
> +	i2c-scl-falling-time-ns =3D <15>;
> +	i2c-scl-rising-time-ns =3D <450>;
>  	status =3D "okay";
> =20
>  	hym8563: rtc@51 {
>=20





