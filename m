Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E72CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AqeMivreSfG7xparwGAYfHGtuPEXwKGg588aNB0VH0=; b=SsDnKlfqOPXelAptvz0wkCSzWa
	oHujvMbZboU87pwTueGqt25mpj2toYIt5eqKp7sx7O5WR2wtvYI98wkHFCkMIlgKOVR2LEsnJeBoT
	omxl+bRef2dxQTKFrhvn3Ie90+bbfx3Pb4xXNTMCIQDd28mObus+g/VWvaMfD97rQITbR4BiYN68G
	IiIXqPIlxH+nixgZDXIZdFRxXGlCfuRjUsMjjj09ks1e3fdje4KDY34G9PSsD0vuAOrmokTjEmEZ/
	yQlIzuRmkqLqz9ECWEeV+YYUS2fIZHjwgwv/QWeLcafgFnxZMybkPRnltnsrSx4WSVHgP10MmIiRo
	cSZF1QMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8ck-00000008rEv-3Wus;
	Mon, 18 Aug 2025 22:46:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Vt-00000008l7S-0jTy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 21:35:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADA271AED;
	Mon, 18 Aug 2025 14:35:24 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CC6A3F738;
	Mon, 18 Aug 2025 14:35:32 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	thiago.bauermann@linaro.org,
	broonie@kernel.org,
	yury.khrustalev@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v6 6/7] arm64: Kconfig: Remove GCS restrictions on UPROBES
Date: Mon, 18 Aug 2025 16:34:51 -0500
Message-ID: <20250818213452.50439-7-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818213452.50439-1-jeremy.linton@arm.com>
References: <20250818213452.50439-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_143533_255486_FC39D8D8 
X-CRM114-Status: UNSURE (   8.78  )
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

Now that the uprobe paths have been made GCS compatible
drop the Kconfig restriction.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..c61572bbe59b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2225,7 +2225,6 @@ config ARM64_GCS
 	default y
 	select ARCH_HAS_USER_SHADOW_STACK
 	select ARCH_USES_HIGH_VMA_FLAGS
-	depends on !UPROBES
 	help
 	  Guarded Control Stack (GCS) provides support for a separate
 	  stack with restricted access which contains only return
-- 
2.50.1


