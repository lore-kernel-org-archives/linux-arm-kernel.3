Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD5FEF070F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 06:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDQataT0zQ8ngyYFf1MHoLkS47NJ64fQnpqo9H3fIYk=; b=ubc2kGsTIHVYXNqNmxo2+aVDeb
	VLjulPwyjbCmUlhXvpGxcJ79wXnU2u/7jx8dEUxQV/EBYiHkTznGIwNJ3b7MQ3jPXUxK0vg9unF7m
	NheCJNp3ELVI512R8S0Mi3Mr5fIQINQwmsF88ChJzjDG7Bjs4dVwrIqNnehuHrbumZBwW1fEgHzST
	3EAhxn2kCs3gFXvQmNar9oO0uArl6cwpiNHHz0x0riWnzeDlBMNIQM2I7OZMkmhU+lsIGj1IQ6bjY
	ulf51+mStKh+vA9FGDfC4M/40XvpiWXhw41yadfJLll9HThA0EGZBZtQN2Kg1zVNyxvEYelbkgIcS
	ofZGqcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKkU-0000000EuBC-1tWG;
	Mon, 09 Feb 2026 06:27:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKkR-0000000EuAq-3bu2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 06:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770618469;
	bh=lDQataT0zQ8ngyYFf1MHoLkS47NJ64fQnpqo9H3fIYk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fM/Zcuj+qwUA9e1/tofsoaYdw/mrlVHhUU9ExrbwGMMHBzvE3x9Nm97uWlO8gwXZC
	 6YLxpqX2XTpOxsQMXGx5CXLeKy8ShBpJn9uum3BD/IzuSUqEF6K+bUC8fVJeS53zbu
	 r49N9s6XT4AbFUFuE78LYRhDBAlSnOzgySEW8+HtjMWOhBU6hduVoPfe8EYS4r5WLu
	 zv0nrRnjaYWMLGCf0uYzbmMzBjb9VqAgoCBgatc8eLmtDfSHMZQpjLohQLU8GMIFHC
	 M9lgHxnalARjf0qA442GGXDU2kdC6ZKlOMXg6MKVk42a2rNYx0oUFRI01n/jKJjCwo
	 fzw5ckvZr2Fmw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E27E5602DE;
	Mon,  9 Feb 2026 14:27:48 +0800 (AWST)
Message-ID: <62b7557d7af89742d142c1c8d317b8fa14f7ba24.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed: yosemite5: Add PDB IO expander
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Mon, 09 Feb 2026 16:57:48 +1030
In-Reply-To: <20260130-yv5_revise_dts-v4-6-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
	 <20260130-yv5_revise_dts-v4-6-4d924455f3a7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_222752_103403_CB6FDC55 
X-CRM114-Status: GOOD (  15.93  )
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

On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> The new hardware design adds an IO expander on the PDB
>=20

What does "PDB" mean? Can you please expand this in the commit message?

>  to support
> fan presence detection and HSC
>=20

What does "HSC" mean? Can you please expand this in the commit message?

>  fault monitoring. So Add the PDB
> IO expander device node to the DTS.
>=20
> The IO expander interrupt is connected to SGPIO92, which was
> previously named ALERT_PADDLE2_SMB_N and not used by the system.
> This pin is now repurposed and renamed to FM_IOE_ALT_N to reflect
> its function as the PDB IO expander interrupt.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=C2=A0=C2=A0=C2=A0 =
| 21 ++++++++++++++++++++-
> =C2=A01 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 524597a81365ef10cd03b67d35eeb88a965cbe0a..48f864b52d1a22b12f8a39ba9=
703a90349ed930d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -389,6 +389,25 @@ adc@1d {
> =C2=A0		ti,mode =3D /bits/ 8 <1>;
> =C2=A0	};
> =C2=A0
> +	/* PDB IOEXP */
> +	gpio-expander@24 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x24>;
> +		interrupt-parent =3D <&sgpiom0>;
> +		interrupts =3D <92 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D
> +			"FM_P52V_AUX_FLT_N", "FM_P12V_AUX_PWRGD",
> +			"FM_SLOTX_HSC_FAULT_N_FF", "",
> +			"","",
> +			"","",
> +			"PRSNT_FAN0","PRSNT_FAN1",
> +			"PRSNT_FAN2","PRSNT_FAN3",
> +			"","",
> +			"","";
> +	};
> +
> =C2=A0	power-sensor@40 {
> =C2=A0		compatible =3D "ti,ina238";
> =C2=A0		reg =3D <0x40>;
> @@ -937,7 +956,7 @@ &sgpiom0 {
> =C2=A0	"ALERT_OC_PADDLE2_N","",
> =C2=A0	"ALERT_OC_PWR2_N","",
> =C2=A0	"ALERT_OC_PWR11_N","",
> -	"ALERT_PADDLE2_SMB_N","",
> +	"FM_IOE_ALT_N","",
> =C2=A0	"ALERT_PWR14_SB2_LEAK_DETECT_N","",
> =C2=A0	/*bit48-bit55*/
> =C2=A0	"ALERT_PWR14_SB3_LEAK_DETECT_N","",

