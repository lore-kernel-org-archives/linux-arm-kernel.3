Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A2D31768
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDbwmIuBhshERCXYSkPhenLd2Mhjkk5MhETyYNbkb/Q=; b=WVzhXILCSfFu3ayElTUr5B9Amz
	iE8hgBuXKCJUDZoLgf/oyHJEu1d8j/sv08/v2i/hzvywa5pkRAEmaUXo1QML01MACwsggYUqWGR87
	62VfG4uxKcWisO1uiiTVU83XkIVwgA9B2u16OCR6E81i6AdBHQQcLH0kS7DrTLktsnDujoq+KY6fV
	avVT4TOk/bQkROqfzvTRkX2nNai6omfFd2SFkWfUDb2CzxmsySj53dI1cvouqz+dlBiKcfBoxYmyW
	iaCk8Lvab4NGP+jOfidWsvIZgwmewDXGOVS/jcDJVGiVXFQy0kgeVIfbqMfshlOiP9nJXCNwU9g8X
	RIsxGvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MzV-000000009NJ-3QDL;
	Tue, 05 Nov 2024 17:05:17 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MON-000000002cQ-1MBA;
	Tue, 05 Nov 2024 16:26:56 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-460d1145cd8so38462061cf.3;
        Tue, 05 Nov 2024 08:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730824013; x=1731428813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDbwmIuBhshERCXYSkPhenLd2Mhjkk5MhETyYNbkb/Q=;
        b=BGv49iUK3V+nOXJZwjyYXA2O9P2Jt7wH0kKEu0n0XZq0lzq8NTfrEIoD63J32s4kYT
         lkTeEMptsfNLV7mixixbRvW1Px36vQnBx81PnlG+cv0ptrXq7f5sNo9bPI70iaoV7JKd
         wU2NLDfg0CgQTFYFQ7Z2hupSFixDTi40uzQ+gJoWzRxYZYcZrReIgSrQ8j7F/GoPc+7x
         atrYvrlBVB9Cs2c/5Es9qcMJ/IT5ROPmpWU4xgQqmRlVYrkKgjZZRZ0FAazR+Zb3UtyF
         rxm0meB3QD3GRTjlaPN+/91RT76LjxwzhGQmWN5si4KMikI4gl6erkedVOyGBnaEJ41W
         ImTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730824013; x=1731428813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDbwmIuBhshERCXYSkPhenLd2Mhjkk5MhETyYNbkb/Q=;
        b=qgvETtUsMCiYX8aoFOOBoF86mTr2SK/fPUp8qR4vwVvSdwgwPExAlwn07z79RFJoN+
         VjgGSCz2FRVvZhgsExEAF6CohbLatEV+dHG5MtdpHRzrBs+Me98w2NOemgH5M3p15vPB
         KRZEaZU21HV0IM8H7jK/rl8EEaLyKuAk6GB1QqIwypzPvpHb8Za7P2mWiXm/t9bj26JC
         LzvYOsaJt2IPID1GaIbMI4tQf4QgP8qypJOH1ctQYd2wO33IV2WgDpVh2ShZ+4ELKzQY
         rSPeHuQEZ0bCW0XlKAweRfXpdAl59ljsUCFxPxbHNlrH/NBlQZeyMw0twT8/j468AHVJ
         SJyg==
X-Forwarded-Encrypted: i=1; AJvYcCWIRAeBMybg05DljihmyK1hQflc/Twt7rvZGrSYtm2subV46IYiL7r1ZYhq4dVvVvaFA6wJFXIYfKU5bQ8fH9NQ@lists.infradead.org, AJvYcCXIw/NuG0oiYM9hf7vVUrtUxjvyU34tXgpC1cMySf7qwcRKAGE6GIw5upbEsDjQJ37FF1iy6yC+9KTtGWm64tY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxPHkHZjfVlC+daAtOkMQS0bMxESLJinUgfh7Hcxu79iXJqk0c
	2mpTexi/OxmZAwPW9DaCvD8eKLjFfG1YNDPwoufUGNNlkJgPwkpdmL6YARLPfrzCY4wJ6pgVnaW
	yOxF4bjcSTErYT5deh/iVfHen0UNqXA==
X-Google-Smtp-Source: AGHT+IGJ7XLtWYJje82bhRsHQKoOCawC7fDCWpQbhUa9IlTL2mavUPQDVtWKBU6r3gqBrgHI32tivQiaz5RCybz5S4k=
X-Received: by 2002:a05:622a:1446:b0:460:9b2b:e8b5 with SMTP id
 d75a77b69052e-462b86536b2mr197191941cf.4.1730824013485; Tue, 05 Nov 2024
 08:26:53 -0800 (PST)
MIME-Version: 1.0
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
 <20241104214310.6048-2-jiashengjiangcool@gmail.com> <pyutqiut5yascxkwrv5ozrwdbmb4k4n2vu5jiia3fpgkra4up2@u7nvqpdscb4n>
In-Reply-To: <pyutqiut5yascxkwrv5ozrwdbmb4k4n2vu5jiia3fpgkra4up2@u7nvqpdscb4n>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 5 Nov 2024 11:26:42 -0500
Message-ID: <CANeGvZXsw-93j7YrHd=aa4bWCLioE-LbT5kakc9gjeHCK6O+qQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, dianders@chromium.org, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_082655_390191_FBC3D971 
X-CRM114-Status: GOOD (  17.99  )
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

Hi Andi,

On Tue, Nov 5, 2024 at 9:13=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:

> > Add check for the return values of clk_enable() and clk_prepare_enable(=
)
> > in order to catch the potential exceptions.
> >
> > Fixes: e7d48fa2b5fb ("[I2C] pxa: provide late suspend and early resume =
hooks")
> > Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk suppo=
rt")
>
> I don't think we need the fixes tag here and nowhere else in this
> series.
>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-pxa.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.=
c
> > index 4d76e71cdd4b..1118a7f5c6bf 100644
> > --- a/drivers/i2c/busses/i2c-pxa.c
> > +++ b/drivers/i2c/busses/i2c-pxa.c
> > @@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device =
*dev)
> >                               i2c->adap.name);
> >       }
> >
> > -     clk_prepare_enable(i2c->clk);
> > +     ret =3D clk_prepare_enable(i2c->clk);
> > +     if (ret) {
> > +             dev_err(&dev->dev, "failed to enable clock: %d\n", ret);
>
> please use dev_err_probe here.

Thanks, I have submitted a v2 series without the above problems.

-Jiasheng

