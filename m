Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA594FC5927
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bnw64VDmOIsDBjD+cxaJBPxWhHWJgKFnBBtMRI3MdyY=; b=OJe8oTm7lE5A0cg0BGydKyMc+W
	T7bjEs2rMhRlFYW9IfFaP3fILRCqixg2dsi/hCEQUIkzt8hymhVIP++SfFBrRdP+gKqf3qe8G2ZF3
	rBKTTVlU9TH0FmpdbYRiI1ai3YsB4eKFlz9A2aoVFS+k9RF/eTuXSFX34eomRsRqJ0uGHXh33BNLy
	kVbba9IoIebBP//mUrHiEKPy7XPaQXLy/HI1+SjrEa/xELrGxYX6e7ctN4MwswObC2QJEYCDigphX
	VRQFJggR/BbOpBBFM20LOJA0WOTmrOd8HYrsd1Y4KIlLGYzjdiJ88eR2h6wqjgY7iSp4ja0uxOuOk
	XhlUhW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAx-00000005zHH-2RNu;
	Thu, 26 Feb 2026 11:04:59 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAu-00000005zFq-0bDh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:04:57 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-463960df4f9so611990b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 03:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103895; x=1772708695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bnw64VDmOIsDBjD+cxaJBPxWhHWJgKFnBBtMRI3MdyY=;
        b=ccLJEhBCol7ZYqjfZxEtX6BHiskpP3oyYMaopPkaXM/pim33dgA5fJlrSo61DTUkLl
         vb+Y8kxdrbpE/i3icRF+BgMt6Pp4ILtK8HHMSAjOqmAEgTzDDM2BALS+CLafKKOcGpIi
         ORDV7MZouTSAqHrOf79hAvARLp88kdPzGIj6zhB1H2W9k4ZSRF/72X4IBMeZ2AXqUTrb
         ByWwt3YCBdktB0x8dTqMExGrX3COt9Iiky3ECoNe87blZgQEZkp8VCVvLlAj3LG+b+T2
         VOORsG3ziEr+2QOgpm9j3vYu/jEyJe0/WJ1CQ9WuzYBwnmcS9S1A05sWA0t6QOAJZARz
         8qWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf6FBceRANuzlGOpoZfcsQgoYhfdAETezQT84cpUenq//t/O1/v1NCuDNE21z6cGiW7iQ47eWZ2j89UbrD2NkJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwfS1kdMVXDgY/8REW2FR0zjYMvJUCkAS85RjsLV/IY74WJnH56
	QBP+gSi/b10PBf7YE1i1UGr9pr/PR8yeBqdVTxyV/a69dD5+bqzJewm6JducyL5P
X-Gm-Gg: ATEYQzx+QEK1VpB4LsQjy9zgYxviu0nb3H54a0VxJuuamyB86Ssa7F++3Ej2V64rZoU
	eFe+4XdmDbJCbw3P2X0IyDJjeR15rMX4X0NKeIypFG5WI/0NJFH2KP1f6NoNX0HtMfP9YAP9Xk7
	Re5Ew6C0NPbq4gUG9P+Go/eoeKr3Ned7EJMx2GlG4YR21ZBV15sv0nkUbgkHbrPrkD3ZuEtnhF2
	j9Zl+S5aG8dFLlopmBibhW+xeXL6//2tUIr8mL43T1eLJgVb8Np//aMWMr+9NBdCBPNSxMuecYK
	PgFF7mqCvvZe804RCAXEJPojnB0dq2p9bA+HFkgcGyFX29s2t101L/kstG+si9SQGFlw8c20Yel
	bNnNirtVxVR2tMQYVTtK9cGfV9mM0RkFbaxHEVs64CS4l/508WgRPAp84pkUx6zvB+//5FjsGlY
	wmk0a98H1H6x1OT1tRQEYm7RxKMV8MG2rHTtNytoyjbC4+k7UIaDUID8N0ZzjCA1dCJqyYfdk27
	S8=
X-Received: by 2002:a05:6122:4f86:b0:559:65d6:1674 with SMTP id 71dfb90a1353d-56a8bc7bfe4mr1873930e0c.14.1772097645763;
        Thu, 26 Feb 2026 01:20:45 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9215ac92sm1941941e0c.14.2026.02.26.01.20.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:20:45 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5637886c92aso367769e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 01:20:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXn/ZmnSJg23WbrcHYvlsjZSAG7aL4tk3fba7C5uSKMbV6EInBEqd4d5NllaDWmD5eNjI55Ab9evT1zNvrW2MRO@lists.infradead.org
X-Received: by 2002:a05:6102:1606:b0:5fe:12c9:6e55 with SMTP id
 ada2fe7eead31-5ff141ca4fdmr1209533137.39.1772097644539; Thu, 26 Feb 2026
 01:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20260225155409.612478-1-hugo@hugovil.com>
In-Reply-To: <20260225155409.612478-1-hugo@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 10:20:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVd0Ds5vHQa+MG2E+E36qAu5HQE3b+Vzpbv84MM=2DFWw@mail.gmail.com>
X-Gm-Features: AaiRm50xBGkpSKzhEw3ibXVEzal-pPxdV_uLqXQh8Zi8JcZzUL3k8C9xrOoM_9A
Message-ID: <CAMuHMdVd0Ds5vHQa+MG2E+E36qAu5HQE3b+Vzpbv84MM=2DFWw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] input: add GPIO-based charlieplex keypad
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com, 
	mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030456_179410_D493BCA9 
X-CRM114-Status: GOOD (  22.76  )
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

Hi Hugo,

Thanks for your series!

On Wed, 25 Feb 2026 at 16:54, Hugo Villeneuve <hugo@hugovil.com> wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Hello,
> this patch series add a new GPIO charlieplex keypad driver.
>
> The first two patches simply commonize two properties that are present in
> a few bindings, so that the actual patches for the charlieplex keypad driver
> can reuse them instead of also redefining them.
>
> I have tested the driver on a custom board with a Solidrun RZ/G2LC SOM
> with three charlieplex keyboards, all connected thru a single PCA9416 I2C GPIO

PCA9416? The closest I could find is TCA9416, which is something
different.

> expander.
>
> Link: [v1] https://lore.kernel.org/all/20260203155023.536103-1-hugo@hugovil.com/
> Link: [v2] https://lore.kernel.org/all/20260213171431.2228814-1-hugo@hugovil.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

