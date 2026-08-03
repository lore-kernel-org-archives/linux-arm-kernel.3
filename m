Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401DDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLjX1DA3K8fYAJ7gcAbyXIpN7gOrD9t46We+X6Ro4XA=; b=n680kpeQyVFKWwSMFTuWwvJXF1
	ZJMFUKeVMgJRsWu45gpV5XUuddG85sPSkriM2/Gjpssaxou0CIJUPP0Qs/hK+Y9X+14Pe9nBFjhjz
	YW933oDTT+OnMTZHjLLdobAA4+O8AR8eSv7c3mdZD9rgNIheprNQNzQk+v8mXN10I7uEIEBevhZS1
	7fCAGvNP+/6t8qEQFK6qqsEu7Z6Nrt3hEHuWzb9Vnvx3KnkoYTsfSV1nifUuNPeq5Mp4VD9OXScZW
	LNRzOwKt3ZsIB9d1/oFJvLXrM3xC8Xpg/pf8GkOes9GGxcHpfft0rzfKdxI9iKf72AVZpD3IoDjLe
	S8ziFJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvkd-0000000074X-0Mlx;
	Mon, 03 Aug 2026 16:42:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvkb-0000000073v-3Ug6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:42:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 590D74372F;
	Mon,  3 Aug 2026 16:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B437A1F00A3A;
	Mon,  3 Aug 2026 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775373;
	bh=OLjX1DA3K8fYAJ7gcAbyXIpN7gOrD9t46We+X6Ro4XA=;
	h=From:To:Cc:Subject:Date;
	b=lP/e9EiX4sFYWnLXiNmghLcwSCqmDZf6HyNBlH21myUAA/7sKKg5pnL7vBiVGl0wg
	 LwE1PCDMhN852rrnQjUrkGWvOnIaTPFHEXKHTqGpX7R1rG+kkfc8NcrcX+ozkmSckU
	 DXrW22HJWT30ku4tFaxgVpZK10Yth5HC5X+CfK4HfyVPFFyCSx2clNGzSYx5izYs0e
	 u2Vy7CA90Hc1fynnoG+ssYqH5G2sex3fkVRELrQZwUSADNT5QZyOEOzJ++EhVoLiR6
	 iOSH65PMPdO56gkSk3GisM0o6SHuDW4/amGX+aKmPW1RRVwTrPV81jFaCiv1EEbR6U
	 5cWh77HWbaczw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] MAINTAINERS: arm64: Add Mark Rutland as an official Reviewer
Date: Mon,  3 Aug 2026 17:42:30 +0100
Message-ID: <20260803164230.25172-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Mark has been part of the arm64 furniture for as long as the code has
existed in mainline and is consistently one of the most active and
knowledgeable reviewers that we have.

Make it official.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---

Mark's actually OoO atm, but I spoke to him about this offline and he
was keen to be listed. Honest!

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 806bd2d80d15..08328eb1064d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3913,6 +3913,7 @@ F:	drivers/platform/arm64/
 ARM64 PORT (AARCH64 ARCHITECTURE)
 M:	Catalin Marinas <catalin.marinas@arm.com>
 M:	Will Deacon <will@kernel.org>
+R:	Mark Rutland <mark.rutland@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
-- 
2.55.0.508.g3f0d502094-goog


