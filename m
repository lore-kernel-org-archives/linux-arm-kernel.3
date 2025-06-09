Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FDFC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpmkGucy2RS3jBDTNw16VboUFxkjN0cf7us7G6qbOho=; b=L9XMoZIqVeE5QhtmkJWRoEkvfJ
	uPd8RJ066H1QQ35xTrhbdHSMte9jsRSe4PlpNeHTug8XTVc7kji+ldE6dTIwg9msUWOu7IMScS8WU
	Nb13zsjiBrCwus5/C8vEIMCPRz9XtKroFS20vZwGRNFEXviB0ByjM5c66PhD8WT5TPZFYGtvl1FY6
	yDytW/4tK83tDqQVo0wOj0LPVk/mDwydE24bOxYWdXuMvKGnlLMffSEEk/gljPcuKK08VIcBNr19Y
	PCpl5/TbecOQuBnfX/2Q7H82gvoDul1jHw8DajfKYBrcZH0HMbbZGavD7uPhAvsdjUZ8LPyzV/ede
	39axY5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYms-00000003m2n-1M8Q;
	Mon, 09 Jun 2025 09:27:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYbW-00000003kG4-2sbS;
	Mon, 09 Jun 2025 09:15:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235d6de331fso47970465ad.3;
        Mon, 09 Jun 2025 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749460541; x=1750065341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpmkGucy2RS3jBDTNw16VboUFxkjN0cf7us7G6qbOho=;
        b=aqPLqFvmsqaGGIV98IqRCr4lYj/8mE5dVbDwheSRtRxhFK6RFBaEjqT6vdGqTOke2I
         hhsmL7QMr5rNbWe717fEcPC1vlp44VS/YWW5kf3r0DvDzx8gtZMGeb4ktTB7dLCMDXrZ
         HxeODsTqqpgkTuZx2RD5RWc1wSlCoAqT92Rai4bYObXsPRUz8+rLypojh1UF0aggDdbC
         734csqKfH8StDhaxV/WdrGY6pTW9Mp+ull+nWmlJVtf39le8usjMylr+GJ+5S2cCM/x5
         WGZarAYCFEzKsQdp+h6Xw5P38SrH0HYBCgN2b3o9jBPMVkbPddBhtX9GuSveZXRzVzYP
         kbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749460541; x=1750065341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpmkGucy2RS3jBDTNw16VboUFxkjN0cf7us7G6qbOho=;
        b=CXCqudHR3UXQIY2vU2o01vM+MH54/YwPeNCjHSz6Was70HDmTwtgSlDLPzVWI23TMc
         II0jBW50BGxxDjyOk/Er3L9WrO1QjJNFKvGynTqPXJMtQefuFBNhu9pWZEyGGo6Qy2Zi
         xSkTwaA15Va4EG+85uw5t5TMigHZF4a/pOVKJRGqPW824k/1OIYRGy9ZoA6aLMth+Xb6
         Kw5rA+l/iMDGf6ThaeQRbc+t93oGj7Q0JGkLH3CPUhO5XwDsGi8zbmSHnyDGJ8onuC0V
         gITnrmFOxoV9QYjiTmsDqDssLx2AE2AVQnYkaPpF9G2Oj4BXXO3WCUxArrcFVCwP6orJ
         YXIw==
X-Forwarded-Encrypted: i=1; AJvYcCXa2SmfuAeDwY7GS4fquNSt9H2nglWJb0la8odwBHPBLTWf3qr9p8mD036TxBrk8skqZ+EaHDdWx7v8TV9hYkkI@lists.infradead.org, AJvYcCXkwdHjr0Gfq7c5Gpm0kuuLWFJ4hgi6cFCiUPb4pwukwCw+YUls4BVocg33B1zMnizDpR9QV3oxcSDe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4mMIts9a8PqJW2sYLjSyAQRUeWc0Vdc79HgOG9bV3mAOsH5mN
	Wxuj4lCzsaXx2trA5aDU6ZySVcuoe0nXgs2THUaq9JDZOYkkAlI15AJwDn/r/4M5UKrLzNhAXi+
	ndiS/sRqVsmbxnXh66TwG3Jfb8+dQzLwH5G7dH4+H3dRb
X-Gm-Gg: ASbGnctSlAr0YHb0AMIHFOjBLz+/7XP+18xdDwUGVoKrKK8AKKPmNN0StjzHcGcIyfF
	1JzaKwtboT3B7VZos0uNQHr0TBP4QZ8OQq/IwX2mSk/r+cMkiCvoImwjin7QNFEjeFHDz1SZR1E
	helrALuCzGKAoiFI0vaxBOq4j8KBKmgX5Ffy2LUQrCGQ==
X-Google-Smtp-Source: AGHT+IFEiclBaTJZlih4iswbFa1U+LhgFwjDy1Wcd+BvQJmUmpObry6wPhiUxn5NKpdaFyOWKSitROu6/8JAQhawYRU=
X-Received: by 2002:a05:620a:460c:b0:7ce:bd8b:2d08 with SMTP id
 af79cd13be357-7d229862b2cmr1761187785a.10.1749460530096; Mon, 09 Jun 2025
 02:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com> <20250514204159.GA2988411-robh@kernel.org>
 <CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com>
 <2b520ae5-eb0d-40eb-ba73-cc18759f33b9@kernel.org> <CABjd4YxRMfi3ZFQxhB__6U4Rm3KQ7bm6J=wQLWAkpb++61ddEg@mail.gmail.com>
 <87y0u1z3jk.fsf@bootlin.com>
In-Reply-To: <87y0u1z3jk.fsf@bootlin.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 9 Jun 2025 13:15:22 +0400
X-Gm-Features: AX0GCFvOvTOTy7296A8LugdUtVGVag1zgpyjF2HNfUyXz1MiexIEF2mhKUtpCQk
Message-ID: <CABjd4YyMavJ414JY4bfouTDy41wB=aajJvJ6vCM55mdEiTFPDw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_021542_721984_E42EF84B 
X-CRM114-Status: GOOD (  24.14  )
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

On Mon, Jun 9, 2025 at 1:07=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi Alexey,
>
> >> > Happy to reference the spi-controller.yaml binding if so.
> >>
> >> SPI NOR flashes are still child devices of an SPI controller. You can
> >> look at other examples - aren't they all using spi-controller? Why thi=
s
> >> would be different? Unless you found some cases that are different, bu=
t
> >> then which ones?
> >
> > No strong opinions here, and no expectation of any special treatment
> > :) Just wanted to consult on what's most appropriate.
> >
> > My (subjective and perhaps unfounded) expectation when seeing
> > something advertise itself as an SPI controller was that it would be a
> > general purpose SPI master, to which one can e.g. connect an SPI
> > driven LCD screen and get it to work with generic Linux SPI
> > infrastructure - which would not be possible with this single-purpose
> > NOR-only flash controller. Given that I don't know how flexible or
> > restrictive other examples are in terms of driving arbitrary SPI
> > devices, I thought it's better to just ask.
> >
> > What I'm getting from this exchange here is that I'd better use the
> > spi-controller binding and respective node names regardless of the
> > fact that this controller cannot drive arbitrary SPI devices beyond
> > NOR flash (which, as I'm getting, is irrelevant after all).
>
> Just for information, there are several SPI controllers which are
> optimized for flash handling (not only NOR, though) and for that we have
> a spi-mem layer which allows to reference a set of SPI memory "only"
> callbacks. On the description side though, these controllers are like
> all other SPI controllers, so the same controller bindings may apply.

Noted, thank you Miqu=C3=A8l!

Best regards,
Alexey

