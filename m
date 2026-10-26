Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZfgpeax;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fomnLbuc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=; b=qZfgpeax1f56HW
	ttdckmV/DlRHMd3n+ds2sJuzdC+W+u7qOtUAwCtQupFQObbU9CLRdvkfW8E9T7F6niCcVAUk59CpW
	6Jdv/zAUPPfJqHDKzxmW2CWkq8AqKwdNm26nGFdcEvQmh3rOPYJRowzBuB77l5Ti713TBP3n8e7Bu
	dqUZ1BG5+p1jTL5RMBlpT9v7jxz+SfjsFuVGPWkNEhwLSZhCBu6+RI81EyTwJ6gCDAqyebwuO7Cky
	L8gvWaQNZVbOBNxertt7I+jG/v8/a5N7tgxmhT6bajb4gYdg90/W9wws6Mwz+wnf6fyMr67UbbApG
	ySpi8R7/pUJ296eIOljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFxT-00000001wDD-0qe4;
	Mon, 26 Oct 2026 08:21:31 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFxR-00000001wCc-0Eq7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:21:30 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1324160b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793002888; cv=none;
        d=google.com; s=arc-20260327;
        b=p1Oa3DAuZZktPzgdbEG7VZO7oN4lnMcOyAVEApXXE4KRHaYRwNKoz7DIiHZTt26QJ1
         ONN+I8RUACRwdQXH2YLV/QBPddA+ehL4ESHdpUKNyNE+fwtiR9QgAdfwyEdQTDWv7vAd
         awvbsGKD4Ii26i1lIKU/0PjjXnbWtNOiudVLhET210W7RjvagjBVVriQUCXv1Zc7rACr
         s9CCEhM1hGwZOTqKo8ghD/A9LDQR6GvOtVG7LLGIB1j+ju65h5qoYTOLdUpagcEDH2u0
         2kRocp4NqIpMVPVPkEqBOMwFtJ4qZLD2R+2CwaH6YgRHYi6wS/7Jecd7+gUJdOdAURVT
         J1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        fh=OvY7TB0ThBm4iyXy2iCYJ5SRTfSAJv/Jbxr7WuuvaNc=;
        b=a13lTwTQnrlBqiAAp4l1+TtI2i28BmjARNGjKfbun6OwClHq1SpV5D/kcdMdA82EMY
         xccU3Gt24gSZ7MVPlC5SMbAvsUjtIYWuyWpjcbjMJTr/jFI0lghsmZboJs2MnznlTNU5
         yMLLtRc8qT/1v3XGdkL8ICCg5E858uXbmYKyYHvCe5Wyzil3e2auIkM5JUzDP31gTkry
         p4gPmQIpJRkjgzS/33bMBQaYpuh2Ig9YBiGKzn0zmho0o7ynkRYhEB/6W022m+jh2ZAY
         EFzZ61fnV152ibkdO8KzrzC+hNepVyj+cvAhd7Zy3o0KXKu5U9FAl4ueuvc1UNhbA9GD
         vmsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002888; x=1793607688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=fomnLbucj6SSGjes8mZ0GGAIC4jmu02aGYu8H0/voN9neLJff5IPeuSTQDaPEeA0/L
         253P0QICAHjwoS/Jy8E+Wd+EmSFPI/3cko9xBYSLNEaHC5S7fFjZmcPQO5KWgK0Po90j
         CVq03lHMEyHQqfiyyWynD6NeNQW+OB3Xlt4bZFQUSw71gXKLGGsGcgOG64NEsLiiyfdC
         TI05rSFUG6K1U+VspqxurC2UKdnrF++MBMxX7SloBKykcbEtaoYPbtN+uhCINfrnU0n8
         bFTTao8llGAS7IXSqt14gHjOvzE7l7VOC/Qu3c6TmBjpgXfID5e9Bpfuuy9eHl9h+Yof
         peUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002888; x=1793607688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=JP3eqryjYMyKiPmWPsbyH5cwjD5+lQvSiRbuqRQHp5ck10TAqIG6EmlWz+XIAocVRU
         R3XRIx1e3AkDJ1R1hjCOtwhFFkB9Vc1KFvvBYTzFXvAaHvgHPCODndMbqMsCvChxLSeh
         g7UTpOXS+rQe8SeDK5VpXhr+b9j7UrQ8vgFiqKe3DQ6Y8kh5eZwb0JCU0kzMPyRVfPul
         Z1V3D6tF3dwVRDoF+sWyECv5VSK4Rx8QxqbEzcVt9Ltn/eKUcmCghOm9zsnvwqHE/O4J
         ftJWZOpKE8+dlrAbYpWPKtEolWGQ/yYxnWyxRr8As8dFnVAD09SjBoVdAMqwvEmRGDOM
         O2oA==
X-Forwarded-Encrypted: i=1; AKwUvBwfvoSXlwOMO5tf//OWZGqxlKGYCF70a+EUZLjLZ8harZfDGCFwQJWfU9dOwKBXEKJMYsbD7Z9VU2jtJQv+Mhzx@lists.infradead.org
X-Gm-Message-State: AFq9FYKBaIvebMDpzcWpevo3bCH+Mbs9pfzeimWMNvgsUzyEkeswKkS+
	u4xFxlbc6L7v4+yXbHpK3vlgl9yLD3WfsH6qBYLFB5oKK2vaBrQ5H+SVAJG6Bh134js2xeAUpFL
	WfvvPE2K8Txrc35/LYP+xKkTWRcba0U8=
X-Gm-Gg: AYBFou3OIyfHcuuFYNGunNuxgWruiLC9QYqWJnQW8L+gLxpNjwPLYSDRg0vvDP7mYRn
	UlyKO0wmuPQ6Zf2IFQBgKyjoVHZrGvcu7skmLq8Qu9/fu5SarUYTnnrwoPNRNf818kLg+wzj44I
	cYClJ9mL32lkLF6DCAC+p4KF6O3bgtWO1a0xXtxKw2/yZtmMVkSO4xc41VisI8UTO+FdJJKHPWt
	WlTBndGJMuSBduJkGx0IKttakTlhaHBLfcO3cGm1P2RKKlEWiAp+p+SKsnoifNcquYd/GUC1zTC
	tzMM+sIvI9OW6bBqj8Yq+54J8oQzuii72LINIUYF9VIA5TGoAlZeKFhdEdTUi1YW4qTQKbofYDf
	hdhQ8nJ1ihNOdb+ybevuu5ieGvgKQporPdkLhmU/G0I8azFQH0gtI
X-Received: by 2002:a05:6a20:db8e:b0:3dd:85a8:cad3 with SMTP id
 adf61e73a8af0-3e7bfa95ca3mr4905748637.42.1793002888123; Mon, 26 Oct 2026
 01:21:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-2-pmazzini@gmail.com>
 <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026083058.04173f10@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 08:21:18 +0000
X-Gm-Features: AclHuK-pzB2ukAo43D26PIOQvYip4LrlulkX87-Zh2YxM609r20rprIHYc6RIYc
Message-ID: <CAAxh=jvGJVNTU6o9L-8-AeHDVHBcBwJDxwwoNZDwMN3tjRk1pg@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_012129_100555_D30821E2 
X-CRM114-Status: GOOD (  21.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks, I will drop this patch in v2, so VCOM stays off until a consumer
enables it.

On Mon, Oct 26, 2026 at 7:31=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:12 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> > always-on before the driver stops doing it.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/=
nxp/imx/e70k02.dtsi
> > index dc7ff108aa85..bd9c6c6fa117 100644
> > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                       };
> >               };
> >       };
> No, please not. That regulator is in practice used with a not yet upstrea=
med
> driver for the EPDC on that platform used to deal with the current kernel=
s
> fp9931 / tps65185 drivers. So it is very welcome to have it not always tu=
rned
> on.
>
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm=
/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > index ff9d50942884..6cf5603c0752 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                               regulator-boot-on;
> >                       };
> >               };
>
>
> Here the situation is a bit different. If I remember correctly, there
> is some special EPD logic in userspace on top of some ordinary kernel
> display driver. But thesse things are missing is devicetree?! But
> that might need to learn to deal with regulator enabling/disabling.
>
> Regulator always on is probably not desired here, either.
>
> Regards,
> Andreas

