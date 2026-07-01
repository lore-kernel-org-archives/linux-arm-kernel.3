Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 02:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQ9pbyyLZ8W2ZgRimHaqlSaqrHZBvDPVJzuppgg/WjU=; b=JXm6+bOPGKdnZh3an6agxiKJbv
	xMo7J6tPDt781H+D7P1N4kT1LFtu+XKUjhWCisesAIBFwFTR1GrurvwHfWbxy+HWZZa3zHgV+EEon
	yex0rtX3ZPwv/LAOMNJ3GMdhrZfp8tcxpWBivsfXn9AZqaQJrLNhNybxUeTQruBOP8XtC4uOk5/zR
	HY+DyBGeuwuzI7W2ASaAEYzyFxTAo123+54ucsjPW8sMmt5eM8oBheU+ScYB2H7Cpe8j0FGTGUxb3
	WSypOoDWW2zlxt0SddiCcLS/kYrsOaBYJE5ylx3TJsMwj4TtUOBFJEKo5kjFxGO0k0k1FQ8HInMOk
	53dL+mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekgm-00000000Wgd-1bF6;
	Wed, 01 Jul 2026 02:28:36 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekgi-00000000Wfk-21e5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 02:28:34 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c892143db7fso76686a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 19:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782872910; x=1783477710; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rQ9pbyyLZ8W2ZgRimHaqlSaqrHZBvDPVJzuppgg/WjU=;
        b=XfoPB9BdfOP4GzI78595+M8alGwdHuiGLaSwZLFxduHQ/rCVHRG5wnSIYg9NDrIHEN
         7gqTQBFvC4BvcnpK4H+67tGtujUCSum3l+4XhOKnCkTIsFMuo8C/rCMLTJrzZ+YBKVNX
         nVt3Zy1WJ1nxVGstD6nfwnhiT2b1mOx+8gswEYg2edJFYMPU+I2QGk3BxmPnNGSxCc8r
         nUyDeAFfot8b6Hz2+W/lMMrxtmwQ+nZRdsJ5o/BPCW5S3WTkYfc1EkOUJJKBiF+/gl/0
         KrgXIKBcCQeYfD2QIc2KVTT68Z5nH7ZN4hYavJcbyJvZujAHTWz1/eDpEdnY0TCp3nvR
         Qn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782872910; x=1783477710;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQ9pbyyLZ8W2ZgRimHaqlSaqrHZBvDPVJzuppgg/WjU=;
        b=Uby5x11/+281BU20GZfF1YuqSpUAQVkLXp2jR0hVsu2rhLSGFTBdlCmxHCKvpkwKkV
         9SP7OWmJ9DstECr2gMJHwP69Lq2v9XW/dnn661RLk/8kU9wvwHYVmFhXK+RVgEY9L725
         xA1FVH9c4y2rURm3Dzw79ENjGErw3I+hCGhM+Hqa6Dqcw+5LYVQ1mATIdyKUhh/nLASw
         zFv5APmmwey4cWpJlLUyxgz1HvCK0891jLBHGCz6ryD/7pOiVxSIx+REtnutfFiRZJS7
         /XNByM0EAmlgn99bAa8UFTy9m5kU15zBHQF62XvbUYy1AFiOlDWZROxSI2OhsaSN7bgS
         TlgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lCtTUP/9te9Nuq5vTWx0nUc5wPFhdcChwnHY/IXp2lCkvcjmm7zKEL4LTa7BKBwvNLVzCzo7tT/PdG0fi59Mp@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIzwbtsdZdPcxPhZkyj6KP/Vh+4rH197xi6cEecn6QTRvu8+h
	IbKSkhl/7oP773lHkOidbXJmlZpHM659T9o7u8bwn7RfG3JkaVJzLP1FF6LaiDbUCKWUvgTiddj
	LnvDe+eyoUX2CnsjDNg==
X-Received: from pgau25.prod.google.com ([2002:a05:6a02:2d99:b0:c9b:aaf2:afde])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2c12:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3bfc505ebc4mr5389980637.5.1782872910207;
 Tue, 30 Jun 2026 19:28:30 -0700 (PDT)
Date: Wed,  1 Jul 2026 02:28:28 +0000
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=19203; i=rdbabiera@google.com;
 h=from:subject; bh=sCVO/BsPuEEOCHCQ4Vh/tQBo726wnItxuvqSSeir+Hg=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGLJcqr31In5/WSH4NSnBI0DL90Nc0Abts425vF57Dstdz
 Hv9Y7FdRykLgxgXg6yYIgt3ySXpU+F7HTisihfAzGFlAhnCwMUpABM5l83wk9F1ofnTaYy+D9dl
 X1rwPMxEpWEpx0QV5f2bV9xRb9Rm+MDIcKQo+7yMqprx5F7uj1oTTyet93Au0pR0yI24/mOKofw PHgA=
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701022827.785674-2-rdbabiera@google.com>
Subject: [PATCH v3] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
From: RD Babiera <rdbabiera@google.com>
To: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org
Cc: badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_192832_668212_9F0CEA4D 
X-CRM114-Status: GOOD (  26.45  )
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

Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
This patch adds functionality for the usb3_tca register, usb3 clock,
and usb3 reset as defined in google,lga-usb-phy.yaml. Kconfig now lists
USB SuperSpeed support.

Refactor the probe sequence to initialize the USB2 and USB3 PHYs, and then
initialize clocks and resets for both PHYs afterwards.

Refactor set_vbus_valid to reduce duplicated code.

Implement USB3 phy_ops for phy_init, phy_exit, and phy_power_on.
combo_phy_state enum is added to track PHY bringup state across
PHY API calls.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes since v1:
* Removed mix of goto-based and scope-based cleanup from usb3 phy_init
* Removed unused usb3_core resource from probe
* Added combo_phy_state enum to interally track ComboPHY bringup state
  to allow google_usb_set_orientation() to change TCA orientation.
* Modify Kconfig documentation to reflect SuperSpeed support

Changes since v2:
* google_usb3_phy_init now sets USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N
  to false if phy_init fails elsewhere.
* google_usb3_phy_init errors are now handled via DEFINE_FREE structures.
  This affects set_pmgt_ref_clk_req_n, clk_bulk_prepare_enable, and
  reset_control_bulk_deassert.
* google_usb2_phy_init also handles undoing clk_bulk_prepare_enable via
  DEFINE_FREE structure.
* google_usb3_phy_power_on allows program_tca_locked in the
  COMBO_PHY_TCA_READY state. Waiting for PoR=>NC is only performed once.
* Note: there are checkpatch errors for the DEFINE_FREE macros resulting
  in "ERROR: trailing statements should be on next line". Other cases of
  DEFINE_FREE where the line limit would otherwise exceed 100 columns
  have the indentation done the same way.
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-google-usb.c | 404 +++++++++++++++++++++++++++++++----
 2 files changed, 368 insertions(+), 38 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..d2d401129af7 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -100,7 +100,7 @@ config PHY_GOOGLE_USB
 	  the G5 generation (Laguna). This driver provides the PHY interfaces
 	  to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
 	  both of which are integrated with the DWC3 USB DRD controller.
-	  This driver currently supports USB high-speed.
+	  This driver currently supports USB high-speed and SuperSpeed.
 
 config USB_LGM_PHY
 	tristate "INTEL Lightning Mountain USB PHY Driver"
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index ab20bc20f19e..610e3b6f465f 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -20,6 +20,7 @@
 #include <linux/reset.h>
 #include <linux/usb/typec_mux.h>
 
+/* USB_CFG_CSR */
 #define USBCS_USB2PHY_CFG19_OFFSET 0x0
 #define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
 
@@ -28,11 +29,41 @@
 #define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
 #define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
 
+/* USBDP_TOP */
 #define USBCS_PHY_CFG1_OFFSET 0x28
+#define USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN BIT(1)
+#define USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE GENMASK(11, 10)
+#define SRAM_BYPASS_MODE_BYPASS_FIRMWARE BIT(0)
+#define SRAM_BYPASS_MODE_BYPASS_CONTEXT BIT(1)
 #define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
 
+#define USBDP_TOP_CFG_REG_OFFSET 0x44
+#define USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N BIT(0)
+
+#define PHY_POWER_CONFIG_REG1_OFFSET 0x48
+#define PHY_POWER_CONFIG_REG1_PG_MODE_EN BIT(1)
+#define PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG GENMASK(31, 14)
+#define UPCS_PIPE_CONFIG_ISO_CPM BIT(5)
+#define UPCS_PIPE_CONFIG_PG_MODE_STATIC BIT(6)
+#define UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT BIT(9)
+
+/* USB3_TCA */
+#define TCA_INTR_STS_OFFSET 0x8
+#define TCA_INTR_STS_XA_ACT_EVT BIT(0)
+#define TCA_TCPC_OFFSET 0x14
+#define TCA_TCPC_MUX_CONTROL GENMASK(2, 0)
+#define TCA_TCPC_MUX_CONTROL_USB_ONLY 0x1
+#define TCA_TCPC_CONNECTOR_ORIENTATION BIT(3)
+#define TCA_TCPC_VALID BIT(4)
+#define TCA_PSTATE_0_OFFSET 0x50
+#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
+
+#define GPHY_TCA_DELAY_US 10
+#define GPHY_TCA_TIMEOUT_US 2500000
+
 enum google_usb_phy_id {
 	GOOGLE_USB2_PHY,
+	GOOGLE_USB3_PHY,
 	GOOGLE_USB_PHY_NUM,
 };
 
@@ -46,34 +77,172 @@ struct google_usb_phy_instance {
 	struct reset_control_bulk_data *rsts;
 };
 
+struct google_usb_phy_config {
+	const char * const *clk_names;
+	unsigned int num_clks;
+	const char * const *rst_names;
+	unsigned int num_rsts;
+};
+
+static const char * const u2phy_clk_names[] = {
+	"usb2",
+	"usb2_apb",
+};
+static const char * const u3phy_clk_names[] = {
+	"usb3"
+};
+static const char * const u2phy_rst_names[] = {
+	"usb2",
+	"usb2_apb",
+};
+static const char * const u3phy_rst_names[] = {
+	"usb3"
+};
+
+static const struct google_usb_phy_config phy_configs[GOOGLE_USB_PHY_NUM] = {
+	[GOOGLE_USB2_PHY] = {
+		.clk_names = u2phy_clk_names,
+		.num_clks = ARRAY_SIZE(u2phy_clk_names),
+		.rst_names = u2phy_rst_names,
+		.num_rsts = ARRAY_SIZE(u2phy_rst_names),
+	},
+	[GOOGLE_USB3_PHY] = {
+		.clk_names = u3phy_clk_names,
+		.num_clks = ARRAY_SIZE(u3phy_clk_names),
+		.rst_names = u3phy_rst_names,
+		.num_rsts = ARRAY_SIZE(u3phy_rst_names),
+	},
+};
+
+static inline void google_usb_phy_clk_disable(struct google_usb_phy_instance *inst)
+{
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+}
+DEFINE_FREE(inst_clk_disable, struct google_usb_phy_instance *,
+	    if (_T) google_usb_phy_clk_disable(_T))
+
+static inline void google_usb_phy_rst_disable(struct google_usb_phy_instance *inst)
+{
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+}
+DEFINE_FREE(inst_rst_disable, struct google_usb_phy_instance *,
+	    if (_T) google_usb_phy_rst_disable(_T))
+
+/*
+ * combo_phy_state
+ *	COMBO_PHY_IDLE: The ComboPHY has been torn down and USB3 has not completed
+ *			bringup
+ *	COMBO_PHY_INIT_DONE: The ComboPHY bringup sequence is complete.
+ *	COMBO_PHY_TCA_READY: The PoR => NC transition is complete, and the TCA can be
+ *			     moved into USB.
+ */
+enum combo_phy_state {
+	COMBO_PHY_IDLE,
+	COMBO_PHY_INIT_DONE,
+	COMBO_PHY_TCA_READY,
+};
+
 struct google_usb_phy {
 	struct device *dev;
 	struct regmap *usb_cfg_regmap;
 	unsigned int usb2_cfg_offset;
 	void __iomem *usbdp_top_base;
+	void __iomem *usb3_tca_base;
 	struct google_usb_phy_instance *insts;
 	/*
 	 * Protect phy registers from concurrent access, specifically via
-	 * google_usb_set_orientation callback.
+	 * google_usb_set_orientation callback. phy_mutex also protects
+	 * concurrent access to phy_state.
 	 */
 	struct mutex phy_mutex;
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+	enum combo_phy_state phy_state;
 };
 
 static void set_vbus_valid(struct google_usb_phy *gphy)
 {
 	u32 reg;
 
-	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
-		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	if (gphy->orientation == TYPEC_ORIENTATION_NONE)
 		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
-		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
-	} else {
-		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	else
 		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
-		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
-	}
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+}
+
+static void set_sram_bypass(struct google_usb_phy *gphy, u32 bypass)
+{
+	u32 reg;
+
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg &= ~USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE;
+	reg |= FIELD_PREP(USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE, bypass);
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+}
+
+static void set_pmgt_ref_clk_req_n(struct google_usb_phy *gphy, bool resume)
+{
+	u32 reg;
+
+	reg = readl(gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
+	if (resume)
+		reg |= USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
+	else
+		reg &= ~USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
+	writel(reg, gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
+}
+
+static inline void disable_pmgt_ref_clk_req_n(struct google_usb_phy *gphy)
+{
+	set_pmgt_ref_clk_req_n(gphy, false);
+}
+DEFINE_FREE(pmgt_ref_clk_req_n, struct google_usb_phy *, if (_T) disable_pmgt_ref_clk_req_n(_T))
+
+static int wait_tca_xa_ack(struct google_usb_phy *gphy)
+{
+	int ret;
+	u32 reg;
+
+	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET,
+				 reg, !!(reg & TCA_INTR_STS_XA_ACT_EVT),
+				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
+	if (ret)
+		dev_err(gphy->dev, "tca xa_ack timeout, ret=%d", ret);
+
+	return ret;
+}
+
+static int program_tca_locked(struct google_usb_phy *gphy)
+	   __must_hold(&gphy->phy_mutex)
+{
+	int ret;
+	u32 reg;
+
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+
+	reg = readl(gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+	reg &= ~TCA_TCPC_MUX_CONTROL;
+	reg |= FIELD_PREP(TCA_TCPC_MUX_CONTROL, TCA_TCPC_MUX_CONTROL_USB_ONLY);
+	if (gphy->orientation == TYPEC_ORIENTATION_REVERSE)
+		reg |= TCA_TCPC_CONNECTOR_ORIENTATION;
+	else
+		reg &= ~TCA_TCPC_CONNECTOR_ORIENTATION;
+	reg |= TCA_TCPC_VALID;
+	writel(reg, gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+
+	ret = wait_tca_xa_ack(gphy);
+	dev_dbg(gphy->dev, "TCA switch %s, mux %lu, orientation %s",
+		ret ? "failed" : "success",
+		FIELD_GET(TCA_TCPC_MUX_CONTROL, reg),
+		FIELD_GET(TCA_TCPC_CONNECTOR_ORIENTATION, reg) ? "reverse" : "normal");
+
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+
+	return ret;
 }
 
 static int google_usb_set_orientation(struct typec_switch_dev *sw,
@@ -92,6 +261,9 @@ static int google_usb_set_orientation(struct typec_switch_dev *sw,
 
 	set_vbus_valid(gphy);
 
+	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
+		return program_tca_locked(gphy);
+
 	return 0;
 }
 
@@ -122,17 +294,18 @@ static int google_usb2_phy_init(struct phy *_phy)
 	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
 	if (ret)
 		return ret;
+	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
 
 	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
-	if (ret) {
-		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+	if (ret)
 		return ret;
-	}
 
 	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
 	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
 	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
 
+	retain_and_null_ptr(clk_dev);
+
 	return 0;
 }
 
@@ -161,6 +334,116 @@ static const struct phy_ops google_usb2_phy_ops = {
 	.exit		= google_usb2_phy_exit,
 };
 
+static int google_usb3_phy_init(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	int ret = 0;
+	u32 reg;
+
+	dev_dbg(gphy->dev, "initializing usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	if (gphy->phy_state != COMBO_PHY_IDLE) {
+		dev_warn(gphy->dev, "usb3 phy init called when combo phy state is not idle");
+		return 0;
+	}
+
+	reg = readl(gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
+	reg |= PHY_POWER_CONFIG_REG1_PG_MODE_EN;
+	reg &= ~PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG;
+	reg |= FIELD_PREP(PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG,
+			  (UPCS_PIPE_CONFIG_ISO_CPM |
+			   UPCS_PIPE_CONFIG_PG_MODE_STATIC |
+			   UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT));
+	writel(reg, gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
+
+	set_vbus_valid(gphy);
+
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg |= USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN;
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+
+	set_sram_bypass(gphy, SRAM_BYPASS_MODE_BYPASS_FIRMWARE |
+			SRAM_BYPASS_MODE_BYPASS_CONTEXT);
+	set_pmgt_ref_clk_req_n(gphy, true);
+	struct google_usb_phy *pmgt_ref_clk_req_dev __free(pmgt_ref_clk_req_n) = gphy;
+
+	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
+	if (ret)
+		return ret;
+	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
+
+	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
+	if (ret)
+		return ret;
+	struct google_usb_phy_instance *rst_dev __free(inst_rst_disable) = inst;
+
+	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_PSTATE_0_OFFSET,
+				 reg, !(reg & TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS),
+				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
+	if (ret) {
+		dev_err(gphy->dev, "wait for lane0 phystatus timed out");
+		return ret;
+	}
+
+	gphy->phy_state = COMBO_PHY_INIT_DONE;
+
+	retain_and_null_ptr(rst_dev);
+	retain_and_null_ptr(clk_dev);
+	retain_and_null_ptr(pmgt_ref_clk_req_dev);
+
+	return 0;
+}
+
+static int google_usb3_phy_exit(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+
+	dev_dbg(gphy->dev, "exiting usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	set_pmgt_ref_clk_req_n(gphy, false);
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+
+	gphy->phy_state = COMBO_PHY_IDLE;
+
+	return 0;
+}
+
+static int google_usb3_phy_power_on(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	int ret;
+
+	dev_dbg(gphy->dev, "power on usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	if (gphy->phy_state != COMBO_PHY_TCA_READY) {
+		/* Wait for PoR -> NC transitions*/
+		ret = wait_tca_xa_ack(gphy);
+		if (ret) {
+			dev_err(gphy->dev, "PoR->NC transition timeout");
+			return ret;
+		}
+		gphy->phy_state = COMBO_PHY_TCA_READY;
+	}
+
+	return program_tca_locked(gphy);
+}
+
+static const struct phy_ops google_usb3_phy_ops = {
+	.init		= google_usb3_phy_init,
+	.exit		= google_usb3_phy_exit,
+	.power_on	= google_usb3_phy_power_on,
+};
+
 static struct phy *google_usb_phy_xlate(struct device *dev,
 					const struct of_phandle_args *args)
 {
@@ -173,14 +456,61 @@ static struct phy *google_usb_phy_xlate(struct device *dev,
 	return gphy->insts[args->args[0]].phy;
 }
 
+static int google_usb_phy_parse_clocks(struct google_usb_phy *gphy)
+{
+	struct device *dev = gphy->dev;
+	int id, i, ret;
+
+	for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
+		const struct google_usb_phy_config *cfg = &phy_configs[id];
+		struct google_usb_phy_instance *inst = &gphy->insts[id];
+
+		inst->num_clks = cfg->num_clks;
+		inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
+		if (!inst->clks)
+			return -ENOMEM;
+
+		for (i = 0; i < inst->num_clks; i++)
+			inst->clks[i].id = cfg->clk_names[i];
+
+		ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get phy%d clks\n", id);
+	}
+
+	return 0;
+}
+
+static int google_usb_phy_parse_resets(struct google_usb_phy *gphy)
+{
+	struct device *dev = gphy->dev;
+	int id, i, ret;
+
+	for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
+		const struct google_usb_phy_config *cfg = &phy_configs[id];
+		struct google_usb_phy_instance *inst = &gphy->insts[id];
+
+		inst->num_rsts = cfg->num_rsts;
+		inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
+		if (!inst->rsts)
+			return -ENOMEM;
+
+		for (i = 0; i < inst->num_rsts; i++)
+			inst->rsts[i].id = cfg->rst_names[i];
+		ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get phy%d resets\n", id);
+	}
+
+	return 0;
+}
+
 static int google_usb_phy_probe(struct platform_device *pdev)
 {
 	struct typec_switch_desc sw_desc = { };
-	struct google_usb_phy_instance *inst;
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct google_usb_phy *gphy;
-	struct phy *phy;
 	u32 args[1];
 	int ret;
 
@@ -212,39 +542,39 @@ static int google_usb_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
 				    "invalid usbdp top\n");
 
+	gphy->usb3_tca_base = devm_platform_ioremap_resource_byname(pdev,
+								    "usb3_tca");
+	if (IS_ERR(gphy->usb3_tca_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb3_tca_base),
+				    "invalid usb3 tca\n");
+
 	gphy->insts = devm_kcalloc(dev, GOOGLE_USB_PHY_NUM, sizeof(*gphy->insts), GFP_KERNEL);
 	if (!gphy->insts)
 		return -ENOMEM;
 
-	inst = &gphy->insts[GOOGLE_USB2_PHY];
-	inst->parent = gphy;
-	inst->index = GOOGLE_USB2_PHY;
-	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(dev, PTR_ERR(phy),
+	gphy->insts[GOOGLE_USB2_PHY].phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	gphy->insts[GOOGLE_USB2_PHY].index = GOOGLE_USB2_PHY;
+	gphy->insts[GOOGLE_USB2_PHY].parent = gphy;
+	if (IS_ERR(gphy->insts[GOOGLE_USB2_PHY].phy))
+		return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB2_PHY].phy),
 				     "failed to create usb2 phy instance\n");
-	inst->phy = phy;
-	phy_set_drvdata(phy, inst);
+	phy_set_drvdata(gphy->insts[GOOGLE_USB2_PHY].phy, &gphy->insts[GOOGLE_USB2_PHY]);
 
-	inst->num_clks = 2;
-	inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
-	if (!inst->clks)
-		return -ENOMEM;
-	inst->clks[0].id = "usb2";
-	inst->clks[1].id = "usb2_apb";
-	ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+	gphy->insts[GOOGLE_USB3_PHY].phy = devm_phy_create(dev, NULL, &google_usb3_phy_ops);
+	gphy->insts[GOOGLE_USB3_PHY].index = GOOGLE_USB3_PHY;
+	gphy->insts[GOOGLE_USB3_PHY].parent = gphy;
+	if (IS_ERR(gphy->insts[GOOGLE_USB3_PHY].phy))
+		return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB3_PHY].phy),
+				     "failed to create usb3 phy instance\n");
+	phy_set_drvdata(gphy->insts[GOOGLE_USB3_PHY].phy, &gphy->insts[GOOGLE_USB3_PHY]);
+
+	ret = google_usb_phy_parse_clocks(gphy);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
+		return ret;
 
-	inst->num_rsts = 2;
-	inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
-	if (!inst->rsts)
-		return -ENOMEM;
-	inst->rsts[0].id = "usb2";
-	inst->rsts[1].id = "usb2_apb";
-	ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+	ret = google_usb_phy_parse_resets(gphy);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
+		return ret;
 
 	phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
 	if (IS_ERR(phy_provider))

base-commit: 2ace2e949979b82f82f12dd76d7c5a6145246ca3
-- 
2.55.0.rc0.799.gd6f94ed593-goog


