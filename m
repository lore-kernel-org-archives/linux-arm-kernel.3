Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F770E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QTNgmzYB7WhakHI7BtpiVfr7WRGVdLXuQWsgOk30eY=; b=M3Ylt6deHN/qL1MruK1n2tExU/
	SBpTYYLf4aRynDY/xNptsMGmCIlni1u5RFZO2MeIy3WeiZkrBaaegQg5KIe0BkClzUPSGW6+PMek6
	OaoUeGAGLTE7yh80Pc9S9EfE8FrM0WsKbDpVIztcEZ89rfvn8EnWPLQTe9YYqRjbeFYD9dVk6jiKN
	i1eQXiQJ+D8XyMK5a2wSxFYVwrbqmeY+C0ur6ESUrTTYoe6DUerZJ5KGyS0MT3wxrxauvjgZu6G1x
	7nAadW1i3PKwfvltbEu8JgQlOpVxvJRCidpWJwvyNDj7sa1+piGbYz0L2yxlf4i4s+8v/gt4Ttk2K
	6Eq/gYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKxO-0000000EiCv-39aD;
	Wed, 11 Dec 2024 11:32:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKrt-0000000Eh97-49Ch;
	Wed, 11 Dec 2024 11:27:03 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso9358585a12.0;
        Wed, 11 Dec 2024 03:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916420; x=1734521220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QTNgmzYB7WhakHI7BtpiVfr7WRGVdLXuQWsgOk30eY=;
        b=c8ifs8hgFo77f2SbOw2C8N1r2XhxApx3bFaYNyhl7bm/AVBJQkx/Nsw6haoM2ICxgV
         LTuJThYnPrF/Jp46cmXJZkX2Th8tbcHLabZyThylWoTj4P1QaqepBlU0ILUcpbCPCFsI
         uO/nYmFC4iMrObVjPHp/IejGdb1BgW7NiwkMNeoQY/vkMYjxza1ViU8+rKjPB3rdXu8Q
         rLlFiuB5otMZBcy0gV/6FXShIs8BlwPMTYl9GdWNb5gL0cqPhw0G1Z0RhzPSE7sogKTs
         1597Ez33dOArsl4TKji3rxE08/pPJ0R4zZ7Fum1HAjAnYbwuANri63wQu9olr4xSLsA3
         +I+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916420; x=1734521220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QTNgmzYB7WhakHI7BtpiVfr7WRGVdLXuQWsgOk30eY=;
        b=SH6SO2W+PhsPWdP3+nEh+3w4X57dJaAFdG1gI7G55TuqkqV8pOsOStYjXIrt3oFPJa
         +HCP7HNmPf6pvKXvpFpe/BYG9TntxUHHDoyjWHr7iteneNPBpZFyPlCjQVntStTrs4F+
         G110CKKE2QGk3+gA+UxBOcR2IE0l2GvD3iPORDHFykfoEVGME9YWveqgGtOXLjMPPRh4
         9WwTb6RWG0OU0phv58hd+EH8i2GdaIT016ixdLnuNEtt0Z7rf6GlzWwNtzIzyKlTAsya
         V2g1jNzOM4pU1XuU09Exuf0KIRN2psPqazIiVIjIWe5U50OeLAWFG6X3aEKrxnrYwHv5
         SQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNAybykeGNZQyofs+qf1WK+l/CMeglbIoM0ZCHsCk1l4VoXy6iRrYuDwkW4uqZsfAyhK65oPtsMmb2iIsomZFS@lists.infradead.org
X-Gm-Message-State: AOJu0YweDTDEad5tlMXSsw9CE0N+dkB22tYUJ5+LzR1y/zrr38jFy3i0
	WXEDv4qqVtwaOce98wiRWiEqU+ERRJvHGoVZsXpl44J2eg73UELDTJvPaD30w4f/ybXd+b6/jCM
	Yao2bVdyf51WehTI8vahrb1BYIouQ0GSt
X-Gm-Gg: ASbGncv9pzu5SlxStEiBOyfeinC4WpCCESK4uHOLSEeYIUFkDiDGMWjQGo6ty3l/OB+
	59lPH3WbCtnhIZpR5oEMuxZTLZd9jWuZGwKS3
X-Google-Smtp-Source: AGHT+IGm7Cc0UCKCXs6Zci5MhmEB6BM+vhudXV8nstxvwpWP8Qfr3RbFbc33+jNWjYOvcsdishshabpxzxK6uMTtoQo=
X-Received: by 2002:a05:6402:35c6:b0:5d1:2652:42ba with SMTP id
 4fb4d7f45d1cf-5d4330ab69dmr2432050a12.16.1733916419489; Wed, 11 Dec 2024
 03:26:59 -0800 (PST)
MIME-Version: 1.0
References: <e00f08d2351e82d6acd56271a68c7ed05b3362e8.1733901896.git.dsimic@manjaro.org>
In-Reply-To: <e00f08d2351e82d6acd56271a68c7ed05b3362e8.1733901896.git.dsimic@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 11 Dec 2024 06:26:46 -0500
Message-ID: <CAMdYzYpnx=pHJ+oqshgfZFp=Mfqp3TcMmEForqJ+s9KuhkgnqA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Delete redundant RK3328 GMAC
 stability fixes
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032702_027951_CA8F9B87 
X-CRM114-Status: GOOD (  17.94  )
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

On Wed, Dec 11, 2024 at 2:29=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>

Good Morning,

> Since the commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
> RK3399/RK3328"), having "snps,txpbl" properties defined as Ethernet stabi=
lity
> fixes in RK3328-based board dts(i) files is redundant, because that commi=
t
> added the required fix to the RK3328 SoC dtsi, so let's delete them.
>
> It has been determined that the Ethernet stability fixes no longer requir=
e
> the "snps,rxpbl" and "snps,aal" properties, [1] out of which the latter a=
lso
> induces performance penalties, so let's delete these properties from the
> relevant RK3328-based board dts(i) files.

You may want to include snps,force_thresh_dma_mode in this group such
as on the rock64. It's even more limiting than snps,aal.

Otherwise,
Acked-by: Peter Geis <pgwipeout@gmail.com>

Very Respectfully,
Peter Geis

>
> This commit completes the removal of these redundant "snps,*" properties
> that was started by a patch from Peter Geis. [2]
>
> [1] https://lore.kernel.org/linux-rockchip/CAMdYzYpj3d7Rq0O0QjV4r6HEf_e07=
R0QAhPT2NheZdQV3TnQ6g@mail.gmail.com/
> [2] https://lore.kernel.org/linux-rockchip/20241210013010.81257-7-pgwipeo=
ut@gmail.com/
>
> Cc: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328-a1.dts                | 1 -
>  arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi        | 1 -
>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi | 1 -
>  arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts         | 3 ---
>  4 files changed, 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot=
/dts/rockchip/rk3328-a1.dts
> index 824183e515da..24baaa7f1d8c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
> @@ -110,7 +110,6 @@ &gmac2io {
>         phy-supply =3D <&vcc_io>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&rgmiim1_pins>;
> -       snps,aal;
>         snps,pbl =3D <0x4>;
>         tx_delay =3D <0x26>;
>         rx_delay =3D <0x11>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
> index f9fab35aed23..d5f129e304e5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
> @@ -142,7 +142,6 @@ &gmac2io {
>         phy-supply =3D <&vcc_io_33>;
>         pinctrl-0 =3D <&rgmiim1_pins>;
>         pinctrl-names =3D "default";
> -       snps,aal;
>
>         mdio {
>                 compatible =3D "snps,dwmac-mdio";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi b/=
arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> index 181ec6de0019..9ec93f61433e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
> @@ -113,7 +113,6 @@ &gmac2io {
>         phy-supply =3D <&vcc_io>;
>         pinctrl-0 =3D <&rgmiim1_pins>;
>         pinctrl-names =3D "default";
> -       snps,aal;
>
>         mdio {
>                 compatible =3D "snps,dwmac-mdio";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts b/arch/arm=
64/boot/dts/rockchip/rk3328-rock-pi-e.dts
> index 3e08e2fd0a78..59dead1cc503 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
> @@ -153,9 +153,6 @@ &gmac2io {
>         phy-supply =3D <&vcc_io>;
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&rgmiim1_pins>;
> -       snps,aal;
> -       snps,rxpbl =3D <0x4>;
> -       snps,txpbl =3D <0x4>;
>         tx_delay =3D <0x26>;
>         rx_delay =3D <0x11>;
>         status =3D "okay";

