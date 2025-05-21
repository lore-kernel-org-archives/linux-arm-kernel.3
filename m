Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2365C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DnMLD3+0ckchWosSSYtmn7b2yCGZyXFleRAl074knsQ=; b=TFWsYThT5CZdsDqZeykkl+dvp4
	lFvDCKPhKrKIHfyvLi1T62VOLbVbFog+fSWUU7MmgLSCz5JSeTJHgQ68PMTRPZVgFWK2hdkxuwCis
	2rYbhIMKYEmtMo9rFirygB6FM1jr3zxc5aI/VXSTP4VJ0RjUZz9y75fMnoCEeQwM/H8ZhbBSAj9L0
	HiDEuozolIyyqAmYd2Dltd9zMz1iO425AjD+7tzh2kQy0kcdy87Z6IM3HElH1ihofJzGQHxZ6Mfdh
	wlXyblUfJRK91dr2rGmtPM0aUhyngsshmCLqqVvtfPWzerfWnPrzg2HtyA8Z3Ie3nBXXz9+Me24wq
	vSifOigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnJV-0000000Ga5O-2XK9;
	Wed, 21 May 2025 17:33:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHnCb-0000000GZJ3-0NkO;
	Wed, 21 May 2025 17:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=DnMLD3+0ckchWosSSYtmn7b2yCGZyXFleRAl074knsQ=; b=YJdEYkXHXEjAdpqgjMDlB4CJcR
	SPRLN7QBHQFvmfzY1t8VQNVPG34YWexxxMa3ijUeBNi7V92+Xj4wnGH5MD4Mq+hoInff8mqNJ9+kI
	pUbFz8UtKdMbBaSu/UnsT0lR4GbdpmosmpWR7tvUhPvly9uYlXie393P5ZBoYYzC0UJjNPIFZMBGt
	zQ6LZC4AV4kINjhphYOaa2vBnEag77IWlLsqZtF8CpK8gi1w0GOOet3xWNHL+i8oTuIE+SHPqBQhk
	xjzuuKFhL4ascYadUxKQ4pRf39QbWQZLOkw7facyNJrIBb0l40Sa9qaraKju1CAy+NStXUwvM0AWN
	OF3cGRQg==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHnCZ-0001cS-Q7; Wed, 21 May 2025 19:25:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.16 #1
Date: Wed, 21 May 2025 19:25:58 +0200
Message-ID: <4060740.R56niFO833@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_102601_138526_2037ABA1 
X-CRM114-Status: UNSURE (   6.88  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-defconfig64-1

for you to fetch changes up to bd088836a10e418aaf7dbda4a1db9da864f09fb8:

  arm64: defconfig: Enable Rockchip SAI and ES8328 (2025-05-09 21:41:34 +0200)

----------------------------------------------------------------
Enable Rockchip SAI and ES8328 modules.

----------------------------------------------------------------
Nicolas Frattaroli (1):
      arm64: defconfig: Enable Rockchip SAI and ES8328

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)




