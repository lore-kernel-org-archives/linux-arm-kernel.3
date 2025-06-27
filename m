Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BAC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVQwiu85tNm7TS181cVQ4J8mZoVPIcV/KjJUpdE8mH4=; b=vuFo2MeR5Xmy0SGa1EZFkrlxT9
	QIgEnJ8ZtMTM/V8bg5kBb+e2GEvi6qtJLffRYi+Y83U0ZLJJvvsnCWj7NtgDlBpxu89GNQ8wFSdbx
	q/YuYNxE/u3p4NWNiFpJdzfc7LqjkjXasa2fL4OWTV9ySAzzV4OParMvy+lXLkrauHPKzyPP8FmQW
	AKOnHrIsxbNC4u2Y+Qt/5Q6qDUxrlFzS64vsVr0DokMry1XETDfZnFcVB1k2MlCyH0XSFNtWyj2VK
	jbkTjwr3T52IwDATj2lAI6+byqpWYYmM33JM8sIl0u7ORocF0UruFjFwLECiadJsk2SZGWEw3E/6R
	uetegIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8w4-0000000EkQM-3R0k;
	Fri, 27 Jun 2025 13:16:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8NW-0000000EfKE-1R7h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDE3A43CA3;
	Fri, 27 Jun 2025 12:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E17C4CEE3;
	Fri, 27 Jun 2025 12:40:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.17
Date: Fri, 27 Jun 2025 14:40:16 +0200
Message-ID: <cover.1751026659.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_054026_396579_3DEC4CEF 
X-CRM114-Status: UNSURE (   7.58  )
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

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.17-tag1

for you to fetch changes up to 910aa7765a7a12a5b485547de924fa97a21eb779:

  ARM: shmobile: defconfig: Refresh for v6.16-rc2 (2025-06-19 19:19:46 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.17

  - Enable modular support for Renesas RZ/V2H USB2PHY Port Reset Control
    in the ARM64 defconfig,
  - Refresh shmobile_defconfig for v6.16-rc2.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.16-rc2

Lad Prabhakar (1):
      arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 2 insertions(+)

