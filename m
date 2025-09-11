Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F1ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNwKnllKcgNmSxozD/+n9dLn0I91saVxOj9Y59G/HOU=; b=QsBc75RPBudI8d3MX8oysWaLYv
	dHe41+sVyTFBLQC1BzUmfBNZsrZPiWu30ItA3qt4YNDex20HPPguMWCIIQoKtYwQQHwyMDLGE3ezT
	LPBFg7g1qbW+eQ+Eq7kWjFIpdTeCfnGxenafwUv8JjUwGOVw77D+5drMI+/IlT+w2Jgw+neq2VZAx
	1atu2BtgCI0AmzSPI+UN3ylFYTOUk2XcwJMRxneSwnTsSlkM8CJwvvHfImcOHJ5Xpbv5FZypRioeE
	d20tlMU5tEkoXRkb+YWU0WB949uIcY0ZaxXihbad9a/6+v0zIF/WkqMOC/dRTKA+SJOnieNdGfv+L
	6J0vYNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwl6N-00000004TPS-0PV1;
	Thu, 11 Sep 2025 17:28:55 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwl6K-00000004TOj-0AvL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:28:53 +0000
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-53410d0f4e7so762346137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 10:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757611730; x=1758216530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNwKnllKcgNmSxozD/+n9dLn0I91saVxOj9Y59G/HOU=;
        b=LmmycU20uqyo1mki+qZHb0Iwlm0SL7C9yyPlCN07DdOKlvZmssZEB02R7xy2PrtsrC
         JY49wi1tRHgj/H03ITqux60gtjhsqaqfL4esnNOc7Syz8prAfzZtddUhF9+6QluJ5ETw
         3HlUPiGiD/fq6zLnB1+RMPI9IalPjWHegUqLNbg6jQLqTe1nFaSv2wAGGCIOn7QvBPFE
         UXJCZBUoDkI5j9XVH/OInFL2PNwpD5cFtuJ7AIQSCIbCdh3paZ4eN93ccaQEqW6HTcrl
         wh/QMLgNnzClusjeqOEmDh9u7UZsK572Uxo8NzDmy1s1qSEGncF+I88BG/8Q9BsTTzjo
         HirQ==
X-Gm-Message-State: AOJu0Ywnb5EK6wHSaXAFdWRr+JjnNIfaX3fpfmNoaqsNx0Dt7u4F/Q1c
	koGU8M6ETdJVDdXXq3a0DPAP4CDHYD13k1wvtK+6Cn1hTEAtAgUQt/mK+iNnPkEJ
X-Gm-Gg: ASbGncuqYFcnf+nVUilXTYO/9t9m4EgeMCgoxKxsGIjlDPdHnDIhoy4izjIxfXO2S8Z
	gRQ+1ZPYwjqjPJH5vYd5+c9wUnxVY5lVbpnRU9seUwoCUMTNXq411WlE6drn8xS/LOp+D8U7fAr
	hyfX1+0fThg+8B5wH2TsrTxOYCKOKSXaoP6204N8ixuj42NbPWM4Jv+UvyfSofZZNOBVg8vdyc/
	mhiCB3IC+RncTu8ge4jWOPs0TnQk4tGs2ggYwGOOSpn7hMXFCjiwbntfjkYdU4knSkhCHSutNkn
	7uwZEWfmmyF9UOUyqssqeKvSoYuYgu1BtgRdzlexlSPCLCGNQwsscQy1barrINWG5MV9FZuWADP
	PCJ/TkvgBNqZtnn8CtMYrp4btC0lO53wMrWhvr5V+orqZvUPwfWNFbDNLtKrS
X-Google-Smtp-Source: AGHT+IGX3w3nblgVULI2terWtVKh2VLO9zkw7M1NNBs9D1HJNPGCSeESKraoI/R+iYY7fxg0s6A4lA==
X-Received: by 2002:a05:6102:b02:b0:522:1013:cace with SMTP id ada2fe7eead31-55607e2bb0emr227602137.10.1757611730248;
        Thu, 11 Sep 2025 10:28:50 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5537062c9c5sm460688137.5.2025.09.11.10.28.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 10:28:49 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-890190d9f89so560423241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 10:28:49 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:4fb:fc47:e8c2 with SMTP id
 ada2fe7eead31-55607e2ba72mr193657137.9.1757611729558; Thu, 11 Sep 2025
 10:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 19:28:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHwp7EiVw97CFZG0zmcK3opAgO-YGcdSGRaF3tGwgLcw@mail.gmail.com>
X-Gm-Features: AS18NWCqPuEA5ue65D37BzPjM6jGqyVU7S3WL9hosSlR-Z0YeWoG17bjv1N9sFE
Message-ID: <CAMuHMdUHwp7EiVw97CFZG0zmcK3opAgO-YGcdSGRaF3tGwgLcw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Rework fan hwmon comment
 on Retronix R-Car V4H Sparrow Hawk fan DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_102852_082639_35341692 
X-CRM114-Status: GOOD (  16.83  )
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

On Mon, 8 Sept 2025 at 00:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Reword fan DT overlay hwmon comment to accurately locate the
> fan control sysfs hwmon node on Retronix R-Car V4H Sparrow Hawk.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

