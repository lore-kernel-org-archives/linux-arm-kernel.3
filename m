Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC965F46C44
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Qvrcf7tO5nZ4IoVr29ly7yF9d7+3FnZcEY3lGOIP18=; b=TAdhk3B8wfPfXxzmPSMIQGPj4W
	6HjG4YiSO9kmoKsZ8OQCujLrhFNip90l9yHH0P+eHmrX+/ils47srIucdi9jqA5SKewyReP9e6TY6
	F8ukGmP4mn55hLaUDeWX8FT/aDF5ILxBFyPOV4WdXhKuKfDNAznodoiOO7EDGiPGwX00UQsh+nog6
	sJgllZ8pP+h2C1DuuId6gF3XQe7Lv7jVz9LaWd6L5EKNYWClnvygw5Vxa5qvFhy/XLi6Az+QXSjRR
	VgD7cUeB8AEPdVCyC3SawokpoVhLO2qu5toBFu93QapvkSX6MWJpkMbgURWj7r4FwZFt9gTdDrh6q
	D5N4P4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lIv-00000005Du3-09y1;
	Mon, 06 Apr 2026 14:51:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lIt-00000005Dtx-0p9x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:51:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EC2F60126;
	Mon,  6 Apr 2026 14:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE317C4CEF7;
	Mon,  6 Apr 2026 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487110;
	bh=rwPbP1+bFk4jFXuGeRlNdKBo7Zv7Zhhj2QVlBA9xpOU=;
	h=Date:From:To:Cc:Subject:From;
	b=hcX0ZLjoUqvZGX4zWItRYNaHBJw/PC9a750oubI6W/pSAJJ3JEUIyATkSMF6YXcSE
	 nIejwAm38lKqcHUJqrznQIrvIIbINNVkXm4s1l6FugwYqku/Pqg0NMoPTu1u3GVbWN
	 mxnIQxv6qhTiG3gNr67oEx/j1yeI8Wv9kZ61KS+kWu68h8EdrKGvIaIPeaCLHl4SMC
	 94crm/1rhu3TxOmLfd/OVsZ08Bx5JWH/dQoyzVT579H4/irJA0tWb8tQ7ozFigmClh
	 iXyxv7LhaU7/YRg1Rp2KSS/8Db4VCs9WdTZ8twQgBuwU4yC/YlJOPr756ZJhPxRZtN
	 aVnM9wK76qv5g==
Date: Mon, 6 Apr 2026 22:51:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Device Tree Changes for 7.1 - Part 2
Message-ID: <adPIgTlQxnVpYgH4@home.wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The following changes since commit b912e48bee355b6b1faf86efc4a23191324ffecb:

  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support (2026-03-14 15:27:04 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.1-2

for you to fetch changes up to c755e39836ec492b0bc210fd96c2b720b5b4a690:

  arm64: dts: allwinner: enable h616 timer support (2026-03-29 21:20:49 +0800)

----------------------------------------------------------------
Allwinner Device Tree Changes for 7.1 - Part 2

UART DMA channels added for A64 and H6. Standard resolution MMIO timer added
for H616. This timer can be used as a broadcast timer for wakeup from idle
states.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      arm64: dts: allwinner: sun50i-a64: add UART DMA channels
      arm64: dts: allwinner: sun50i-h6: add UART DMA channels

Michal Piekos (1):
      arm64: dts: allwinner: enable h616 timer support

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   |  8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi |  9 +++++++++
 3 files changed, 27 insertions(+)

