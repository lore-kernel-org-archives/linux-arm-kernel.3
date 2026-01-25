Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E94D72371
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPeOjk0B38f1CGKSwqjOBJQrH3Lg6I5cjyY6QhesP84=; b=dg9sQceSffdAsJ+YpBwj5uaEVQ
	/mcJzEsUpvR1dAXM+MqNd+/0+k54CEz6btLYccIWN5znAdXcgfV02gUXEGH+trHyAfWTnWlI+T+dj
	xQSxeDLwBdMUiH/86ZQf+xN+jtUZnvdATtQGjOca6Lx+qHK1WLdBgF7lvOuHfLoZPD7OvCLLffoZO
	n2D9K6O4yc1h2lMYahmJw7ve964PWE5t/KJvKRCcCosgAs0Ypw+OV9hJN6ewylEgOwH70Mrf4vm9o
	WxC8EXPjlv26tJymP6XcCL+xNy20c2jpxGy6m+ziYH5Ck/PIry452DK3k9rP/K7tsvcGUJrDlAsY7
	/7F7EQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7zp-0000000BXdq-3Dif;
	Sun, 25 Jan 2026 21:50:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7zn-0000000BXdD-2uls
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 21:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C80C243F25
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 21:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A4AC16AAE;
	Sun, 25 Jan 2026 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769377809;
	bh=K+L+r3Aw3bizzNvK17w9PWhseeifQb6ZXxs8qMco0Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=Pc5ol6QS5FS2sJxAgeVJ1uqY+8nhzF/wpHUqCom3NdmLPrsbJArLfcMSG370vJv4G
	 WuoMZhBUHxLuUgvrHfErYelopvPBHQ7Qpf0nBgZVLi8Sa0y6J/bUIZ9qNkGJTIHUpa
	 EyQGKH0RmXe6/R5GfxyAr5SzXx+dndNFXqPoKJT3VRFPHnwGNjLH+Lwk6sCKYP/6UY
	 zPmwn4N8JJlob+gRqLXnENNeLUwOs4rA3LR9tEQxyf+eM4Pjgq1RxKLSHhenljlI5d
	 1q0576LNq99YQa8onoh3wLCAz8YBZHk/bJPL8xHmg34BAppABnw9fYWvJwAQHHuLuT
	 ZfwUnCqExBX0w==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC driver changes for v6.20
Date: Sun, 25 Jan 2026 22:49:56 +0100
Message-ID: <20260125214957.3367-1-sven@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_135011_763876_9C8A7A9A 
X-CRM114-Status: UNSURE (   6.76  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-6.20

for you to fetch changes up to ba99035bf16ef0d4a7f6acd56fc9292c0bd0d42e:

  soc: apple: rtkit: Add function to poweroff (2026-01-18 20:32:57 +0100)

----------------------------------------------------------------
Apple SoC driver updates for 6.20

- Add a poweroff function to the RTKit library which will be required
  for the first USB4/Thunderbolt series I hope to submit next cycle.

----------------------------------------------------------------
Sven Peter (1):
      soc: apple: rtkit: Add function to poweroff

 drivers/soc/apple/rtkit.c       | 16 ++++++++++++++++
 include/linux/soc/apple/rtkit.h |  7 +++++++
 2 files changed, 23 insertions(+)

