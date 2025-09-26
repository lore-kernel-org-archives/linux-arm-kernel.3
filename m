Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E444BCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh5uxEyK6OvB8UynZ99mPLkC/3fYPS/LIg1UGviPL70=; b=iE8HcLIxvJwINgB/0ZRw5d7Evq
	BnT+kyIBrtC9El/KUOLwA5MPsqVRkdSOUpkTDG6tEdP7QXPu3Ub7d3L8wTjPLp1Ka1iJ800imVyE9
	txXFdDl/Z1VGkQaeuseUKoGQQ6Lls4lMS7WySCRLQseIwIAVpLc9f3cNsWiBdstk+LEkkehW/GZyU
	9zcYidhKaKVr+zHl4s0dl1wTVd/ThvzvvINUW9cXz47cXit9Vh6jxC7Nf869JYRURHGCY2mwfKpRR
	5puDA4nbRiP7i5gPvRdo7w82blvGIMBX8skC7xABtOLnp1vk2f49emLjqbKzBM7dUaI8gIoqoyJaZ
	sXtEndjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v242A-0000000HFSH-0ESe;
	Fri, 26 Sep 2025 08:42:30 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2427-0000000HFQ5-1ieg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 08:42:28 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-905b08b09f5so631677241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 01:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876146; x=1759480946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh5uxEyK6OvB8UynZ99mPLkC/3fYPS/LIg1UGviPL70=;
        b=LqQ8GPw0GglxhEVQD0HoZZgNkKSYrzXPEH1hlRAqbwLq9bU1Cz43ehQGuMrIPXnTiT
         8k9EUDdiNX/tWoRZpcpeNK/EeHRsaZWjvH79qpVoFjKiTR8semqHt0f2PaOy69GFI1ln
         sZWi8vPi6+/GEP7dMCwg7sq4X+mLrt6+Nm+5m8DJ4M+lukSwfTpTCiwUu7v6EtJM6/Xm
         u6I78rpPlS6lkMqHwxpr+leKbqkKCDPcwIqlxXKSearwDksjkz31dVRzpg6xUBSZmwqH
         sRTYPkAZkETiPQt5y9qAHe9SgBtJXIdclpO+KdFkRPjPAwgGjQh/MDaKS77jN/F2Giz5
         C59A==
X-Gm-Message-State: AOJu0Yy7N7+Qt7fkvBzYoAf4gf1ifecjJ/Q2NMayg4Otz73F/IGotyKH
	5TEFesxXP9HlDIzz86+V5J7avU+xvIt0zyw30eGOFqacDaDJ6qy/XUm+jq0dU662
X-Gm-Gg: ASbGnct0D/43d+suzQ9htNGfm7b7hfJON/x82576qWHh6MbQRM3jXslrYg0K5Sb94vd
	MpYUZR0crTHgBmrFRcJotes8AfGTsljMVtdi9M5tlPMBUPncLbkPd2aJN3XG2QYM6xHoZ2Q+nlW
	8cOCmpQ3ydjCxa3oG2eWdeem//NBB/VkV4LlfvGPkejUyiHEEQU71faSFJ2GqWwi/vhQBWORArd
	gwhsjmtTmkdM2KSLMiv85aGtliWXFLGwO/i9rLR8XpURhJ+EIoXgkxr/mVPvKnYUYDH5mAv1sGq
	Execz+fnh9MzOWDB0ld3jjuBIZLAs9gu5JsxE38Satvbl9NLtveGBWPrjqhJClFNfwqwXnppjxh
	95atZqwehYauS1xgkcy2W3F+99pD/9H7yjlps9tnGq+y2MaDTBOp4XZPxDZBVBnN2WdHUEBY=
X-Google-Smtp-Source: AGHT+IE2McYaLl7j1sPV/GKyW+ZpZ7koEPhjOL77h87c+iFsY6p8G/fvsLxsPbi/ubVmH8ZMPQYFaQ==
X-Received: by 2002:a05:6102:e07:b0:4e5:980a:d164 with SMTP id ada2fe7eead31-5acb7e5e7c4mr2747438137.0.1758876145971;
        Fri, 26 Sep 2025 01:42:25 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed8b2010sm788704e0c.12.2025.09.26.01.42.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:42:24 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89018e97232so498114241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 01:42:24 -0700 (PDT)
X-Received: by 2002:a05:6102:41a4:b0:55d:cfa5:9d60 with SMTP id
 ada2fe7eead31-5acc6805581mr2527265137.12.1758876143956; Fri, 26 Sep 2025
 01:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 10:42:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+X47H=_7y8rXGkXU+wCXq61LgD_VyWw-quq3O0KBzQQ@mail.gmail.com>
X-Gm-Features: AS18NWDJaK7VikVNhpA9q5HvjdDy559ovF-XoDoqQf-Yk5Qz5FJG5_rrh8fqJYk
Message-ID: <CAMuHMdU+X47H=_7y8rXGkXU+wCXq61LgD_VyWw-quq3O0KBzQQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_014227_452018_22447689 
X-CRM114-Status: GOOD (  17.69  )
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

On Sun, 7 Sept 2025 at 18:11, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
> Sparrow Hawk board. Fan RPM control and full RPM on reboot has
> been tested.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: Depends on series:
>       https://lore.kernel.org/linux-hwmon/20250904202157.170600-1-marek.vasut+renesas@mailbox.org/

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19, with the one-line summary
changed to "arm64: dts: renesas: sparrow-hawk: ...".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

