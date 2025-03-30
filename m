Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E01EC36011
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=; b=wZK0Um9+et99FVpsXos16skEHy
	B5ot5jimVuvEwes166MVs/adTrt2tRI9PHFcQVDonIUwK5obHqOstDKsaItYzvmtm35WbzDKuA3oz
	VfM8Qe2PoO5jo8go7mA67FZIXCiZmg3JJMVtuVPy1nOzqa7zvlKjG/oYGKDFvIVe2cqV3qsZBn1jZ
	ilk7q9a6cT6PAI0JZ7Y0uDA8AqWSJbuymeZOVx+41nNc3lgU3/vKEC+Qs2Ztq4ntMesNleu4LnEDs
	hPPz0OUlLIMONMibb+JAm3yH91vu2luDhh46wkBBsYL79mg3cnM/xQ45+6hMKrAN9EaP5mQnCyZc2
	ydSFRkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzxC-0000000Ghs1-3hif;
	Sun, 30 Mar 2025 21:12:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzvT-0000000GhWo-2zDP;
	Sun, 30 Mar 2025 21:10:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227a8cdd241so38909315ad.3;
        Sun, 30 Mar 2025 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743369039; x=1743973839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=;
        b=cJXXyEhHhoLOG4bsjZ7a6CYBJo3/ss3Ac1x8pFsbuNfP1kFgp+C9cy+uqTAmVl4bfz
         Ra7/b8DxwJ44hjUBu44v+IiZiFNfUGijMS3PN03oEyeno8IpBgckLg469aSEBKFjfxkE
         Uw8IFdl7rytJXJS/fAzhCcwx/WiFY88NeFRAVUIxjxj8bnnXRr3RXyNPdyE3nFX1vI9V
         I9YWaCFdyE/3OTNLBMrfkhRP/y3X1X6C+pVaGc9raQFxGn/y9jyx4iJC5mD+JLW89eTC
         U+cel2WeyWYPZEcphiey8ofE56Bxx0dXG6+ONMN8JGP1+M/fk7H2V5NZvqbCwONyD0IY
         O7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743369039; x=1743973839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=;
        b=SjbzxR4aa+uZ00Qzs+71dOxf1Ydflgp1wV4SztovUGlHj6SBuhbaikc3YWpUkANxu3
         riXL7pTmTpfARdrtMuNspNd8zZXaBhaTN6vDrAn97Kr9/tonjpLaFz3B7NmlPS4+yy/e
         8/vLdsUHEL2sImQp1bHIaRVzHDrOlql3gWVZqbc4FPvFcC79sq2HrmAOdVLpeLmT4gdx
         acOhcrk4Cwk3d/qmxWFFf2SDkgfDICk1XEbEEfDboOWRbPGJwkX4Gm5AnhX9HwsSJQ3/
         x9BZL96VCs/88I7PNvkACp5GEXDGb1oyJ207IFk3luJ8za+OGMh5i0VPtkDxeZKlyyL4
         Nxaw==
X-Forwarded-Encrypted: i=1; AJvYcCV52EOFUnw+mYvzbQCHkdHAXMZusQ33i3NzoS0fyZldTuXQf1djvxj5nuAt0kJ4Kl0KczRfZKIsHej7Ddy4@lists.infradead.org, AJvYcCXH7Cm52Tpdx7tLr1Ehr1uY4UMSiltNR+SO/zSyl3kewtPNFcFuJm9CfoJo8RlZhC1RIv3kmxfz/GEQQAZc2sKFNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAD9XFbm4fnvw2YXFB7BojhZB2W1LuullyrqcE5nBZHG7BYZ0
	DYm3y8SncinkagrqUzKlzCWx+FFbxmHwt/TIH0Og8S87YTXiU8Cv6AqOgpYgRrC64qhGk5H4bZR
	diZlw3crodcb/s34SlPUHtEzKuyU=
X-Gm-Gg: ASbGncsESwidM/Fz5eWaYg4meLp3H2KYvXzh3WdZmWB7HzUlVNYQnvmCACEPR8UY9WP
	qoPgBqrdLmRzh7FeWqSKeUCdkOB6pk7g9gv1BlHAdXTC2ophX/eMjDRZMnqyUbipeNjbRBFQw+A
	G8SfX35ueHRGa1cGfHC5cU3SvvyGW0G4KuwLi2vet/enxmyXeuIZmFjiaJCMg=
X-Google-Smtp-Source: AGHT+IGG8TQ/aML9NKHr9fatF2KsYLKFfgoL9nDkVZai2+M8OApdKY34UCov5OwIf2Xe/caQxnERpRKq31UEig1iKE4=
X-Received: by 2002:a17:903:19ee:b0:224:10a2:cad5 with SMTP id
 d9443c01a7336-2292f942a6amr130079115ad.10.1743369038858; Sun, 30 Mar 2025
 14:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net> <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 23:10:28 +0200
X-Gm-Features: AQ5f1JpHPy4BrslsaR2BuaGOJO_CEScsXGIyscHyEtnp4vipG1FtG1_j-1eqkLs
Message-ID: <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_141039_749908_B2090926 
X-CRM114-Status: GOOD (  13.54  )
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

Thanks for your patch!

On Sun, Mar 23, 2025 at 1:38=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
[...]
> +               eth_phy0: ethernet-phy@0 {
> +                       /* IC Plus IP101A (0x02430c54) */
> +                       reg =3D <0>;
Does reg =3D <1> also work on your board?
0 is the broadcast address. It's unfortunately something that we still
have incorrect in a lot of .dts files.

[...]
> +&i2c_AO {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&i2c_ao_pins>;
> +       pinctrl-names =3D "default";
> +
> +       pmic@32 {
> +               compatible =3D "ricoh,rn5t618";
> +               reg =3D <0x32>;
> +               system-power-controller;
Here I'm a bit surprised:
Aren't some of the outputs used to drive VCCK (CPU power rail) and
VDDEE (everything else power rail, which also powers the GPU)?

[...]
> +&usb1 {
> +       status =3D "okay";
> +       dr_mode =3D "host";
> +       /*
> +        * This bus features a Realtek RTL8188 2.4GHz WiFi module, with a
> +        * 3.3V supply voltage that must be enabled before use.
> +        */
> +       vbus-supply =3D <&wifi_3v3>;
If you want to go for perfection then you can use
Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml as
reference.
It's also an "onboard" USB device which requires toggling a GPIO and regula=
tors.
The driver side is super easy to manage as it's generic (meaning: it
parses any GPIO and regulator as long as the USB ID is registered):
drivers/usb/misc/onboard_usb_dev.c

That way you can just describe the RTL8188 on the USB bus and assign
it's vd33-supply without having to (ab)use vbus-supply of the USB
controller.

[...]
> +               sdxc_c_pins: sdxc-c {
> +                       mux {
> +                               groups =3D "sdxc_d0_c", "sdxc_d13_c",
> +                                       "sdxc_clk_c", "sdxc_cmd_c",
> +                                       "sdxc_d47_c";
> +                               function =3D "sdxc_c";
> +                               bias_pull_up;
This has to be bias-pull-up (dashes instead of underscores).


Best regards,
Martin

