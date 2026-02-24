Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B10F4BB61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/n6MVmWLGg5Zh3JV3n1pm0pQQ81ajZOcgQnp1V9LWk=; b=U66S6+qIoD/HjeOyuz1hSicjzD
	kSe981+Mzvzx+wlv+/SDNFm5L0NLLTLBgwOIXWKgzsO22MDWJDEtan+5P3LxUxbI/7nUwIWHGlk8C
	mk9AvHt7MUgu43m7mH5CscjarmZ3+fdrU3JGibpjON9HH7M6kJ7NW7vI9wxa/UvTv8uSyWt/Lmb4D
	djSqULnRMqfxGklav9iLx0voD9Ma5DYA/XQ8Oe3F/PRcJu3OFm8l1Jp8AHtVzi+HDOx5IywMnRyAI
	sN3doq4J2TmS0SLP26KtWyktxDw/tzMZB4taC08foyL3PLWRaTuiY2Twp2QQcjauCSLvvDvxLSKjG
	c3l5XZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw1G-00000002T8m-1LDa;
	Tue, 24 Feb 2026 17:16:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw1A-00000002T4Z-2dkq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2315142A3C;
	Tue, 24 Feb 2026 17:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39645C116D0;
	Tue, 24 Feb 2026 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953376;
	bh=nXGV5CVF9KwRvJ83Nkm9Y6yySQlR6qshXE/F7dMkN1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tLrpN21XxX2O3kigPFKRqgkCBRyN1tW5nh0Po1xdRfmHoWPM6r+2h4/QHKh/z4/Rj
	 YbhWf6JM7pSoHlZNuloEJ66DCszoTwCnMRNJQf24K8fFPSYiRxu+xQPFX2Ea/NaYNd
	 3phab1yhSV6gS6BOLc3x0N9zSummIwFLDzOEAa64HMc7gPOhXm+FC+BkN5TK0EKYxp
	 AHRlX8msfMGVkPEZQEiDnKBGVcnaNYGNgY30h3V8K2SqIRL8pjmk2TUcF2l39K5TlU
	 VuSMyKBysbZzNWoXtFvHifyBizynKnBFj0YZJ2Q2xMDph1v2urNKVtEqJ5Akl5nX6i
	 Ci7uF3JnOKU8Q==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module
 clock
Message-Id: <177195337394.94628.14115585329669405806.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:16:13 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_091616_721157_D5B79C68 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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

On Tue, 17 Feb 2026 17:30:03 +0800, Chen-Yu Tsai wrote:
> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
> 
> Add it so that r-spi can actually work.
> 
> 

Applied to sunxi/clk-for-7.1 in local tree, thanks!

[1/1] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
      commit: fb20ccf70cf695f178d7c32e2d33b376560df0ff

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


