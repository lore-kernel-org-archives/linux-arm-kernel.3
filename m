Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA41C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2veFNGdTL1atZAhB2vrZxwxXadzUoQya1iQSnNw0RO8=; b=UaG+ccoMBcu39nS994SScOCVd+
	JCS/IqmwUEuWULgG3nBfNg+Vk8rO6hCMdxIaWu8LusrVwZu/FAEV6C+9wqy1wrZ8fR59GvoabahAG
	YgvWbtwCQkFi2BTQ1Urttmvm8/YWhbOmJ0xPKnYMLLqjToGMUuztUfUPSLyPhKe2xcqPsU678lII0
	eTbbjNjBmI9BFsJtxf/elXCXzse3b8pJ7aVSAr9C5T9AKOOI0i+ijzqCIRmoKFbfcvZvdz4IrHw0A
	YkKs3pKy6j4YQ4grmUks2eNzh6y0UedlqtRfR+Pjpb6RX60tjyMZRuMAdEJ//uN8MS5BQ8GVRNM82
	QdXbrbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcisd-00000004eV7-3uMk;
	Tue, 28 Jan 2025 10:31:39 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcirI-00000004eHH-1qDk;
	Tue, 28 Jan 2025 10:30:17 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-46b1d40abbdso50867491cf.2;
        Tue, 28 Jan 2025 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738060215; x=1738665015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2veFNGdTL1atZAhB2vrZxwxXadzUoQya1iQSnNw0RO8=;
        b=nV3xRUnYeVn7ukC/8NTitjcZs65HcK0u38f4QFjQce2+CmNmh2Yp5wL9KfJNhFr3Nu
         he7j9s52btis/yIIZ9rUrsVJSEIgtdZNx1+HTZJm6O2wtNqDIlV0+LcIXh/NAC5YC6tk
         GckG2EdoxykxTDueBNC201blKgle9y+Ug1k2cRUY1PBr7A6MWUE60KKtzA2GOqc2RDnq
         X2F9sa9j4kmPQWnfPij6Yqnkrp59TfSXDlNJT1+UMhZ+RkwPZ+Sa50DNo0g2wDZ1CI2J
         Fa0kv/m/gZ79+kfLomWd14UDCfMQm9y7lFyrmhECnW55gSRTpNB9IRKcAkoqWHkWR840
         j/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060215; x=1738665015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2veFNGdTL1atZAhB2vrZxwxXadzUoQya1iQSnNw0RO8=;
        b=FBfU/ODpO4RoVoh1m4mrY3d2kDC8wcVpBZTfTlRmyYelHZ294yf1Wn9jsgnwsB0c9e
         N/JKqB4KWPjbmfnrAUkNXtZoG89EkfR6xWczTVdP/uyyRnSJhTu7R3PuPixkCYnkqNbt
         07UbnTRpSz54+FOIrvooYZacfqchRHln9ciWvjvHdvrssx+eEyiJWg0NLMBSmdCW9DKR
         tYUzDBv9znG4IU4MdhEFYZ15BWfzmlx23jkaZeLNQnjeYX7GRpVdkFs+ff0nWPb//Gry
         G61o0WnlbXS3b2Uo3OZ2ess+QGvGtLR7aDjsY5/SgulxYoB50PAElXAX6m0Dbhtcd0FP
         kLqw==
X-Forwarded-Encrypted: i=1; AJvYcCULl/ou/C6BAxkDrPhkUEZ9ubHAVwcYkNNr8j9CKl9EZszpMGH9izBfEIi2RDcND5kWF2REei/Reoy/KA9Pe/ht@lists.infradead.org, AJvYcCWO8LrW8Fo2luBG0zVMFD0NAnri4ZhaAjhJG+s6clxjlkz3t9M9FDmFMM/xk460Yt9tvqz9HTvxplBUyClN8og=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEOi7FSI5wCDYv/8LJZh6fWwMYL6MsPSK8LZhrdyK+cxQr5zTC
	Q67b5vv9dmn3lWagL2nWh0wNDoynhrAJtQ/2aaP0ix0pV6y+vHSrjb8zENlB3wP5og9YyUe/fXY
	YKEIIGI9nSxwLvzgT6fcG2tVUp3U=
X-Gm-Gg: ASbGncuL54k//X7nYwlPWBs8T3+v02lbNdjvB7cxxbz5lzAU5oT6Waip2yX1p+BAhYp
	vt2Y+EplH3ceHbQN4GfiOuSzNo8l5P0ADDwgbzVmr+ncIO4wjeyEwrYRJPW3nt8WFcn3ldVe/
X-Google-Smtp-Source: AGHT+IFptAPSbmWwcq0EvSGs9/WQk9gEFjx4eFpUlVUg+jaJrVO+3/mHFzqrzQpEkuhDpBlIt/Oq38oTIAXUASFu73U=
X-Received: by 2002:a05:622a:2d5:b0:467:87df:851a with SMTP id
 d75a77b69052e-46e12a56380mr637928261cf.12.1738060214750; Tue, 28 Jan 2025
 02:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org> <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org> <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
 <CAP1tNvTRER=QzC29Udw4ffOetVECWV+MfZ2o-mbUFvuZ0_i-Kw@mail.gmail.com> <b57d8a834f5c07e37e0e7ee74346c700@manjaro.org>
In-Reply-To: <b57d8a834f5c07e37e0e7ee74346c700@manjaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 28 Jan 2025 14:30:03 +0400
X-Gm-Features: AWEUYZkFoDxmRPVn24plApRoTji5kgp1WG-euAKTrUa39_3kburtp9GexnHZUNs
Message-ID: <CABjd4YwCH93-=Cqck5TiuJoTUkYbRh0495J6w=J8t93oHdt43g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Dragan Simic <dsimic@manjaro.org>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_023016_481410_CF09094B 
X-CRM114-Status: GOOD (  21.74  )
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

On Tue, Jan 28, 2025 at 1:24=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Alexander,
>
> On 2025-01-26 15:25, Alexander Shiyan wrote:
> >> > > I think it's actually better to accept the approach in Alexander's
> >> > > patch, because the whole thing applies to other Rockchip SoCs as w=
ell,
> >> > > not just to the RK3588(S).
> >> >
> >> > Anyway, I've just tried it after including the changes below, and
> >> > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
> >> > pinctrls under tsadc, the driver still doesn't seem to be triggering=
 a
> >> > PMIC reset. Weird. Any thoughts welcome.
> >>
> >> I found the culprit. "otpout" (or "default" if we follow Alexander's
> >> suggested approach) pinctrl state should refer to the &tsadc_shut_org
> >> config instead of &tsadc_shut - then the PMIC reset works.
> >
> > Great, I'll use this in v2.
>
> Please, let's wait with the v2 until I go through the whole thing again

I, for one, would welcome a v2 that could be tested and confirmed
working with and without driver changes. Especially given that:
 - the changes are pretty small
 - hardware docs say nothing about the difference between TSADC_SHUT
vs. TSADC_SHUT_ORG, except that one is config #2 and the other is
config #1
 - none of the source trees I looked at seem to enable PMIC based
resets on any RK3588-based boards, so these pinctrl configs appear to
have never been tested in the wild for RK3588*

So trying and testing seems to be the only way to understand the best
way forward. Unless, of course, someone from Rockchip can comment on
how the hardware works with TSADC_SHUT vs. TSADC_SHUT_ORG.

Best regards,
Alexey

> which I expected to have done already, but had some other "IRL stuff"
> that
> introduced a delay.

