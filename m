Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC50C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldw9IkqaIQzJu21l/wIaIDvztg7NLw6YwJV94HNEQ3k=; b=WJVfA/2cTegffBfcfFfgy0FBn9
	M+9cZ7WJXKgGiuBEaSDhMaltT8G/wjFOhxSupHuy3BfTi/yNnp00bRhmJ5hK1vOmsC+xNea82dHK2
	NkJUFSZQFDsM3JnoMzY0QGJMTOsgGOd8WU2pn97r39j1DUXyFNCxZmtVJyXgA/M7E+LOBPPceb8e+
	ysw0+tKIxmv8W+/dCnog3+e3/CusDgDM94JW5Yb2zN5jYO3412LNOUxJHK6DmMZWVfXuVTk5PFpjK
	8mqVQDQHeVeLLYWAjvb/8hCNyX6LAA8aQDeuI20kEITSmDZjj8e0uyCLqUu+GKEOo416i8yoNbZV+
	HUARyXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGdB-00000000gAv-2zUW;
	Mon, 31 Mar 2025 15:00:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGFW-00000000a4z-1SRf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A72F6116D;
	Mon, 31 Mar 2025 14:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4F6C4CEEB;
	Mon, 31 Mar 2025 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743431785;
	bh=QQfSJ6URsGQRTmdqKZqvlDNd1JClNHUaKpoKWm2qpLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b21Qdsok5uFW960xskwtBFN6K6tfDsM+QJEHx668u2IYsxNGKgkdEdr9PunMJ0tCu
	 Fu+Gs3udW5dWlP2tDXV2HDOMICPI/yu5N+zS3S/S4Kv9hTyCngHVPMrCgIQXVeJmIz
	 nvpxWATw1emXZ06Bw8wiSNe0CYjMTd9rOK5TqhTTVLPrYN7lOI2VnzIAFnqUtvblef
	 R7LkAiwO5ccX0vjmqQTdwoPsxx4aFftJxTpBJiq3JhudPhzFhRzTIyJOK+Pf7HL2d1
	 UfFW8ZQszGAJDcvJhNa6N1lN48j4rS74HklWwmuw8iSGTE7xLrny+Z7sc0SWQXXFb/
	 aDIHQuwxCLRog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	mark.rutland@arm.com,
	oliver.upton@linux.dev,
	shameerali.kolothum.thodi@huawei.com,
	maz@kernel.org,
	scott@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 6/9] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Mon, 31 Mar 2025 10:35:59 -0400
Message-Id: <20250331143605.1686243-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331143605.1686243-1-sashal@kernel.org>
References: <20250331143605.1686243-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
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

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit 401c3333bb2396aa52e4121887a6f6a6e2f040bc ]

Add a definition for the Qualcomm Kryo 300-series Gold cores.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Trilok Soni <quic_tsoni@quicinc.com>
Link: https://lore.kernel.org/r/20241219131107.v3.1.I18e0288742871393228249a768e5d56ea65d93dc@changeid
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 488f8e7513495..c8058f91a5bd3 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -119,6 +119,7 @@
 #define QCOM_CPU_PART_KRYO		0x200
 #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
 #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
+#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
 #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
 #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
 #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
@@ -195,6 +196,7 @@
 #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
 #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
 #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
+#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
-- 
2.39.5


