Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxonLNhC5GNVbEkUNnarkbIz3StdVy52zNW6TaQLLSw=; b=aqHEO9jhw58BvoHTDsZa3gjlEX
	MW7rytIz453gV8Lp0hzXW1THw24tNNrtNrMTzEfToTOnqZNiHaduMfV+4+WcdTXKXHnRdKCxYwxTX
	5AKHWDX4X+KsvWBOePC6BUboBG1Sw1ycjYoBo7MlsDX9sz8agJ+4eUjsyOSi/0UHwDjCnEbnPRwm/
	PiN2A7MuUG4tXkfPYEFydqNRaMhAjKutnwNhLmJbSbxuCifnlSKKGyZ/zEopEwa0+om9GTqxUZA0G
	dNwmALDFCFvFN7YFmKz43gqDC8cpYoQZEEJI10iMSm5fHu9wucZqnvYAggHaF7uUprfUxwjKDhJ3i
	O4JYKFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8oO-00000007AAG-3tKY;
	Tue, 11 Mar 2025 23:15:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8mk-00000007A5C-3Mqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 23:13:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE8C0A46AE3;
	Tue, 11 Mar 2025 23:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16C4C4CEE9;
	Tue, 11 Mar 2025 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741734797;
	bh=8zqqrE6NewUBWLpJZUQ9TW4QDanmnleqtNEBYnbMVTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n72wMNa3Jz0xhi592qwthWXHm9rUyqJmj8Nr/TkskBp7IiNe3/ds1wy404etUxux9
	 vrkb8V8GqZiLBtTp4iWf9eCS2DEjEIA5LZNHJm4XsihtynVTav9pS1J/91Nue4CjS5
	 EEiLv0EXT7CYCs8sSFH4FHo3QIKJfBcN0L48Bzvj8YvVuXYJ/rAYO7hZaVJ1H8EVEJ
	 yxX9Ay8U1ETzjuP5dEx+uQ/Rc8ZDnKckGE/XmgV0/NtGAg4bqfubeKfaSdyI7PwDUS
	 QqHWh6Qn0PJROsbHrVf+0f1b5mwlQMgPasICv6DpmpyTjYFsuK6PZIBU3F9/eBBC7I
	 x6O1Hqzg4nGkw==
Date: Wed, 12 Mar 2025 00:13:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, igor.belwon@mentallysanemainliners.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add PERIC0/1 support for Exynos 990 and hsi2c
 compatible
Message-ID: <jwihm4ahyjluillz5szgvwj3ntjypqekjf43g4c2poa7r3v7ar@5uka5xftxjzf>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_161318_910486_1E849AF3 
X-CRM114-Status: GOOD (  12.58  )
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

Hi Denzel,

On Wed, Feb 12, 2025 at 12:48:20AM +0000, Denzeel Oliva wrote:
> This patch series enables the PERIC0/1 (Peripheral Connectivity)
> and compatible hsi2 for Exynos990:
> 
> - PERIC0/1 feeds HSI2C, SPI and UART
> 
> This part tests one by one to see which clock hangs without
> the CLK_IGNORE_UNUSED flag.
> 
> Changes v2:
>  - Remove other unnecessary patches which is nothing related
>    to linux shipping style.
> 
> Denzeel Oliva (4):
>   dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock
>     management unit
>   dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
>   clk: samsung: exynos990: add support for CMU_PERIC0/1
>   arm64: dts: exyno990: enable cmu-peric0/1 clock controller

what is the future of this series? Are you planning a v2?

Andi

