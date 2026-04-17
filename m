Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578FCF4369E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl+c4Shb2wYk5ZcB+RauhBC6rlb1gBsMvB1Tds2EYy8=; b=IOgbv7SGJrAEYOeQbZYs2Gav12
	aa+sRp2MTo9uU2Rt6c5i85ugQ5Jq68TdwLY7XiqXqbz1l4zfJcMuLhXJKQHeEY/7kS8yH+P1+AJ22
	yIBi17gp45zd9S2mLkVy83x85ynbnhRbViesexXe/GFeC7QAtI3HRCbaXb/0BLonHcLnPao2DizpX
	6/5itxHk9W8JbUJjhi57WXWTB0/eTjzQfrTBZz4IefbKaZ34suMYMhixGClZzBPuRNrqDYCmBo6cF
	uE+l8smJ+NNtIkTZQmLWd80EBXa/3tnF4++wfKntepddq5MOswVjs+KpBeVsli1anxMqj5OOQpSFw
	prlzPvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj3H-000000044c1-0Kms;
	Fri, 17 Apr 2026 13:16:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj3D-000000044ag-0xuG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 13:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB4A56013B;
	Fri, 17 Apr 2026 13:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C3CC2BCB0;
	Fri, 17 Apr 2026 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431762;
	bh=ZwXQ0B97mAqYw+Pj4q1qkn3w0VEkp8PC3RW3zFe6OsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cas8tNl9CxmcLPr+klpYOiOUpWw43pvARwfWzkMhAldp4ZiMUUD85xhwTjq7t6hVg
	 bIcshTUeASvThAOLJ6gi/HwyuE/Dir1wBYF/Hj5q8lgD/slBp7IQ7i63f0qexpV3wJ
	 Dpdik+ZOT2LUCaDE9CzA3t21t9MAph0JK/phP//57EZbMMfSI9howf1iEOjXKH+sGI
	 wHm+HbRaq2FdZdHUEirPh/MOgchAVjivRph3vR+xdxflx0o/dn8vCQediYu6KxEK78
	 e7BzDvigmM3Xpx9AtOQL++z/+7AN13/idhGEszTreTBLHfZ6xObY5Sgu3f+zx0TmNO
	 CMyLhJqHZ9Drw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: reserved-memory: Change maintainer for BPMP SHMEM
Date: Fri, 17 Apr 2026 15:15:48 +0200
Message-ID: <20260417131549.3154534-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
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

Peter sadly passed away a while ago, so change the maintainers for BPMP
SHMEM to Jon and myself.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
index 4380f622f9a9..6efadc5f8078 100644
--- a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Tegra CPU-NS - BPMP IPC reserved memory
 
 maintainers:
-  - Peter De Schrijver <pdeschrijver@nvidia.com>
+  - Thierry Reding <thierry.reding@kernel.org>
+  - Jonathan Hunter <jonathanh@nvidia.com>
 
 description: |
   Define a memory region used for communication between CPU-NS and BPMP.
-- 
2.52.0


