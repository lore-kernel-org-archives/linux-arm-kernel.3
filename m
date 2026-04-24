Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6D9FE520C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTjTO3Vp0zB9Wc0GJptJYSFqlnWOG96HJNT3Sm1YIxY=; b=wXrPAp4Twe0s1dSHdC2bbKiCE1
	huNQ5nsy+dM77ZZ475eQks1iPUNsQF59y1K/SJEkjbpLJP6cpXw5Uou/70kXJ/xtA2aR9VuuhNKYU
	mLwrN/WHmiEHua2e5oNigOiqSYgayGbNOIVEyWrbR+V4cfHhDgP1IQ/qP8s4zyFQIKNKaxTE20zMf
	7CdnF9tbUwMXs6RyvFvAx4cBLYlK4mBWW+NpRpIj14dLYjalaPNkM47yOQ9fFDByOBdvBfY4KzdlC
	PFORS1ZpZA9jRJ17RynMD3zz3IBh+fqVJBws6sgBsQgweTlispzmR3Q6cqzLd+EcKeln0UlF0N4Ke
	uZsuoVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEhw-0000000D7vC-21aV;
	Fri, 24 Apr 2026 11:28:28 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEhq-0000000D7uN-3SA7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:28:26 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56db1b3626bso5023395e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 04:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030101; x=1777634901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTjTO3Vp0zB9Wc0GJptJYSFqlnWOG96HJNT3Sm1YIxY=;
        b=bMPWDeqc8RTQnYG65bYLyEG0tdTrrcGfEHO5QG08I1P/DSkW0OtKgmgJGFTDhYBJKL
         qosZ1WlHwBJ48GI30HWPmX/bysEwdJK6dSJRaCGBAWX+FpStlUyGs+ChLY1Zv8SB1W8l
         EQY/3+fEMQVwYjYkvOPVyA/ZQFoTdkUti1nqzWgf8oalv9yhxOV8MhL8eafm2FdwnfNJ
         lhyR6ZalQtQ3EPFRYGWVlQJocPb6On+IGubwCAde1aL+Ps1MlMsQNJ16mJGl/eI7Exbz
         blpIur1Ci5NRb9+RQY7i+4NhJz9WZvGRjNlYHf9MHW1AiDVmr5eOhMTz+y3xo3wIEtAB
         nZkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QDIfG675j1VK9lmEm2itziCOBEz0VFXmpAvwm5V9fH9Rb0+PPMBE4/bd3wcc7wDz2/1+vSZ6YN+d/3X8vs5J5@lists.infradead.org
X-Gm-Message-State: AOJu0YxfcuihL+N1KSPNh+KLB950Y/GnKOs3ozDtgNHtxc+fcQvG7PFF
	tO/Gbd3oW2zWBE+PKPWku0fKZXWxE8h7Phuyw9npGwRgBOq2MM5ValiArA67oWDk6m0=
X-Gm-Gg: AeBDiesa+wR+BJwKiMF7W0CWtize6+2ZacgjOM+bD/n1+Kc8xUJnvj/H+08za5wJK8f
	FFsHORWsNckG8RYGFItIzpcSMbEa1FHImCzL5io1V0CQnRII7UN6TzSt3oUQSy9UgjF8rYr97l0
	YVZgQMIVPAg2GRv4M4+q72bYI9WLtw061g3YHKSjuX+AEAN1SIFY3+t83OnAbLm2Wtqw7NiJsoy
	7M7ecR89TGBAqi/cXlYiAA53XBmVO+T+fzOm2SDXqfSvzG5z3O1s7jUF0bjHFlCQohCurrvDBBe
	XWPPPqYLQ07IjW+d5WBuyixoaTP2oX060d7dgKDEx1FanjKj8/xYU1pz2/SUaVlkL8L05xYWvD/
	VBYOkKz9/LOXKS6la1vz93P8iqnox+ol4e8zWtUHXIwEUedgOYqNjhYT4EDFto63HQgdSuENhG0
	E5eCPY//vj2WTeLOmWzPljFFKmSVB9vA9DexUeuuUyKH+GX7ZWfkJ7zLl6tD5q+g3d/IXhM6rlk
	JbRNQFIkg==
X-Received: by 2002:a05:6122:8898:b0:567:44ba:bd8a with SMTP id 71dfb90a1353d-56fa59daac2mr11836255e0c.9.1777030101169;
        Fri, 24 Apr 2026 04:28:21 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm13155564e0c.13.2026.04.24.04.28.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:28:19 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso4465631241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 04:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8pHfuR1nBRZi/Cn0gtYSLB8DQ+2nNHNn71gW4KZBIkp9QeQ0jHkYfzRvoG5HehElwxfNcrzW+OKVCJezTOoCuM@lists.infradead.org
X-Received: by 2002:a05:6102:292a:b0:60a:cd0e:5cee with SMTP id
 ada2fe7eead31-616f4f84fdamr16386481137.12.1777030099174; Fri, 24 Apr 2026
 04:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <7hcxzqr4qi.fsf@baylibre.com>
In-Reply-To: <7hcxzqr4qi.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 13:28:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
X-Gm-Features: AQROBzBE70P7irgYnQUYx63AIUadZqGfMGlPrac0wi4EECHihh00jV8ht_DYoMI
Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
To: Kevin Hilman <khilman@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_042822_892725_C3EEEF53 
X-CRM114-Status: GOOD (  26.28  )
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

Hi Kevin,

On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> >
> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
> > SoC/board combination that implements the ARM System Control and
> > Management Interface (SCMI).
> >
> > This means Linux can no longer perform various system operations (e.g.
> > clock, power domain, and reset control) by accessing the hardware
> > directly.  Instead, these operations are abstracted according to various
> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> > firmware running on a System Control Processor (SCP).
> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
> >   1. Core clocks and module clocks,
> >   2. Module resets,
> >   3. Power domains,
>
> I'm very curious how power domain hierarchy is described on this SoC,
> because one more issue to add to your list is that hierarchy cannot be
> described for power domains in SCMI.

So far I had no need for such a description. AFAIK, this is handled
inside the SCMI firmware, which does know the hierarchy.  Hence the
firmware can power up a domain when any of its children is powered up,
and power it down when the last of its children is powered down?

I think the clue lies in having a PSCI top-level domain, cfr. what
you wrote in [1]:

   "But... how do I describe the relationship of this hierarchy? In
    particular, when the SCMI-controlled PDs are actually subdomains of a
    top-level, non-SCMI PD."

Or am I missing something?

So far I have used only a few devices on R-Car X5H, and e.g. the
serial ports are in the always-on domain.  I did experiment with
a dummy UFS driver, as UFS is inside a real power domain, and that
seemed to work fine.

[1] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

