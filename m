Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793B8C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 17:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF3/2kfrsJYjoCEIlZrwDWAfYUEZcN2JfotI765XeoQ=; b=qJlPhukW4c3QmSrQ4kA9p/IaxR
	Wa55kDlrZD/R/OrlSz8Y5DAAGQH1can+e6GsQUEt4zpyXctbgX29rgO6IQXga55FfpAybaJR5O1kY
	mkfDZqIgvk8L6nHTh1Oe1T447S+HTtSAefTVqfIl7U2m86YlzP9n+9leN9UDWMiY0lZrQCCn4eGMJ
	ukH1Z6dC5PkHIfn25agbbDyjB57ceZNb31eDNylBpH/f+yH2ftQvwJRlLfkWh9r0f8E+b1Igk/lKO
	pH0ySjGHlW3XD6YjDmfaOTfCsK4NkwatL/7hOO0WEiEE6V7fhqZN1JbKDvqnDbDhnPnA2jxrbzHlh
	hlvSAseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidRY-0000000C6A5-0ZGI;
	Thu, 13 Feb 2025 17:56:08 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticg0-0000000Bwfx-3EO1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:07:01 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5203c91d28bso341444e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466419; x=1740071219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF3/2kfrsJYjoCEIlZrwDWAfYUEZcN2JfotI765XeoQ=;
        b=rzhWxJLX1Zssq610iyafub2Z9xsBgEEnt7pGq9wurGlw08evi3Gru0zrsKrfv6zHgy
         LWpnBBz0v1qcXtAjOeGrcFv4BQN71hPIZOsPj00iqCn1E8qMWE7MXfkVb0DJ9QxFvDcU
         VL1Kh1Bf99wW++pgtcpDb6oaex5Zn7Yu7zxcIyducBMazgpj28dr3+Wvl0IQXVGPzwJX
         Crpp3XfUPfpq3kA/bKeMF7fwIGFtG4r3afik/ySSBllT3fieQg4s18QMx4TnSZ1Wu8X/
         yp3i/NXlM4tiNLaR4u1cQJVWmrGzXoYrlR7L/OiSoFCgkATUD6kV5qEmdMfgO1+cs7P0
         eJWw==
X-Gm-Message-State: AOJu0YwrMxO0luiKIQqaULeEqda1V9lK4VHNksbPwJn9e+cTuBFmClfa
	y16L/T53bylTWvOqUJYuI6IUoPFMiSg1qJfTXEYHUb33t6ReGTmP0GTngUMcxtQ=
X-Gm-Gg: ASbGncu8mSxqltez0NE08emOnYpukOFMwumknP3EiMt8AWHQ4YNTOi/WZF/F/29vooE
	lqKalt3J8u46fnsxj5AjWkBWHQXAe8wpIpkm5ac5oQqLldPOFnMuQcBRi5FfqJKfbIRBd0YEjpz
	39vrVB3x5+LM0pxc4/b8tkjtYGKKEsN9/nSzYydUk9wQxTy4/7brx5DkQ6+vnM7bJ490qcQikE0
	EtIJCg740JEYZx0TpVVxVJg0YxtkTmyP6417LdqFjXSv+Ek5RaPh4uKnmfnrCuH+/NdvgxnwEyw
	LYjB+ShIi3XIdPwD5PWWdVHyKG+To+mxq3rcXc+gCO2YwNS+db6X9w==
X-Google-Smtp-Source: AGHT+IFGaf30Z0s/8+39Eh8Ts+Ly0Bx/EVbCp0U0Q2ItwASkijfvlXR+iDh4tnJROAU7MoFQF+xXKg==
X-Received: by 2002:a05:6122:2186:b0:518:791a:3462 with SMTP id 71dfb90a1353d-52069dd8b0bmr7104679e0c.9.1739466418593;
        Thu, 13 Feb 2025 09:06:58 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa3ff9esm219696e0c.2.2025.02.13.09.06.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:06:58 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4bbc406499fso274778137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:06:58 -0800 (PST)
X-Received: by 2002:a05:6102:4191:b0:4bb:c24b:b623 with SMTP id
 ada2fe7eead31-4bbf568bd5amr7299920137.19.1739466417907; Thu, 13 Feb 2025
 09:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 18:06:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRu7Kp+qF52ApYYqdHg=tV5WTAOaG-Vi7Vqj5786Us2g@mail.gmail.com>
X-Gm-Features: AWEUYZliYRg_sys6dyhouDCv7ONlDd2mFCSmyYehrp9fFQVAs0ioNoeU0iPhl6U
Message-ID: <CAMuHMdVRu7Kp+qF52ApYYqdHg=tV5WTAOaG-Vi7Vqj5786Us2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: renesas: Add boot phase tags marking to
 Renesas R-Car Gen2
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_090700_805256_6D1AC512 
X-CRM114-Status: GOOD (  20.54  )
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

