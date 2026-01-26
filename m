Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49331D19503
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KLkm2SXxYAqywK7J66VoIRSl6/ndSOtBJAmzzNChgmQ=; b=VHZFyTDztTre5pBTEFlVFiv+t2
	eFqQgBJ4QwPLITBf2qhVhRNUmlXZZOiKdKMJJ+roLFYSYIg9ztM6iqnI6yV/DIj/JF4xzGGVjXj4y
	fzNKGfK7TeeLv/OPJiePMMVu2IxBjf+ESyvTcXD+EmADrdep89fP0nM2xtbsFDhTxdN/d5BFTg4GU
	tWAIcj/lUa3xiCLyTP1NRc+5zGcpv4P9RFxlq6+06/T2sdt7p7CQD2ARbmoouu/aM55+BzfF+ufQT
	1sorjWkRMZYtFUXQNCflAiQuXO69MYAigXAwajNU5Obq7RxEkWsDLAohzVv5QN6YnBtUhOrhToSdo
	TKtWvZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ5B-0000000CvZ4-1RjE;
	Mon, 26 Jan 2026 17:08:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ56-0000000CvUH-0iMI;
	Mon, 26 Jan 2026 17:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=KLkm2SXxYAqywK7J66VoIRSl6/ndSOtBJAmzzNChgmQ=; b=A+qF168uNc0We3BIlPN2S902p+
	WBur0Py/hf1/tlYzh6ydr5dLyr5FX4+nDan64FPARlaaE639uTfLR26GPBZrbdEImi6FDb7sTlkbd
	L4xPOxcVUKqNyoGqmXik8vFVYPiT8yYR79aFOhsaFyCFYpbGH2/SQxPdXWWG5BiGa1nmrws+h9AmW
	MV0wsoSlQwDxnpl2PPjyg+zYNkVqIZ74CDJKafUHw2QtgidSMSd0XaRY7ITq4fI2/SX3m5cBygAOd
	LxatpjfY/3vVqeYRUL2wq3Yvyowo+cs2GfVHjaMXiZMcy5A8cxwsmN4UZha1sstJVcFeoQTbHmMXL
	RStyPFDw==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkQ53-004eOe-Ll; Mon, 26 Jan 2026 18:08:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.20 #1
Date: Mon, 26 Jan 2026 18:08:49 +0100
Message-ID: <7385436.MhkbZ0Pkbq@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_090852_216624_2ED15F20 
X-CRM114-Status: UNSURE (   9.14  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-drivers1

for you to fetch changes up to 75fb63ae031211e9264ac888fabc2ca9cd3fcccf:

  soc: rockchip: grf: Support multiple grf to be handled (2026-01-16 11:33:50 +0100)

----------------------------------------------------------------
Two fixes for the default-settings code for the General-Register-Files,
which sets system defaults for some settings like disabling the automatic
jtag/sdmmc switching.

One is a corrected register-offset and the other makes the code actually
look for all matched GRF instances, which it didn't do before.

----------------------------------------------------------------
Shawn Lin (2):
      soc: rockchip: grf: Fix wrong RK3576_IOCGRF_MISC_CON definition
      soc: rockchip: grf: Support multiple grf to be handled

 drivers/soc/rockchip/grf.c | 57 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 29 deletions(-)




