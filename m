Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7EFCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8RVPbEFOTSPlauJwisCB+Zu3o8p13fOLSh1Yr+MTZ0=; b=n6GoVi8jL65ReEDq3aTzyM7PqR
	7eoqMTxwAKsCgQQsh4UszQ35InQEekx97z++08l92YTxrtL+mL55ffxb6BIx6j73ZoCjPR8p85Myl
	lMm+ULQLZrF2OJgbxa+lLUVAKgkd+zNqolV4wNJ8vNrGXuO9GoX/UXzF/kl7GVt4v4QXDJm9dMzNo
	4e9CZUW8G3gOX8uvN/3elDtMMK0JZEOIyujvDtamLQpf2VSDZSb2x577AjG6D0M9kH4Y/Bp7ndd7F
	GhmS4iKYN+O4LgDlEUVFiZFb79wIqQwlWwREyPPF3ppKd8pm+HOmegX4CXm6DTF6LC9wxQrIf6h2A
	4a+k2bHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRCe-000000008iQ-2Bpy;
	Fri, 05 Sep 2025 07:49:48 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQL5-0000000HPMu-1WW4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:54:28 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-544c598b9a4so617642e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 23:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055266; x=1757660066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8RVPbEFOTSPlauJwisCB+Zu3o8p13fOLSh1Yr+MTZ0=;
        b=cqY+UB+fsS81lJCKOm4Jm9pgHbeeh1Lin4APy5pfqiLduVmOtYZ46r9k7M6rJMpAL8
         FtPnmrvXFaHGoYWxvrVSpRtLMGLqPJJaC5+7w4/LQtt+O+myol/9sZmusBQOARc6BI/0
         scQCu9rZpzH4d7YOXF/PQIA08yh35/HeMcn9fcsdp6MdjRpU0fvoS5IrDbj4kqPqYu4P
         akfMYVPAMWAd2ctEBomc/mmETgB0UQp7SvMVJDvG9c0rJGnW0t2lyL3Dm06YDqdbyZHE
         iVEb142NN8ggVIXVqmZ6CWhFPB5bvLf8dpCSmeNDV1eVfrVglF+9Vr+XrXcEKNVYsxVS
         tTtQ==
X-Gm-Message-State: AOJu0YxH4Yxzynlf293PqBzYkDP5diPUD8BrQutyqq1spfuqBDLcp26x
	yzCSeNloc+B2PN+pidrecfJ8rNOI4FxtM23dtd8z8MUyNXMxkmXByQQCimxHevnE
X-Gm-Gg: ASbGnctoEJ08K9lDiZ3+qUM331YIJxcL5ARgQHBESSF+SlcJXsxg4lfPtZEU/K22KJ/
	2E4DBKG5CsOW1Nqhacx6vSYH+TqJbDGE5tnH6mYp221Di5rX1w1elXofFTiHfk2GYG52IdmBgTk
	iIb0fdBAi71jwNqleo/aT0EbLyzh3yVET4aqmF7gMJh6p0/c4P0hVU/9Cxli/xW5w8wYuSkJ3O1
	35t+D5XmmM6ck4qBG0BeTq2Vzy7N11BtLIZi3AFyRcRnxBA46IuJRfiA6y9g/bgF/UWiF3R08uS
	wowshG1EXJtvPai5cJ4c2k1CYULQCuvxAYJaFf7A6wOpnxTIRAGCBDjkTbpaf7AHwARN3znhPqy
	78LlXduuFB1QYSMAQdwVw4eDmIzFDOXSpdvYfTbEtJ9LH+VgHNvPRCJfEy1S7
X-Google-Smtp-Source: AGHT+IE66DsN+NRwFd7gUzU6UPCs8UqaiViwMUEh176F4ETlMoZE3wMuObcp1RE485aV8QwQhrKZvA==
X-Received: by 2002:a05:6122:8c0a:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-544a01a2db5mr7278620e0c.8.1757055265900;
        Thu, 04 Sep 2025 23:54:25 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464aebsm9537740e0c.14.2025.09.04.23.54.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:54:25 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018ea5625so446281241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 23:54:25 -0700 (PDT)
X-Received: by 2002:a05:6102:38cf:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-52b1b709618mr7043507137.23.1757055265355; Thu, 04 Sep 2025
 23:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250904222806.193260-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904222806.193260-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 08:54:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUN=dSz2O2B9UZkEaDGBmb9srFt2NKtDpHhRnLkig0XcQ@mail.gmail.com>
X-Gm-Features: Ac12FXyx5e_elYMrDnBinRvBEkJ6FCNigNEPMLGI10BsAiTc3HfuEbdRhjWeeNw
Message-ID: <CAMuHMdUN=dSz2O2B9UZkEaDGBmb9srFt2NKtDpHhRnLkig0XcQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235427_402823_8122FD3E 
X-CRM114-Status: GOOD (  16.27  )
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

On Fri, 5 Sept 2025 at 00:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fix SoC type comment in the PFC table file, replace R8A779A0
> likely copy-paste error with R8A779G0. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

