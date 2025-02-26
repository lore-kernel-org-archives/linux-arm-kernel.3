Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24B5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rtvvMmvMsY8SG2s1d3cMiDjOI6XkZ4YDCQ8jLmsDfHA=; b=P4Ri2nM9/AjM5c9G9M8i8FCfIh
	3XiSbz3iB09fIrQUwpL3jsC/n8xIjtzHusVbSbFqrnOcQ6yt//j3Q2bZzRPY3OVnl4Z/O6BxUNKk/
	QrNHXi88lah/DHqn4ZvIsQD7ByQREOnqYvQ9FbR0i5yW5FUi9TEdZ0cTkEPQjI7trecspZ1/XHXho
	qsmfKQVxfddgwqGipay8Ma/UiTbL7pTdQCG+ln7Qpm+hj0B3a3f16pYB6su7u7xd2OvaPr5EtGWRQ
	81RMGU7iN/FbZZc9465p30vkawrphI/xNRY/xms/oqrsRI7yDCdcHj1/HgX6t5/z87pempIjjY7/A
	uUkuzBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMjt-000000055m6-3tQg;
	Wed, 26 Feb 2025 19:06:37 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMdl-000000054c9-3Fzx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F4FD61503;
	Wed, 26 Feb 2025 19:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3035C4CED6;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740596416;
	bh=wRpTgVNyj3uFgb5wwu79FFUhOzFVyOzLcCfMgdRPLUM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lRm3ned/BUYf6GvWxpgCOO8QFq0tstqJRUiEyXTgUmphlSq/KNZ2g9vEMjPaJN6fZ
	 53QIPBAUNEr3J/bMDqJoy69IctFdFrPzJ0TWsquINlXC5lylaZd+8DyMVrD3tZDnBk
	 wN1LVVuCmiXu783iLZ4z/XCDcwO1srFHyECKo46pcCOhcsAczakaHtizpRdzFBF6IB
	 ZoEUMHAFNWBUgq/Sf2sDD0vXxyQ96348PWD4b6HNpzfxouzpUMB/LNeFGoZSDiDbDA
	 kc5hOWbt7EaGrET+x+asYSMybMdx/L54cfuj4+G701/BbW/fXlCSJIwkY2V0vwd0Oh
	 hKBKiRD/J6T+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F09C021B8;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v2 0/4] Miscellaneous Apple RTKit fixes
Date: Wed, 26 Feb 2025 19:00:02 +0000
Message-Id: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJkv2cC/13MQQrCMBCF4auUWTuSjClUV95Dugjp1A5oGzIlK
 CV3NxbcuPwfvG8D5SSscGk2SJxFZZlr0KGBMPn5zihDbSBDrSEy6GN8MOoS8CkasG05WHK2c+M
 A9RQTj/LawVtfexJdl/Te/Wy/64+ifypbNGj9yY/u7Lzr/FUzz5FXTseBM/SllA9SysEtsAAAA
 A==
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=wRpTgVNyj3uFgb5wwu79FFUhOzFVyOzLcCfMgdRPLUM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/r+lF0rtmXPCKrcHZwkdkdrq9kvHjMe3mcezRsknjxdt
 ERMTVyqo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjARrQaG/zHO/8T+hOSnBcwU
 Yw9u38vbtfb/l+/zvW9eiuPY+cD2GhfDf3fjQ68NFCcdn3JxEtuRx7IqsixdG2dIrJ8xgfHQ1oV
 cAvwA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series contains four unrelated minor fixes to our RTKit driver.
These are mainly required for drivers which aren't upstream yet but
have been part of our downstream tree for quite a while now.

Best,

Sven

---
Changes in v2:
- Changed commit message for APPLE_RTKIT_PWR_STATE_INIT to make it clear
  this is a behavioral change
- Added a comment for the new oslog logic that the asymetric shifts are
  indeed correct
- Collected r-b tags
- Link to v1: https://lore.kernel.org/r/20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev

---
Hector Martin (1):
      soc: apple: rtkit: Implement OSLog buffers properly

Janne Grunau (3):
      soc: apple: rtkit: Add and use PWR_STATE_INIT instead of _ON
      soc: apple: rtkit: Use high prio work queue
      soc: apple: rtkit: Cut syslog messages after the first '\0'

 drivers/soc/apple/rtkit-internal.h |  1 +
 drivers/soc/apple/rtkit.c          | 63 +++++++++++++++++++++++---------------
 2 files changed, 39 insertions(+), 25 deletions(-)
---
base-commit: 00834971f0d9e38beae37e92055b1432782827d0
change-id: 20250220-apple-soc-misc-55ec124184fd

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



