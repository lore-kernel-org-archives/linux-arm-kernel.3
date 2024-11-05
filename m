Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19883D12685
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBUO86Esag0AIKMgH5gfK9ZnxtYJdn4AEUd68kd9nv8=; b=ffcxR5zye8/sPbcMeEIJlTi6Id
	Lj3M2XEIOKwoVnpuE/hHdbvazog4GRQo4nnI0s2GTbauJtR59Trgi+Drxh7I699rjNZd2jjP9uU1b
	lpcoS40+bmBCDE7PXTWnjtm6nMHNBiJZKlBEcd5OuuGof50o5Mu1G96d0DtKFsWLh9gz4mw+ue6ni
	8yvsxXMuX4OXO58xl0XV6W/M4zoBDyjJgheqYb2BDHBr/PuinCUE3q5GTVaGtcZVoUqnC7WsqD1n+
	iiyZaLejRLrUxz/1NrqoUDWmmoWtKDOpkbgZ4xOc0mWVOxBcPHdSPBN+oaN78n8UL8XKaEqmn5C4t
	7BvQKmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HU6-0000000Gnob-0wh4;
	Tue, 05 Nov 2024 11:12:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8HSO-0000000GnWZ-0dy6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 11:10:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69134339;
	Tue,  5 Nov 2024 03:11:10 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DCA03F6A8;
	Tue,  5 Nov 2024 03:10:37 -0800 (PST)
Date: Tue, 5 Nov 2024 11:10:33 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Enric Balletbo i Serra
 <eballetbo@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 "Tony Lindgren" <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 "Kunihiko Hayashi" <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH] ARM: dts: allwinner: Remove accidental suniv duplicates
Message-ID: <20241105111033.462acd82@donnerap.manchester.arm.com>
In-Reply-To: <20241104230628.3736186-1-csokas.bence@prolan.hu>
References: <20241104230628.3736186-1-csokas.bence@prolan.hu>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_031044_257006_DC1ACBFF 
X-CRM114-Status: GOOD (  13.12  )
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

On Tue, 5 Nov 2024 00:06:27 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

Hi,

> Allwinner suniv boards' DT files were accidentally duplicated
> in the Makefile when they were moved to the new directory
> structure. Remove these duplicates for code cleanness.
>=20
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories=
")
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

Ah, good catch!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index cd0d044882cf..2ea5df3d9894 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -268,7 +268,3 @@ dtb-$(CONFIG_MACH_SUNIV) +=3D \
>  	suniv-f1c100s-licheepi-nano.dtb \
>  	suniv-f1c200s-lctech-pi.dtb \
>  	suniv-f1c200s-popstick-v1.1.dtb
> -dtb-$(CONFIG_MACH_SUNIV) +=3D \
> -	suniv-f1c100s-licheepi-nano.dtb \
> -	suniv-f1c200s-lctech-pi.dtb \
> -	suniv-f1c200s-popstick-v1.1.dtb


