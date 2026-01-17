Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8848C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUWEhhb8frjqfBNQo4kP9PuoM+qzbcoNLHgDVyTdTW4=; b=QZou9Il5aRa8N48CgpRqR7kR0k
	/r5K6/+LG7N0eqdETU1fZagijabOGswdZgidv4nFVVGVCu7SLFP9wCL2DAigFvBcxceeNYetfBXhU
	PkT4GwRMCN7eEnrohY47HzUlyOPTMx2R0yfwMhBSJvpv9yQ3zfblFP0jqTMLRuRMFq+l4fFlFKyOP
	QivRzQC2gDrZ4+K4dXFkMX3vN/7Eiy5rNZv7Ty1Alte3rqNkXxdkh679p6iHrarw8GDbUZgorSYhE
	ZQC+c2oNFBGem/q/Xrq416FbxEhN3BLAn6f8fyhFnmyMTkP11naqy3RxXcgmPiR19NGowztmJB332
	kBnfj6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh0qx-0000000FN3l-0ZYx;
	Sat, 17 Jan 2026 07:36:11 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh0qv-0000000FN3F-0N4B;
	Sat, 17 Jan 2026 07:36:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 5CC3841A7E;
	Sat, 17 Jan 2026 08:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1768635363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cUWEhhb8frjqfBNQo4kP9PuoM+qzbcoNLHgDVyTdTW4=;
	b=Jt91tXv26Ir2A6E3/Q4BzdCryRTEdCDmYO/sBExFNBM06bJObgxTtxwaIIjNlAdKVieEze
	XlGhk++onPlu2XD6xxMs1hogFehZz94PIr1hFIW8eq6fcmv50t45X67ABkX/3shlHaTFkg
	SYoRogcHotG5uue6ZCItND9fQU3RTc+IOCt1NSk5+HdBIEK+q34z5aLEppLh1Y0n3OetUL
	PgdmqfcevRUumK07Za8K/BNlpzbixdSaVBb/DDsFsuM7yhzOCqndA8Osf+ig3RxhezlTb/
	2MID6M5+qRxDLx1HOvV8v39U0Fdmhi3GcPabtl1gOX5uSAHmHOaQMdgE411Kkg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260116151253.9223-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20260116151253.9223-1-jerrysteve1101@gmail.com>
Date: Sat, 17 Jan 2026 08:36:00 +0100
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, heiko@sntech.de, pbrobinson@gmail.com, didi.debian@cknow.org, conor+dt@kernel.org, stable@vger.kernel.org
To: "Jun Yan" <jerrysteve1101@gmail.com>
MIME-Version: 1.0
Message-ID: <eb29fc56-d77f-7000-52e7-a6aefea5b883@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Do not enable =?utf-8?q?hdmi=5Fsound?= node on 
 Pinebook Pro
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_233609_370298_A5FC8B4D 
X-CRM114-Status: GOOD (  13.69  )
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

Hello Jun,

On Friday, January 16, 2026 16:12 CET, Jun Yan <jerrysteve1101@gmail.co=
m> wrote:
> Remove the redundant enabling of the hdmi=5Fsound node in the Pineboo=
k Pro
> board dts file, because the HDMI output is unused on this device. [1]=
[2]
>=20
> This change also eliminates the following kernel log warning, which i=
s
> caused by the unenabled dependent node of hdmi=5Fsound that ultimatel=
y
> results in the node's probe failure:
>=20
>   platform hdmi-sound: deferred probe pending: asoc-simple-card: pars=
e error
>=20
> [1] https://files.pine64.org/doc/PinebookPro/pinebookpro=5Fv2.1=5Fmai=
nboard=5Fschematic.pdf
> [2] https://files.pine64.org/doc/PinebookPro/pinebookpro=5Fschematic=5F=
v21a=5F20220419.pdf
>=20
> Cc: stable@vger.kernel.org
> Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for =
Pinebook Pro")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
>=20
> ---
>=20
> Changes in v2:
> - Rewrite the description of change
> - Link to v1: https://lore.kernel.org/linux-rockchip/20260112141300.3=
32996-1-jerrysteve1101@gmail.com/
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/a=
rch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index 810ab6ff4e67..753d51344954 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -421,10 +421,6 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> -&hdmi=5Fsound {
> -	status =3D "okay";
> -};
> -
>  &i2c0 {
>  	clock-frequency =3D <400000>;
>  	i2c-scl-falling-time-ns =3D <4>;

Thanks for the v2!  It is looking good to me, so please free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>


