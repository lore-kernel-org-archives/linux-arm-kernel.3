Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FA2C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfMtID1csigSX2IWfEYOXc9oHZi5pHn/dI5feGkUJYY=; b=er6sF/rA0H55LEkuw87jovnplh
	gSP9neuLJhX5K3J8Du5x/AqvSPo7gaAXWItP64X6giOjkXLxOfXLZt3thjNSNBFbjMyKNChKq+8GR
	Mtu7nQgeX2NN8Czj44T6K5llk/3081REbUWpMvPdkqG5l5YwIlsHOXlDuVlDN5TTh2C9ihtiTQkO5
	6WyasB6jdADbpygoVrMKry9aXlumpZ4KD+kMFeM1yR3x//bQO1tmC2lPOgL3EFtaehQzAayHt2A4w
	oHBVbhEozpUexIp9c3TO5RaA7SEh8GWDXwl4Iwv5oyU6tGX/wpsoLmHJ8FLTMaaslw9BcqVd6TIyr
	9JnIzkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunh2-00000002KJb-2odi;
	Fri, 14 Aug 2026 08:55:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunh2-00000002KJV-0Fg2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:55:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7303243EA1;
	Fri, 14 Aug 2026 08:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7FA1F000E9;
	Fri, 14 Aug 2026 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786697711;
	bh=FfMtID1csigSX2IWfEYOXc9oHZi5pHn/dI5feGkUJYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9j5tgSIXL8ovK/x4C7cm6J4QROZscq9fyUeIZAuc6T9aIGu7iKLvLCBVh31QCuVN
	 bY5meXLF5VYmD63L19iAWbHhc1ZdJsnPyKzq6eyMtl73bv+VhIzpEccvoob0hNKadC
	 ZzuD0uMo1AuRZ7crS4Om+nQX7pVZMbfz/Kiium6Ijtg/P7Mdge2qspOiOa1x2I58/Z
	 n59u/6FXrTxn0dQzl6/GaRuBYK61pSwA+AkUP035xsU7YTy48pqixxkVD2m5gUDkq2
	 MlfiIxG7p9zylURn34TWTTGrIlhxrYg/wkMikj7lhs0CbJ3c/mrbzQbhTJcffKfRLO
	 dQ4NoNTOfBF3g==
Date: Fri, 14 Aug 2026 10:55:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH v3 5/6] arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK
 DT
Message-ID: <20260814-skinny-basilisk-of-glee-9aec37@quoll>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
 <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>
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

On Thu, Aug 13, 2026 at 05:56:16PM +0800, Long Zhao wrote:
> Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
> console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Ad. Sashiko feedback - that's why this should be one submission towards
soc@ tree, at least after initial review, as explained in SoC maintainer profile.

Best regards,
Krzysztof


