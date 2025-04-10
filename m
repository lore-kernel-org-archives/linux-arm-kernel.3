Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A297FC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPR5GZSRvxu16rwEBjKkd9y5335azxvaE/olKP0Je3U=; b=bFdU2B2d/lxenlwo7XcJulElUD
	Q8c66HB0y2PbDYPstY4uU8RDcfUj9FWdOMhRSpqMr8QcMMShNIP0iePy2G8Eoujk7RuUwvohmXMC/
	T5ZjGS7eDocTME7tvLynsytXT7VK5/PY6lPZ1ssxK3PIKAApo5ZQemwrtqk/RBaX6I1GDH2sciITf
	oRnsopOHmYNJ/Ni4cP0fCdY4TUaICeG+wQumC+9Q387/eKX28BsvynxiUcGsSYLwHyv5/JwYzowcH
	SJEl//1UOOM/lrkoEtyKDhuTvdB6g7qDN2ty7riyXT67/QYQjj7JSG7pWPOYFFhg0MuO7DrRGJCOq
	c7CaHCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u1D-0000000B3at-25OC;
	Thu, 10 Apr 2025 15:40:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tGl-0000000Auep-31OS;
	Thu, 10 Apr 2025 14:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=oPR5GZSRvxu16rwEBjKkd9y5335azxvaE/olKP0Je3U=; b=G77x/r+tt7d+nYmpy5n/BrYFGY
	TgGYU29oQC1E1hWaWmA+t2MxVNwINUe4ii4xPrwV7p2K27aLClNlJeMqKrErTB4POSvjA3ye5hEIC
	U1UQlKX0Zm1Az4xGoYRkiEyo++bf55XkrLpDu9CZWHoSTvPDyRwTMWFwWno6amILGuvjqXPLqlWP7
	oSlOOJ/gabRLa7qFX92fX1AFEUEk67fmiQA18aZakQC94K4WJYDH5nOHoCxA2u3blrwZ9KQTCYiV0
	nwONvT9uEJSN1jYJY+GX6KT6szb9C3VyaLxPQWvIdfhyevmsUJxPTc+8Q8r8S7VVDd/Z7MD1yHFx0
	EJnIBQag==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGj-00012N-2a; Thu, 10 Apr 2025 16:52:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Drop empty init callback for rk3588 PLL type
Date: Thu, 10 Apr 2025 16:52:29 +0200
Message-ID: <174429674412.910874.4819823369489889838.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326113556.21039-1-ziyao@disroot.org>
References: <20250326113556.21039-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_075243_768398_B9B32171 
X-CRM114-Status: UNSURE (   9.66  )
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


On Wed, 26 Mar 2025 11:35:56 +0000, Yao Zi wrote:
> Unlike PLLs in previous geneation of SoCs, PLLs in RK3588 type don't
> require any platform-specific initialization. Drop callback
> rockchip_rk3588_pll_init() that does nothing in fact to clean the
> driver up.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Drop empty init callback for rk3588 PLL type
      commit: 646bfc52bbe184c0579060c3919e5d70885b0dcc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

