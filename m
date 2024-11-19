Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB0D6C2AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFlvZUhBTVG/QjGIG47CN+zwdKjfaq1hUpC4OSztlJc=; b=NCCh2V+oesjhOdizqf1ADbh/WP
	/5zylSvHkrGQfSQbPXx7s1uSHYOys0f/VDNNtvCX6AQj80d+70ajMzsnfeU0Z5CGzmfKRSF+yRwhT
	oTUuz2qYEQ41Ue/Fy6LZI8m+mvpdVT7oUtlxA1I5xcLijxgiV6H9Bmcqg4Biv0pDhp3SJhvvBsFqK
	b0daZodwJRBOB8IsWLagEEQph4vnSFm3IETSHdXqVzTiwupx42iDCiG3fiylBEkjYG7+OBXGD6zuQ
	UHYZqt5UlKAPs6UU3tg7QCvb8o02gjY+kbR6P0sgcHKzpLdnlUx4uLGEqqEVO3Mezch+HDEcHQKZg
	O16kOCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDX02-0000000DvA7-3txq;
	Tue, 19 Nov 2024 22:47:10 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWz7-0000000Dv55-0JdB;
	Tue, 19 Nov 2024 22:46:14 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-46101120e70so45066601cf.1;
        Tue, 19 Nov 2024 14:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732056371; x=1732661171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFlvZUhBTVG/QjGIG47CN+zwdKjfaq1hUpC4OSztlJc=;
        b=ONcHAhTxOm6ea4tzX9Js7v/85s2/KfWoCG5y89AJu4t9Zf8UQ3pEMMFG0huwYK8IE9
         nvaGZN971OBW52/Fm8oiyLUPTdVDPuROH9vdMdjAo0+Rzaqw814snIo/Dg0fXn4fiW1X
         2GtLByb/l9qh/0PGCF6D0DP6KR/h6rySd1OtEFYpHOfsUMkihVfNamfa8ktpCgnRgduk
         d63AODZsGdWSDn1n5o1YPsLrPeqCNeBzq647QWVje6Tc8tyf07Q/Zh7P6G1dfZfHDIW4
         rSHlx5Ls/m09YqXXVZNYBZzduwWEQCGujxs88d4gumUJDAay/xC8nb9zvXxIxoHvUXHf
         KgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732056371; x=1732661171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFlvZUhBTVG/QjGIG47CN+zwdKjfaq1hUpC4OSztlJc=;
        b=H5sMbp9n3J8xnD4O4zHzuz9eSzcG+N4dhQfI0GVsK8rhzIrfLacQAJit2uVfxyevHZ
         /wN0/raKrxFuyYBWx/gXaE8XnfhzcDSWsr6crSFMkDuYsM0phOfMRUFId8Coddl4UOrn
         IhfKEdoSgZAKz11KnTWxOxA/SR/aIRRMYKIYd63Ym8/0C0tPMXkpZVv7eddXKvrcEmzK
         MY6DPE/pRaa4+BX4tz+82uj1JojsMnI3j55BcyccAbZrQbGDHV1qbQAHSQbOjgxorb7H
         kN5rfgO4g31mSr26quDjNBETv5BkrW39447fGLxJ647MA7/L7xCDKW33C+yDafat20Ha
         YxKg==
X-Forwarded-Encrypted: i=1; AJvYcCUefZg1l+nHGYQq3wdkaqLOHJTZvptn9NghdXlm354YeGibZ0S3JKmuEZcr7Dmg6eS834Mw4F7IfIbyBJ7E6xo4@lists.infradead.org, AJvYcCXLxrWpIZDNFZ70K8AwO3aEaFDpYdqeAembp43hORBN3eicBXwcFiVQf0kuw4n4VWp5sgpmX5fdfMbiHOkWdRo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiZ9xsWwBrNWDcPR4XaV4YasUjnc+6uWyedF0yRsgh4dH8w6MQ
	IgycBN9r6RExqjIANmEbRnXw9qJLax+vHAqSwo9MMsG2gtfH+5/VIPiGJI3RA6FR81cV5xiB+LW
	VEMuWPsoQdpq89RcM7sTvxTdQf/Q=
X-Google-Smtp-Source: AGHT+IFftTaj4R1HHwo/Eur2kE1kx/vORWSc0ROFajcQGqwuxJIqnWmgNQ2EMXfRCVrM+p2dKLWz3cRFX0pW3nWlfJA=
X-Received: by 2002:ac8:5e11:0:b0:461:41cb:823c with SMTP id
 d75a77b69052e-464692a1b68mr5307851cf.0.1732056371312; Tue, 19 Nov 2024
 14:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com> <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
 <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com> <y4xv4lduinhjbhzt64erjw3er5w3s2tcwzjxxdknoudaefupxq@fbqf4esensnk>
In-Reply-To: <y4xv4lduinhjbhzt64erjw3er5w3s2tcwzjxxdknoudaefupxq@fbqf4esensnk>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 19 Nov 2024 17:46:00 -0500
Message-ID: <CANeGvZXnu93tXowfOn=+3H0-=dEYuwBOkjytcuMH1m6yxGg9pw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_144613_112170_36DB26BE 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Nov 19, 2024 at 5:03=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Jiasheng,
>
> > > >  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> > > > @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_de=
vice *pdev)
> > > >       }
> > > >
> > > >       clk_rate =3D clk_get_rate(i2c->clk);
> > > > -     rk3x_i2c_adapt_div(i2c, clk_rate);
> > > > +     ret =3D rk3x_i2c_adapt_div(i2c, clk_rate);
> > > >       clk_disable(i2c->clk);
> > >
> > > you can't disable a clock that has failed to enable, right?
> > >
> > > BTW, although I like this patch (or at least I don't dislike), I
> > > still want to check whether it's wanted or not.
> > >
> > > Andi
> > >
> >
> > Thank you for your advice. I have carefully reviewed the patch.
> > There are two clocks: "i2c->clk" and "i2c->pclk".
> > The "i2c->clk" is enabled and disabled in rk3x_i2c_probe(),
> > while the "i2c->pclk" is managed within rk3x_i2c_adapt_div().
> > Thus, the "i2c->clk" has already been enabled at this point.
>
> yes, that's correct, that's a fast review and anyway your patch
> doesn't have anything to do with this.
>
> BTW, did you have real failure experience here or is it just
> speculation?

Currently, I have no idea how to trigger this failure.
In fact, I only identified it through static analysis.
However, I believe adding a check here will enhance the
robustness of the code.

-Jiasheng

