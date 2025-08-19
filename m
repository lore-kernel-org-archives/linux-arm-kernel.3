Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE325CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mycHp6qSRzlcFd4YjpHc32Iz3RHm3l/TUwPIdxqYeFA=; b=iClXV2FFlg+vSwfmdUupYHCy48
	TuW9BH00xdLCJBSEOYZ33GmjuiCTfO+rnzCeKwgp9f1vFYElpWka1LoM9sS6KrPOis6K3stBqQ8YF
	+GRPkdxaI48M2cBp0zCu4VUoQGX5LbRsJXpjg9OyPX6LXguN9ceKunYJykA63zrKTFiVSAyZla9th
	V0nJnj0pe5t8NxyTsEGLkFfACrvcG/7UakTg+SUJnHsTIXrJhozJFK2HDFafoVHTKzO4tjeEp60yh
	bY9MgIjgjDQ4oFv+lusOJWGCwIUmg8imLyD56r6PHp7Y3eOO9KoJ1M/6pCRuVCIG+E+jVo62y1JmO
	gt0ltJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoL0Z-0000000AMsF-0k50;
	Tue, 19 Aug 2025 12:00:07 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJK6-0000000A5bj-0oAF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:12:11 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-50f8b94c6adso1237855137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598329; x=1756203129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mycHp6qSRzlcFd4YjpHc32Iz3RHm3l/TUwPIdxqYeFA=;
        b=GI5HMA3916x8yZre5SlWhAD5VE8ZrHTFoS/cK0ymZzN6XpWa/SQrwt8cAkqplucdj/
         FfWdG+VC3NNFWs8DQYTITfsM6xgArgNDHcU4r9TtQPRG5FoM8RuMoQWNK0ae0rP4J3Fy
         Q5+wI1p5tHLhp9BundfgZnBGiKsDCYagoxYMxHsYhNZriNDMWODzLD1KHxqkVPkXZ3nK
         yRtTGSIcVFKOqr3oA8tK0AOOJo6EW1ku5iR1q7DLLM+mW8vdYfj399HdjsoNFn9sX1KL
         nSzyGs/49TEjYRdQQovCRMhIcuTN8PcPmkECE3MNvI0zcV2hZ6NEdLi436Pm3gKRjz2t
         u8uA==
X-Gm-Message-State: AOJu0Yy1rlOMsAC0X41oSpCeORoQxeY879rI1ZsOP49fs0B5wUkzpbkn
	LORs3wv6cPVs2acQQJB5m6mpRtNnjWC4mkSlsObqxiEztojCVBshiksszr9Uln4A
X-Gm-Gg: ASbGncu/JMGBKo5ioReAQtTHTAz56OydewqfRUJoX1f4dD8YePSqZychgaN7+KtYpoV
	Ybzb864/wF2dVKiRvlH17qTJypdggqckUagAAmAVlhcSRGcYE0p8lNDjaJTMfIbAGvU4yVbfyo+
	d/VOQ3YsByBQuVo/l3pEBDGlsE516lhfAE3uhqrw3F28G0dt2ezWyDLyJcR+/RJlN14fxndjqCt
	JMPOGMTFcp4ea5maot07V2bxdoERlcDxlmXPOvzqOMCsguog0wHiV6c0uh1+jBvSbDULCperNfa
	oHEzL3gWoaDKplLAytneSYV17oNLtZhEvu6dYyB06bFrwADEU6YecOUG1XQPNQ5gxBbvEGeOrn3
	eihwUqgyTPBFqFMI6p36pHcTI57VpxYRnqRmG+epu/is4TMQ8sHV00JrPl80f
X-Google-Smtp-Source: AGHT+IFd3r8ATJpN41kniPpIoWb1VAwYu9tQTi8MHdvCw/cFBWh1nEQUJuYMEvo5fmFAa99gcjelZQ==
X-Received: by 2002:a05:6102:418c:b0:4f9:6a91:cc95 with SMTP id ada2fe7eead31-5192453c1bemr472881137.27.1755598328835;
        Tue, 19 Aug 2025 03:12:08 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890278ec6c1sm2367347241.19.2025.08.19.03.12.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:12:08 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-890190da557so1004557241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:12:08 -0700 (PDT)
X-Received: by 2002:a05:6102:548e:b0:4fb:f2ff:dd16 with SMTP id
 ada2fe7eead31-51923a25723mr489752137.17.1755598328341; Tue, 19 Aug 2025
 03:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250806192821.133302-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250806192821.133302-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 12:11:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdM2qd_DWiiPr2OwX5=nf1UBuHRUX5Za9P20XPsJG1xA@mail.gmail.com>
X-Gm-Features: Ac12FXzJGw-LH6Umblaudi03B5kX_ZYvIGSqV9QE23hvFag9FOrGjoyEvIY4p5g
Message-ID: <CAMuHMdVdM2qd_DWiiPr2OwX5=nf1UBuHRUX5Za9P20XPsJG1xA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Set VDDQ18_25_AVB voltage
 on Retronix R-Car V4H Sparrow Hawk EVTB1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_031210_232503_8D2528A4 
X-CRM114-Status: GOOD (  20.70  )
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

On Wed, 6 Aug 2025 at 21:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The Retronix R-Car V4H Sparrow Hawk EVTB1 uses 1V8 IO voltage supply
> for VDDQ18_25_AVB power rail. Update the AVB0 pinmux to reflect the
> change in IO voltage. Since the VDDQ18_25_AVB power rail is shared,
> all four AVB0, AVB1, AVB2, TSN0 PFC/GPIO POC[7..4] registers have to
> be configured the same way. As the EVTA1 boards are from a limited run
> and generally not available, update the DT to make it compatible with
> EVTB1 IO voltage settings.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
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

