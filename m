Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68668CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=; b=oKx7Kxz2pKoFEUHwhZDSSv4FJl
	sA64rmeGRvPMSYK6kc2WqoFLdtKpfRxw2vCNNr32s1lKEQJ1QoQKdxaXsAHztKYD0APWwbOZsPCH1
	VdRxgNMbgV6epoGhf6M1UjQBejgQeTrkjbAlKN40g3lGaTK+tIBc9WBq1lVjKV5RkzLYrCajn+AEo
	Doaa/yLzhF+LxdDLtJ3N1+Q0aYqX2nP6P3PMJ2fCVD62+AVlRGZv7SN5/PWlPH7OteU9VuDQWP9Pi
	hNWvHE/ezJdBpODgBo1C3ms1n9W4fR272iZW/drhyg80+VLmujk2yI1ee9fbhiSyfrhYhIhdMaxH0
	OMs0+96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ17-0000000AzTm-0iMp;
	Fri, 22 May 2026 13:34:21 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ15-0000000AzSt-2HhX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:34:20 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57513a91514so2421648e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456858; x=1780061658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=ZgrBkYGZRf/24HkClORSq8+Y2uWFNifbcHHO8+qPMDqofg3MCehB37w6hIp7kPLOBL
         iy+/Hcd3OJEc14fH7I72p4aCiB+y7pkOLeQ24S9ueEz6oi+arxcjqS8eHQwY9zYMpZi4
         /AihvtWpVCgEaQrvfbGA/fQbf+lDq/w8ZmZu7FE4jw1AiRv9jpso6yKbdgh2EP3jrAES
         ka9cRIhL0DE8DxVr2tIm1KiVZWnPWlmPJf1gpnz+/q3MbI4ay/lcsWp1n9Su/0nHY31N
         9bWP2VVf/J1vmg7k3NfBlVdnkcTgfMQNRsJIhxVTCXtMvJAx0oYtjIt3BRD17CNy3WFo
         jR+w==
X-Gm-Message-State: AOJu0YzyAzm/4cUup2XcJXFF3qto/l62Oq3unVd/eKwCFJL0Zwt+Viq+
	FYGGbiE7RMXDlpfugDtUeI/JWgcRWvXma3JPiMrCEbHWbdhQOzPPO7eQUwp5puOjRKQ=
X-Gm-Gg: Acq92OFe9C3tOcXzteu/PTupNpvU1GEkgH3X/ctZk9UNlLRg4g7AurVHHhLjpOoy/Ie
	BVSTbYS0xuXNK15L8FyV4VmAXZl6U6M3b/IU2X+/g3TUmgF+fR6crRfR6rQDqqLvijGIBQFDTop
	ebOrtgEGBdRIVKc1f9bxNzXFrfNQxWDwDAFq81ajHn4mGSJN/ctgpfmR5TReDD8ODU2GN3KqdDS
	7cLuI/txI8lQHVaSpLFLoanoxS4uYAHXv/w+pVJsNFPqwDGNAugUmcib9fKjvhokwKWqHOEIdkr
	wHxUnR7QILPhS4ohQp10YlRksAdl9jASFfT9eo+k1nzOmmkqJjUIGpV16Ru+UCeeVe64NiqjP9b
	6b8jHm7MXuucgRAiqMO5OgnJIMnahx0UOCxpn7/7iBnzXXFBPCizkBZyJQLIkiWkFPRScoRz22z
	eW/mGQNQywva13BWQLLx+II85gDtCF9T5WxYcuCWA1jPlkMvJ4VFRfCM6b7c6BvC0S
X-Received: by 2002:a05:6122:a0b:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-5865e4a60f4mr1864758e0c.1.1779456858022;
        Fri, 22 May 2026 06:34:18 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afdb54sm1560590241.8.2026.05.22.06.34.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:34:17 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57513a91514so2421630e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:34:17 -0700 (PDT)
X-Received: by 2002:a05:6122:3214:b0:56f:2609:cd95 with SMTP id
 71dfb90a1353d-586626bd8acmr2048945e0c.9.1779456857164; Fri, 22 May 2026
 06:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:34:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7cQ8N3L0g6K4nsJSy8UUut2hNcP7=FovSf+UK_VzwDw@mail.gmail.com>
X-Gm-Features: AVHnY4L1t-E-4KNi3I0TSerFd7ad9ospqXgo4JNrc9drpmUktdoXOv4OmGqhgvQ
Message-ID: <CAMuHMdX7cQ8N3L0g6K4nsJSy8UUut2hNcP7=FovSf+UK_VzwDw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063419_577154_2B35B8E9 
X-CRM114-Status: GOOD (  16.40  )
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

