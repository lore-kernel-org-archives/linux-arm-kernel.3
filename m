Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86656E9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbpBDECGTuxrjZK2784Rn4svmYdxHMnNQNyQJ/QvvFQ=; b=Q6bT7/QcglCQdzNVG0s5W6nkOF
	ZUSAkX3IJDUdtFfZoE94KxGnc3I2MTgAg0fzGsiYCZ78IwT37mvBJFua9CUZ9sUOzB+iMxge9+Nzw
	nP919vH2QGUGkBkRAkPkEtAAIhi7KtyjFQ0fFaI6zHW/DTvAttxjg+I3sXa4zFZCz8E6CvT5bRY8k
	E9BnM0ch5nNi7t0hZEdvvLDsQgfZLGrbjvg9s2hB8D7bS/UYpEFIxE0UtX+OW6wT8CygD4jjTCCrz
	ppHJFQI5BxPteiSYYRKGI793giIIVXEPFcKrYGGE1tyNGI8JtxnlHkbnDxZj84JAtKrgYV4dni+xR
	Ys5Cd8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31j-0000000D4GI-1S74;
	Mon, 02 Mar 2026 13:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31h-0000000D4Fa-3bQZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HbpBDECGTuxrjZK2784Rn4svmYdxHMnNQNyQJ/QvvFQ=; b=ooY/zmlETkYqi92IAjG0LqSsuf
	rr4CFu29TPKp6KBNKHhhx25NwHqW1+ODWxz9ztwezZVL46CIt1x7LU1jIPu2VRvA8wBrnR0NjlUsP
	F54Jo/z5pBm9SlSRg3hrbihS1SQi2MJPYm2UxqhoGpidSlmKDSB6CVLLPp6onw7lp+HSO8tZNfj8k
	3n4IWTwTPIq22cgonIFM2LMXwnQ+dV9pOiMk+cRZu6f4shXvu/pRcj2DRKIuaFoJSzBSuKvjLhNPx
	7bOxufa5hoTPCzD03Xfl7ThJ6sDOnwSbbtRT6Jalvap8OJ8QGWC3CVHkRwUucB4ZmdvT50UEF+7wo
	gUqAexkw==;
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31f-000000007fU-0ds5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:09:32 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3631303e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456969; x=1773061769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbpBDECGTuxrjZK2784Rn4svmYdxHMnNQNyQJ/QvvFQ=;
        b=dpU4qPpOzcD2bXyzqbE8jFXoT4YDNRJoec0r1AwYtHNVr9sCOoMVXWHNrWKod/MemK
         d5KOcPDnSoT0ToMt5ql0xR1VAUmo6HqokxkcBar8Nr83cQp6RXDI3ssQqGwRdoFWpisE
         w4SItPC39EFH05HfiZ9ERnaTnYBLkY0bt8qY+0MtpHGj9dbRBKEX6TH3a26AabCkwVYU
         FgSQcsYu96ev+ZgxPju+bmpzc1eEIOYrXUNli4A485umrnN6Plkh3wGNA7x8BaO7KVdo
         bOgjveDSAgvkFIHlnpekC2gjZPvSSiC2XkOXRS0yCOQhgIkaJGsJ93/pqXU13c2R/riC
         MnFw==
X-Forwarded-Encrypted: i=1; AJvYcCXymq/7/fGdU9rSktTZV0GT1sN3kEDEn++WX42nqrD7S88N/IT2VZJwJYve7vM/vp9R2dFX1IhFzyRnmoTDOSin@lists.infradead.org
X-Gm-Message-State: AOJu0YyA5sd/W1Fah5Zz1l2vp1Dvzmc/t185TT65Bn+mPTpcvEScLFHs
	r5JuEEe1vLiQa7byENxxwJ5UlL1mtQDdEQDHRBtoSi3VgqSQMlo9UStk74RW8dLS
X-Gm-Gg: ATEYQzxC8MRfiiG4kst4I95QGznMt7CPADVxo1lTTPJ0MfaIgr/t33J0d2uperqJg5n
	SseNg3ceXMSMPWb+ewu5nELCc5Zu0cM90d4EejuIMVXrMoA4cRhuFtuPI1oAYGQl1wLOIboDl6K
	kifyTzzd+MJimzG4fH+kFR1/dyGXoJp8cb9tJMETulS/E/h22KXRBcrJf56U6ymj6nsukWknn5e
	O6M6gd7wNDOl92iqldE40hzhWs6lCQIz70TZm0ln18Yn8nrbwdsJGikGmvM46GOoYj4zZiOfqCV
	7R0k5RbAmyAv2I6gz81phxFqY/8GmSlpLNDa00Tzu7w+KMwOpUWbxe/R4AlqhTLBq2Cl7INmhi5
	NtqJrZREBvh7VyfS2pNJLbLhSh+6NoD7SH8TDK7lSjF6EEOpsTI0LEYSMZ9qIZ7VhyCRgd8s0M8
	fGlJsDvWuBoi1EfSNeq76smOvtnfr8BdAaIMsGWnTJn+DCuiX4VdE+T2x2AlKRc8nF
X-Received: by 2002:a05:6122:4b08:b0:566:3c58:efcb with SMTP id 71dfb90a1353d-56aa09ebdcbmr6195511e0c.3.1772456969096;
        Mon, 02 Mar 2026 05:09:29 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ab4aad2ebsm6657682e0c.17.2026.03.02.05.09.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:09:27 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a8ebde349so3798496e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:09:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzjAHS9gY2zkWxurQzV1dU4z9MwXEhh3mC6+snHkS+N8SDl4bxsdW81jgrxYg6VFCzV0ogesLh4yvQ7qu/+Svq@lists.infradead.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6199626137.27.1772456966817; Mon, 02 Mar 2026
 05:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com> <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
In-Reply-To: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:09:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
X-Gm-Features: AaiRm50gWrUOn4xlq8V0dsaXBHr2iE-RWJy6NrWL5o5U_z-q0G3KqmZt-0p4hrs
Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_130931_303031_16BBBB7A 
X-CRM114-Status: GOOD (  25.62  )
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

On Mon, 2 Mar 2026 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Move needlessly exposed fields away from scmi_clock_info into the new
> > internal struct scmi_clock_desc while keeping exposed only the two new
> > min_rate and max_rate fields for each clock.
> >
> > No functional change.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> >         __le32 rate_high;
> >  };
> >
> > +struct scmi_clock_desc {
> > +       u32 id;
> > +       bool rate_discrete;
> > +       unsigned int num_rates;
> > +       u64 rates[SCMI_MAX_NUM_RATES];
> > +#define        RATE_MIN        0
> > +#define        RATE_MAX        1
> > +#define        RATE_STEP       2
>
> Any specific reason you are not using a union here, like in
> scmi_clock_info?

Ah, "[PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
dynamic" answers that.

>
> > +       struct scmi_clock_info info;
> > +};
>
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -51,6 +51,8 @@ struct scmi_clock_info {
> >         bool rate_ctrl_forbidden;
> >         bool parent_ctrl_forbidden;
> >         bool extended_config;
> > +       u64 min_rate;
> > +       u64 max_rate;
> >         union {
> >                 struct {
> >                         int num_rates;
>
> You patch description read like the actual rates would be moved
> from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

And these members are actually removed in "[PATCH 05/11] firmware:
arm_scmi: Drop unused clock rate interfaces".  Please reflect that in
this patch description.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

