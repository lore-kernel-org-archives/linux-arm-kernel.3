Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53026C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SNQOcy+R7mQ4cPTc59VSSVwJu1ScZnlp/qvs/mXts1k=; b=ryvfjfP5/IDiUn3g8aoYorLmgZ
	a7tmdFoFrRuBjvPY2MrOjzmor6I8tlSGz9IqoJem+6hULJkQpHFjFR+aZ+zpiXq0WUGhwNDtOLNq9
	sRajch8osIfAkaBQm6LTSkPTBP5R33avPGIzrPDKINlNpfOiUPqG6yYO8Lkfs4iEODLEnh2jCzMP/
	rdIzlOS+2ifvT6dsSnWK5eqDS/64/yrFAk40rbySVM7kTNLozuXAZ2jUuYmq6hGK32Ocmgbw35iqE
	bKVh8328vxpWlbpZvARi9UFFkQFvvVapYnerLan0qqG5FkJnYXnvRHQAHPeLXzb4OZPF6EqK2619w
	9EWY1/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3Gk-0000000AZhi-0mHZ;
	Wed, 19 Mar 2025 23:56:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3Ea-0000000AZAs-37BC;
	Wed, 19 Mar 2025 23:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=SNQOcy+R7mQ4cPTc59VSSVwJu1ScZnlp/qvs/mXts1k=; b=bOIei5bPNo+tiyuP9SAapPEBko
	UQI5znglXHZ4wa4igSaIgMbcKwbIcJWZK/mpf9Q/R6XGEYpJuGVFYPwq/yV+OG/XfDuHm4+7YvTzS
	rbk6vgXu7620BldduyefDk0sdxXy3BuPuKUuHPKAU3VebZPe3NE0q9ZCtlQpj+9YRnR+7++/x59r0
	GB5IVyl/mGgxf8SIsxqEkw8xJMyEuP9qVyn0WvVUjNNyLjjwJCKya1X+oU5zRQ1Y0YzkdbYNdQXS0
	jAxHUVpPN/33+mMa+ZNS6uPriVepPGyMrjLEanecRrZUtih/QKsGQovmOG6mPLGhaD2FYpEYakXHC
	2Y6QVr6A==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tv3EZ-00021P-Bl; Thu, 20 Mar 2025 00:54:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Thu, 20 Mar 2025 00:54:02 +0100
Message-ID: <5552256.Sb9uPGUboI@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_165404_795188_28CDCD31 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi soc maintainers,

I made an error and accidentially applied a patch that was meant for
the mfd tree. Thankfully Stephen noticed that when the duplicate
commit appeared in linux-next.


Please pull.
Thanks
Heiko


The following changes since commit 73d246b4402c3356f6b3d13665de3a51eea7b555:

  arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (2025-03-15 15:49:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-dts64-3

for you to fetch changes up to cee24bc73d4f3f47344a1a54100a69c72f1db061:

  Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible" (2025-03-19 00:22:18 +0100)

----------------------------------------------------------------
Revert of one commit that was applied accidentially and should instead
go through the MFD tree. It is already part of that tree as
commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
compatible").

----------------------------------------------------------------
Heiko Stuebner (1):
      Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"

 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
 1 file changed, 2 deletions(-)




