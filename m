Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C1FE9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/KgeLtXmZOUh5kr82wm/EePACuyTgS6gfBGBNvywTM=; b=yJnSW2HB7EMdmUDAlDIE3nsy5y
	3YWQOvKp2/48KCo8RFrXLXAkKs34Ah65AlHAuRQ0vPQvxU3lD7VjzY56xh64gSCi43zcP85MIHQ28
	jgAFVJo0lP2SP5PbOIj9xEj1tTOIuDDFD4MpiQYGOd0Q8EDx7lRjqGdTSHbd4Ezfcq3Iyhhvr8NN3
	4solmma5HaAFGy8+s+E10F6cY8OcD1KXFBZW7TGg6PWxz3trhf8K/SmrSVWKEg3YFY7YCr+VyKzsR
	jZOSQIr+AtZwLg7i1Fa/78uDHb11A2HLsEsiXk3tPPhkHjGZiBqQqE8IzJbnBGakMAELuIsPijsXG
	W9GiXTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Gu-0000000D5hx-2yUr;
	Mon, 02 Mar 2026 13:25:16 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Gs-0000000D5hX-2IFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:25:15 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dd0f3c4b7so2801890241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457913; x=1773062713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/KgeLtXmZOUh5kr82wm/EePACuyTgS6gfBGBNvywTM=;
        b=FiE8q50uZ2eYm8REXbKtweZrkUe63jXqVfKVhFIgFUoxh8lRxBcoZPTwg8Pff5/wFj
         Mn4DQgMvjn0k32r3nhUsfZ8RxJDexNPYpg+xN0SqXYd9cK33uH2ZWRtaImhuj0SXuPQD
         Fog09Ix6ByvuY8/WuWDkFvWygZrUG/fOuZt7IKansX5wYV0kV93BOLtZUL9Oqw2Vdam3
         OdnaU4URB9WIb+WKp7H3ItBbsJpNCqBtj7DhXXsyRjszVpSHH6XoYE7MrVrk0TrFyh8z
         RakTBeFWSZ4ulLuXAEI3GuuiDEWTkorq+ahUOIeFuruvUXp0ccMvnRaVXu+5NJvYG1ty
         GTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5BMHC7koddomiLWxMycvZ3xIyhMLpPh9M5ydhNObhVuMxNYe/BYrExwmFhoXF7AuBV9zSht/Aakx8NPtKu/aV@lists.infradead.org
X-Gm-Message-State: AOJu0YwmgEW+NimZJcyPFZohLIO8gz9Sj/ndjxqQZCQu4Cr97/vLNFjX
	BKUlDK+18y+uEiAhtqZoI2Pcenpj1Oiu4MyIq+UO/JAyZwX9tjFt+1C/Jik7oN3w
X-Gm-Gg: ATEYQzx3Vr55Bw5IttIFhNM42xT+LGv2ydxe0Askagz/RJFaTTOUr/I8hQXKoEdzsMB
	WUq+PbXMXXqOc0GdZGbF49Uj8yZ942D8iGB2bez8B9rBFk12jOfvwOwXzS4Ury8KJFGy3KGC0ZN
	bgahAoJRKLJvvp85MnTwxJaxfLkYUHmH7JRUbJWh0KNZWr/21oAkiT+F66D4VNHFvrmbE87y/aw
	eORTVAyThSzzlpcdXH1s6A2rMLF9JkkGHdkZfOTd43d0rNrn7enmpZe9n6xVJZZvntMxbshc7nA
	wfKVWPe4qEBgwHg2kg3W8dugiyhvci7M5DNiXMgg5Jl5gA3y3Li4SKYG8didxb1T7plLjCnvryn
	OH+Vvl6Mu07e4ZrdJP1nvM95G3TUCoI9pUPaM/oGrXyLj9hyIFyBtrWUf+fS78O5u8pmOsQ4kf5
	KkDC1O7tKnKCrKXAyQ3S5/WTEcRiRfVv7UOJGxHj2Xh6DvrqL7/fprDfCouD1/
X-Received: by 2002:a05:6102:a4c:b0:5fd:f944:6511 with SMTP id ada2fe7eead31-5ff32396d39mr5603551137.17.1772457913008;
        Mon, 02 Mar 2026 05:25:13 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df61672ddsm12078651241.0.2026.03.02.05.25.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:25:12 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ff07cb35efso2953240137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX27HQHwBrCXjK18HgAn5U3RpL84makDX0l14dU1bn5RHW5lyHStKcQx1Awl753hrQPp6VzGp5OzTeskvhGvr2D@lists.infradead.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6218672137.27.1772457912000; Mon, 02 Mar 2026
 05:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:25:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
X-Gm-Features: AaiRm50Tkxhc-oCHlHPyabn9QxR4wbHw_RTC9z1g5dQZe_w9JY9CV7dca6PXC-4
Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_052514_596606_6355D415 
X-CRM114-Status: GOOD (  29.73  )
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

Hi Cristian,

Thanks for your series!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 1-6.
>
> A further bigger optimization suggested in a past series [1] by Etienne

s/[1]/[2]/

> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the

What does [1] refer to?

> functionalities already provided by SCMI iterators, though.
>
> Patch 7-10 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to ony retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 11 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc1.
>
> Tested on JUNO and an emulated environment.

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> [1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
> [2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

