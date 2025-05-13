Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78782C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=; b=mYj+j3jFOyfNd02mwBG62pvsM/
	HEFAZuEyVkqlNCEoQ3OVl7I4TiGIcXYI4Gmm5fX1OW4aOuD5rSF6SrcrdLJc1rV4JpZXoIO7ChPRD
	cGjj3SR46oqYt2kZZlZaMOmjSXVFB1mgJi+Bm0m3WpjFDgGtgLpP4YnxLfYsw1LKqGI+3e4e5tLSq
	bnBNHW2OlbP8IBjPMk5iOocnXN3l6zjFHAVZMrlxCghwymypm81nMiHm/3v9+wPFQfcj/QQJF5783
	Ca0qBXOChKaUd9xOhy4jku8hik0r+3Z1SCwRtwxbMJgAULOxM3QgFjiZxq93msgecURZxFobzE2BC
	1UDbk5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsOZ-0000000Cuac-0FWr;
	Tue, 13 May 2025 16:22:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsMS-0000000CuDS-1WAH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:20:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e730c05ddso54017265ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1747153207; x=1747758007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=XGT74QQn3CjT1E1LQxc5G4e5tG7Q2OVNws57pT7IS5hqWnGr6Bdqoa2snn2MRpzWqx
         6PNEa/krQQ5BkgyStHc64G2NKJe8Rj1r2Kb91f28UUhRpIg2lnfjryz32koF/RCyyJ0I
         gcIvet9+uPNJaJ3ykLRzX0xzTqR4TxuQ9MZgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153207; x=1747758007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=O/OeKKIj3V1lYzQhEj75VvXTKzeVfUEcb6CWYMbE7zcAyPlXpFp/qi2+z0GWv65mpS
         wDdvUFamgW1sqM4lVMCddPzmBRmKFenPihaXD5IiOc59siOvHuils/yrY2J6ygyESmNo
         jH+aAiwKdmypX4OmBFyJ4krO0rcYuQBEKJmDHiAG7xqb3Vt1qcJXQCH1ZyhX87ErCnR6
         46yr9gNB4IUSvhSGZlOabgX1cJzFDYVJxECpE1fGYsI4VCbwRPt5LzFwmuWus42bI4qi
         PuHqsBgrAqpXl28t7z/UhUUdV+i60qexLQt+ID52ZYi9dD2acwV2rqTedAXUxv+JaWWq
         1VuA==
X-Forwarded-Encrypted: i=1; AJvYcCXRglIKbeM9g+bP08JSgCQRZPa3YwoTgBGcEuK7QYpM7ihwyFKJOyeWssfNkkjUACsecaadGyE0oF3p+BPMvnOJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0rWxFwrZLbtoZWePHozWSxf2OAAhy9kJsyDtmXC5v6mXCY4jV
	wzKLROKd4i4Njj4lj7LzeIDcZppCf+VWgTriPJMedUQMR4D8h3FRpmym7EeOlGHgBFuC75Bg7KJ
	JTtELc9xe+W5tbQygT2Z/SXrmKL8+6hEl+RwAkQ==
X-Gm-Gg: ASbGnctp16yXdqaEhk9BFgMgAcb8BXRYaTBUNDrl7s3fqP9ZVaEUfYu1PmHIgM78XGr
	VRhz/jdA6nt0Dp7vsyOJIxEzXgQhSnW4+UR/yLT/arVu9hnfAQwWZEo1zywxK0wrc4RV+iQ5Yxa
	cXfdIUGPFSvJmddP2RlLrhy7ps7EjBVwXTWGZdRMVpcUgaxF5McNqfO8Wmj04yhAqObtY=
X-Google-Smtp-Source: AGHT+IEFiZZLEVm8p4exZqTgRnoEBDvu1NNpn5CecmgOUa1lbzow7S7xDOQ9y/PS6u/6mPTPI55hbsmTlWowpXVMs6Q=
X-Received: by 2002:a17:902:d492:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-231981d284emr53485ad.48.1747153207290; Tue, 13 May 2025
 09:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250512142617.2175291-1-da@libre.computer> <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 13 May 2025 12:19:55 -0400
X-Gm-Features: AX0GCFvX20FlZeuRo40HJUU0H1dNyPENU2uA3HGGuO4tfwuq5uvg2W8hOH9cVak
Message-ID: <CACdvmAgNVf8jtRj-jONwunGXhheaizUEEyB4rz5tpqzXb6hKqg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_092008_402783_24904AC6 
X-CRM114-Status: GOOD (  24.42  )
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

On Tue, May 13, 2025 at 3:52=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On Mon 12 May 2025 at 10:26, Da Xue <da@libre.computer> wrote:
>
> > SPICC is missing fclk_div2 which causes the spicc module to output sclk=
 at
> > 2.5x the expected rate. Adding the missing fclk_div2 resolves this.
>
> I had to re-read that a few times to get the what the actual problem is.
> If you don't mind, I'll amend the commit message with
>
> '''
> SPICC is missing fclk_div2, which means fclk_div5 and fclk_div7 indexes
> are wrong on this clock. This causes the spicc module to output sclk at
> 2.5x the expected rate when clock index 3 is picked.
>
> Adding the missing fclk_div2 resolves this.
> '''
>
> Is that OK with you Da ?

Feel free. Your description is better.

>
> >
> > Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK =
Source clocks")
> > Cc: <stable@vger.kernel.org> # 6.1
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> > Changelog:
> >
> > v2 -> v3: remove gp0
> > v1 -> v2: add Fixes as an older version of the patch was sent as v1
> > ---
> >  drivers/clk/meson/g12a.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> > index 4f92b83965d5a..b72eebd0fa474 100644
> > --- a/drivers/clk/meson/g12a.c
> > +++ b/drivers/clk/meson/g12a.c
> > @@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_pa=
rent_data[] =3D {
> >       { .hw =3D &g12a_clk81.hw },
> >       { .hw =3D &g12a_fclk_div4.hw },
> >       { .hw =3D &g12a_fclk_div3.hw },
> > +     { .hw =3D &g12a_fclk_div2.hw },
> >       { .hw =3D &g12a_fclk_div5.hw },
> >       { .hw =3D &g12a_fclk_div7.hw },
> >  };
>
> --
> Jerome
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

