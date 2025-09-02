Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378A0CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=; b=Hv06c8iJk3ZvzK54cZqYxpRptk
	Wh0f+HCRrJQi8nZmJYaeQgCUnWX+xW3r05QLvId4zIfiET+r9y1cqHvy/lt2R5jZ52Vz4naCjx0Pe
	pozDONaQPwIXkKbpG1svXq8JLsn4fUswan2eNaSzzSiDadaGZSNyUlyBYniIsUGVmBSOTdvMqqDNw
	HRLEEdONwmSLQ8a7GcmXKGiZIQ0WPfztZn8EdxTHg1tW68UOFZsnZi28XGdjFlR0B7vTvr/6i1o9l
	naLIpfMpTF7OkFpVwQE+88v9gNJq7Y8DHNie/kfnprZd35mZm5cNZ3qFRL25gNsj5fSTPeRxsE/rF
	ea/m/s3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbdb-00000002rs7-42rT;
	Wed, 03 Sep 2025 00:46:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utXu5-00000001yVu-2WBB;
	Tue, 02 Sep 2025 20:46:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b042cc39551so376150366b.0;
        Tue, 02 Sep 2025 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756846015; x=1757450815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
        b=bMId3xmTOOJ0updp7M8wi8CbXVaauzQir9Kas+OEIeqbkFuVcSvRDELMLBqX1nM3uF
         NVhaeRovyMm6xQ/4P8G+9wUtIzsjWfgFDP7+GWmp3iL/Q7QgsGHYIuK50zrAoNJCDoB/
         c2S8RTljP9MpVatrTZMmOXnMixllSws9J6shSdeUb0Jfv0BZwIK3yVQfSEWayQt18fOS
         OBgCqEGnntf82ETuMNjmZlhHU/7gAhEKOIy08DaOOGnrQGmDzCRpXX4ntLEts18oLcki
         p/TXwpPfMztIpkmNfkGqkU/auzvLxV8WXN8zT7eBhRWyjTO3VnAzaJzYrom3Ku/ZotK/
         svTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756846015; x=1757450815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kutjVkpcvEETb1qEj2HY122cngSwuEsceeDMIRlTOiM=;
        b=qOCQZ6DU7DNTkWd/TCrDQxqKcDMonN96Ad7Ipm/vGf6Nrnp6hanV2kxzpYzpiFtMwK
         X7GRlurjUfE4DmFFuuK4vWJF3U4ZLugiU8BLf0lW/OlAQIbfSrjHChGM2gIBJVrkh6bp
         eyYIexL+wBiufx9mQEjYoMTvWKiHtqQUdXw1RRcjLT0/gbd3J62pdcQn8hffVxXeLNZj
         taVaX49TMW8ker+S4JYLRxf2LiZ3GovjH7DmyGGnwpPOYvD/j13bFkRhnGD9Nf57JrSl
         K85Kb5SOmKKoIQeICm2TJT66fdzoi1PCjpYyKaKbJkLqYatdFP1x9u5sqKSumuwev2TK
         C6xA==
X-Forwarded-Encrypted: i=1; AJvYcCUTLXGV+BC3v2MpXao/xdVZaj5DG9MCBNLjr3IvxiIE1OinYfIzshiffaYhJ34m128QsJyAHqke7P/iY+moy9kJ@lists.infradead.org, AJvYcCXqSAZUQUeQ1do0kqYTdywqfo8kKdiYIzKu4xqCBF0tBg9sov6mPDv3/ORuDHBh2wdppTWXZyZI84xo8mFzoPM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIhqlRVbsQs40Nu3YtTNp2pXb+TZz8FGL8Wf10t1YULRTjnC3
	/WvzcLm0lm0/1ILYDTZe2nnYiePpj5UR9g/nZIgBlZfg8Z+iin/GqJn1vIBcXtZsEAOW1d6qNdv
	vsr1+1WNum1nzcbyurgnWKTIQFzDEvTg=
X-Gm-Gg: ASbGncs8hCq267jJdP+CHx9+fKW8xSvXr6WuZ9OvkJ6SVDOKpJZciNIFazK+wbI9se/
	nu5VxROdgg3x5h63BSxROW0GmXZQ6OJGkuPMS1ImQXBrDWYsTywUP9Kk27pgryWf+D//Kw3z4CD
	4ysJiMLtgTd7jUUE/PtGnEtMN/x/fQ60JD0mWrnvJWk0ofu0Wec6LYEvushjbkPp3MdNeN2I4Zi
	G+hLFR4fK26kAcT0g==
X-Google-Smtp-Source: AGHT+IG4zlhdZMe5YSuufGeqwlIQK8acaeuuvg5xL+VVOl3StpGEjjD0yfcY2w04cC3rT7k1Cl4bbDXfAthjT80xlmI=
X-Received: by 2002:a17:906:4fca:b0:b04:6546:347e with SMTP id
 a640c23a62f3a-b0465463a5bmr50237566b.51.1756846015338; Tue, 02 Sep 2025
 13:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
In-Reply-To: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Sep 2025 23:46:18 +0300
X-Gm-Features: Ac12FXzQiEATdvX4DXbIt31zcGrGliq36XoLvlgsSrCLd-DIw99Mu03fZo98CMc
Message-ID: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_134657_639158_3F9930CB 
X-CRM114-Status: GOOD (  17.61  )
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

On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The strict flag in struct pinmux_ops disallows the usage of the same =
pin
> > > as a GPIO and for another function. Without it, a rouge user-space
> > > process with enough privileges (or even a buggy driver) can request a
> > > used pin as GPIO and drive it, potentially confusing devices or even
> > > crashing the system. Set it globally for all pinctrl-msm users.
> >
> > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to =
work?
>
> What even is the "generic recovery mechanism"? That's the first time
> I'm hearing this name.

"I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=B2=
C keyword).

--=20
With Best Regards,
Andy Shevchenko

