Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FFFC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zgSHsXQk29ui9Z+91QJ9ktuD4OjC/hGwUOW699BKQWQ=; b=iABcMUnBL4UI1Pma3Wj10jmF8q
	CjFj3UIiuNtJs2MQ7jg84H8f64GAwY2QlXaieOMSJ+VH1MKOYgQa8j5/eqoyW48bS1r/HhD9bRd84
	mXYWDNor5BJBCsfHidL0u0eTaw2AcW4kbrbKZ0gLJ8K3P+0NkjlCxsjWQQe3bbnL69g+vypmq5kNM
	PU2aedvrk2x5kesha4F8/tmVsSTX49QnTJG3FZlD1Z6kU8g2G0lJkEv46lOU2DSh2QZJWduXy7L7u
	GC+AY/+LK8uSoU75PvRyFuikL1Sez+KnsacNd2J4oEZtMWhGcDqU0UF0XXbfrnqg58INf51c5s6o3
	SLKON9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNHc-00000008PRs-1nVm;
	Fri, 07 Aug 2026 16:18:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNHa-00000008PRl-184m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ED3B60A69
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 16:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E37F1F000E9;
	Fri,  7 Aug 2026 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119533;
	bh=zgSHsXQk29ui9Z+91QJ9ktuD4OjC/hGwUOW699BKQWQ=;
	h=From:To:Cc:Subject:Date;
	b=PsX6h+QcY2eV7aDOCo2ooJK+kXzqprGYPxw3vifWXV7J6m3aGX39KWv3IiG1M3ckw
	 US6zpsXZVjowWHuwiD52v/rimYUky6440s3g/YGrIVvE4Bb4MNgdtwXx8VcSGtaVV+
	 gqclCHeys4zIX373nZUrx2vbGOsVOinqere21yX578CnNvv8P4jnwpbJEgoPF3HQfS
	 AEcPJew8xgyW+vuWGVmh/X6kYooaqDjyiOe08nn0yA0TkmUJNP5T56qIKtmCfLejn5
	 VkGRcnp37T5Qw+BKzlVO46tXxhsGrZg+Y7nhFCW0yKWz9/ZhxrLOBvYxKJLlGT15ou
	 46jKcXN9t9rQA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC driver changes for v7.3
Date: Fri,  7 Aug 2026 18:18:34 +0200
Message-ID: <20260807161840.6011-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-7.3

for you to fetch changes up to fef9350c314bf089a11a62858261e6576ada867b:

  soc: apple: Add driver for Apple PMGR misc controls (2026-07-14 20:28:42 +0200)

----------------------------------------------------------------
Apple Soc driver updates for 7.3

- New driver and dt-bindings for Apple PMGR misc controls, which tweaks
  various global power related states and saves about 1W of power on M1
  Pro/Max/Ultra during s2idle.
- A small fix for device links in SART

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Pengpeng Hou (1):
      soc: apple: sart: require device link for consumers

Sasha Finkelstein (1):
      dt-bindings: soc: apple: Add Apple PMGR misc controls

 .../bindings/soc/apple/apple,t6000-pmgr-misc.yaml  |  45 +++++
 MAINTAINERS                                        |   1 +
 drivers/soc/apple/Kconfig                          |  10 ++
 drivers/soc/apple/Makefile                         |   2 +
 drivers/soc/apple/apple-pmgr-misc.c                | 181 +++++++++++++++++++++
 drivers/soc/apple/sart.c                           |   9 +-
 6 files changed, 246 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 create mode 100644 drivers/soc/apple/apple-pmgr-misc.c

