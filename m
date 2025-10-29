Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBEFCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb/tlKO9/Zxp9vLJznUadT+d0q6ZWEudok8Oi1J/AHc=; b=IEZ99fDOsviQvLT5DbNLHnpi5z
	MiDA3T9bKaEZjKxtDHSyaEX4O0b+lZ0c0eN9eG3D7fPnlzuNeCbjlGDnnNLz1vMgWIPciISt5tnQu
	MlTMaWWMticxTW1ihjmIk92cP+aNm0p1BAdGMEGfSjRfeM8ZMceY8Ki4+U4e5CuS1++4ruwOfTMOl
	vskLKIC2QypG5GRmuLF0mKWS7goflht0vGn2cKVWPIl4BNAyEGPNIu2VrLzzsspn2UIY+SByIYHKd
	PwpitvGlkG+kuJY8+ZPC9sf0GalBStZrvHC4i2ThHSgfoJdRkICpBXOK8pCg9ro2scN6ZXMx1okHL
	H3f0M47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6wQ-00000001Wfe-3PMZ;
	Wed, 29 Oct 2025 14:14:22 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6wJ-00000001WdK-3oxM;
	Wed, 29 Oct 2025 14:14:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 0E72940D1B;
	Wed, 29 Oct 2025 15:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1761747252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eb/tlKO9/Zxp9vLJznUadT+d0q6ZWEudok8Oi1J/AHc=;
	b=QcyZ4nx4bzFvgRTgGGjXFoCKjtw0QC0NoAjioyQ/+bdgjcXHZ4AGxqJrpfZGxowXwRSAll
	5/B9SxX9ve4hpr9DHSvyCdy50RvSKIJn/bYEHXB79NRVg2JU9tJP6cBPHDLx5k1JYawqr8
	pYrQ49hp8vnF/cdHklssIQPxH/Ei2bYLuPAq20ZTw3xTQB3Ce1HrkMYCkTGebaC+fVpWIr
	AXfkV3g20E3C75Yi7Jr2jjNQPDm7RgovKrVo04CHiiQGe0jDLDB4Za5eHGDLawjeUWTrcp
	a4IwMIu4AvtkhOstRyoAZoQBFZdF7BmizJ640LBEkcT2KwIT3v4pfS9VDIf8BA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20251029-rk3399-op1-include-v1-1-2472ee60e7f8@cherry.de>
Content-Type: text/plain; charset="utf-8"
References: <20251029-rk3399-op1-include-v1-1-2472ee60e7f8@cherry.de>
Date: Wed, 29 Oct 2025 15:14:09 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Quentin Schulz" <quentin.schulz@cherry.de>, stable@vger.kernel.org
To: "Quentin Schulz" <foss+kernel@0leil.net>
MIME-Version: 1.0
Message-ID: <f4149b94-30e5-ff0f-44b2-0806b2747890@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= include rk3399-base instead of rk3399 in 
 rk3399-op1
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_071416_180452_4907C3BD 
X-CRM114-Status: GOOD (  15.86  )
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

Hello Quentin,

On Wednesday, October 29, 2025 14:50 CET, Quentin Schulz <foss+kernel@0=
leil.net> wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> In commit 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to dt=
si
> files for SoC variants"), everything shared between variants of RK339=
9
> was put into rk3399-base.dtsi and the rest in variant-specific DTSI,
> such as rk3399-t, rk3399-op1, rk3399, etc.
> Therefore, the variant-specific DTSI should include rk3399-base.dtsi =
and
> not another variant's DTSI.
>=20
> rk3399-op1 wrongly includes rk3399 (a variant) DTSI instead of
> rk3399-base DTSI, let's fix this oversight by including the intended
> DTSI.
>=20
> Fortunately, this had no impact on the resulting DTB since all nodes
> were named the same and all node properties were overridden in
> rk3399-op1.dtsi. This was checked by doing a checksum of rk3399-op1 D=
TBs
> before and after this commit.
>=20
> No intended change in behavior.

Thank you for spotting this issue and for fixing it!  That was
an honest oversight on my part, but it actually resulted in no
ill effects, which is the main reason why and how it managed to
slip by originally.

Your description of the issue is pretty much perfect, so I've
got nothing else to add but

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> Fixes: 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to dtsi =
files for SoC variants")
> Cc: stable@vger.kernel.org
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3399-op1.dtsi
> index c4f4f1ff6117b..9da6fd82e46b2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
> @@ -3,7 +3,7 @@
>   * Copyright (c) 2016-2017 Fuzhou Rockchip Electronics Co., Ltd
>   */
> =20
> -#include "rk3399.dtsi"
> +#include "rk3399-base.dtsi"
> =20
>  / {
>  	cluster0=5Fopp: opp-table-0 {


