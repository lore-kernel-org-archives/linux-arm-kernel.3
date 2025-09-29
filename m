Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24C6CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxW5mXe/+NcsYxkIwV9fCeaWAATP0wBLi6jwkn7jUaI=; b=HYjE6dHEyblM1LoibjAa9+HBre
	r2EHdFQ2f5JPZxzTTOTphYxDtgH2TK0qdaAPC0TXiT/HDEb0M6eZudqlbjo6T5CmJ8sd+VnUh7H4V
	SXcMBj2y6/HzKQ1bRwQgAPrU6wC4DdNYW3vhaDFgcL6jkrrOz4kI/Wrn4/HxVoWFkn8XQ7lPXd9QR
	q3+36WT+pPQX/20kUq8Lo3K8KG/nEPY6/jBmwm9VIHNC4u9khwOHB+aDZKa2XsM5yywMXdG1+En9+
	xayjGYqFeZQhaq3U7DepVP3cmI2msjb6tIEVjWgr+FWUM9DS1B8xCT5jJ0vAcZSrXC9zW05Jmxz6i
	DP/m+c1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3C9J-00000002LWs-0Tp7;
	Mon, 29 Sep 2025 11:34:33 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3C9H-00000002LWP-1Dcn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:34:32 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e30a19da78so3690177241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145670; x=1759750470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxW5mXe/+NcsYxkIwV9fCeaWAATP0wBLi6jwkn7jUaI=;
        b=SYZveR9HI2z/LeRwC5kG61k0RjyUPv6Hswx1Rwvit8sf7LahZ033pEXPoFpBttDmo0
         +m7sTnXGC5E47emVQIsEoLLXZC46M366R7kAD9rgHTcK6af73WSke3E6YUq9+O5UlqwX
         JYYNsYvELvVIYfLyLKgB36ifq9hhFwgZSvz1ct1nu/ArQFsXjfAT9wwSEAz+jCmwBBKP
         HPq8Eu7f0aDdrwm3zFtl6b5LGQZKyGU/BCTW+SrBi0KULCfXJ99qtlDyEjsdGOG8UdBw
         KbGnwoJo/MTuRs+qnpI7vrz+4Irk8fTaFkv/0zxjochyoWo4ky0MWyLsVLwkGPEYHhLY
         iysw==
X-Forwarded-Encrypted: i=1; AJvYcCXy/IZaXG0b5F81ESehRJNsVVlXOLpWFFKgwk7JRXLBJX2kvTYgzrAbVhFzvTtaSvXYQL05RhrWsx0fdqjRd4Vt@lists.infradead.org
X-Gm-Message-State: AOJu0YxZufmBWhbchV5+7C/4dYRwKhLf4aEA/f6EWk6QtEvXqSn6RJ1X
	B2+Qp/tuSIxh42phygdhpfZVORr40Nj7I07YzLssBjBTZQiZQejaq7Gw+RNE5j5E
X-Gm-Gg: ASbGncvoHkX/mTC5+jgdTGMxpb8UMy1iZ9R9QVyMEzI+EXdfdtV6vhTvSm5whXys6Wp
	h3G+IxJ2Tf+UB31mqYeRGvjk79WyP3aSNP7ItlnVX+G0VxYthzlcHzr/DTSKkjdkUtujckfG4J2
	7SNU5fLzhst2N8Vvpg5/7KTcujHwnmiXh4LOnm0H2zkTAOQMQVGHa314hnszJpY0Ju90xeSkRIc
	y80bJ9sjdQnuVbapX2wvFmUy5Q19dJOF06EjBsMW6ItouzPdgnq6phEsWoW0YqUFheuXtLAtJKf
	4we5XrMMQOhjvkYuHUE55F2au/pcCOLVYOVTmmaL4JOp2S7Hg6Ac7SQcW5LHdcDUbi0pGD2Dxjs
	j4FkUwpSZfAWy43mMth2qIPKwF0mVn4Y7Hy8SrKsMP70bZeDPgi6SVn3NymB9
X-Google-Smtp-Source: AGHT+IHhSNSpz30+ofNUEFNlRyELgCwcBWBYzGyqgdM7+3hGibqJUQ5UiQBT/YTP55Wu3tszQW+xjQ==
X-Received: by 2002:a05:6102:620e:20b0:51f:65da:4ada with SMTP id ada2fe7eead31-5cae9fa4d04mr639512137.17.1759145669733;
        Mon, 29 Sep 2025 04:34:29 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3182cbf0sm3301096137.7.2025.09.29.04.34.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:34:28 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8e0c90cac25so2963729241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuewqdaPccFp7naUrviBUxjwhK0rPaT+OJxujOZ0g47yOT2Ph/uNcK/+dvs1ub8DBYKkY5jh1OlzfD5/jhhHb9@lists.infradead.org
X-Received: by 2002:a05:6102:3a11:b0:59e:a2d5:2945 with SMTP id
 ada2fe7eead31-5acc8e94d9fmr6861602137.8.1759145668352; Mon, 29 Sep 2025
 04:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com>
 <20250909113840.122785-4-john.madieu.xa@bp.renesas.com> <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
In-Reply-To: <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:34:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUt86L1Pcui8LD=i6hyqPQYnx=Apse8_h=YyFHAeCta9Q@mail.gmail.com>
X-Gm-Features: AS18NWAfMK9KQyXLWhPAcgQzNt-Bd1yk2_D_oAV-tjfTbvXk5XD0wBN0Yq448N4
Message-ID: <CAMuHMdUt86L1Pcui8LD=i6hyqPQYnx=Apse8_h=YyFHAeCta9Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: catalin.marinas@arm.com, conor+dt@kernel.org, daniel.lezcano@linaro.org, 
	krzk+dt@kernel.org, lukasz.luba@arm.com, magnus.damm@gmail.com, 
	mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, 
	rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043431_330002_A999E02A 
X-CRM114-Status: GOOD (  18.97  )
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

On Wed, 24 Sept 2025 at 16:04, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 9 Sept 2025 at 13:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

