Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69719C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF3/2kfrsJYjoCEIlZrwDWAfYUEZcN2JfotI765XeoQ=; b=aIa2rGSlUfmserFZqTMqAWCv+n
	dV3NCzIHWlsweWI2aaIQsKBa5bt0PUkHtOSll2nKmBWALJxBpVKdudwhXvqgwxdiiJ7Wt632oFjwg
	trXTT6NsLnjaDBggRYDqVrO7KMkzIQNhxm7zQoD7iUzqbCNRU8iWbhnHStEXAlUOCylFLCjoYJk3g
	PosI4nmWrgjTIgCOFzYsk8fEuHZVjIOQuaOwAK5La2SZM0RaWBJYOgicWMu8RRwtMnAn+smui6V07
	86dK+jdzn1cj31DIOshOQ6SuPp1LzqLJoIiYsgd7i8EeT5EHGEROtUsIZWdddeEeGi4JAY+7m1ypN
	evVKQ+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidUM-0000000C6rO-449k;
	Thu, 13 Feb 2025 17:59:02 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticgz-0000000Bwr1-3PQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:08:02 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47197412ccbso17475671cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466480; x=1740071280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF3/2kfrsJYjoCEIlZrwDWAfYUEZcN2JfotI765XeoQ=;
        b=Zwn88dcj7cNgQX+MMEBqMLpWDfFR5f9+X4lKeH/L2WJ//XLnE+xKe2Lu8uVIaCYBCw
         1yrUz4+wW/jfpOp9a1Jp0R2kSLXFgV+nAPFJc5ruic7Jpl+w1nP60tb7859HVUkdeY8K
         XvcEaF6p+JQjwuLtIZgBJkJFeykycF08wb9rsbALutKhIkY/TWK7f5f4de7pMk91JxqD
         TeBD7qS7cluW3YAniff2B+umgK81NNM9M/KjfOhZHjKnt8ztXeW60ezQafsEznsaJU2Y
         jkNjJ4s+q3Z5cS8/fOWIp3+ZBgBvxzISOrEhT+FP66wk5jjDI5RGpFoJEDsw5PVHiwuw
         bs8g==
X-Gm-Message-State: AOJu0YzwpGMY3rM1TF3jHG6jzgq3kbg9q3kERaOp2G7/EOGM9be22Z0G
	3ywhdEPBkSQtvoni+BAsMzdn2WAuQrw+biiJGI2uccSY9517YrNGzeGGvPMHCSk=
X-Gm-Gg: ASbGncvnzdphdz7SXGf/njA73yGN1W79AcFFMOAdu3Hi67HsLkthz03FFobAYi1TQRL
	gkR0yDQTRQskRX9KZxMKULoe5Ahl616MQK1ihGOIJBu4DCZYtbPh6QQCinL6GVyF/YW5RqUgaKF
	bd+FREK/ul/WX/Bmh2l8hPhD5d+TRW2A3bV2Xlgo2SYMq8yH3yeq4YVG/e9bQgMEIfn5LyHSJMZ
	KkXp7jH8uENDzRh2gDo9kVnbOn/a89iX6My3rRj9bh9Ip2EXwE+TXVlC76LwspIWgIgLPANVKmC
	AJ7uw13k7AQct6ex0mmOc+7WbPSA7g6yO+wYM+jaBtxfGoF9oefL5A==
X-Google-Smtp-Source: AGHT+IEb4ze8WX6+1fnnB8UhNhDlcQaJ6cvZ+D6lltDVjRDxM5z4cJB54eksQ3g3aVf6nm+8d2mR4w==
X-Received: by 2002:a05:622a:1e85:b0:45d:8be9:b0e6 with SMTP id d75a77b69052e-471bee35d02mr69925451cf.43.1739466479667;
        Thu, 13 Feb 2025 09:07:59 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c29e923fsm9797051cf.9.2025.02.13.09.07.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:07:59 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e46f491275so19113016d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:07:59 -0800 (PST)
X-Received: by 2002:ad4:5e8c:0:b0:6d8:9124:8795 with SMTP id
 6a1803df08f44-6e65bf20a4dmr62008406d6.1.1739466479037; Thu, 13 Feb 2025
 09:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org> <20250209180616.160253-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 18:07:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBNtxfQiOK-KMsibdKHyr5mN9N+hv+c1ABaiEZSPbWjg@mail.gmail.com>
X-Gm-Features: AWEUYZkos6MVmaIXRjsuTUlAMc2WWtF5h5-89JnjDflsSFca0ymwfS_ZVV3LF2E
Message-ID: <CAMuHMdWBNtxfQiOK-KMsibdKHyr5mN9N+hv+c1ABaiEZSPbWjg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: Add boot phase tags marking to
 Renesas R-Car Gen3 and Gen4
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_090801_842361_93484920 
X-CRM114-Status: GOOD (  19.74  )
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

On Sun, 9 Feb 2025 at 19:06, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas R-Car SoC.
>
> All SoC require CPG clock and its input clock, RST Reset, PFC pin control and
> PRR ID register access during all stages of the boot process, those are marked
> using bootph-all property, and so is the SoC bus node which contains these IP.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

