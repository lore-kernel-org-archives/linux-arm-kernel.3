Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4828CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+W/MI4RalnWOPI6s6gJjU+S1tfYwTsCpKSoFMctY2s=; b=v/YPQ1IUvb8EXDmKRX3Ch49Vae
	RSjPqsazUfxiZ5BaDJx80yXIcNYbWs/1UEcze1HH5fs78dP0FeUbpqCRhNZnkHa/ID3PCeCfzrEzF
	p9GwBH/gRIQkYVIsSQPEEhBF6bi1Cz+fQvwTPCxNElwTk9dNlq4c0YBggamcO9vvt2sAnRkyM8ebS
	/hYhpjl5yhGIZ65rI5DCYnzBpSIUY3QSQlCorS84Ke9UCnb/y/PunUVDbdUUZI9lFEWL7eUVjbV+o
	QtfH/7RmDFvZEmlckaUjCnRPjD47+qQek1jLdhE60xx4KOZvCOYkuyy5wA0gX8s+wIfdqHmoE8GNd
	xjEdrCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwua-00000003cKZ-0xId;
	Thu, 07 May 2026 11:29:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwuU-00000003cIY-2VPQ;
	Thu, 07 May 2026 11:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=a+W/MI4RalnWOPI6s6gJjU+S1tfYwTsCpKSoFMctY2s=; b=wu879gum6DnRyNGit0y5IBWjGx
	CtMTwasYcGXkMpm1/NRXklW/8L+Ix1r1TDNGMfnFn0MajiEsEnOt7yfJKC/4Gw3auIZQH5OpPNG58
	ttgUzv9t9oE2w2nzwsni3kUPDrz6x33SSkmSMHkdjtZd066wMZV1qutCrwrxfUyisixOMJ+dgiSNc
	uOACS/PhP7srev5lUjB6n/sXd/acD12rUeAqCLESOmfh6FPBgpb1xoPXBiqr0ayt2jy/mNzrxdsyX
	RPVqUx0zGy9GFtwW1tcGpUXG9RHlpEg0CQlUW2NltXH2wvN3es40S2Op/6EQcu/BGGR86Pkxjd0+N
	TkPg45mg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] arm64: dts: rockchip: Add watchdog node for RK3528
Date: Thu,  7 May 2026 13:28:48 +0200
Message-ID: <177815332417.3559576.4763546226468728352.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506092804.3320931-1-heiko@sntech.de>
References: <20260506092804.3320931-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_042854_632617_23E604D2 
X-CRM114-Status: UNSURE (   8.90  )
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


On Wed, 06 May 2026 11:28:04 +0200, Heiko Stuebner wrote:
> Add the node describing the watchdog on the RK3528 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add watchdog node for RK3528
      commit: eb24b60553e0692cbbec2863ca31d2a56bff098d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

