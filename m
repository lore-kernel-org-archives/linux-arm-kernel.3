Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510C4CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=; b=Ptg6zo3GZkJor/0ISscGhLPvSs
	WF/LkoV1JypedpTVnDYISnqCWNjxqaVj/cq/0uV5+hFVo8EWR4P6oWs7XVkODYgXzVWxo12txb6+W
	VQ2ICYTpYLUW/JkLooqKtKILS2HoNt6BNwKU6N+YWn1+/TXrJ6kAQI1PTiEOmitGpX4Jdb2TL2zfK
	eFnEK+oWud/9hqThojqQy6DxQLJ+DsAflaY+WZbuo0GCfgfi+FHVIlutIcsRvS/mrMRJnKEj6A570
	QaVHaV5UNjHQc/045QQ+3pWBonNuagrc/XVTGIbbKAPA60TGeJY4jmfXFjvlOP4KQJzZI0Io1sRhg
	C+IipsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ0R-0000000AzG2-3Rih;
	Fri, 22 May 2026 13:33:39 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ0P-0000000AzEz-1Hxf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:33:38 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-57754ec3462so4943080e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456816; x=1780061616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=PPFtB3ZVDbTKalBM+iFWetlO6c0qVCNw0x4lPNqdMhX/w+M7r8OTt2LsWkwjz4YwmG
         fA0hSHD17i33ApmWt6HB9uCEZhvrYxV+JWLp60gasonbadrkvtuadBXXN/a5zQK54BUs
         2EZkXMYPSS2uWmzNQEJiwfTWJozxlbbpZ2qi40gbeU5ydWqoJm2KX0lUkSE562ZAWctw
         7ojDUOS8/KatwZARCl+i1NYZJTey6FNcEQy7Drj5lNX8/wZvjVu5Mm/E1YJLOao64ei/
         jXpwyFTBxjv0Gn4+mbSvXhKEutssqGkPeWHqBX2CDseQ6qdQQ8GqiXc3YGUO4RPTw46U
         HD9A==
X-Gm-Message-State: AOJu0Yx+Gdm4HTTZiRgZjQrxzH6LApet26o5Z55f4yYNULcjyDyRgK6b
	ehHyTAm6rDIJ5z5yjHva4O8Di6fHU2LZYKTObCdW8F2V45vWi0pQtsMr41Kz36nkZuY=
X-Gm-Gg: Acq92OF6Hdhp+y1wUs2P8PTmyvQsugEDfVukQ/kCOfCJG7O12K5pvrV5zNRyOkzMiEG
	BXTY02n+x85fBUur7PoU5cOT0GOB5wwGGAew6H/IiT+q1N7sHhTBu8aDiegI0xwQ07gpkVcSV0v
	iwt4xWudLYvr0meOLcg043Mp8KhPZfuFGjpzdBM1G3pzoX+oHa3yH5aFLsbuKDUfA6vN+XrBGCs
	FMFza4/X5g4LDmE5Bq1k01aWsjYdxqfXR/DUSQ6AoV/RV50PYnb+M4AixO3Kf9mAt4AZK6+/tSR
	OK/AalAhkZqWZAZYdKiNJ8iEspJhzUqNTxK9KSGeQMLI+qhjBFe1CsLRrNFQgw1IMx9dLgTCNnA
	EANZZQjR57UwjdHGyPO68SVLLhYaCfth1aUEmXeTER7OnyGvc2HP/jjZ3LLHb7ylBexWkHKkG2r
	fEiEdkYCO5iSfBbOAFtJyg0zDZany1yDL1zi6FAY6g2W64Nc58tDwK2BT3KHddUGcK5/lF+bISF
	y8=
X-Received: by 2002:a05:6122:4b88:b0:56d:9f2a:d6b1 with SMTP id 71dfb90a1353d-58663771c2cmr1849119e0c.12.1779456815960;
        Fri, 22 May 2026 06:33:35 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm1522624241.13.2026.05.22.06.33.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:34 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5873983d19eso535264e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:34 -0700 (PDT)
X-Received: by 2002:a05:6122:6608:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-5865fbfd0f5mr1949935e0c.5.1779456813889; Fri, 22 May 2026
 06:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRE0Usf++vY2X=p6Wo8Kin8jdF9=2Wu2ctJyPe3QtoYg@mail.gmail.com>
X-Gm-Features: AVHnY4JZvFlBRVi5_begA8jgTeOsJbMlX8gu1et_uqRuljs-iJ43iZMHA347xug
Message-ID: <CAMuHMdVRE0Usf++vY2X=p6Wo8Kin8jdF9=2Wu2ctJyPe3QtoYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063337_344306_E5FE3F01 
X-CRM114-Status: GOOD (  16.49  )
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

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

