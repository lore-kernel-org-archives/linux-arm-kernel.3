Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EvbxDLk+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUd0U6Ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=; b=EvbxDLk+AVtHOBwdKgsoo4isTM
	lGeOHm2dvKsQ0hCizma4fRoTNbcmjtS7j3X5hXsegcmBnNffWeK/roCSHg/Qe6/c7qvvM9YmrIFNa
	wQbz4SsifS043J5DapL9bJh+OQomvVU2xNi2pH41gPML4HZjacAXtbSrpZpn5gDowu6kJtg9M+uwF
	lpmjBab3168XOCv3qd2E1aEYyZz9s1zCM0qibMxTEdJPBtaXjTZxFrwIe7lU3u4yQ8Pj/50Zdkg8l
	0baUZFsSPU/FrUmMY+BR1lQAON2TWWukVkJ+pqv6e2fZV+NQtNFHLXXCFgbeccEzWONQP3vLP8NON
	gxKs9mtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Fc-00000006hH7-1JPK;
	Wed, 28 Oct 2026 09:47:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0Fa-00000006hGh-3ZXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:47:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05D81600C8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07DA1F01829
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180837;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QUd0U6YmlnbueP+KO1gWJx8x6qP5ouGrbjrIp/pKm63rA7a+7Zockmql/PSMadeOK
	 0mdXmyHsh34XR3enAoMI/GyQT2NOKsVT/1d/A7dJyyydIsIYFn3AgpBdHi3/vV8XIt
	 uw/Nk9T2wQQjxt7RO4i4blMtdNxhUdG3rqLvEsgYNSxI4YD9dLczvroepYeJulkjxn
	 wcH5cFBnp/icB1opDu4QytDYEvlJiJ12M9UaygvsjHdo6cV5ThxqJgHmu4x0SdETrX
	 iCOndCJ/1lHv6cEO67ZUQlUrcZ6ikVuwma/tqGPFtg/HYcqvpgQ/2BoTUnfCVC4W0E
	 4bHNF2t3woiAQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3dd9667dso4934671fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByADAyfKvLM4r+L9btnZMRPcAXsk9cLhftQF2TbpAefoQzWdoeiwej2aJM0Y83kJsqErm9UkD5Wq3VX5tL/5IX3@lists.infradead.org
X-Gm-Message-State: AFq9FYKACvujmqTfeT3BKn34mhqB3Y5SU85cgkmrvdozU3YYem8QD036
	yFSpeDCIv5ZGK925VO4+PGperW7msyhTlVxlv794D4eVdPFhisfuRCIn4MUgU7CAZZXcSscvp+L
	LOedNoPtVJb/JtCh+GKg+RUCQEuY+AUwlchV0b3xSWg==
X-Received: by 2002:a05:651c:210e:b0:3a7:69bd:80ad with SMTP id
 38308e7fff4ca-3ac9cf74f2bmr4236611fa.6.1793180835578; Wed, 28 Oct 2026
 02:47:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
Date: Wed, 28 Oct 2026 02:47:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
X-Gm-Features: AclHuK_iGosVAQO6GwGuzhCeB4_YYSDAdlMHAhkY-OLVFYNCMrxDS4lJ3KzFIGQ
Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
<geert+renesas@glider.be> said:
> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

This sound like a fix? Can you add the Fixes tag? Is this patch independent
from the rest?

Bart

