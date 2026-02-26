Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D0AFD8FC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHGlvijmr87D+3n+QVqt0FE6kr9MZ8g5DgUROfQP5A4=; b=a+XvPrNdEjM4KawEajEbIqKCyp
	JSTS9FDfpeDU+RmhDDOP/aBRxo03uzVKXyJ3I6PHR4P10oZ/7DlKQWkXsw8V7eTIOo83gZDZjxyB5
	khme4z7cOitWUCoBdEvXXpkzY1SmxI4P/VqNcrfczy0fZ6+qUF52x5XL/14cAXy9zXGWwiMnEjQj/
	5L13OVWxfmO5glef5+Ttj3hUyb5ukisI5FeuN/scK0hDiICVaZumLwiLT2aD3V7/DdF+9sp3MZDW8
	JTozWy38WumC/19vRJZGP10+UynYqdbEIGeoz2+yVIF9K7tldli6EeyxiBQ0PGlTNJMKyGpKhFR/I
	HbSFgdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvczr-00000006PZX-1q18;
	Thu, 26 Feb 2026 15:09:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvczo-00000006PYa-3kq1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FEF642A9C;
	Thu, 26 Feb 2026 15:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173BBC19424;
	Thu, 26 Feb 2026 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772118583;
	bh=dM7h7sasxVzTsEh5Z4cUfB9ll5Z5dqbcZh4jIBxy4JY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mX2YlMhazqprNl4bPZwVsnmQm/PXQBNEZI1/h1ALSLsQoqpD/UECipILws3TfKHn2
	 n3X0oio3i0JHlmTLQdNsZhXLUhKMlwCJroW6MfzgiJ2bcDGapYkQeKC1UdLcdj21Cj
	 vJrEOYjFDWNCx/clkqw+2jqumkquiL6nGOOF9tcUfwlnyprFq1VoPYPYNwkFjA65y/
	 EImdU6jbDB2oISw53F2it63LRbW+IGux1atEFqjCZPBXNF+GvRTLpaqu2JoN5JAfo6
	 9QzuBzbasYW9j2FXGPn+FUsKJqLbzCe3gp5EQpSF/yxw9hCT/tL/RbatdOVJ/HXUnd
	 aYXp1hB9H8V2Q==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] firmware: tegra: bpmp: Rename Tegra239 to Tegra238
Date: Thu, 26 Feb 2026 16:09:33 +0100
Message-ID: <20260226150933.4067324-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226150933.4067324-1-thierry.reding@kernel.org>
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_070944_996641_8B40AE36 
X-CRM114-Status: UNSURE (   9.40  )
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

From: Thierry Reding <treding@nvidia.com>

This chip identifies as Tegra238, so update the BPMP ABI header to refer
to it by the correct name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/soc/tegra/bpmp-abi.h | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index dc0789c20333..39bb3f87e28d 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -1020,9 +1020,9 @@ struct cmd_i2c_xfer_request {
 	/**
 	 * @brief Tegra PWR_I2C bus identifier
 	 *
-	 * @cond (bpmp_t234 || bpmp_t239 || bpmp_t194)
+	 * @cond (bpmp_t234 || bpmp_t238 || bpmp_t194)
 	 * Must be set to 5.
-	 * @endcond (bpmp_t234 || bpmp_t239 || bpmp_t194)
+	 * @endcond (bpmp_t234 || bpmp_t238 || bpmp_t194)
 	 * @cond bpmp_th500
 	 * Must be set to 1.
 	 * @endcond bpmp_th500
@@ -2108,7 +2108,7 @@ struct mrq_emc_dvfs_latency_response {
  * @brief Query EMC HUB frequencies
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: N/A
@@ -2139,7 +2139,7 @@ struct mrq_emc_dvfs_emchub_response {
 } BPMP_ABI_PACKED;
 
 /** @} EMC */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2147,7 +2147,7 @@ struct mrq_emc_dvfs_emchub_response {
  * @brief Set EMC display RFL handshake mode of operations
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_emc_disp_rfl_request
@@ -2184,7 +2184,7 @@ struct mrq_emc_disp_rfl_request {
 } BPMP_ABI_PACKED;
 
 /** @} EMC */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2192,7 +2192,7 @@ struct mrq_emc_disp_rfl_request {
  * @brief bwmgr requests
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_bwmgr_request
@@ -2299,7 +2299,7 @@ struct mrq_bwmgr_response {
 } BPMP_ABI_PACKED;
 
 /** @} BWMGR */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2307,7 +2307,7 @@ struct mrq_bwmgr_response {
  * @brief bpmp-integrated bwmgr requests
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_bwmgr_int_request
@@ -2445,7 +2445,7 @@ struct mrq_bwmgr_int_response {
 } BPMP_ABI_PACKED;
 
 /** @} BWMGR_INT */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2453,7 +2453,7 @@ struct mrq_bwmgr_int_response {
  * @brief ISO client requests
  *
  * * Platforms: T234 onwards
- * @cond (bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_iso_client_request
@@ -2636,7 +2636,7 @@ struct mrq_iso_client_response {
 } BPMP_ABI_PACKED;
 
 /** @} ISO_CLIENT */
-/** @endcond (bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2644,7 +2644,7 @@ struct mrq_iso_client_response {
  * @brief CPU freq. limits in ndiv
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_cpu_ndiv_limits_request
@@ -2678,7 +2678,7 @@ struct mrq_cpu_ndiv_limits_response {
 } BPMP_ABI_PACKED;
 
 /** @} CPU */
-/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2911,7 +2911,7 @@ union mrq_ringbuf_console_bpmp_to_host_response {
  * @brief Set a strap value controlled by BPMP
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_strap_request
@@ -2949,7 +2949,7 @@ struct mrq_strap_request {
 } BPMP_ABI_PACKED;
 
 /** @} Strap */
-/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -2957,7 +2957,7 @@ struct mrq_strap_request {
  * @brief Perform a UPHY operation
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_uphy_request
@@ -2997,23 +2997,23 @@ struct cmd_uphy_margin_status_response {
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_init_request {
-	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
+	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T238 valid: 0 */
 	uint8_t ep_controller;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_pcie_controller_state_request {
-	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T239 valid: 0-3 */
+	/** @brief PCIE controller number, T194 valid: 0-4; T234 valid: 0-10; T238 valid: 0-3 */
 	uint8_t pcie_controller;
 	uint8_t enable;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_ep_controller_pll_off_request {
-	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T239 valid: 0 */
+	/** @brief EP controller number, T194 valid: 0, 4, 5; T234 valid: 5, 6, 7, 10; T238 valid: 0 */
 	uint8_t ep_controller;
 } BPMP_ABI_PACKED;
 
 struct cmd_uphy_display_port_init_request {
-	/** @brief DisplayPort link rate, T239 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
+	/** @brief DisplayPort link rate, T238 valid: 1620, 2700, 5400, 8100, 2160, 2430, 3240, 4320, 6750 */
 	uint16_t link_rate;
 	/** @brief 1: lane 0; 2: lane 1; 3: lane 0 and 1 */
 	uint16_t lanes_bitmap;
@@ -3084,7 +3084,7 @@ struct mrq_uphy_response {
 } BPMP_ABI_PACKED;
 
 /** @} UPHY */
-/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500) */
+/** @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500) */
 
 /**
  * @ingroup MRQ_Codes
@@ -3092,12 +3092,12 @@ struct mrq_uphy_response {
  * @brief Perform a frequency monitor configuration operations
  *
  * * Platforms: T194 onwards
- * @cond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @cond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  * * Initiators: CCPLEX
  * * Targets: BPMP
  * * Request Payload: @ref mrq_fmon_request
  * * Response Payload: @ref mrq_fmon_response
- * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t239 || bpmp_th500)
+ * @endcond (bpmp_t194 || bpmp_t234 || bpmp_t238 || bpmp_th500)
  *
  * @addtogroup FMON
  * @{
-- 
2.52.0


