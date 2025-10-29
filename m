Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C10BCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQw8srW8sZp+NW7sFJ0wHastT8WjOnxgYbS0cHBnNRA=; b=xhm8dBoRWWtcV3H7Vius+cti0V
	gLtP5MjuJSEcHgwYu/pfH429k6Uudu+68Em+wjZp1POF8LGezmiezjPAdYjYbDS02tVdJiuqJBiT/
	2UItlOMQ4tJrZivUNy+x/A9ME3njhZuQ93ebk3L1972EUpuXeQk6wjQE7QB5uHmmBid0z3NFbse8u
	AB333UfVxAHn11/EEILKFs1jAZPm8yn2vtsWhPKSOclH3y51JmVD5Zy/Pehnx6rri3WABtoPL8iPZ
	5YALrYwbc3ptpbOKm4lY06F/wWITMi4PUXYEu+CIG0NdQx2V+3D8p8PH3XgaDZEmL93FeVs5JgpAR
	7h62/+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7YU-00000001fuk-2i9I;
	Wed, 29 Oct 2025 14:53:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7YU-00000001fu9-07iq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 14:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PQw8srW8sZp+NW7sFJ0wHastT8WjOnxgYbS0cHBnNRA=; b=qZ3gFqzTafm/0CAi0R1xNzBEZu
	FK+i0UbMhwkOY/X2WCXMrJmNk79qtRQk7y0SBh9VYH+PWqfqbf1zr0uFFVtznwAkAkgsVxUNf19lW
	MbzdTovqjB4BWY8iVwAfsSJkVSM1VCNMU6iv3T4Qd9saKXmpldXkglDlWyK24xBlvhve5bU6cl5/9
	LeWZpwalGWwUBKnpi0unb1xCi66JMoWpsUYstMNlWBtE0v+KO+IUSFxxBdhmJsiUEVMPcE9sOwLJ0
	Ot2ecxUle8nO5pOmzx8rP1zCY3nzJ2DoVR9KPUrHoakEJ29HvuDbo+5h/IbhJo/FxeNeAqCb4sYM3
	VDBqHI+g==;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6gh-000000073O2-1NY0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:58:09 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-934ad40c2c2so2817358241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749617; x=1762354417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQw8srW8sZp+NW7sFJ0wHastT8WjOnxgYbS0cHBnNRA=;
        b=kYcmvh7F/0vWzGreTZsC64jpgDdknhDeMuytuCzPO+dxz7xM2wHEUFf+ylHlmZuBdN
         k2r/U5itfLeVlfNA4wJDEAuSM8k/QwZVqgiwcndEJ6ub0z9CM9HMFGQyqomLMODMcvfk
         tJhJw26GLq4dXvfxp8y11E+mxZco87/KiyM3oPCE3/vpf8PGm42TmeQ/rlG/EF672gIL
         nDhCbUhGVkh+KCAvxwSQ2czBWkzjT4/4kVv47g7gXzLyzCjOvJlh2Zqy4dWHB4ePxqtE
         EJeEfG6yPk32QC+QLkRpTfLZsLUSWCsYenjQIs/COYQVSONMng3v+foOdYAsZqb2WODG
         jdPQ==
X-Gm-Message-State: AOJu0YwtnZ6ZRxrn44M/hpAgGS5zlAQPmTbxDMTHJL/FFjmb4pOq2+8Z
	1knNPhevTW8fpTf5J1AGiQI1jKjVlm2v9YShbMlT4cy9cwWJAr1SBuPW58ax2mSE
X-Gm-Gg: ASbGncuSNO/Bgr3i8psE4QZBGSIaDQNgEmlBkv1XLodmQSw/7cxK+KitNAedoeP2HDJ
	729RO1Wee2Cyc+h2PFWiZB7NeQPVUkaF0I/i2sBPlgpkD2PxTVs2U7BOEiSAA+o6RWbG3O9YWQ3
	gTE557MoQLmR+2adfpLzubiwSzYSDUoJz7QkCFRz2k4C0OsXTtghmNJXDAKE9ufLJ4Fne2J4yEj
	kacst7aAu7faFSXGf6Hup0lFYlBa6wMsC2jUkzVjwO5OWkm9JlV/O2RMBbEazjNlRcHp7O8LUUK
	rwCLD9is3ddUFJ4oiFstJxNXY7AHIta/TUaZRO4Kr1s3jF7xoBtB6mBtIMJpWNUdoResuOv54wF
	3C9tZS++rChYbSgm5CLINjtfFnnJrF0tFSydcvnFftj7Ld5jNztrJDJ4httCMe3odH4eGt70gFI
	RvdqnLY+QlescIEFh95QONcCEypII1Cd1UZxvRIVBV0w==
X-Google-Smtp-Source: AGHT+IFX0wFKsZZPB5qQi3VLmHy1xAiPcqyXD6P3rwtVyMTNbC6HS2MxL0pZ/DiIQMkjJWXstR6JJw==
X-Received: by 2002:a05:6102:390e:b0:5d5:f6ae:38dc with SMTP id ada2fe7eead31-5db906e2a3amr907014137.39.1761749617032;
        Wed, 29 Oct 2025 07:53:37 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c4098715sm5199254241.13.2025.10.29.07.53.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:53:36 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d6266f1a33so4635066137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:53:36 -0700 (PDT)
X-Received: by 2002:a05:6102:1491:b0:5d6:6ce:9675 with SMTP id
 ada2fe7eead31-5db906e35a5mr890070137.40.1761749616368; Wed, 29 Oct 2025
 07:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:53:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpkbFGFuYA5qxohU_P5trfdrR8=OE4bOFZusuax_4M5w@mail.gmail.com>
X-Gm-Features: AWmQ_bnTzLRSdC_rJSCH1WOHi3pChMPMBglo5qebVwVc_9tsiGfE_PRGste6mmI
Message-ID: <CAMuHMdWpkbFGFuYA5qxohU_P5trfdrR8=OE4bOFZusuax_4M5w@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_135807_520190_4CDD2C77 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X 2nd version with R-Car M3-W+.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

