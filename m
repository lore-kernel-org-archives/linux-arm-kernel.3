Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4493C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 10:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xg3hntEINQ694Bl6T/sY+0NFBskADNRL+c8+ihX0e5k=; b=QeaSWy5m/KjgahhQBp0rfW5L+E
	Y1Rz1G5B72EIDKqRnXJaFgguJtsyQso+AapY/isAHIhgqc96ktWCm9wnOwkf0b61n/6jZHZCQVREH
	2hQTsdl0xrCdILZFq2+SOrtvFD//4bxugJYARmW0PsO1W3/7B7q2ag4gJk6iYyVvnfI/6PTJdy+dU
	Z1PVc+bIdQowJLtOm2kD1g/ov4SZ9I3R3i2qbaCq/NHUhAN00mnGxuKVpT8GQZAO5bLDrwM9yu+wK
	5MprlvFpteb3cTzPozSASiGsr4f8y7X7q6YRCymsZdOrbMzsG8lGMviUDkxmnvoggHxOWjXNHAiM+
	Oxd+U65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQjF-000000098pu-1Nsa;
	Mon, 12 May 2025 10:49:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQZI-000000097UF-0ZWF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40FC45C57BC;
	Mon, 12 May 2025 10:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C90C4CEE7;
	Mon, 12 May 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046371;
	bh=nRWsb2wolmIY//6flqGvzmnzjfqP6D0rAaoQXhZBqFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q8aYIXd6C+TalCCIXOp2o3UTZ1HaM6grqhJqnRtTyPSdm8mh3IORbBkN0T2fQmBmN
	 dT9QBCvxqd3CwzpUD7re06jG7AI8ULeIHSE+4opZd5t83Q9yx20nkt9OO8Mfe5mPgv
	 5XQVQv9FIy7LEz8Y/N64w79BAN0R8t3c3i3b8YEqXETvJskjEOWXKrqu0k349Ae5MC
	 0w5QKWN3LWg55htmEl0V9rvGrDe+j/8bvnNKRuN0kPXziWL0MLHwgmtlMn36PDE2Q8
	 kQrLCkdimgsaDsxy81LY0KsS8PboOi7K+tlUIdAEYrA2+mWeDuAyrKjp5ZGQ9ABpMC
	 kE5DXCdI0EC2w==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.16
Date: Mon, 12 May 2025 11:38:58 +0100
Message-Id: <20250512103858.50501-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512103858.50501-1-shawnguo@kernel.org>
References: <20250512103858.50501-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_033932_229113_38521479 
X-CRM114-Status: UNSURE (   5.69  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.16

for you to fetch changes up to ef4c2c789a8a42e90a335e7411bd3cae3eb8d8d6:

  arm64: defconfig: Add Toradex Embedded Controller config (2025-05-09 22:41:57 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.16:

- Enable Toradex Embedded Controller driver as module in arm64 defconfig

----------------------------------------------------------------
Francesco Dolcini (1):
      arm64: defconfig: Add Toradex Embedded Controller config

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

