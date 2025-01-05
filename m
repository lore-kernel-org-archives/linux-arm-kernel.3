Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D52E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YywA5lTEdJWoFMmlp4DfxD/jE6edYt47y3+JzLz1vMk=; b=Og3RZxAceQPlNGmepT0KI5CnDD
	osjZVUYcHlGA+TsakWIREyw1RfVdQ8J9gAm+iGVVd+psVmQRMfu9vbjmK9mpJQA35Bw52D55Scc+u
	ZzpGLvSkpgzyWU9uKBoRi5OYhiZXWuxaQ1OaQEE1mccaCg2uPzmU86x62DvjDXIivxBQuIcjZ4sd9
	BX3m5fqjVBKYI3haO0dCYvPbkOoQSjUxixbuVuHWVFYgUv4fXnob3IdJItHyiKJ+EUfoQQhYmRl4X
	dbE24oUfJzG3ikNteWD/1iDPyZcL1E/aeGJfRjBt7oxAyUp5AZ6Fvk+o27wcFfr6BsGc6L8uwot2k
	8jobb+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSuJ-0000000H19r-2jB3;
	Sun, 05 Jan 2025 15:51:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUSt7-0000000H11o-25yE;
	Sun, 05 Jan 2025 15:50:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216401de828so180596075ad.3;
        Sun, 05 Jan 2025 07:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736092200; x=1736697000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YywA5lTEdJWoFMmlp4DfxD/jE6edYt47y3+JzLz1vMk=;
        b=Ab/rLD7lrEowNJEt/xSwSR3wZZRKNxUXbDI1YWIP6gHhjzFP9Yj9FnSZg387U5HgqM
         JYyts/ehe8CVCfPhftxn88+mNIQbpQrWSAZi6fNn/S9VBfEz6cuZk1usGJR0AvMryrGu
         YmqGcMTMS1RQG1fc0dvbGyphvVkLsQTUnkGYRcqHR8fJf4hUPF2Pvr3FJqZCJgoPg3cq
         tY8MSBaeNvcT0UlojAFRkWBBsbu0rRaCe+uZWbrlANL9qV2kBpnlUepl7ZsbmaS2MRWd
         pGM68Hh70S/H71EYeSHA8ZkJXIavNE5VHbKhVNIqMXcDym2dmIysk24gPBR6+HDYky4R
         +Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736092200; x=1736697000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YywA5lTEdJWoFMmlp4DfxD/jE6edYt47y3+JzLz1vMk=;
        b=tCWNsMdzY50hLESGnltSiIUjHYMx0fnWgzO1Q8mSOM9dZmveA2HCyqwULduEMdw6lr
         4aZhAWdLbcniO6Eh+JsbR2WaBChIKrEmDQVyhE8gMIUH66YYoWrYkJHmRT4j8cwFynGG
         rYJZf8DLLZf5S8xR+qz+CzCAXTfslLCxk5Rt1zUtjmVV+YIBguEoBvBiDNCxWZfbaD2U
         4axkx6Zn6xtKAR6R4MRwdWZYb7QOqppMN8dTT61ym3z2JF+Xo8f/klj2InaJ2W9I2Zn9
         b1ApNdMTa8Bqrk6v1qptPxPZzR2uISPp3UD/S4lv4h8LhqxqifNXrhI2QzUNLtyyg8/r
         BuuA==
X-Forwarded-Encrypted: i=1; AJvYcCV8sgeMStY5SQdJr+EXKdIY4fTswevwAspE/2HywddGnkn4QYZrMNyx12KLkTjFzgQJzPv23xnLJLvhp67tt35s@lists.infradead.org
X-Gm-Message-State: AOJu0Yz26RwA9jEf7OxpFXiH7K7S4I6KtFkq4+Va4ANmrZ+OmHo2q6HG
	lKXA6i8GB2FFtYBUONWO4uAmZUei01MT9dnkVetpNfN93HmlzL6B3HzL/2F99IUVWdfMSurEe+w
	gBBR/RN9lNty7xb1TRpuPrczLQt0UBw==
X-Gm-Gg: ASbGncsg+MobNWgAN1uzmJphlnhcTuB2ovTlJf12QNkOY0IoTGDbnbkzyB6iWLaU5ST
	597hDJ6jte5N2713XpbbUg+2rYCYX7V2nAzbcpiuLUBTHhcOeDLRs
X-Google-Smtp-Source: AGHT+IHBq4Bpn7IMCuiOvWpCDfq6WSEWbk+kF8P/My012EE2LHfMCwEfjsvbXgI3Q5S8UqpawhTxxnoNTWpu5as8yyE=
X-Received: by 2002:a17:902:d4c4:b0:216:7cbf:951f with SMTP id
 d9443c01a7336-219e6ea195cmr764170955ad.21.1736092200275; Sun, 05 Jan 2025
 07:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
 <20241231194207.2772750-3-martin.blumenstingl@googlemail.com> <20250104135912.390ec87c@jic23-huawei>
In-Reply-To: <20250104135912.390ec87c@jic23-huawei>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jan 2025 16:49:49 +0100
Message-ID: <CAFBinCBxaVet9HxW98uCSDnv1XVXV6r4V9Z3BRmZJypTcxDZ0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX SoC
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, gnstark@salutedevices.com, lars@metafoo.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christianshewitt@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_075001_576237_90143877 
X-CRM114-Status: GOOD (  22.94  )
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

Hi Jonathan,

On Sat, Jan 4, 2025 at 2:59=E2=80=AFPM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Tue, 31 Dec 2024 20:42:07 +0100
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > The SARADC IP on the GXLX SoC itself is identical to the one found on
> > GXL SoCs. However, GXLX SoCs require poking the first three bits in the
> > MESON_SAR_ADC_REG12 register to get the three MPLL clocks (used as cloc=
k
> > generators for the audio frequencies) to work.
> >
> > The reason why there are MPLL clock bits in the ADC register space is
> > entirely unknown and it seems that nobody is able to comment on this.
> > So clearly mark this as a workaround and add a warning so users are
> > notified that this workaround can change (once we know what these bits
> > actually do).
>
> So IIUC this is to make some non ADC component work.
That's correct

> How are you handling dependencies?  The ADC driver might not be loaded or
> is there some reason it definitely is at the point where the audio driver
> loads?
Unfortunately there are no dependencies at the moment.
To me it's not even 100% clear if those bits are a dependency for the
audio IP or if they are instead linked with the clock controller (more
background info: some of the MPLL clocks are - at least in theory, in
practice we don't use that - are also used as input for the Mali GPU
and video subsystem. The only practical usage that I'm aware of is the
audio controller).

Christian and I have both tried with all of our contacts at Amlogic
but did not get any answers.
If I knew the purpose of these bits I'd model them as whatever they
are (resets, clock gates, ...) and provide proper dt-bindings.


Best regards,
Martin

