Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2132CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJ6kAa7oShKc/lpiM+bPhxWta9HH3iqlBxnqLQNfAj0=; b=3Cr95RU24SYDLFK69ETBu16euq
	uKVwqh1ehaKqw1w48kbc3J1KmhIvqSbHQ9IBjwzAT5xaCOnutQuZKYOlQfwWyIrxi1O1KAWz3VJE+
	0IXU5wCsYiF2S1YdFBKpFnLXTc5DXjadPoFApIFVLZCH6oWCmEowipWjl2vzQnD8bEXZYDPk8MVau
	83/BXPbwfming52kqqwRp6DF+KSivNmtaJLis0jEjLgyA7Pi4ONraBjqArKqRbK0YJXl4ZlNGBSoM
	Nt+AaZhdobMEi1xrkmaytE3BPwx6xw/vjUDu819wHclygEhUnhX/ZR9xNUT1+bvABcVl85iHcrKJv
	6cZMVYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uut6p-00000007paj-49MS;
	Sat, 06 Sep 2025 13:37:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uut40-00000007pTt-0rds;
	Sat, 06 Sep 2025 13:34:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-625f7457475so544110a12.0;
        Sat, 06 Sep 2025 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757165682; x=1757770482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJ6kAa7oShKc/lpiM+bPhxWta9HH3iqlBxnqLQNfAj0=;
        b=MDETuxXhYiT7W6+mTye2l5IRHYIX/si9t4oxJAaH48jjMO6gJa2kHmh0USprPNQFip
         iDmQ+g+N30wXLKVhxhnrp9CXeYZUoDWz06cizTojmkWrpy9Wko+jDyG0J6KEoY3+oxVI
         5Cr9NnmfRbcRGPlpXL6unysusJAVzdhfWjzhnS7leAh10dsHrEUMnEEOSBPLtMx6wyz/
         uK8g/NnCzugQW7H3i7DnE6GwRIfr0m+19MP9Y8zrrvPD4HKzxXR4k5f5GbuI0tJiZKaA
         SkF7+IreF+zj+LiJODlj2q5+zE4x4yP/3Tyhe/QykOPgCt3Pgox+3pG22maIMfzEiScq
         TBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757165682; x=1757770482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ6kAa7oShKc/lpiM+bPhxWta9HH3iqlBxnqLQNfAj0=;
        b=fqZ31YDcZSzwVlcUZxJWJ9IMLxmzOQXHx9p5IHi45Lcou/wLsl2W+DxwXd7tas2VtZ
         XdRDhNUC+8gCdXty2hQNMGycT6mZmLifK8HDzpqEQRjfBcxzLDvPdzybttKa9Zw69XCh
         pJtf+CFSkhwwkoHSQwU9u9aFdPQgjWSEt7KRDoJrY/yzXO9R30TWr2sn9Jd/DqR1iOir
         Q3iR1WUE++aKeJMhIGP/KR92mdkgh6YVjcD9Ks3AY8VH3ox/J99Ueu/husmrVo2FBiKu
         MK/x3PSyXaek9tB+L9nYEGagXxu31e189ftFlksOUbVBn0nF/61vwQWdZvpKcqLlZJ0Q
         pCig==
X-Forwarded-Encrypted: i=1; AJvYcCVpIcptiBCONWXjAl1MHdx17zkYZXLEQ4a0egPBJjJNydMv/CSlEo0FzyBFjjKH3tlzHvlqSLT8iuP1/kMhX/U=@lists.infradead.org, AJvYcCWlv1IbseLCUpOCSaUdvzdyJVpNhrO0Vp1wNQMmfmaoBU3hA0nXRrT4NZkn3rRU6Vr6zGkAacU7gUExsubCwWXI@lists.infradead.org
X-Gm-Message-State: AOJu0YwsY1rvsVO6ffgTJwIQ3lRthEnZ+FlOtK3VEBMJQt+Wzd0k2av+
	sHHcfuVprmP33vBWybuDAHNb0Gj5K6BYZjd0R66BTbv4hqR29MaS2TZjaA+G1oXe/3ltrtfZUrB
	cXtmZfHU+kdOZX1ATuqJhbsywOmZsoMY=
X-Gm-Gg: ASbGncsyCctyCFmHv96qHSMtQXd7x2h1PtNForPp1o4yjCQ+XPKAiA4EDOXITdJyyg4
	yqNppqagjce+D7Qtv1R1CeigUz0ApnVEhTjV6lHoAJVlRbKfiJU3g+N9I/32wSu4+PLLEUHsPs7
	Ekdlus6I7pb8mnbKxNuAEnudNbgwkX9lYk9z/a7E7wZEa3URX8LljhZJYcws0i2APLsP6N1xbpe
	3orqijnRorxe5NEpg==
X-Google-Smtp-Source: AGHT+IFG1phE+ZeZqgW1zMy+uFKSv2Qx1hsWmfAK05w/g8wdzyZKfVxtUYHEK5SPBjzsv/309PI16u5CYZdBDd/9NL0=
X-Received: by 2002:a05:6402:909:b0:624:6ba9:52c0 with SMTP id
 4fb4d7f45d1cf-6246ba9555fmr1617735a12.15.1757165681932; Sat, 06 Sep 2025
 06:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132328.9859-1-cn.liweihao@gmail.com> <20250905132328.9859-3-cn.liweihao@gmail.com>
 <707aad1d-fcdb-4c66-8d96-41cf1a1b02ce@kernel.org> <CAPEOAkRTVtKBsmiGTbKOCar0oNS-C3dRXqdpuowroRPH1bFS7g@mail.gmail.com>
 <58b638c8-b27e-49a6-b79e-f078135c575b@kernel.org>
In-Reply-To: <58b638c8-b27e-49a6-b79e-f078135c575b@kernel.org>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Sat, 6 Sep 2025 21:34:25 +0800
X-Gm-Features: AS18NWBAYmmcyxx9GhaGWWnfw6zHk7za_4uCKBVeQx-mNiFJOJIfxAZlKy9QaMc
Message-ID: <CAPEOAkSpEzVtUqyUJQbDmbmPOjORnAfuehhvo1qqZgAAeY=ZVA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: rk3368: add CLK_I2S_8CH_PRE
 and CLK_I2S_8CH_FRAC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_063444_247881_8162D7A4 
X-CRM114-Status: GOOD (  18.57  )
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

Hi,

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=886=E6=
=97=A5=E5=91=A8=E5=85=AD 15:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On 06/09/2025 03:34, =E6=9D=8E=E7=BB=B4=E8=B1=AA wrote:
> > Hi,
> >
> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=BA=94 22:13=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On 05/09/2025 15:23, WeiHao Li wrote:
> >>> We need a clock id to assign clock parent when use i2s 8ch as audio
> >>> device, CLK_I2S_8CH_FRAC should be CLK_I2S_8CH_PRE parent so we can g=
et
> >>> frequency we want.
> >>>
> >>> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> >>> ---
> >>>  include/dt-bindings/clock/rk3368-cru.h | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bind=
ings/clock/rk3368-cru.h
> >>> index b951e29069..795e721957 100644
> >>> --- a/include/dt-bindings/clock/rk3368-cru.h
> >>> +++ b/include/dt-bindings/clock/rk3368-cru.h
> >>> @@ -183,6 +183,9 @@
> >>>  #define HCLK_BUS             477
> >>>  #define HCLK_PERI            478
> >>>
> >>> +#define CLK_I2S_8CH_PRE              500
> >>
> >> 479
> >>
> >>> +#define CLK_I2S_8CH_FRAC     501
> >>
> >> 480, no?
> >>
> >
> > Neither of these clocks belong to the previous grouping in terms of
> > type, so I chose to start with a new integer id here.
>
> I don't know what is "previous grouping" here, but IDs are abstract and
> are incremented by 1.

In the current kernel code, the RK3368 clock IDs are categorized by
SCLK, ACLK, PCLK, and HCLK.

However, for the I2S 8CH peripheral, the default MCLK output frequency
depends on I2S_8CH_PRE, which has four possible clock sources:
i2s_8ch_src, i2s_8ch_frac, ext_i2s, and xin12m.

The parent clock of i2s_8ch_frac is i2s_8ch_src, and the frequency of
i2s_8ch_src comes from either the CPLL or GPLL.

Due to the clock topology, CLK_I2S_8CH_PRE and CLK_I2S_8CH_FRAC cannot
be simply categorized as SCLK, ACLK, PCLK, and HCLK mentioned above,
so I choose to start counting from a new ID.

If this way of assigning IDs is not appropriate, I can modify it to
increment based on the previous one.

Besh wishes,
WeiHao

