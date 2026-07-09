Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EB3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBx1Lwl28bs84XHLARf2PZgvr/qdRO+0Qc3qcd6uTMQ=; b=V+g/wjhO5jl91VWljlF6joubo1
	P3uSno7I0HkJtC8pVtjk86sWpGuJRpLDrZWEROx4L3Xd+L60wNppd3Wb9tRclLC9v0epZkgg5ZzET
	LMsTcyxMYeu39XSH9JEjJ6iJyq4EY6Gjr+jzo3jM8eWaOON71JvL/IewY6RiOSS9WyTfkZlmA3OP+
	Ughpd39RXQ5UdQy0amyM8iz3yafC5e0Fjh008fdwvUidfWTh8Kg4Ub/OI2yI0GZc8Rf7hJDnL4MdY
	fzhVtpRX8dChm2Cf2yy4w3TFvONSi+zaJ6IBNYEPhNePHphmdNx9h0TJ2d9Z0FwGT8PLt/S7N/wny
	2s88JWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlOH-00000001ncQ-0ezt;
	Thu, 09 Jul 2026 09:49:57 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlOE-00000001nbx-2EsD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:49:55 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-969524c1aefso424275241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590593; x=1784195393;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBx1Lwl28bs84XHLARf2PZgvr/qdRO+0Qc3qcd6uTMQ=;
        b=knEh5q19+505Vrytn1vus/52SL3YpVj4Pgv394bPmmnyRDPyjDtICInwBeYoKQEWQX
         t0tuPqxs38iEufnLf5o14bSG8eVnBbZpUA0GSjIc8o2J0/aSoevQxq97lTri3wAeiTyb
         2DZ5tiBc8BYshUuuJbfkP71c4rVRp5DTadiAYO9xopntxuFPnOIILkNJeK3ffnKqHeD5
         MHkodLn49ImrPKs89HufbT4wp4Bgz/7ixthia/LR+fm0ZuFSGBZZt6uLo2hfZIiIkEBQ
         SXwjHWm682MQwv01tzocakS5tRBuOkSHxNwm6EMu6oKW1wXI38RNFSFn8xL1/tMaon7u
         xQfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoW/pu4uhX+iYBKBmb5EGs3gMG0OrZ1fLZKT4f//0bNdNrdnwFEf1LgTPzgKt619M42+tORHrIxnEs2cd+sNTZy@lists.infradead.org
X-Gm-Message-State: AOJu0YxZMPOHbh54qE01dcazIMUKHjlIzb2XOwSzfXfZGTCv1iWyrPMQ
	Y8UwLSQKTEEhKm5PQSY2HY/nfQRE4/LR6oF8mQTepcTgobVbYaZVexIAC8R7LjvQ+Zk=
X-Gm-Gg: AfdE7ckrvA+hA7GVv+AJdBEx1HMeAzenEW+BofyIh4acXyrLX0DcKfNMLKbmDdhNm9u
	2rzcZB/2iDeHquQNCSiVipQjr7kXYt2S9Fo5ukWUQMnokSTV7CpJng5yt1kSLdv+1aBArRySL2O
	QzfoyaS8wG1+9y5KLr6uG0wsAhpzwG/npofdZl9uoPAuiV3MM54M0w2bjym1gEHCjAzlLSEDM7n
	yHXy2bEn4SPbRogr8yldRIn/fzPinRmRU9WkZpyhZg24BzgiLUjy02hTrxi06i/sHuRA5g1tn0U
	fhOJX//xWMkqfaT/FdQV6cvg7DMmckHyv1j2Sm5Oet/YUnFaTfsGZhrPIyfaSdEfrEsfC6T5iUV
	PLgat7Xh1wRKxu+Hf+V+BukM0wHMaBVGEtmlQe8yqAsXQSIRH8KdHArKzSuU681M+uGy1TVB5gf
	1qBy0Gos/t3aOaXED3vK9j0hDm3awkNk4NpGC9ivI5pUIo9QVNqw==
X-Received: by 2002:a05:6102:6a85:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-744e0091b12mr3500028137.14.1783590593143;
        Thu, 09 Jul 2026 02:49:53 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm2851894241.12.2026.07.09.02.49.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:49:52 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso566209241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqh9/ggrQ/I5gl4jSZEpeXyzWwO04QFNuBs00EF4xmpD9NGkmVPoC/kvhqZ3FKZqXp5hbCw04ZBmSanTPqMU7xp@lists.infradead.org
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id
 ada2fe7eead31-744dfed12b0mr3967593137.6.1783590592726; Thu, 09 Jul 2026
 02:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
In-Reply-To: <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 11:49:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+nHe9kWbBv1k=b-6iixBBJbqeNY-Vq+qbT+wD2g6jUQ@mail.gmail.com>
X-Gm-Features: AUfX_mz8czD0BjSvqmftRZ_pTGys7GO-j5nSESdQS6eSA4Z7r12bLxvVFtqIaAw
Message-ID: <CAMuHMdV+nHe9kWbBv1k=b-6iixBBJbqeNY-Vq+qbT+wD2g6jUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_024954_575620_586DBC99 
X-CRM114-Status: GOOD (  24.74  )
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

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > +static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +{
> > +     struct device *dev = priv->dev;
> > +     unsigned long rate;
> > +     struct clk_hw *hw;
> > +     const char *name;
> > +
> > +     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +             rate = fixed_clk_rates[i];
> > +             name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> > +             if (!name)
> > +                     return -ENOMEM;
> > +
> > +             hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
>
> Would it be viable to use devm_clk_hw_register_fixed_rate() here ?

Yes, I think so; thanks!

> > +             if (IS_ERR(hw)) {
> > +                     while (i-- > 0)
> > +                             clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
> > +                     return PTR_ERR(hw);
> > +             }
> > +
> > +             priv->fixed_hws[i] = hw;
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);

And then this, and unregister_fixed_clks() can go, and
r8a78000_cpg_priv.fixed_hws[] is no longer needed after probe.

> > +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

