Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pysUx5KjUsnCC7SRGDXolsL0u/kPjjXuwebo/Ew3v+g=; b=OZOfqPEOgzGfiiaWuOwKvfYrzg
	/1sPA2b4RDrR/U1qpMmHbJ/I3bhsJ+KZr8YK6CuKHm/tGAUxuJvRqTuOk4yzM7s1QKfaBVG1cqtug
	MUNgC9iuPCNs1BwGHxFqJR5EzV8AM4+YvGHGcIVGUeTcuBgp7f/vOcbdEyb309GvAoxYbreWIRi6x
	EyuFUvADgbJhQ6ZFoOKVsFpaH4GgSBducRGkWYEamyeOVq9xFlXxcnqM/XPFkLUynShZCx5qHy7DJ
	49Y1swRmm7x+hYI4tc6QduUuMFEXLepM1lewtkGRkAJVBpcCFj40h7agsG/+NN7VqbLyBq8VmrEwS
	6JWgKN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhqo-00000003FVZ-3ULA;
	Mon, 24 Mar 2025 13:28:22 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhny-00000003Eux-1SRU;
	Mon, 24 Mar 2025 13:25:27 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d69774081so1832320241.0;
        Mon, 24 Mar 2025 06:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822724; x=1743427524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pysUx5KjUsnCC7SRGDXolsL0u/kPjjXuwebo/Ew3v+g=;
        b=DOYAMXVxVmCdYosoZrWWAHwgK90Y4iMq3746hcwbZczqOYnVeVgvBI8tbjzhOziR2g
         8tsJnoRtBx06zfyVR8LxIGaAJGyW+k+w6X525p7e0rrw4KcMggr5cZ0ve6mb0Gl6bfgk
         zCGNFBbVgkLsM/7q24Rz7qvIsl62Q/Tw1CRzKe4EdC71XiHseOomi25LyrYueJ9wMSgy
         KXujb+Dn+uBbyCvmu1P+67nznnEkyXI/28eDP0ZcpcoraHz8pJTl12N2rlgQPmI9nt5e
         Qru39yj8e7/h5oOYnFCTI00Mz3BauT1tfwwmFPZh6p3lAdTzz/+Z4Z8N83dPWtaUhvT3
         384w==
X-Forwarded-Encrypted: i=1; AJvYcCWjnjMq2b9DBjJFNnVbviKC/c7ZUFCQ3ZopVS6BRsp7HExJv8T98LH1/WHKuouf9yMbVi/WznUN5qV0oZVXqFPH@lists.infradead.org, AJvYcCWmU0ttFWe+AehfAn1ov4i+GEBavo3G+OrpbGGuAwIa1Hw9cMMBdO9c+fA2tZdV3ke737jF1DBnLohFob0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzT/txF+EHZdXg51LeEJ1LwuwyKlxE1m5RPjmvksqhWrvB4/O8L
	YA/clxGGvb847yraYh7ouES0zk309tpHq7CfrZ0zjiZI9qizv8kp6bBsnacn
X-Gm-Gg: ASbGncv9V2EX+VqDfCGmBjegMpYqVBVXZpgZw6Q/yokITbx+nHUdx7OnzedrOYBkeIT
	59gy6UYWnDahvQ4aFilaxrUm3GbE3jkOypHg21ZlAYefu/4Csyle0WUV/3pniak+5s5ZZvVTYhP
	Hr6SL3MR1osgxGDMoRBYMm3PPLLq8sgcGE/lc7hDHTKPkR+5T0wFHQgwopM8jaPIxLwsTWInUiU
	1Sqog32kl20Ibf99234j14gcLUr2OoaiBr3hjPQJ3+mT1WdmW7YlhsGis6jvZr/INoPHep9CAZo
	4K3wEbGwl5u5EZhFtv4bASr5Q5rKNhNDHjKtyOgrfXuIo7sZagVhp1X8SX7vz9NG2u61rIbfVBM
	Mpzp2Ffg=
X-Google-Smtp-Source: AGHT+IECBHfCR4MgHxQqTdqWkajQ7XFactkytMTGy1KXDyLBIsyzSOyi2ua/GK4lqVoLolTsuHaT+g==
X-Received: by 2002:a05:6102:3f51:b0:4c1:86ff:4af7 with SMTP id ada2fe7eead31-4c50d60626emr9004675137.21.1742822723611;
        Mon, 24 Mar 2025 06:25:23 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3a31c6sm1609708241.14.2025.03.24.06.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:25:22 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d69774081so1832295241.0;
        Mon, 24 Mar 2025 06:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGg5y/AwifYBDR/EMnVW8/QiMvZu9e3WMWfZZa9Gl2jrpx8W+Ivihc3wkKwVHM8KR99VK4cw8MJhh5mkk=@lists.infradead.org, AJvYcCXqa9WQuy5Vo94VirosENjLzEzmknVaeZjySQw1PWAZjiTZ8WXAnCRGixC76I8F99oJCGVY+VW6diJ4Yqb/1cu8@lists.infradead.org
X-Received: by 2002:a05:6102:fa0:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c50d5c5525mr9355749137.19.1742822722526; Mon, 24 Mar 2025
 06:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 14:25:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKFgm_44XXq7Zq8yqosBCQc1CK9dkJoz4nLQ=aDNx-Yg@mail.gmail.com>
X-Gm-Features: AQ5f1JrAqzrQO9P6bZUVH1yKTkJKGarnEoNgpKJ1GLu55BnPfqFnSLdxcuz5LI0
Message-ID: <CAMuHMdVKFgm_44XXq7Zq8yqosBCQc1CK9dkJoz4nLQ=aDNx-Yg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, Maxime Ripard <mripard@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_062526_385501_776E27FB 
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

On Mon, 24 Mar 2025 at 13:53, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

