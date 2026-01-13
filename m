Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B13D2D104
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n3qCGV+st50jJBNwT3OnLSRel5DXBMwwRtV/6UeHVwE=; b=A81s7JuR1eU353PP77+cSkEhJO
	0CTtpWsOpWvB5CLFQ/4mgadBBG9ulk+Dbbq55f+V82XeXdfcQzFdhDdvHxvqGoWgqSStGaFaMzImz
	h7HYVzlr3mHrCLDK+xC2vMnAABhRjLXcgiwkfHsX8gUUPqg8exIafEuhsGK2KqVv+AdcBRef1zrnf
	HmuVOwcypzNzWJWdFA8GxlYet8FXK/AtRkEi5zDbTTtD1Xc9tUo5bPvMhqrpP+3bo3H9LTxMW2VcO
	qYL3qwu0rR8lqXNnK2H/UIlMVzuBhEBZEJZoAIsJcnI7/sv8rHOT0P4kEDP/y5Nt4Sou7urUWmr1l
	tu75J9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeis-00000007Ane-1L19;
	Tue, 13 Jan 2026 13:46:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeii-00000007AmE-3ogE;
	Tue, 13 Jan 2026 13:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=n3qCGV+st50jJBNwT3OnLSRel5DXBMwwRtV/6UeHVwE=; b=vj1Hf5q3sAy4wnFzhIegdHZT/p
	rwbQ8YtNixl/A5XqGD4RrgPwzmINjkvJPbE03ErsHAgmGQgkYQUqOur3xXtAtPat3e/PN4Ei/0Ujf
	iTLxJ4dDpy0+rjDEy77bvLdRWtZe+0nuLOfg0YKgPxtkpnmNUww/fV86O66PXwvYz62P85O8z6qoZ
	ud5mZIaAt7jV6ISJWm3nrgNrIsOR9QmSLhP7s0DWzjhBsYAnLhpqSF9rKZjJYhljobjMZYjz0waHU
	xkpMcFsGKCMlIPvRuMBXniGrxbMB6TWOiPRMbBShLJ64CQ4S7Lol8noiDMxOUeOJoFW5AfCiaH/Fs
	kAO6GRKQ==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfeig-00276T-Ma; Tue, 13 Jan 2026 14:46:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.20 #1
Date: Tue, 13 Jan 2026 14:46:02 +0100
Message-ID: <4560446.MSiuQNM8U4@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_054604_949308_1138D2C2 
X-CRM114-Status: UNSURE (   8.52  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-dts32-1

for you to fetch changes up to e74470cf3101da79666f20186c9406192223e9a8:

  ARM: dts: rockchip: Add vdec node for RK3288 (2025-12-15 12:21:05 +0100)

----------------------------------------------------------------
HEVC decoder node for RK3288.

----------------------------------------------------------------
Alex Bee (1):
      ARM: dts: rockchip: Add vdec node for RK3288

 arch/arm/boot/dts/rockchip/rk3288.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)




