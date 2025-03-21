Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96745C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 01:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HZK/FjsgxH8rgQz5UdjpktKxGwid5B9t/SURmUdS6A=; b=qVNxBWVYAAyKlbEjmvgxu4q/QG
	IWApmuqlE1ssc+JUtwpIhnF0B//d9pADkCOoDkUhx20LeG+TgWcwdwr1fKILpNpsIJB5HG4fU6Vvs
	S5QSzbo8kP4xml7pVIxuVVfR60h5bbdfKrgW4YLgfoxsgIT3qIea6akv9aX5N00M3DFcFKPZ8R5nl
	q6gx+GL720cmG2GyqsIBAsuo/w2V2bW5NHKYjwXGzcBRQBe0WAatd5YBSKN3NsAHKzm/l60U2NQoA
	boV4TTGhX22l0NUHy2wtrrLcJaEdTCi8X6SHBjIaOuzgaDrh8rdU1ZkgxOiPB6s9YkIKhSZ+NbgIt
	9NTi8Z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvR5X-0000000DdRJ-1adG;
	Fri, 21 Mar 2025 01:22:19 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvR3p-0000000DdLB-3jdm;
	Fri, 21 Mar 2025 01:20:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so2694851a12.0;
        Thu, 20 Mar 2025 18:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742520032; x=1743124832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HZK/FjsgxH8rgQz5UdjpktKxGwid5B9t/SURmUdS6A=;
        b=CD35lpHA/pfRCkWln8y/v8jPvLCTnsVJP6ZJqYDcJJqKGjKf9M5MFyCE31iArFyPcl
         cS9vMeg2aDCN25i+jIc75ZDPp3NHYi5GIeOFRm0OfUmGRAizj2WsTtXx22ZOIjafVmLr
         mC1UxsE9tlVOLQX+eDR6HzRPPPMoLAAUli41o+FU/JWmrCcMDPzUheUUYUUknGaTcKgp
         e/QZqvZNgulMa5pz1kqweJR96mA23+vjOg68Xi62EfRTF7vMjXb7t3RnX9F8UVksQ+0s
         lvysuna6Da/YoJT172zOQfG6Mfkdet+btFOp8+D1BAraCjVSS0vC66gmMd9md4R0zl1e
         9omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742520032; x=1743124832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HZK/FjsgxH8rgQz5UdjpktKxGwid5B9t/SURmUdS6A=;
        b=V6f/ZLYh6LX1KiB0KZdhenHaRqOV7AEHinkhzmjldNRo98qpIwKWP3jgKUkQPfWE1j
         m+fsc/t7/t8PEJ6dCsbK5G5ucOH9GDq4Mfpsqz8YHEMhudx2RmBn074RCY68z+8/Tl6g
         y9npY8VCKUBlDPqef2EOzUTAhZZdEks5eFv7q1Onz2eqxKxvDT/22aIANcale9KDbgse
         Bk5dKrKl3CiUNn9syKhQRekJnO+GWyd7CWEGTyllqf3I5jwi5VI1CYQ72ems62tT+9/2
         307KQ1bwDvVFW8QhFLvOuN6ysRn+73X8m+Ow0FmKJerJj4vtr3yDtJM3J+0BbRfmvmJQ
         35bw==
X-Forwarded-Encrypted: i=1; AJvYcCUyql3e58dM5wiyQq8RctIg7eIhruOvX2u1kZPSbYyxUcG9AJRakY9WBpzqNHq2QIrw11SdSxtrRL3MokmtOFLW@lists.infradead.org, AJvYcCXM+4EjjsSbQI+ACHNGi3H8MwFHMrjR1Mwj+L3JPuhuRpjBgd0EsHp6V4Y3chKyVKL5dtCvcabSsfIo4+437a0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw3fwUu2+ENFWwDq9MBRM/2duk4FyTbP9s0J5cgFwQhQGb4QM/
	Q0Q9m69VOjmvXQZ/3zki6/3zM8yZmZieeNXaV5Y6pPimhmZiPU4xSLUg9NwbDejugkg4IJgvJa7
	fUfgV9ZQQ0Oot9xPltWAFxP+of68=
X-Gm-Gg: ASbGnctRXre6op0DqKgHJ1pGlgQ9UUaHz9layCgAVKMjOSku3dTyl/lkBtcmOgriYFg
	Rn4mohzrGCtoS7g92H4XadhQEwS/L/vYlH4VBdJMHetaf+8wJfBM2t89wcotWUH96us3XjTWYDI
	fFDPgW2KyaaJHHCINBAcPje8eDe6QBk56Ttp1PFhoJu69H7+m4zWu/e2iyAoY=
X-Google-Smtp-Source: AGHT+IGIE1+moUJxAvVppTaWNdlItcrjKuGQPgygcTy+VdcsvgnoPSCeR+4j8NRkAklH93BWzVlDqMTDcRKMNKFlmI8=
X-Received: by 2002:a05:6402:2793:b0:5e5:3c1b:c0ff with SMTP id
 4fb4d7f45d1cf-5ebcce07a08mr1613441a12.13.1742520031566; Thu, 20 Mar 2025
 18:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250315204852.1247992-1-CFSworks@gmail.com> <e1cdc3a39b9201cb115b12b559899aee@manjaro.org>
In-Reply-To: <e1cdc3a39b9201cb115b12b559899aee@manjaro.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Thu, 20 Mar 2025 18:20:20 -0700
X-Gm-Features: AQ5f1JrZ70w76EeL0x7DU0tc9VlG6Hcd3TPBcx3Yd7HL18hR7dxsfjuAIY08JdU
Message-ID: <CAH5Ym4hqkMMBsT7XEz_f+TCng+0X2m0nV_Kdr-LAPBqgENgr5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Allow Turing RK1 cooling fan to
 spin down
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Daniel_Kukie=C5=82a?= <daniel@kukiela.pl>, 
	Sven Rademakers <sven.rademakers@gmail.com>, Joshua Riek <jjriek@verizon.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_182033_932141_FFBD560D 
X-CRM114-Status: GOOD (  29.55  )
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

On Thu, Mar 20, 2025 at 5:38=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Sam,
>
> On 2025-03-15 21:48, Sam Edwards wrote:
> > The RK3588 thermal sensor driver only receives interrupts when a
> > higher-temperature threshold is crossed; it cannot notify when the
> > sensor cools back off. As a result, the driver must poll for
> > temperature
> > changes to detect when the conditions for a thermal trip are no longer
> > met. However, it only does so if the DT enables polling.
> >
> > Before this patch, the RK1 DT did not enable polling, causing the fan
> > to
> > continue running at the speed corresponding to the highest temperature
> > reached.
> >
> > Follow suit with similar RK3588 boards by setting a polling-delay of
> > 1000ms, enabling the driver to detect when the sensor cools back off,
> > allowing the fan speed to decrease as appropriate.
> >
> > Fixes: 7c8ec5e6b9d6 ("arm64: dts: rockchip: Enable automatic fan
> > control on Turing RK1")
> > Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> > index 6bc46734cc14..0270bffce195 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
> > @@ -214,6 +214,8 @@ rgmii_phy: ethernet-phy@1 {
> >  };
> >
> >  &package_thermal {
> > +     polling-delay =3D <1000>;
> > +
> >       trips {
> >               package_active1: trip-active1 {
> >                       temperature =3D <45000>;
>
> Thanks for the patch, it's looking good to me, with some related
> thoughts below.  Please, feel free to include:
>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>
> After a quick look at the RK3588 TRM Part 1, it seems possible
> to actually generate additional interrupts when the TSADC channel
> temperature readouts reach predefined low thresholds.  Moreover,

Hi Dragan,

Ooh, I see that now!

It seems to be as simple as adding a `.set_cooloff_temp =3D ...` that
writes the lower thresholds to TSADC_COMP#_LOW_INT and sets the
necessary bits in TSADC_LT_EN+TSADC_LT_INT_EN. Since the driver
already rescans all temperatures on any interrupt and acknowledges all
interrupt status bits indiscriminately, I don't anticipate any other
necessary changes.

I can easily take care of that this weekend or next if that plan
sounds good to you. However, since *this* patch is a Fixes:, I'd
rather land it as-is first and handle the above separately. :)

> avoiding the polling would actually help the SoC cool down a tiny
> bit faster, which makes it worth detailed investigation in my book,
> despite not being used by the downstream kernel code.

Do you mean "spin down the fan a tiny bit faster" (since it would
detect the cool-off without needing to poll for it), or are you
emphasizing saving CPU cycles that would otherwise be spent polling?

Thanks for the tip,
Sam

