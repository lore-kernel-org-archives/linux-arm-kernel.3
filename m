Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD85A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CCilDBE9;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=cSX82FWk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=; b=CCilDBE9GIDRzN
	tkmaC1slZPYpvuWHTgXuKFHF9AQSbyzKjVGmStW3hcNlVzKoO9/pzEQnsWg2BJkLMuDOMG4EZDb6n
	PUY78HSfeqhQCEKkBZpkRrEFVLCeUomMqmoiEz5iGQxTU8dGvtt3bSAoiLroxtRvWjQMSuuUlVXtH
	aAV7plMLhd8mCH1zRRD+cHTeU85elZ12q7S+q05JMkpKKzn6umt86on2EhDRV9rN4T3bA9fmHNka6
	+ZrcTq+KBHpwpWMl33SPfnzE3Zf6DoC6+3CoXHvqjM3bOWmVPqUZ/8E8h6uMsNOmRTZxoThdeUqVE
	NRQVDH0peQLUuZm/9B4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePS-0000000FBDy-2UJe;
	Sun, 01 Nov 2026 22:52:18 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePQ-0000000FBC5-1BmP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:52:17 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-6798eb0d13fso1693152d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 14:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573535; cv=none;
        d=google.com; s=arc-20260327;
        b=LxIQ6ot5gLiitaVy2K1QwgqyWGajP+xSAuiOjm0njMxQnMiDdUK1tTVH4nieRrFvY5
         3gSVa8M5iqww+g6CCRP+xaQ4EHMs3oxl49oU/TgP0C+SQ9Y22x3bR3SEp32J6JuBi+XM
         4xo8JUdcRDmt1Xn77bDz0oBxWwkFO1Kp8/2YAo1CXAs7oHXudkgJT9C07v3qBQWsadzh
         rcC5PGjSuvltMklsPvTLxU2SDJcv9oZPU0GFCeX9owD8HJJ95BGtSZskuFlz+QSLNX1R
         DaaHh7XELRnDqCP+cBgmRIU+Ls976sVO2fEs8Du8zcyuWp6PZdGSG8COBaKc9lv00BvQ
         xkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        fh=wTQqNZJZXSWncQ4aL0ppTkK9xnlnfgNAQQvks/lXnpc=;
        b=aUY/+6CkFw48m8Yitbp0Ouv55Yq8kHBDq5UCwufWw64QPm71VPn8DqdRQukauBTeHw
         Z8X1eKsIH6QOcxt+ov489okxqgeeJJ5PD+Bg1L59WtQ9HPWPY6WE0gT0xhehuxTtBuIr
         LNT8pz4DWkkheiywuhu/3hW6uPjEGYdCm9ZJ1moKhxJmkDekcoZgeVF1nFiLoySbkPu5
         l51bbNyLa2iY7Msr9EqavxqKd0HhYQ95KbI0HbgSRI9n2kIVdymhtIkbJu0/xlZQKpve
         FFvdPIOthLyTaWaJw85t5Yq/R5wYd7mIiS5czNOoKO4kTuZ0D11e/AIHJ2Ac5xwORss9
         h/Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573535; x=1794178335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        b=cSX82FWkr0oGZrXLIDn8Zi9L50+S6MoQB6GwuKD3O2aKcfGK8jMtH3QEzOdY7pn4N7
         i6gRjRkNKW7vlh3DPSKrYsEwjhzLfDiPCLzrXvfusSPzCpk0a+NSYM/NyUXssmaOp31v
         OruSh/BiQejYnBh/uzgpQhOhyLT1PycUu6jEx08Gd59enTVYkWi8AQbcIAZLnlmPbuih
         sySnUvN3Ed6puGuk2WwOp/VsrKdzyHz2EATZKkC1kbMmhxBYKHx4zHyEnMZTY74NVEKY
         IbiCHWSYIvOqsQ1ivMGZgp9x5D4dSvkRPTp6YFIcDNrq7FZifHLqKfT+2H34LQe7MMKp
         KjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573535; x=1794178335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        b=mfpEQDyKr1zvPZvGknmM9/wMUr6zowNFOWt4ZDb4nPZ+kYPFmqibhU6JLc5R0dM2W5
         /FB49uj8oS+RuN8G9zgt/jBUuGWhXAwSbSNO3nPhi9bINukzIVyyf3grkqglRkigTgNq
         RNiA0Ob2ZtU3VBh1NwlBfo9f8XF9MuQNJTXzNKTeOH8VYtR9IJ5evNudNNoikcgNDq9B
         Ty48QJ+JCNVBWzHR26GhKs2Fd1KVW+ciu0CC2UBZeQCwUzV9ER4Pk69pC3vGBP1Sg0C/
         q5fZcDXkq5gzaDzygUK0W/rGAOr/y8ymBjPQ65Cg5s6M7A8PP2R0hbzxGhdGmopBWQxD
         xVbA==
X-Forwarded-Encrypted: i=1; AKwUvBy9XQSvL7Sj0n9tIdbCHBKYamJ38PyFANoCq9dfz9ml+af2WAy5o5BpxItrOVJYNGclMRaNNvvU6yw9ntF2R+fA@lists.infradead.org
X-Gm-Message-State: APuU4Z8dvT2Z8PMmfgfmeFIDnDi7mihicKq8m4bNPJVL9+laF7Cfet60
	x0Th4UrmRi5b0K0GTzzMTCuEuu2l/BIS0I2WL0sOjSYc4/UzZ+qBfDu5R6vZQhjIlt/e5qOeGdS
	Q5udl8JzLiyvPCZbTjneHw0OuWDZlMWCB9A==
X-Gm-Gg: AYBFou05L9tzKN6yBG1ZckxWuUoNtUSel95DPdJNhEcuyooAhapQAs9bxaVfapnKXbw
	TAJ0Aj1Ygfw4MRRmzcaV37g14EGLptm6kuH7ftd/J6p3CivXqcFnKmVwItXpSXVmkHwG+UdR1Uc
	M7IHe5YsuYq+uL8arAU5qmTbv3BPX4HDLr8Aex2wSzDL5bYuYG49km/RX5Jz0WYZTklFpNitzxq
	37nltlLNo/ywsL2nqmUUG/mZgWuThWNXNTn3iKeQUEyFVJ/IWuhyp/D2KWRFWPKXgwXwcyib09m
	05RIZC975TRPNXeFnCCGeMhx+zsAVX4EMe012Al5I8OcsNIiNaTXmZPkSzOJbiHy8fPNvF6+zH6
	VcRJdnWvOMhzFbi4dcTU0DJtYAQ5kdlQ4hRvpUsSmGIranft9kKFEBqJu57uqPmZfvWFjQw==
X-Received: by 2002:a05:690e:b8d:b0:679:98dc:b39c with SMTP id
 956f58d0204a3-67ba501901amr5094827d50.125.1793573534917; Sun, 01 Nov 2026
 14:52:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
 <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com> <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
In-Reply-To: <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:52:04 +0100
X-Gm-Features: AclHuK-R3xNv9qpm1VWMmHjI05K4ugJP9l_pkjDrq2qiEZoGQf-7YzD1L0LqP9c
Message-ID: <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: HELPMEEADICE <yuanzhenpeng210@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_145216_328281_D55E546F 
X-CRM114-Status: GOOD (  16.45  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Nov 1, 2026 at 9:55=E2=80=AFAM HELPMEEADICE <yuanzhenpeng210@gmail.=
com> wrote:
>
> Hi Martin,
>
> Thank you again for your feedback!
>
> I've completed the comparison between the original driver,
> MMC_CAP2_MERGE_CAPABLE, and the 128 KiB bounce buffer implementation
> on my Xunlei OneCloud (Amlogic S805).
>
> The results show that MMC_CAP2_MERGE_CAPABLE alone does not improve
> performance on this platform.
>
> Runtime instrumentation confirmed that:
>
> - dma_get_merge_boundary() returns 0.
> - host->can_dma_map_merge remains 0.
I see, so that will prevent it from doing anything.

> - The block queue's max_segments remains 1.
> - The merge-only variant behaves essentially the same as the original dri=
ver.
>
> Here are the sequential read results (MiB/s, mean of 5 runs):
>
>                  Baseline   Merge-only   Bounce
>     4 KiB          11.81       12.20      13.01
>    64 KiB          12.88       12.80      57.52
>   128 KiB          12.97       12.80      67.68
>     1 MiB          13.11       13.05      69.43
>
> The bounce buffer improves sequential read throughput by up to 5.3x
> and sequential write throughput by up to 2.1x.
Let's wait for Ulf's feedback in the next few days if it's something
that should go into MMC core (either by default or opt-in) or if we
should keep it driver specific.


Best regards,
Martin

