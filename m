Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4VkzCNy7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=; b=4VkzCNy7Jfh2wIJojN02PMSb0e
	zq9t6Aj7FoY/GZyu2GR/hqKA3lC8iJ7UpCOWKgogCkWxRFKiyC2Nc5ZkUVF3ZfIjAfnIHN692cUTY
	Jw/KbVYHywhLDCuHhPEQl3/ldBWm0tNxq7lWjo+rd1d8jJla8r1i2yE1a/eZAjm0BbJlRwBQ2+Q7e
	S4AHRdO5lcltlMuhpVmRj/MsPEg0RiuyUezcRXnKMoxK9BPr7gfQPv12fRn65zzBBHZMgkBlvePR4
	8bM1+T3hd6jkQi1c/0H2+AfEt0Dy+YhjbliOUABLPCtnlzFbjFTqYgsEZwXUQELx6FdoH7U08Nc7/
	2GFmD3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Lh-00000006iJ7-0i2r;
	Wed, 28 Oct 2026 09:53:37 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Le-00000006iIi-0ajZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:53:35 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98c6e050c5dso458312241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181212; x=1793786012;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
        b=yWMpxRzF1G79WJSG/VMGGBUor5pYu5oZF1FzXiotOBU3euULmG/pu1qHeB2kxsJa6w
         R0rmEYUBmQcZcb1Y8lMpCPJPiQQ9IjBbmsY4nLlvohZ5uNLw5N0i33StJAUg4ZqQPc5G
         OAHvjACDsfQItQ/lqIwaqvx0wJNSLe+Oy1zkD8wsYjFgUQCjZ06k7mXfNjlmO/b5GSXh
         wovtiJkicZNMXMWL06Dym9McXfOv7siTTVh7/wjTDU3ZzynCI2KgW6GT2Ngkaf9QdjQL
         VyIkuBl5SptPQAPzj5cvlS6sSWteFS0xk3ksMNVQ6Skdfjd8UVPc4kprqucjh4VbSmnj
         F1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP79iqKJfGMPemVIdL1+k62nxSOWyJbecY6YMs26MyL5BW93ZfvjhhxIZnJPE+V36s2YMbXoDD19oK5zLDyR+w@lists.infradead.org
X-Gm-Message-State: AFq9FYKqG4U4hxzORQn2lD9kMm5RLYno+oDUKrDYUEOhecVsAgNqq2Jv
	NpKsqMmatn2PlhU06tA0NjJx4+Y0RrZ+YYwxS/WHD3LP7GbHsiVKnVXDl1pWuhGt
X-Gm-Gg: AYBFou2hOlvx9rDtfniXX71ADUQqeC2uYmMIPQx2ZcXlrY7vCeTE4JysaTmJdzI6PWH
	MY4lpu8oLzylEDAsaBb25UuRKiqX9cj2kyJ7OnY4FExCT3l6Y4g3npiddt4rBhHLbv0wiTb0Ft4
	/+4XwHqplc5S2fn3E5xk+7MeDjqF1CHyOU5xSbU8HTW8Zr5ayuFGAhDcjI6An2eSJ4VnJhugC3c
	AzznALNtndg94TEgWbPkRc82UAyLz8TRCtIWtloapBsMVw+nk0Bt4ieaxjfpQRYXR9eZu5tmZe1
	U/wDdeHBwvJYGn/oedXsLQ/SiF6iCLds6EQD0l0WWV4TVTj5ZVbPfbbqzhh5tFpycfzqumRfRq9
	sGaShuCIi92jLWEdGPfJip7ZaBORmBwrTRDHzwJKpQIXrw6kItWlN9TdgCJi9Uj3GpAIljl8Jr3
	OnrJaWpkwWo0S7KdQA0YsjC7Rt6TXGmHrWcRJONF+GXH59RVdtRgiJ7hATEjdoglyruQ14lff2T
	R2+1gqp6KyIOALlQ4AGM8dcyE0L8i51ATQbBQway3ZvbcSTFA/xKDC4Kks19wa2GnEz4YQVjac6
	MVHjCo0TE1kFzHP73t104UgqGsCQJQQrmUYlvzxmUOVP3kVDKSplY2iFnVDuC50USwnY9cO1eqR
	ykeyYUFnQGCOD
X-Received: by 2002:a05:6102:5106:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d03a4e928cmr820593137.25.1793181212420;
        Wed, 28 Oct 2026 02:53:32 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912da2d9d1sm2741891241.7.2026.10.28.02.53.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:53:31 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99075306daaso423830241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvfcuvcOLz675fwrdrmc7eoPh5QhnIy7fCcVmr0on5l8dKL4RCfLOLqvqWfG4DwZ5QRyZmxPPtVLHeCaNzVfHQ@lists.infradead.org
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d03a47e768mr803872137.18.1793181210633; Wed, 28 Oct 2026
 02:53:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
 <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:53:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
X-Gm-Features: AclHuK9BGkRKGrsUq56mu96OMIK1DMZBGsGDXPyfwPmkMrcZVroZETBYHJfP3k4
Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_025334_191181_25599FCC 
X-CRM114-Status: GOOD (  22.84  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bartosz,

On Wed, 28 Oct 2026 at 10:47, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
> <geert+renesas@glider.be> said:
> > When a gpio device node has no gpio-ranges property,
> > pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
> >
> > Restore the ability to use GPIOs before pin control support is added by
> > using the gpiolib helpers instead, which cater for this use case.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This sound like a fix? Can you add the Fixes tag? Is this patch independent

Sort of, but no upstream system needs it, so I don't think it is worth
adding a Fixes tag.
ISTR we used to have GPIO nodes without gpio-ranges on other R-Car
platforms before, when pin control was not yet available, but DTS
history doesn't provide any evidence of that...

> from the rest?

Yes, it can be applied independently.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

