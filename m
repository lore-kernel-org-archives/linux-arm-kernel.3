Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8119ACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE5Sc3I5fhZDV/Yx4xguTp5z/tXd0Rx77uBwtmUCg9g=; b=RwQtWWVZziSYofjj/rRBhuhdF1
	uNdBTEsf10E37PbpE5g3f9AOFjS83uS3Y6usO2jeVc0x7WFPQEmE4QxskbBzRpb/Csv2WUZ8Dps0U
	SWKSD/cJxPipGG12rVmkd5XP7PyiKNpr/k8CQfhV5Lm27OGExipsv/VF548fvgcT2pmdefjeA/ugN
	jMsf7etIEtgB6M4osbvCWK1/4uqomM8z+evOdVAzfNjRl13UbYoyvP2rCQJO+Uwy4mPIYmofpbkwm
	FJNWFfrKmQk8cntkDKeLR5J2PP+vx6cQxzJy4p7Op/DJQjcuj8n1ttwp0Ks+cx/StR8+Hcfc+M+Xr
	BxG0DhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9O6-00000002ccM-26Lv;
	Wed, 13 May 2026 13:12:34 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9O3-00000002cbX-1Ieq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:12:33 +0000
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6314cc192a4so1498213137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677949; x=1779282749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE5Sc3I5fhZDV/Yx4xguTp5z/tXd0Rx77uBwtmUCg9g=;
        b=VfzM2ctpUDa0wwrZJw1GPiHgDM0ylPM8gbHGvHpCtl0ecIGmHOZbAqS6TzK7Stu0J7
         fLKzHLbZfQzfK3kkJvlwS8ZS/lHfRFDD2nvjR0EAQHXuA0cQVRA5dotvh1MHYZyCBEFm
         uZQyH6+ZE0YqBffy0sLAyskw+Wf7+FLC42zBQXL0uapjJE06c05gUJcqIkEu/tuIPwi9
         69/TOZUMaamU92W/0FUyDGzjfVQ3A0SkzOak3hUtcOMxbIT+n+TCVs1lfDDv/IR26ipo
         ir+p0TsE/AEUu10s+mARswol1ftYvKQEwS0/gkYCsDjOUOM6cm9tSmmsLvmGjb8waiUv
         4+Lw==
X-Gm-Message-State: AOJu0YyN//zW7eta98f7bAiaSxhcbzDjZkXqPvYD3gsezx02j6sVjIT6
	JZRNty1ToJrNdie12SVpB4GxGm5AmuclFKd8K1yxU7d0lwGphopslegdHfTFlShE
X-Gm-Gg: Acq92OHUx8+ml9YDJelFs7Vu60xvh8nHTSNEaQVbH6ygG5v0DsMLcbDmB1vICoF57Cl
	WSqiIxSzruBSTG1Lf+RbehjSMxLxWQjM8QK+0/I6fds7mmLiSkeZ9scAasCRgYBtnQbEOqrEroU
	P53nmT84mdHSmWySfXRRH2sPXvaWOvNbX/BZLuwgJZAmKidYxpXVQQd3EnWjB0RYhmH9wNq5UtZ
	YK3G+qqxKlPYgHLdX155GfJ8rtK0ly8KelJ6epWS80upIDwWd7+Cipk1UCNoYYOUfR1HU9nD5JJ
	HFMid28I1kruTkCMskBkYO6TUIX3HUBpWN2a7Wl+FIOnFyfoK/kQlUOFgTEBIghJSX5WRM8yxHi
	G2+JTfIuiBEeKw7WcLgkZEXiRNcTd4FXfottcur1kFbQzVDLKCA5WCRsQQ/AK6GO84zUccwHeyt
	VItxk3GKMk+M1q+kGxTJ3g3JKEq8GP1HSHedobzDuYJV8QSv4HiLlIrseP/uqCH8EH
X-Received: by 2002:a05:6102:5cca:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63771d9a36dmr1358335137.10.1778677947281;
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6314007acb1sm9924931137.6.2026.05.13.06.12.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a857578a8so2306401e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:12:26 -0700 (PDT)
X-Received: by 2002:a05:6122:6992:b0:575:352f:eac0 with SMTP id
 71dfb90a1353d-575e6fb88e4mr1415729e0c.7.1778677946052; Wed, 13 May 2026
 06:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
X-Gm-Features: AVHnY4I1ueP8c0lbfl8GeS1mAQp1h1WSM6acug8SaPsOhckX1RLhaKldCR-pmEE
Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061231_351797_5D59BF9A 
X-CRM114-Status: GOOD (  19.13  )
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

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

