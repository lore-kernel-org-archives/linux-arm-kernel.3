Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333B9F33817
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1dFAsgiIjJwbzkv4iAkhLhnDR/uX1wmLjNNPR+w9HA=; b=DS1odFcuDkCGExPVab1cS6PPcF
	/3dPsLQHTfnQCOgjtwN9J35rzCN+Xw+TIf0mb7pnAggpyB5ychqgKLN7m3ooTwKdN2ZDNG9C/JJIC
	Jg6jco9UsrI33rAbj0ScOtMiLabqvYuG8PlZA6Q98nC3+wgK1/6malWMODNuC4M3gfVtdoAAgj3/h
	XzFMg8U5RLJd+hN/XgqCV7w1WfInHLA+t5h9UXCC1Eqp/4tgTGOslq3MFbEgZ3DuPHEcoGc7woIwk
	BZnOzqQYtlBRiNSpVOJuhtXxJ44iZ+bdRVMFNX4cVtftYfHKeOf+1UR+aB3i9q4vucyagsD3xMV6R
	qaZvl0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q4W-00000005kxS-1QrM;
	Tue, 17 Mar 2026 08:46:40 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q4T-00000005kx2-44DC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:46:39 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5674d8be45eso2051172e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737196; x=1774341996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1dFAsgiIjJwbzkv4iAkhLhnDR/uX1wmLjNNPR+w9HA=;
        b=MrM7nkPbtO7h+saQ0eaC1qmpubQElfm5czjO6pXA1Vurv0NIiqY32J+tzmN4YxuO2Y
         575g9ZjLa9p9Hl3pqngUgqZ051ECdDTaqYWHLL9KYI3wBKq7R6PN2VOQw2jQSMN5viiA
         jDbLvAxdtYad5Tu8RLatYRle2tIsSaFPwCfX+y/LihtNgk8WLTwwRzAUMca7WrwuIVkG
         aU7Knh1eiumt0+Ev1iAmEZnCcR7HUq6PORACsObfG9nfmB7yaPEclqcV1cTYfbgdfLv6
         BjoobFzExHAMdWrRY8dbuBGuaGuoNQ9Vi9yBP2mT07O3tw7QUj9cySLzEK78nquJo/O8
         4hhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0/bgUzw8TZZ9QlbWcxf1bZwQ6WGLmHYm3Vw/R4874d8ifJyOCWv4jPSKwax/VhKgEU8blENXNvlZ0eGmn4H2Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyIemaq4wo48bskO1uxxMWvmL8LlCrYTcOMDC5b/9H7fnIAGnyM
	l3MRTJgxgjuByILmkSGJkPf04DsDPd9Ks48o6m3wa0vRyCwJab1GXatI1U5/FLjF
X-Gm-Gg: ATEYQzyEk6kyXtuIhpfBX9EMagA3hfQg4yCbuYl5uuHpjitrgxwR7QD7fhBYis1WmG+
	fIZJoDOkJ0XyAy9vqrO4ydhR6xfzTpFaYP62zxtngUW4sNPHhUU3bQtYa4g9prYUKa79xlb6IrK
	n3f7QIG3d/cTugoTgL7y6bpURpNkXpfQX6VkfaW/cdzHATGKh8wLfoGJAD+jTeORcugzhIcTsFf
	yqJYndY+gpt2QJTWHQ4X8ig6Ig4fHlTzz51GiNDoVKW1NIp5nbrOPXUj55vq8Vq3Vr6l7Ur2dJL
	hxBNFNS78HnYnP/EM8EU047MONvPuAP7Hyx7Y9ButWKzG+oBBmnH3E7E50NSswvDZWXpRfgkbz3
	XJItXuBsmSLTYlfHwQeyKEjfh1xKfact7fVFHSkyqCdZD6iXcErR9xSbfQBkp4tTc6wJ9qI7Br7
	tUMhN1IWNTDSEvx7Osd4Z4pCK9xKm18Ut1xL1cKmBCFXqBfcSvehBWATV1N45u2LPr
X-Received: by 2002:a05:6102:ccd:b0:5ff:d03d:7815 with SMTP id ada2fe7eead31-6020e2137c6mr5928652137.5.1773737196020;
        Tue, 17 Mar 2026 01:46:36 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-950db2b28aasm2129068241.7.2026.03.17.01.46.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:46:35 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5674d8be45eso2051165e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVt2gDzG33Pusec3EWSnXmCZVYT8xfn30Szu+i0lBPPyV8mAr/9WIU+E+QmefnAaqPLGSI5E56EcxA6jLtBSWDF@lists.infradead.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:8b8:9f89 with SMTP id
 ada2fe7eead31-6020e682490mr6012940137.35.1773737195424; Tue, 17 Mar 2026
 01:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <20260317-spirited-mahogany-swift-b1ac53@quoll>
In-Reply-To: <20260317-spirited-mahogany-swift-b1ac53@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:46:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
X-Gm-Features: AaiRm518-F2BTcrALlb72his_SW49wZkbqH0hdFeWMeWLkKc2Nwvr-LXzIlrumI
Message-ID: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_014638_008194_D06B5DFF 
X-CRM114-Status: GOOD (  20.96  )
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

Hi Krzysztof,

On Tue, 17 Mar 2026 at 09:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
> > This is my first pull request for the inclusion of Renesas SoC updates
> > for v7.1.
> >
> > It consists of 4 parts:
>
> I think pw-bot did not reply to any of these pulls, but I applied now
> all of them.

That is correct: no replies from the pw-bot.
renesas-dts-for-v7.1-tag1 does not seem to be in soc/for-next yet,
perhaps you forgot to push? No need to confirm if that is true,
I'll notice tomorrow ;-)
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

