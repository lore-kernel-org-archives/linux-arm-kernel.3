Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C324EC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcKn5fgFgJYMW14/UIgbAr3xvSOFZE4UOmlwvYcTvq4=; b=P1MpUz/6RdHRWlTGThxVfelqye
	wtJtrhbEwpkTeiqmk6AMwaJJkuIi9bofDXd90Mej9Mdx1GE2fbPoczQe9OUWCqMLIrrL0xnnWhAjd
	o2cTx+ZK7zWFiaYFOOiGsWHB0td8SMn+L1xQNhajOdG6YB7sO9xv2tccmP7gJ8A2ndHd7RJkadTT8
	i+vKsztJSr55IzG+kyJ4EuGTRuIWUtg3JPpRV8CAbeaORFxQ20d0cS6bUwwtPNRJfx7+yV39Eh7gx
	qvpp8oMPMO+LDKtYdxuAMX6f/wWtIGgUZ33yHmBf/pEAeQcErKrdOyMFJ1soo4YnyQxu1higAi40i
	Ic+lA02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrBg-00000006mlD-1VIh;
	Mon, 05 May 2025 08:28:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr9i-00000006mQy-2MWh;
	Mon, 05 May 2025 08:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tcKn5fgFgJYMW14/UIgbAr3xvSOFZE4UOmlwvYcTvq4=; b=hYanNWuJ8wYGOLPdj9w8MvI97U
	oFD0l/S82Fcl3Z/UiZBTtWBsv4YWaMxg+ql4Y6YjO8Rc3IqJAMZ9DzV/nT0iEUeD7IMeOiOw2JHlM
	CeL822WY4z/f4dhXzJdGnZJq8Yn89ynJTdhJh9nNBAqwu1gSs7V7ReMRWSN2taw/n5wJbsrpBe6TR
	2KOsSLARZYWYua0MGVr0rMqJDEy2A3L6ARnnTcZoDps5vMYpCPEEpr09tKA+Z/f4wukjdkgG+spmJ
	W4x8yG1CnMdUIlaJUQ41ugJCHyBq4gP4/+ZyOthDip1b7DCQ6WDfh6DZNkCc4/MU+Sv0YLNuI1xMw
	BYoJDPjA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9h-0001Ho-3f; Mon, 05 May 2025 10:26:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Some graphics enablement for the ancient rk3066 marsboard
Date: Mon,  5 May 2025 10:26:17 +0200
Message-ID: <174643357078.1204535.9408600816388349176.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201043.990933-1-heiko@sntech.de>
References: <20250503201043.990933-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_012630_599746_9A200319 
X-CRM114-Status: GOOD (  12.20  )
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


On Sat, 03 May 2025 22:10:41 +0200, Heiko Stuebner wrote:
> Enable both the hdmi output as well as the Mali400-gpu.
> 
> Did this to test a patch converting the rk3066-hdmi to a bridge driver,
> for future improvements, so it'll be nice to keep this around too.
> 
> Heiko Stuebner (2):
>   ARM: dts: rockchip: enable hdmi on rk3066 marsboard
>   ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: rockchip: enable hdmi on rk3066 marsboard
      commit: cb2a6738f33c3a9da7d1c0afa9ea5e9d78282eaa
[2/2] ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
      commit: c895c32bf1ce90839fc525c5d23cbf867ebe519a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

