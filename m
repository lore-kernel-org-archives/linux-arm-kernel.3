Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189BDD132C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgXCii0DshHtUhq28hb2Xg8c5R9TmuHmpiCmDqnpQag=; b=usf+7i6niBXG7K8qUn3dJOvKHv
	cO05NV8hQXKN0q0qLZFY4KY9fH6gKcvm4lmvTxdCxvN3y8UjQE/A5q/9mfmQzY1b6E0m2uCFFFeQO
	3q1HL9HB0tLsVe+T49DuDIAQID+6liGW1SflLkQ3Jt+XhXKlLH3wqzoo1h7cjSFtVZZ3kdPNLn7U8
	XmdjYpRCbREvFzmd7xNS4BDg3xw0S7wC7y/BeVkvRmbnxv4EgLGh8IymwkVhX/LBKvTf3UB5H5Dzb
	ezs3Y25XTCTbGoW3bVEZxl2ACEAaCNfCfrsjvG0k9RqvfR+/XDXv5oSOiLqn/p1x6/dFBo4PgFRa1
	VcyYZBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x4O-0000000DqOP-0Y3t;
	Mon, 04 Nov 2024 13:24:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x2B-0000000DpwG-2ljU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64F74A42F4F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85C0C4CED7
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730726537;
	bh=Tj2FqFQ7r2b4f3vcnV2ejn2hN8icLGVwIvwRHnFu6LA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lu4kk/++HaJgFQNzO2vYoHRA/4OazSta4k/aueQRYLiY+Db/YoNkBsR1VUyz55OZH
	 7fDpYM5kelv49kFSvd6A5TRWCyvRbhbMyYW/N5BZar0JaS2+LS1EDECQUm68+4XORX
	 Dfk5XxrJJKdFdkb5EM4GfkVJlbZ15jklzRWWoZY6IhbOEgy9kUz4LYSCoPoo1HGf7u
	 rd1DMHceezwsg9p8g7qodXrAqMlpu4JtqoDTSFv8ZAHOqNXBiSLFYKdt67SCN/jYkh
	 tnR+gsNjFA+L6/Uiv+hNUAB2FZpTmwW91g0TJwvQoZOSvYdBZd0Pc+fq8S1d6QtR88
	 DfNJ7F4zO68hA==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e2e340218daso4124168276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:22:17 -0800 (PST)
X-Gm-Message-State: AOJu0Yzy9iknGoKkDhwvCETV4Q2AVavvWB4srmcMD22zWbQNpAeA4LY9
	+AmNXNzjNpbk2QZcE7feunckkKbA3dy6txy4WmqAbWXeLG2kApW4zXtgwUU4gh6buET+Lrp5AuF
	cj4iVAspMrwCpG8t1AsFdrEkb3A==
X-Google-Smtp-Source: AGHT+IGeqHEHHvv5WLP3SxrhgX6E1Sdt1m4eiSmZCbSQ1YICeESTFlOi/vfYQlC2v1SaGAP7PYV4swW7rypB4eXi2xE=
X-Received: by 2002:a05:6902:2701:b0:e28:a4f9:c2ff with SMTP id
 3f1490d57ef6-e30e5b79503mr12339543276.55.1730726537038; Mon, 04 Nov 2024
 05:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20241014193528.1896905-2-robh@kernel.org>
In-Reply-To: <20241014193528.1896905-2-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Nov 2024 07:22:05 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+QdfZbkeeY2PWAq_5OpeSF=QpcL7OKWpz7byuXNLRG1w@mail.gmail.com>
Message-ID: <CAL_Jsq+QdfZbkeeY2PWAq_5OpeSF=QpcL7OKWpz7byuXNLRG1w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: Drop undocumented SATA phy names
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052219_848839_3A385CC4 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Oct 14, 2024 at 2:37=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> While "phy-names" is allowed for sata-port nodes, the names used aren't
> documented and are incorrect ("sata-phy" is what's documented). The name
> for a single entry is fairly useless, so just drop the property.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Cc: Frank Wunderlich <linux@fw-web.de>
>
> There's also this 2 year old patch fixing other SATA errors[1] which
> was never picked up. :(
>
> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-3-linu=
x@fw-web.de/
>
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 -
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 --
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 2 --
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 1 -
>  arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 --
>  6 files changed, 9 deletions(-)

Ping.

>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-7040-db.dts
> index 5e5baf6beea4..1e0ab35cc686 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -214,7 +214,6 @@ &cp0_sata0 {
>
>         sata-port@1 {
>                 phys =3D <&cp0_comphy3 1>;
> -               phy-names =3D "cp0-sata0-1-phy";
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/=
arm64/boot/dts/marvell/armada-7040-mochabin.dts
> index 40b7ee7ead72..7af949092b91 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> @@ -433,13 +433,11 @@ &cp0_sata0 {
>         /* 7 + 12 SATA connector (J24) */
>         sata-port@0 {
>                 phys =3D <&cp0_comphy2 0>;
> -               phy-names =3D "cp0-sata0-0-phy";
>         };
>
>         /* M.2-2250 B-key (J39) */
>         sata-port@1 {
>                 phys =3D <&cp0_comphy3 1>;
> -               phy-names =3D "cp0-sata0-1-phy";
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b=
/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> index 67892f0d2863..7005a32a6e1e 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> @@ -475,7 +475,6 @@ &cp1_sata0 {
>
>         sata-port@1 {
>                 phys =3D <&cp1_comphy0 1>;
> -               phy-names =3D "cp1-sata0-1-phy";
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-8040-db.dts
> index 92897bd7e6cf..2ec19d364e62 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -145,11 +145,9 @@ &cp0_sata0 {
>
>         sata-port@0 {
>                 phys =3D <&cp0_comphy1 0>;
> -               phy-names =3D "cp0-sata0-0-phy";
>         };
>         sata-port@1 {
>                 phys =3D <&cp0_comphy3 1>;
> -               phy-names =3D "cp0-sata0-1-phy";
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/ar=
m64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index c864df9ec84d..e88ff5b179c8 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -245,7 +245,6 @@ &cp0_sata0 {
>         /* CPM Lane 5 - U29 */
>         sata-port@1 {
>                 phys =3D <&cp0_comphy5 1>;
> -               phy-names =3D "cp0-sata0-1-phy";
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/ar=
ch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> index 42a60f3dd5d1..3e5e0651ce68 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> @@ -408,12 +408,10 @@ &cp0_sata0 {
>
>         sata-port@0 {
>                 phys =3D <&cp0_comphy2 0>;
> -               phy-names =3D "cp0-sata0-0-phy";
>         };
>
>         sata-port@1 {
>                 phys =3D <&cp0_comphy5 1>;
> -               phy-names =3D "cp0-sata0-1-phy";
>         };
>  };
>
> --
> 2.45.2
>

