Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB4FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zFYUOCKxecE3zvLhGC6dTD6/LfpNvcBTtUuMrF+lm4=; b=CD5wynYRSskFeoOg/wW8L41wxq
	b2TvNoTmpJTPQOPsATS+Ff57uhLWYAKbqaA05+bz5T15VfXMwIspAT960VbnJL003rLEp3DVXLAgZ
	m7yAlwW3fMCnEQl2FmtHFFK1mQ8ovkpCSclc0vWF7faALQ9nLuTMa6kNjl3cl0bvn4Qum+N6EpWjc
	PUq/m9uxylVleUAesZzY7yVM/77B63xNzQ6MbkH8wyO30npDdgis/luXzA1z8DVCkwroqdZ75R1in
	984njGS76uGv7+o32lK0AiAulnLUIQRj0T3/sGnCLqasXi0Bxjw89fwsbhW71L0FQ3TDqWYNDeNOz
	fErOO3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA24i-0000000C1YR-07Ic;
	Wed, 30 Apr 2025 07:41:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1ps-0000000Bz2O-0Y2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82A605C4067;
	Wed, 30 Apr 2025 07:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1017C4CEE9;
	Wed, 30 Apr 2025 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745997987;
	bh=t6ueMHETV9KCgJvq2360uo0bIUeF3j0Jz52z4tX26yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvfeD8QQKzC0uPB03Va/ckWcaetKMqORWYU7mNHmOrEUeDNqw7jklqILFZ1yIClEn
	 XJvO5yloSVlgk2e2ngqu0UwXSJ7osrrwPdsqPh7K2nFhr+dkViD+i3557R4wqM+guG
	 HOeoorPCdi9p7Rpy4rLf6rYMwzwGQq9E1gl6paGPowIPqnM3CBO75H939mkoztme5q
	 nLXboaD+iH5B7Vj46Dyh8BMFCQ8VA5eRryLiWvtoIfGrlXVGxEsSZTp6U7sSwOoSzr
	 HZtf5Y12zNpbJ1YH0H5rxFcfJAZPFo0sEXWY3MWJQ+h1/oNkJTj08OFE6Weo0U7Bt4
	 AzFyrj2aFg/qA==
Date: Wed, 30 Apr 2025 09:26:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shin Son <shin.son@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: samsung: exynosautov920: Fix incorrect
 CLKS_NR_CPUCL0 definition
Message-ID: <20250430-wonderful-meticulous-groundhog-cbe6e1@kuoka>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
 <20250428113517.426987-4-shin.son@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428113517.426987-4-shin.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002628_211388_3EA3ADAD 
X-CRM114-Status: GOOD (  10.49  )
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

On Mon, Apr 28, 2025 at 08:35:16PM GMT, Shin Son wrote:
> The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock ID.
> It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which corresponds to
> a cluster peripheral clock, not the last clock ID for CPUCL0 as intended.
> 
> This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95	

> properly matching the last clock ID for CPUCL0 as intended.
> 
> This error was due to confusion with the hardware diagram, and this patch
> ensures that the number of clocks for CPUCL0 is correctly defined.

Fixes: 59636ec89c2c ("clk: samsung: exynosautov920: add cpucl0 clock support")


And proper order - fixes are *ALWAYS* before new features.

Best regards,
Krzysztof


