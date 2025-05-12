Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED286C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSoxyHvUrLiSc3/psAWBZmLYF3TjkhwktVK+c+jvBxs=; b=t64Z3qFzLSmYkEPY/xm4lu1QZo
	B6PC4/5zsg9oOOWKqqhJDltalHiDl46gOdnpJMWv10blnLZxWmn72yLU68aKsuLBpUQu6KsWtNc76
	pKXZti5JAxAyF29QsrP4Fv7ONGQZLCxkOLI8gwJsaXFSQ9pyRp9eOpBawPV/jnQDP33feJBqSk65c
	Z3tW9WADAfA75FMu9KLPcYHZASwNgrd7bZnFR/8vCN3cwrDYP1bZr7ySsPt7+TccMLQ8tdCWEt0x4
	KMTqDZfH/XYKOHOeUjArXwkhO7LAPZDAjGwPoyV+SL0w4+Z9GdK2l6uiQ5uBt0bEydqU//IEvXkME
	lGtQkfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXdv-0000000AJgl-3pJq;
	Mon, 12 May 2025 18:12:47 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXIV-0000000AGA3-3Cvj;
	Mon, 12 May 2025 17:50:40 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-476af5479feso56262411cf.2;
        Mon, 12 May 2025 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747072238; x=1747677038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSoxyHvUrLiSc3/psAWBZmLYF3TjkhwktVK+c+jvBxs=;
        b=F6AQlC03YZ3SztuEvCGaHDD61ZItXOyBBocv4fsLh1DZCPwZQBYJ4g1R6k0g/eBabn
         KeRAwsUHNrcxgIJyxn02cG7293l095JQHbk3UekrKUfLZhoHepyclxj1sxxTSA2pm1QY
         NPKcATfoQTlOqkGayf4iofJ8YvUZ7/wO+89MU4wplaVH2vzOplFCfWCUXpkDuzBoBsxe
         uoXBpSmuAl3/8dYXdULwZWR58w6fYkfJRdm4mOBwxSMsaNChOs0ax6N6VM1meu0TC4f/
         vovpvwSPFjQG9zCjP9/sPDf87KnW7Tg9kNlFfOOstYDR0KOMN3skoY85ZxUnl1b4FMoD
         A4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747072238; x=1747677038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSoxyHvUrLiSc3/psAWBZmLYF3TjkhwktVK+c+jvBxs=;
        b=ohA0FLDHT+u05AkGmmQj6ADEF1ZA5eDRa1qDpRxa0AGLtFVhvpm2e6NE5q8KyNJ67W
         XpljoGgYGescPP2/bKNHmu+n8kbbIQ8Ps6uwYQf4GBiK9HdTcRB6L9Cz0Ji/4lBS8gpF
         G01xVPiWmHA9F//i23elesr8uu3Shr1kE4jXk4uCCDix5MgWzrJEs5BY1AWG1VaPjf/2
         fAlMUJBuy08YF27r9eSchqpesJe6/3TgwFYe2gDA9uPHIMoVAruoBM/fewQOg7UzZ+mq
         0hu79qMtidosJndXeoIs+8TdPFFWvgQnId+sRwW8l4einN2EnYSGjONhuAVZAqrN9mXW
         VyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+zgnANBE4wnmDpReyJZeoHvSC3dFcKEUJB7GJqkaG4DX5TWZ10ar/0Qm6CthDfD8Jj5vdNiVU3gDp7dHlkvXO@lists.infradead.org, AJvYcCXg+E9jKVuuOeRIyg93epeWa+0jXy4guCGKax0gnhCrDMXZghl2R9nYnxSPZE7tMrulQPbwpz9Zbc5D@lists.infradead.org
X-Gm-Message-State: AOJu0YxN+5/BhRpzFiZ7AnTnNjfQpdwNbvT8feyL9Ky6jpp94k8JqLd1
	asqdhzFj7Y4g4bTuX959V2efEWPKksYRu2nunwfZKXe4vnNZcmSFuRP/6ab7sEQ8licL43hjurS
	I9w98f0RBsUl3JrEsKnc/3HNhCHU=
X-Gm-Gg: ASbGncsHOyIeBRLFPlfCTm44QxpxcNkxmyZdWJ99DCMOhb98ZH6fmiCpvajxz59iF1U
	d95EEnfOmp8hRlHu6OLufcqr88FyWhi3ZNJrp/Ik8ZJanY2UGfRzv/C+a3iH/wW74dOl1cdtt8A
	jn7vuMC7ZAPMkrb+DQKc4tkEBA3n9WKKI=
X-Google-Smtp-Source: AGHT+IGkeH40cXRztWXpSrCJ5q6XKPbNvx7k9EkmvL+Je1u1a0S2VQUWKi48NLpznn1NHqP6LSPKlLPZSwHilThRqUc=
X-Received: by 2002:ac8:5f91:0:b0:476:a895:7e87 with SMTP id
 d75a77b69052e-494527f40e7mr184965391cf.48.1747072237855; Mon, 12 May 2025
 10:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com> <mafs01psu89sx.fsf@kernel.org>
In-Reply-To: <mafs01psu89sx.fsf@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 12 May 2025 21:50:26 +0400
X-Gm-Features: AX0GCFuTn2-A7ifRuVywFd5v331R4uCu7HoPZVJQ7gQFF2XE3zSvat71MlVoTDs
Message-ID: <CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_105039_806312_FC58197B 
X-CRM114-Status: GOOD (  26.44  )
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

Hi Pratyush,

On Mon, May 12, 2025 at 1:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> Hi Alexey,
>
> On Sat, May 10 2025, Alexey Charkov wrote:
>
> > The controller is tailored to SPI NOR flash memory and abstracts away a=
ll
> > SPI communications behind a small set of MMIO registers and a physical
> > memory mapping of the actual chip contents.
> >
> > It doesn't expose chip probing functions beyond reading the ID though, =
so
> > use lower level chip opcodes via the "programmable command mode" of the
> > controller and the kernel's SPI NOR framework to avoid hard-coding chip
> > parameters for each ID the way the vendor kernel does it.
> >
> > Currently tested on a WonderMedia WM8950 SoC with a Macronix MX25L4005A
> > flash chip (APC Rock board), but should work on all VIA/WonderMedia SoC=
s
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  MAINTAINERS                                  |   1 +
> >  drivers/mtd/spi-nor/controllers/Kconfig      |  14 +
> >  drivers/mtd/spi-nor/controllers/Makefile     |   1 +
> >  drivers/mtd/spi-nor/controllers/wmt-sflash.c | 525 +++++++++++++++++++=
++++++++
>
> Drivers in drivers/mtd/spi-nor/controllers/ are deprecated, and we want
> to eventually get rid of the API. The expected way is for drivers to use
> SPI MEM (drivers/spi/spi-mem.c). SPI MEM drivers are usually more
> general and not tailored specifically to SPI NOR flashes, so it might be
> a bit tricky to write drivers for specialized hardware with it. But I
> think the drivers/spi/spi-intel.c driver is written for similar kind of
> hardware so it should be possible.

Oops. I've had a look at spi-mem, and it seems like it's not a
particularly fitting abstraction for this controller.

From what I understood, spi-mem primarily expects to be talking SPI
opcodes to the controller, and for the controller/driver to bring
their own chip probing routines. This controller on the other hand
abstracts the opcodes away, and wants someone to tell it what its
flash chip can do (the controller itself can only get a chip ID in
"normal" mode, and it needs to somehow know the chip size and
standard/fast read capability of the chip). So pretty much the
opposite, huh.

In the end, I only need something like spi_nor_detect() and can do the
rest directly on top of the MTD framework without touching any SPI
opcodes after the detection is done. Is there any other non-deprecated
framework that can provide something like this? Maybe physmap? It
looks even older than SPI NOR though :)

Best regards,
Alexey

