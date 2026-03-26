Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6539106F317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F94y0mp+/D6GVV7M4ewGzosByGn4hznQhChrZ7f2x4Y=; b=dNT7JEdmVb6OVwvqHgWZYURWbt
	74i1YuXL74GKT1oiqNjQVzGW+zBCjSXk1Ypwgf9dsGxttBgDnEUS4FLmfj0wnBEIYb44c5MyfOW0C
	4I3JyMeBrV0K6amgTGoswb3ZbjcGXMOlW3Ke5Ny087jJBL3djKykabhGpYxVu+MzQm505AT7bczak
	X/06NWvzynoU22z0w6MTr3GFi4z5AintfU33mfxWKoqwPbEIwOmDkA9y/kzexglNscrTXDANMePqJ
	YwzQgyjIwOZGl9pcCnFc8ctUYSNZtNtPB9/VSMn8X2ZFmv++4r2naBavRy3p2pESvog/j0yDmAKl7
	qoREeBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hd4-00000005EfN-1hxl;
	Thu, 26 Mar 2026 10:07:54 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hd2-00000005Eex-0Foe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:07:53 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so292483e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519670; x=1775124470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F94y0mp+/D6GVV7M4ewGzosByGn4hznQhChrZ7f2x4Y=;
        b=iRn4H62WV6ipDEmOOdYOZctD4WYkszJQqnmt0ywZpIZsj15/vt03TEN4IH21MULif3
         AqyA4UZbrGa4E/l7Vo40TR/njrmFcvog+OZx3vs8aAAqaAd9G2dW0N1wupWBnfqPBGt4
         O6ZxdIuThcoMK+lE0PtBMUkre9cCuE1k8kUqiUE3BfPpVbw6QTDXS+mZX1uA58tb2AtN
         UhDHoHy04iz1xQhGMULAwlEeb2M6SheFLOMYEUVz2y9UkTHeR3TewbbbVFPNwCpg459M
         VBP5hhwem9p+dik69bLHHRJmINRhPdJ37hNhD7ede9GKQQMsGVaYtury7BXAiz+jbAYI
         IOKQ==
X-Gm-Message-State: AOJu0YzjxhEd8zIoxthV7XP5RumwgEoQHqxCxkuxKk5aCNSrLs05nRQa
	AxkdlpYtooxTsQc+QyGKjIz9zJo4O5d12zbIgMZU50qV2mto3mBdWmU9VfguW4ZCFpM=
X-Gm-Gg: ATEYQzzC32R4Lz2mMU/zrcvaKbjG4VcCtAUSeVmrIhfzoGgFLBMuS4J5dGzSdM5pLVD
	radD1JGaZzW2uAmRkQCo4g6i7RFIevgXTXGEkWXrYcx4Ha5WIRC0sL2cJkoHNg6nsm9R5gmLjOM
	vRhfbVjkSnfu/5AexFjqGFw6I+UioieNka61d7jt7hDGgw6zA0n03vlzDQEbRSizNFPwFXa4RTI
	7e9oq3AJnuOFUXnd3KDle7YfDPF9XUEzluAF0OZzzOZ/94syx703cVrHFLp4smZE74b/b7qsTDN
	c2iek8afjCx7jJkONM3+JpGZbW1i/nFywk6e2vhTgxgLuKigv9NwJQVgEUrhlCjElJq7dnvZPTB
	CNPggh+OUlmxE49NtsXhI7maDz1YywGNMGfg+3kzf8aVs0iKVgZ40abTKWr/4bsloRdKwmHavYN
	TaN4tNEwzbGDLF4nR3CR8kRlZA73W9voSeiueEo3SItMivfrzjrhv8p5zs5Uu/7SLr
X-Received: by 2002:a05:6122:905:b0:56b:1042:a24a with SMTP id 71dfb90a1353d-56d220ba1fbmr3351121e0c.13.1774519670283;
        Thu, 26 Mar 2026 03:07:50 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf74basm3847737e0c.2.2026.03.26.03.07.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:07:50 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56ce5c899fcso286264e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:07:49 -0700 (PDT)
X-Received: by 2002:a05:6122:3387:b0:56b:5e7e:d3fa with SMTP id
 71dfb90a1353d-56d21f56bcfmr3191484e0c.7.1774519669709; Thu, 26 Mar 2026
 03:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:07:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
X-Gm-Features: AQROBzAkfIER99cc95oQTkegA98ufjqQruJaj6kJ10lCtG__AGEprt5eHbo-Ac8
Message-ID: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030752_123204_0EF775C5 
X-CRM114-Status: GOOD (  17.28  )
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

Thanks for your series!

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DTOs to fix warnings like this:
>
> "
> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "

All of these are dtc W=1 warnings, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

