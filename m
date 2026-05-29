Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB97CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D2Gqqo3X5pT7/OB7PrQNynnY8xsTJGt7leNxVWfYUZA=; b=inEfhO80UBHEiiIME/ybJjceIz
	yTPBKS3Ecp4TbGnMA3Ko5hmXdhfCY1ehGdQW62sWN7+a+rGcUSs/d9P/XZTjwn7gINy97VX0Tn3SN
	6SyOPTmRPVO4DBuzkqZm9jhmrja5H5d9oZvWBQfSLY5fr3sR9pxngwh6i9h/vRGfdDc5JG7biqyoP
	2TcXRXnFN3Az+WO0iw33QKYhodvugHFpp4QVuL4VsUvWEaUXsUfXFvjcw0Gbkvp5G6b5ayG/sKz74
	XnhfEoC3q8SxiDWsg/y7lgsqKQqFUSNyamCAZ8kX5Po9CtUyVtCrX18eCM/2PFFJz5kWYpFa8l2jO
	y02/pEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxWW-00000007T49-0Pxf;
	Fri, 29 May 2026 13:45:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxWV-00000007T43-0XOd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:45:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34221605C5;
	Fri, 29 May 2026 13:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114B21F00893;
	Fri, 29 May 2026 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780062313;
	bh=D2Gqqo3X5pT7/OB7PrQNynnY8xsTJGt7leNxVWfYUZA=;
	h=From:To:Cc:Subject:Date;
	b=HOWWQL8FtPL7POLKJByanUk70ZpFIHmztZZlNhmo0zjb5zmEtUMkPI9zYQbPMTQxy
	 Tb7//aDAhQeZwApYF1LCB1+ViIF9IQseV9N/4yrMaKr6gp4aPO19JRN2q9Ldask4jt
	 mFCamrYFkf9GBmt8QxLumw+kSvODlOpeKgevpTV9qLYBYQavadKoAWvvbxwxt8rAuV
	 J2nheOkjLTHmT7O7EpBXdMuaTkRSuKQwCQ69+ezcRPnHnI+g4TF3Dq3cv/0MFdQDk1
	 7b1j2yOXVBnh8I9b8tFdjsMC2uUsSKeysUA5o3CQgYO63a+xGF2OgNzTgFEThEJ35S
	 2S46bRIdBNZ5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Brian Masney <bmasney@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: samsung: acpm: remove compile-testing stubs
Date: Fri, 29 May 2026 15:43:31 +0200
Message-Id: <20260529134454.2147446-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Sashiko reported an inconsistent use of NULL vs ERR_PTR()
returns in the stub helpers in xynos-acpm-protocol.h.

Since this only happens on dead code for COMPILE_TEST=y, this is not
really a bug though.  Having stub functions that return NULL is a common
way to define optional interfaces, where callers still work when the
feature is disabled, though this clearly does not work for acpm because
some callers have a NULL pointer dereference when compile testing.

Since CONFIG_EXYNOS_ACPM_PROTOCOL already supports compile-testing itself,
and all (both) drivers using it clearly require the support, so this
just simplifies the option space without losing any build coverage.

Remove the stub functions entirely and adjust the one Kconfig
dependency to require EXYNOS_ACPM_PROTOCOL unconditionally.

Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org
Link: https://lore.kernel.org/all/a7994860-24a3-4f87-84bf-109ed653dda4@linaro.org/
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/samsung/Kconfig                        |  2 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 14 --------------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 70a8b82a0136..198d8b621289 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -97,7 +97,7 @@ config EXYNOS_CLKOUT
 
 config EXYNOS_ACPM_CLK
 	tristate "Clock driver controlled via ACPM interface"
-	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
+	depends on EXYNOS_ACPM_PROTOCOL
 	help
 	  This driver provides support for clocks that are controlled by
 	  firmware that implements the ACPM interface.
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 83cbd425b652..c73aea30d960 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -68,22 +68,8 @@ struct acpm_handle {
 
 struct device;
 
-#if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
 struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
-#else
-
-static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
-							struct device_node *np)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */
-- 
2.39.5


