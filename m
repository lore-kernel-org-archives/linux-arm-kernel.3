Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F9BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PXsaD36Mhp2xdabWJgYcrfy29+ICcaNiixvphOY3GMY=; b=bCuKHBheWFQ+DggjBAgIcpzmsK
	sGYIyt5Fi220T424O7SnZyd/LQJyz9KP57t/MYZ5Sg+VhvcFaejjln8Y/XDQsnn7EomG/TUzK7uZx
	cLgCBFDZ8OJ30nZAtbBuw359Byh+KGmDQaa5zHpRFKoVTt/8DlkA5vII7tn/Dk+CIc87FMzBu6YN/
	B1Dugfop45XMRgsWBzzzVLf2zLnZHTgqogtqUYrIvmuTXuiqIEnd8m4TcKLVARCtpMzQ+SlKdN7oo
	CUZun80yM882WwUu6DAkvAr3INg9ZujufQ6zIcqcMYSoxUfx3XokW6ZQqENFY45rsv6svPLQHWNgJ
	9/wb6eyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZGZ-0000000B4HS-2fVe;
	Fri, 02 Oct 2026 09:09:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZGY-0000000B4HF-2s8l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:09:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11A9F40633;
	Fri,  2 Oct 2026 09:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DBF1F000FF;
	Fri,  2 Oct 2026 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932158;
	bh=PXsaD36Mhp2xdabWJgYcrfy29+ICcaNiixvphOY3GMY=;
	h=From:To:Cc:Subject:Date;
	b=Hcq07Oe1ma2HjAffxWEwVcSkqOWKJozQiKprnBhdxHWlGn5XhlfrOYLtNxx76e02d
	 lLd0b0OUXVjWCXIQvAH6JrD98gEg/OdWPhkStYcbm/eqkPxibZWuuDDlkdIbSOVrBM
	 ouePwpRaTzE82NljQBvD8J/1KEETCG1he7vi2K6ibHRb6QjQt78EmSKGQX7HN69FgW
	 eIZqmTnI0HPA9IoTlA9PE6Ez3Tshy5WuhA8cKnCvTRwQo5cYlFtdyDJRN7b6icN9II
	 p0RUEqQShGJGMeQ9h5KJ4/oBmqPINYvMY1kVm6jfnt+ea1SgGESasSrNDM9/Th6DBm
	 DbTnCdlPIBE5Q==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: tegra: Fix Trun -> Turn typo
Date: Fri,  2 Oct 2026 11:09:12 +0200
Message-ID: <20261002090912.2200487-1-thierry.reding@kernel.org>
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

From: Thierry Reding <treding@nvidia.com>

Found this while experimenting with codespell, so might as well fix it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/mach-tegra/sleep.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
index 945f2c1474f7..751cc71dce7f 100644
--- a/arch/arm/mach-tegra/sleep.S
+++ b/arch/arm/mach-tegra/sleep.S
@@ -48,7 +48,7 @@ ENTRY(tegra_disable_clean_inv_dcache)
 	blne	v7_flush_dcache_louis
 	bleq	v7_flush_dcache_all
 
-	/* Trun off coherency */
+	/* Turn off coherency */
 	exit_smp r4, r5
 
 	ldmfd	sp!, {r0, r4-r5, r7, r9-r11, pc}
-- 
2.55.0


