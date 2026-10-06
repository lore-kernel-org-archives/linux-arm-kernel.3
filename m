Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4391CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 04:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RD8Ga2O8ARY1QtYUhUhQvuqFRUYNcYjPCatI11JRIN4=; b=ELaP/4mrj2cL0Zu4j+0VQKRq23
	qrKOl4zu6oM1LChIVemcTROg8mVziqjCciVY5t7CTIidxsmAAcmKwGB1tUDQP2KZ7fea83vGgeQve
	WhSZMAXnFhcCXbsRh3SzpG8Fwoi7SPbxw7BJW7sxX63WqI0ZTwfCpvzLAgo1C8gPL3WEz0VKH82Wt
	GsACQ45mDoXqd2MVec83g/b1E8VY/E8A+0IGOPhxeuFQXJfvOP+BboWP5/VhOFtngRh5KmfOPBIWR
	0wocUNUZ/u5nfCZmHea98SsPy/P2F4iX7D4FslpnrBbYkE3CmWLhV/QxGqdWxy+Rls/BGgd0vG/rQ
	yPcKQ+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwTg-000000000Ba-32uM;
	Tue, 06 Oct 2026 04:08:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwTc-000000000BK-2AAe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 04:08:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A42FB601F1;
	Tue,  6 Oct 2026 04:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6032B1F000FF;
	Tue,  6 Oct 2026 04:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259707;
	bh=RD8Ga2O8ARY1QtYUhUhQvuqFRUYNcYjPCatI11JRIN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PbRsy+3K3LGQmLw61u6nsXvfQG1eZ/iuVzupYDaEUN/YzOXYkfC2nB1tLYeDWex0M
	 7jJqOIV2U0tVkE7KIbL6y9HYH3pBLXYMM9RVZIluPpKlf4j14DJbkgoQUgW2yITJqg
	 Dd9ebEUVcd6EfgRGebjzj8ce1lV5sGl1PNZbtvbFASceHpl6MENDIa8sMtt2c7GUiu
	 Xu71htWKgoyUatYMJ4EVjsBsMPCg45MSvp0aX9AZ1TZL0v4K/P048Klvws5oZqTqn8
	 1pDZiWynwLQgEo3/OpHBgzXI93EdUuSsxmR2U/ETDmNzhgfPmGrvRjoR/byi5XKJvu
	 tXd3W4ggv5j+Q==
Date: Tue, 6 Oct 2026 06:08:21 +0200
From: Brian Masney <masneyb@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.4
Message-ID: <asR0NZ1VyI8k2NHo@x1g10>
References: <20261005102459.35529-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005102459.35529-2-krzk@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)
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

On Mon, Oct 05, 2026 at 12:24:44PM +0200, Krzysztof Kozlowski wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.4
> 
> for you to fetch changes up to 13634cde9771811488847ef76cd64a785599fdb5:
> 
>   clk: samsung: acpm: add Exynos850 support (2026-09-20 17:11:54 +0200)
> 
> ----------------------------------------------------------------
> Samsung SoC clock drivers changes for v7.4
> 
> 1. New drivers for a new SoC: Exynos5515.
> 2. ACPM driver: add support for Exynos850 (beside existing Google
>    GS101).
> 
> ----------------------------------------------------------------
> Aiden Isik (3):
>       dt-bindings: clock: Add Exynos5515 SoC
>       clk: samsung: clk-pll: Add support for pll_309
>       clk: samsung: Introduce Exynos5515 clock driver
> 
> Alexey Klimov (2):
>       clk: samsung: acpm: introduce driver data for SoC-specific clocks
>       clk: samsung: acpm: add Exynos850 support

Merged into clk-next.

Brian

