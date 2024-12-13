Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C4AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ykVcPxdYRMYvIQcuN07sVQ3CQt8LPa77Lk6kk9NGrNE=; b=yBlyoIj0N1o44frBWYb0uLrxDF
	TamH4xEuXNE4wVYCTU4jx5YjX+EcyTgltHN0NeRb/GnLkw3faN6VPj0p74m382qqEi8BWB3eS8Jhk
	JSABlUP4eYDhMAnplcnS+mKhDH3kIM/OktJ0VGj1Fm5kofdVGhD7y1rji85iM2AgB27Tz4YQ1yDya
	6k1tMVbd0KqO2ykaCPTDG/SDLFr3cjk2JJI/Pu+bCNtOi3AbRSa3+vURef+/JL/wYMY1Cf0hV0mC/
	91wgBQnbHyLZ5yEHGM0m/ymL/Rco2LQkvwJ7x3ST+oYIUTkamRaqCy2W4hjksYHcOt+0/sCCVL/4s
	UCFAalrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4nM-00000003i2v-2FCe;
	Fri, 13 Dec 2024 12:29:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4lz-00000003hrO-3opB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 12:28:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E7C81480
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 04:28:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE76D3F5A1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 04:27:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
Date: Fri, 13 Dec 2024 12:27:49 +0000
Message-ID: <20241213122749.2132488-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_042759_990010_956FE5BF 
X-CRM114-Status: UNSURE (   7.65  )
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

This option was removed from the Kconfig in commit 802b83205519 ("clk:
qcom: fold dispcc-sm8650 info dispcc-sm8550") but it was not removed
from the defconfig.

Fixes: 802b83205519 ("clk: qcom: fold dispcc-sm8650 info dispcc-sm8550")
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e615863..c6d6a31a8f48c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1352,7 +1352,6 @@ CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
-CONFIG_SM_DISPCC_8650=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
-- 
2.43.0


