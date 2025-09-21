Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08679CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gp/wZE0fDakAICLTarIzJLK2I+Hr8K7LrcHSpG0GvCA=; b=KA8ENAeLzEro6rGw6J+0103kYq
	fuk20FxJdnyuzIwovNk5BaSvaS0Byt20LPh8d7jTqsFjbpqdwJpRD9VLo9kxV4rilqGQYlJbazDey
	241v5JE6rsho9KwWSU8TVAy71QNOm5/+bLzadVu2IqE5R/j6by4Oxc9cn4/ftNxbyiQNPPwCW/EPC
	ZvLAFJt3czgy9QY1VRU6mk0pOXoJ/ysDOMro38kEDQHj5MKat/ZU4Nm8MHtoRGfK0NddShtiVGLKN
	XnJt1uIosDbHytXMQ7T/2K35tjMLFgB0SoDdLthadagKAM/oGI3JQKKob02y+UDvgY0HRZCPyRKeR
	S2j/xlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RCH-00000008CY1-2CZT;
	Sun, 21 Sep 2025 21:02:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RCE-00000008CX4-0iGD;
	Sun, 21 Sep 2025 21:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=gp/wZE0fDakAICLTarIzJLK2I+Hr8K7LrcHSpG0GvCA=; b=yeMChb36K7dkO4z2vnZJtQClrS
	hGJYFGSy9y2EgFQWXC8jsN1QTAOIIh40d7dK9kj4mdTqOy3aG7s3QrMzUX0MWd6z/tPYCKdtVjCHr
	lLQ+GwMMoth49XBHM9ORoFnAPquOXEcInzpK/9kPPRUGuQGcDA1qa3dnO2R7Vg1+YbA7T3cmzk6HX
	3f3hVUBdo8GV5S2SHeT49yuhuOlYw7tPSJVrFPVZyGKT7BrycNoId065KpH2vyXKWNdsBapdbQy0l
	GUdi+GHO1REIFU9UiSfAXzKSgEE91V0GGQXQietNje7eaC5Mwes0YY6jMv8dqgdKnNKXLwg4Lm+XU
	29eq05OQ==;
Received: from i53875add.versanet.de ([83.135.90.221] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v0RCC-0007dq-GS; Sun, 21 Sep 2025 23:02:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip soc32 changes for 6.18 #1
Date: Sun, 21 Sep 2025 23:02:07 +0200
Message-ID: <6025175.zQ0Gbyo6oJ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140210_218581_56271E66 
X-CRM114-Status: UNSURE (   9.35  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-arm32-1

for you to fetch changes up to a1b20e062245571c128ec521c4df56ad1bff9bd0:

  ARM: rockchip: remove REGULATOR conditional to PM (2025-09-18 21:05:39 +0200)

----------------------------------------------------------------
Commit d1bef995f61a ("ARM: rockchip: force built-in regulator support for PM")
introduced the REGULATOR if PM dependency for the suspend code, while
commit d1558dfd9f22 ("ARM: rockchip: Force CONFIG_PM on Rockchip systems")
later always enabled PM.

So we can simplify the REGULATOR dependency by dropping the if PM.

----------------------------------------------------------------
Mikko Rapeli (1):
      ARM: rockchip: remove REGULATOR conditional to PM

 arch/arm/mach-rockchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)




