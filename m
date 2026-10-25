Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB09606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=glLfQJ7J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=; b=glLfQJ7JcHMpmrWHNiepAqtDtn
	Xgp3HdCiLxdAT76LuNDqCwLP1u2GZqlvD3C4h6RDlF0k46OTBK2oBqzc5+mjcdxLR/KtcZYNDxJuj
	qnSFjeHZ5h3jvsf9z6XYQ8BasFmYaXbClRo1r2uDsowmhjlcwSVmr8HPdFU5jGfEyaZy9iBIAauUL
	uaDciuW8rn9Oe0rbbshTq9huHH6j+zKvEPT1vopQ8eFJM6O/tskz5MNccXbTXb9IHbXERa+LUwGV8
	7vl/ifLGwXG4qQ4c5wSq1/Fg6vXwhZZAhEhnNZHvPSo2jsH8A1qmS1xcA4TidSrQzdeiqRwJoi5tN
	ZhpcilAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKw0C-00000000zof-1cj2;
	Sun, 25 Oct 2026 11:03:00 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKw08-00000000zoI-2rAP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 11:02:59 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so1861403241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 04:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792926174; x=1793530974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
        b=HBSLzK8R9aHGbCK98KJtyCmZueNxw8Tdpo+wfMab0p7AZ3af8kz0TBzi6HIrMUqkIt
         xCNqq38NPbdE1jNKEpicTR2IEjZlAvolHLgZkE1LEsiEhkYSrWgkBhlb7wApqd6kD8l4
         oG9AmTpIYWixo6Kf2f3hzvqwuR1cR6LL2Bhc8eD8FcoHacAQgwVtg1zSTbZebumX5KpQ
         kbfRVlmuvrZAuiGK59ygUfIgUH+9N+s8gldm5tiPANThO9kJhk1npUzcehdn9Q9RdkB/
         56RzLPOpeyYhLgiZHhHXjFbE0xeJGZJJXorWa8CNBYCUH3w6MP+p3OdOPWAQOImBnYpa
         1ukA==
X-Forwarded-Encrypted: i=1; AKwUvBwpJVsrW3Kd4ufgkc9hMVOWxZDrPXXezZa7LVZQsNFRtRiR7QEOmayBHN4JIuljxo3uCM0WU0FgfvdPJ/NLxkLT@lists.infradead.org
X-Gm-Message-State: AFq9FYLAQopYEoc+yMZJZveLTaIrHnzR3/sTXuCgUoNxJF1h6+6BFdAD
	pyoUiyiyEm+Z2lxh2i6KNWdFdWNGUYhCL/phaQm+2RWqgwJ/e7YZMMHRQskpmTP5
X-Gm-Gg: AYBFou16GjKpOiAVy7Y3tQReuZJBsx6wnmQZkggxv8yyTld9DHAnuewmCpMuE5+QwEy
	Vrh+NuIemtn6NR4IyTaAVCgXy4/l1cI/n2fr7OZ7EuBCsa8tcMGJFZsGUGAsKWyTG2MHKBhIu7X
	orVVRa+LT3EykO+G+i4d0stq1lnzBd7siVhodhMHGn7Tvw5PaMVTzrQJOiVOde7qLWrCQC7PexG
	P6Vcd2rDeTj07K8FWQm8ydnCPUqoM0GjL10UQmcbUlSZNUb6h0MFRRI7nAwBTIRGqt0o+wzqsEZ
	Uzjy6yqTUn1/AWZrVF9/h+NUszVQk10F8XLhPr+PXet+A7stmceWIAleFr+Cx0J5ZifPlT4z/6V
	m60DHAGqLBnq7WEmJ2/KZ1rHxr70yLrX308wUbmKt7pcHrVtXb6c7dAxgVNPh9DcFq7JHLr4j6e
	zwHmc1tfee9sGYygyPD4cotDaGgP7kLpp9UHReK/x4c881IsxaPfIBgGrB1TKJ5sjHaE+aXBdfc
	F3Ky92CUdHxcKn1+UZoCdYj6Dj2cNF/GgXz0NnAkdBo2WguGK5WBJGw3p6NiAi6NZvb1uLt7575
	qxlFZ/rgnmlSG6FjJg==
X-Received: by 2002:a05:6102:f0f:b0:7c1:ce61:19b3 with SMTP id ada2fe7eead31-7ce5cdfb1famr1394834137.33.1792926174072;
        Sun, 25 Oct 2026 04:02:54 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm5139593241.5.2026.10.25.04.02.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:02:36 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so1861254241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 04:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1n1LVWJxH2n7g/XPRMNp+KkZAdSPMlXcCglZ0ID6wMcVhHUGWODMbEwRbfXK3az9Ce6y4grtvmInEMDgxiEMT@lists.infradead.org
X-Received: by 2002:a05:6102:4423:b0:7cc:776:6c54 with SMTP id
 ada2fe7eead31-7ce5cd246a2mr1349167137.21.1792926141152; Sun, 25 Oct 2026
 04:02:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
 <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
In-Reply-To: <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Oct 2026 12:02:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
X-Gm-Features: AclHuK8CaW_17mlyRa4Y7XpLgXIYuKk4YmAF6_as85fetPG-fOFZ1fPRmRtKgD8
Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_040256_733947_483E9667 
X-CRM114-Status: GOOD (  24.13  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marek,

On Sat, 24 Oct 2026 at 07:35, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/23/26 7:50 PM, Geert Uytterhoeven wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> > the Renesas R-Car X5H (R8A78000) SoC.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes compared to Marek's original:
> >    - Use hardware clocks/power-domains/resets instead of direct SCMI
> >      references,
> >    - Drop gpio-ranges properties for now, as upstream lacks Pin Function
> >      Controller (PFC) support.
>
> Is that ^ OK ? If so, good, TIL.

Yes, it works without PFC, as long as the pins are kept at their reset
state or configured for GPIO before Linux boots, which is the case
for the pins on the PWM connector.

> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

BTW, looks like I used a wrong base for submitting, as the context does
include the pfc node, which is not present in upstream ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

