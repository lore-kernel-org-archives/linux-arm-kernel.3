Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E640C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr4iHssyb6BG/1AKbGKXTkraXilD33gxEVEHI0uTy7c=; b=hWY/jjQyzwQ+uysW0jJMo3Ya1B
	kFHJqL33s630ozCl+357qxdpnO5LluJ3uRpDkIhS3Fid7Se9FgkTaO1u1QykmgpzyIJnOd/Phoc4L
	eY2ThyoOgAo9ot1jwPJq2bwdpoyWvCtO/sFhVfRVgfChDya+Bh/GiGqTRuAZ0dMhqLNOpIj/CdcU8
	DIPJEu4cPys1spMMtuF8BP1cKq50K427p7XD4izg61iwQivetzxCA7919owlmKNgwdmvG+qckJAKV
	eIoCdEjB0QMRuybnDnZQ5t/5oDSn61B9W9eQMWnzMqGfhve+sVti77+JjbLdjymrA6iVEbQOG6gjG
	8DhwRYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mnn-0000000Cgbr-0wwo;
	Thu, 17 Apr 2025 10:49:03 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MJH-0000000CbcU-0Cn3;
	Thu, 17 Apr 2025 10:17:32 +0000
Received: by mail-lf1-x141.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso817717e87.3;
        Thu, 17 Apr 2025 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744885049; x=1745489849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr4iHssyb6BG/1AKbGKXTkraXilD33gxEVEHI0uTy7c=;
        b=joYcr4jXbDZWb7QnrJmf0OWIwl6ggc2xL+ImH3irlhshumpCDJgH2n/cA5aNNKPrBA
         Se25a3in8Pi61olfGQjLI7iB+rJROIGor9rvXZGzT8FFNDKBuqSIvDurAQrOIusOcde0
         R8sgb1XYnKoq8FSJ4D+YlVE+s8pqQ+lIz4Un2kQuBWPMsQa8qYhO922DtPCzGsrSw76I
         NnjTzEUbiXXq2ebGQ7aMKDCzVck+a8+uLwVM/C+FMB7k5zC6/Gr86HWLfJXnln7Tjc+8
         tXpvDDAgi/S1ALvJnhVCydjnOHWr/dJELUczk70Wcbkwq6wW7RH3abcotoDKF7oaXfS2
         vNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885049; x=1745489849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr4iHssyb6BG/1AKbGKXTkraXilD33gxEVEHI0uTy7c=;
        b=igXdkVsUMlpHtcy8oLzCadMlGKfEs6ZBddUDto82vaKzbzgv6QXQI4HS6nCUnHHd3F
         0UdP9rIprEhYGDRZjbCLfKxmUrX8v9ZJ9pvdbe5wp9TBncWzn3utRRLVxig+6Buq6UK+
         zM1L3Lx3o3y8nVO35rgMmWIG+Q8Tv6MxWpb68wIQ7bjhHF1qBHIatvniftdgDe7RwUiI
         NomisJ1FRZLEHORK599lgAxyXzXfETeyXO2+H3Iqh7QyNmc0TUhV/E1MC2Q/QixsOKXe
         EpGn8IrmZz96tiD6f+Y2jmT6Sv+dVtCgxKjReMl2wXqAL6UxaZa5hyUF1RgkgaDy+aBF
         c8/g==
X-Forwarded-Encrypted: i=1; AJvYcCVnnN3eC8+tIqyBLgbqFF6+2W5L2UPz2kaQTdJqM801ZkAjgZrcL4pLX/Yu0G0HANdhy6aQ+kDZBiVCar254md3Ug==@lists.infradead.org, AJvYcCXQTPo65rtaspfH0u+kq+kuf0W6yky4XY1AUXRqKZd437IVj5pVKki1R7AXjAvG6NhpLFNInmIFBBhrlK0A4N6t@lists.infradead.org
X-Gm-Message-State: AOJu0YxpgRCy1oaiyoKXxOodYt/Y32WadU5hRDHgNbTaiXsv1euSbyWn
	fZgWdDLSbug5OjC1GMR6vbMYY+Ann6ehAnQLNIPBUIaJMwUCRuXJPTaVnb3WV3Rw1dvrIJByGz+
	r5XGZCNzmpuoAF5XZClUUvXBG6tM=
X-Gm-Gg: ASbGnct8gGbqrKCFl4dydmixI+iocYY9mX2PjpG3RvzebQ5TXb+5m8auSJs0BFn10jM
	MeI4hYya+X/A6YbNLzO1WL/xFymj2h40vFUrHpJMffi46qQVruQO9asigYWG2/WmurLuo5Dgmoo
	Cnkzdj6UCtgZ2Ajpdp89MWtw==
X-Google-Smtp-Source: AGHT+IEvRSTyP0SY5ojVdpl7yM7WjI0aehemNKpV20d6KfCvjuDMKOIi2DQC57sqiNxjCYpB1GvaF2rMc9iGaUjrjwM=
X-Received: by 2002:a05:6512:3b8f:b0:545:fc8:e155 with SMTP id
 2adb3069b0e04-54d64a9c105mr1945636e87.20.1744885048467; Thu, 17 Apr 2025
 03:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
 <20250402020513.42628-1-bsdhenrymartin@gmail.com> <14654c19-fa26-4d37-8f0f-9cf092982b67@gmx.net>
In-Reply-To: <14654c19-fa26-4d37-8f0f-9cf092982b67@gmx.net>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Thu, 17 Apr 2025 18:17:20 +0800
X-Gm-Features: ATxdqUHZfP5CWnv2EfUodjm25gfdmY6UfSse5sOTHfNb3TCeaJauUAPMA3I37KI
Message-ID: <CAEnQdOqoCuiN67oWisJs7RYandhHxcvbPXXxHKmPaoS5=puPyw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
To: Stefan Wahren <wahrenst@gmx.net>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, 
	mripard@kernel.org, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, 
	dave.stevenson@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_031731_085408_8FF8D125 
X-CRM114-Status: GOOD (  15.85  )
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

> Just a note, please don't send new patch versions as a reply to older
> ones. This makes them harder to find.

Noted, thanks for the review! I'll make sure to send new patch versions as
separate emails in the future.

Regards,
Henry

Stefan Wahren <wahrenst@gmx.net> =E4=BA=8E2025=E5=B9=B44=E6=9C=8817=E6=97=
=A5=E5=91=A8=E5=9B=9B 18:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 02.04.25 um 04:05 schrieb Henry Martin:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> > raspberrypi_clk_register() does not check for this case, which results
> > in a NULL pointer dereference.
> >
> > Add NULL check after devm_kasprintf() to prevent this issue.
> >
> > Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
>
> Just a note, please don't send new patch versions as a reply to older
> ones. This makes them harder to find.
>
> Thanks
> > ---
> > V1 -> V2: Correct the commit hash in the Fixes: tag.
> >
> >   drivers/clk/bcm/clk-raspberrypi.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ra=
spberrypi.c
> > index 0e1fe3759530..720acc10f8aa 100644
> > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(stru=
ct raspberrypi_clk *rpi,
> >       init.name =3D devm_kasprintf(rpi->dev, GFP_KERNEL,
> >                                  "fw-clk-%s",
> >                                  rpi_firmware_clk_names[id]);
> > +     if (!init.name)
> > +             return ERR_PTR(-ENOMEM);
> >       init.ops =3D &raspberrypi_firmware_clk_ops;
> >       init.flags =3D CLK_GET_RATE_NOCACHE;
> >
>

