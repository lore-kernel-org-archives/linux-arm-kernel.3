Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fK7T4qAu;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A79BeTvS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=snXuXEKWmUfii0F5AXtZujH11DsNCuBeEf/2yZEVVhM=; b=fK7T4qAupS2I/dZVWeHwH1VXce
	+1bmWZoNRc3at9CO3JxYLMJJbRPQRp/9GYNHEm545RYbxqSAtpNLOUreq6BeU9EvD+JJPPCguwtpl
	8HHVZGq9gBfxATxNGoduO8L2GECXCO9nxb6CZ+SO8347AIFrcpXNsSY+0R0BOz3J2miO2yXhmvbl2
	C85UE+PG21v6fGGl0zmYpJNXc9H/UR38dobC6zKGKUOzJ20LbMgVo4m4fysUohQCx4s+ZDwAO7qVN
	Sxg801l8qEJScPu2sX8xRBWndRPeklQyH87WE0ZAGHU4RaOML0vKFEYw0CZkl1w3lgX+i1PeWp1CH
	eTgomSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66g-000000012kj-14rw;
	Tue, 03 Nov 2026 04:26:46 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66O-000000012ch-46j6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:26:40 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2e94f72fb9fso36582595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679987; x=1794284787; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snXuXEKWmUfii0F5AXtZujH11DsNCuBeEf/2yZEVVhM=;
        b=A79BeTvSqBidF4d5YVPHhjxJnBpRXjy/+IbR+MuPqTZTakRcZuK8FsdHtckMfdjTIl
         nQngyZJKF1keYAF5IpFb4w4OJwZu+0pE/pVNqFqqtD1sG1lN7bDHbVOLLCT4PU9Jb6Xk
         tcRKErZf2qefbmmFQsXMRC38+EgdiSV1Opv/8hsiYDNo1NBYB7a42iO7PGgT3A1yxS/8
         8ZDmaQx5UaUSo4XQUncstloj/4AYYBi2Hm0E4iaenxZ+bEIv+We0NuUiroUt9KuudUVd
         W/U7RT2MoaBhCpILMQ0TSc6SnbmItMEcTg/He+i2l1zNa2WrL01LDisTLzxriym61nrJ
         GTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679987; x=1794284787;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snXuXEKWmUfii0F5AXtZujH11DsNCuBeEf/2yZEVVhM=;
        b=glo6bOyDh+yJute5uGD6CrWVGDLgJfVVbXNW74UgbYFrnAFw7QkT79dDkNvDc+Do7Z
         1YbXMk/SzQH0/8N4xgJXbnKuNF7FRMR9cprvEEfOUczQZIhA4qdticODujAxcxIXWm/Y
         Nvo/ov9zpxhkG1zweFkeg/Ih3jUkwC2KNrdYUfYypsov9djqKI4bMWXiVvbf2nwBE4k4
         nbZaJB/3VPA61JJH+KxMXQ5zPnziZ0L6z2ifMTUNpsKA8sVwNHbxZaJSGRtYRvxTL+Zm
         yUqtBl7qtIRg9fIsRxfT31ieVudUZ9oeT0lqi4iwB9F0BgtD9GQKs3dAb8U+IiyOGDnx
         tlDg==
X-Forwarded-Encrypted: i=1; AKwUvBzkmApYKYCHGnh8qvgd1f8RCpu6PVPBe2+7T4pGRP4cQm2baAMpYkziD4chBJyYJWNn1McJAJfsrqJI2ciLivs+@lists.infradead.org
X-Gm-Message-State: APuU4Z98SZBGcfSp67Ew0Ng33OqwfX6KyYVljdnn7+/WZqmd/Efsu+C3
	Cm144fWYlpuHerYh/n1MefACYo/Kcm89NNq5G05KUyAqpaxH7ERUT09vkvP6fI0lI0ISFAncFmT
	JAdtERLR8Wr8qMHMnfSph5itfRWio9u3Vyw==
X-Received: from plbnb8.prod.google.com ([2002:a17:903:15c8:b0:2eb:15a2:31f2])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1cb:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2eb3648968amr104559705ad.18.1793679986658;
 Mon, 02 Nov 2026 20:26:26 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:07 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-4-vamshigajjela@google.com>
Subject: [PATCH 3/3] spmi: Add SmartDV SPMI controller driver
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_202629_580003_74E0E471 
X-CRM114-Status: GOOD (  25.19  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

Add support for the SmartDV IP Solutions MIPI SPMI master controller
("smartdv,spmi"). The controller supports standard MIPI SPMI v1.0 and
v2.0 bus commands (RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write,
extended register read/write, and extended register read/write long
transfers.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 MAINTAINERS                 |   1 +
 drivers/spmi/Kconfig        |  10 +
 drivers/spmi/Makefile       |   1 +
 drivers/spmi/spmi-smartdv.c | 525 ++++++++++++++++++++++++++++++++++++
 4 files changed, 537 insertions(+)
 create mode 100644 drivers/spmi/spmi-smartdv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f44c597c2075..fc0d364ad22b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25248,6 +25248,7 @@ M:	Vamshi Gajjela <vamshigajjela@google.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
+F:	drivers/spmi/spmi-smartdv.c
 
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index a80cf4047b86..13bd85b0e23e 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -54,4 +54,14 @@ config SPMI_MTK_PMIF
 	  This is required for communicating with Mediatek PMICs and
 	  other devices that have the SPMI interface.
 
+config SPMI_SMARTDV
+	tristate "SmartDV IP Solutions SPMI Controller"
+	depends on HAS_IOMEM
+	help
+	  If you say yes to this option, support will be included for the
+	  SmartDV IP Solutions MIPI SPMI master controller.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called spmi-smartdv.
+
 endif
diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 38ac635645ba..34f6d6487604 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
 obj-$(CONFIG_SPMI_MSM_PMIC_ARB)	+= spmi-pmic-arb.o
 obj-$(CONFIG_SPMI_MTK_PMIF)	+= spmi-mtk-pmif.o
+obj-$(CONFIG_SPMI_SMARTDV)	+= spmi-smartdv.o
diff --git a/drivers/spmi/spmi-smartdv.c b/drivers/spmi/spmi-smartdv.c
new file mode 100644
index 000000000000..6f6563df087d
--- /dev/null
+++ b/drivers/spmi/spmi-smartdv.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SmartDV IP Solutions SPMI controller driver
+ *
+ * Copyright 2026 Google LLC
+ * Author: Vamshi Gajjela <vamshigajjela@google.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+#include <linux/spmi.h>
+#include <linux/units.h>
+
+/* SPMI controller register address offsets */
+#define CONTROL			0x0
+#define IRQ_STATUS		0x8
+#define REQ_COMMAND		0x10
+#define REQ_DATA0		0x14
+#define REQ_DATA1		0x18
+#define REQ_DATA2		0x1c
+#define REQ_DATA3		0x20
+#define REQ_RD_STATUS		0x24
+#define RD_ERR_INDEX		0x28
+
+/* SPMI controller CONTROL register bit masks */
+#define SPMI_CONTROL_MASTER_EN			BIT(0)
+#define SPMI_CONTROL_ARB_ENABLE_MASK		BIT(1)
+#define SPMI_CONTROL_MID_MASK			GENMASK(3, 2)
+#define SPMI_CONTROL_VERSION_MASK		GENMASK(5, 4)
+#define SPMI_CONTROL_ARB_RETRY_LIMIT_MASK	GENMASK(13, 6)
+#define SPMI_CONTROL_PRESCALER_MASK		GENMASK(21, 14)
+#define SPMI_CONTROL_RD_LATENCY_MASK		GENMASK(29, 22)
+#define SPMI_CONTROL_ARB_SSC_DELAY_MASK		GENMASK(31, 30)
+
+/* SPMI irq status bit position */
+#define SPMI_IRQ_REQ_CMD_DONE		BIT(0)
+#define SPMI_IRQ_RSP_NEW_CMD		BIT(1)
+#define SPMI_IRQ_ABORT_MST_CMD		BIT(2)
+#define SPMI_IRQ_READ_DATA_PAR_ERR	BIT(3)
+#define SPMI_IRQ_READ_NO_RESP_ERR	BIT(4)
+#define SPMI_IRQ_CMD_NACK_ERR		BIT(5)
+#define SPMI_IRQ_BUS_TIMEOUT		BIT(6)
+#define SPMI_IRQ_NO_BOM_CMD_PAR_ERR	BIT(7)
+#define SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR	BIT(8)
+#define SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR	BIT(9)
+#define SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT	BIT(10)
+#define SPMI_IRQ_IS_BOM			BIT(11)
+#define SPMI_IRQ_CONNECTED		BIT(12)
+
+#define SPMI_ANY_ERROR_IRQ_FLAG			\
+	(					\
+	SPMI_IRQ_ABORT_MST_CMD |		\
+	SPMI_IRQ_READ_DATA_PAR_ERR |		\
+	SPMI_IRQ_READ_NO_RESP_ERR |		\
+	SPMI_IRQ_CMD_NACK_ERR |			\
+	SPMI_IRQ_BUS_TIMEOUT |			\
+	SPMI_IRQ_NO_BOM_CMD_PAR_ERR |		\
+	SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR |	\
+	SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR		\
+	)
+
+/* REQ_COMMAND register fields mask */
+#define SPMI_REQ_COMMAND_NEW_CMD_MASK		BIT(0)
+#define SPMI_REQ_COMMAND_PRIMARY_ARB_MASK	BIT(1)
+#define SPMI_REQ_COMMAND_OPCODE_MASK		GENMASK(6, 2)
+#define SPMI_REQ_COMMAND_ADDR_MASK		GENMASK(10, 7)
+#define SPMI_REQ_COMMAND_BYTE_CNT_MASK		GENMASK(14, 11)
+#define SPMI_REQ_COMMAND_REQ_ADDR_MASK		GENMASK(30, 15)
+
+#define DEFAULT_ARB_RETRY_LIMIT	32
+#define DEFAULT_PRESCALER	0
+#define DEFAULT_READ_LATENCY	32
+#define DEFAULT_ARB_SCL_DELAY	0
+#define REQ_COMMAND_TIMEOUT_MS	100
+#define REQ_COMMAND_TIMEOUT_US	(REQ_COMMAND_TIMEOUT_MS * USEC_PER_MSEC)
+#define REQ_COMMAND_POLL_US	1
+
+enum smartdv_spmi_xfer_type {
+	SMARTDV_SPMI_XFER_CMD = 0,
+	SMARTDV_SPMI_XFER_WRITE = 1,
+	SMARTDV_SPMI_XFER_READ = 2,
+};
+
+/* SmartDV REQ_COMMAND register opcode values (bits [6:2]) */
+enum smartdv_spmi_hc_cmd_op_code {
+	SMARTDV_SPMI_CMD_REG_WRITE = 0,
+	SMARTDV_SPMI_CMD_REG_READ = 1,
+	SMARTDV_SPMI_CMD_EXT_REG_WRITE = 2,
+	SMARTDV_SPMI_CMD_EXT_REG_READ = 3,
+	SMARTDV_SPMI_CMD_EXT_REG_WRITE_L = 4,
+	SMARTDV_SPMI_CMD_EXT_REG_READ_L = 5,
+	SMARTDV_SPMI_CMD_REG_WRITE_0 = 6,
+	SMARTDV_SPMI_CMD_RESET = 10,
+	SMARTDV_SPMI_CMD_SLEEP = 11,
+	SMARTDV_SPMI_CMD_SHUTDOWN = 12,
+	SMARTDV_SPMI_CMD_WAKEUP = 13,
+};
+
+/**
+ * struct smartdv_spmi - SmartDV SPMI driver instance
+ * @ctrl: Pointer to spmi_controller structure
+ * @dev: Pointer to device structure
+ * @base: Virtual address of the SPMI controller registers
+ * @lock: Spinlock to serialize bus access
+ * @i_clk: Hardware clock feeding the controller
+ * @rst: Hardware reset to controller
+ * @clk_freq: Core clock frequency in Hz (i_clk)
+ * @ctrl_reg: Cached control register value from last write
+ */
+struct smartdv_spmi {
+	struct spmi_controller	*ctrl;
+	struct device		*dev;
+	void __iomem		*base;
+	spinlock_t		lock; /* Serialize bus access */
+	struct clk		*i_clk;
+	struct reset_control	*rst;
+	unsigned int		clk_freq;
+	u32			ctrl_reg;
+};
+
+static inline u32 smartdv_spmi_readl(struct smartdv_spmi *sdrv, u32 offset)
+{
+	return readl(sdrv->base + offset);
+}
+
+static inline void smartdv_spmi_writel(struct smartdv_spmi *sdrv, u32 offset, u32 val)
+{
+	writel(val, sdrv->base + offset);
+}
+
+static void smartdv_spmi_read_err_status_dump(struct smartdv_spmi *sdrv)
+{
+	dev_dbg(sdrv->dev, "No response frame & parity error: %#x\n",
+		smartdv_spmi_readl(sdrv, REQ_RD_STATUS));
+	dev_dbg(sdrv->dev, "Read data frame error: %#x\n",
+		smartdv_spmi_readl(sdrv, RD_ERR_INDEX));
+}
+
+static void smartdv_spmi_clear_req_data_reg(struct smartdv_spmi *sdrv)
+{
+	smartdv_spmi_writel(sdrv, REQ_DATA0, 0x0);
+	smartdv_spmi_writel(sdrv, REQ_DATA1, 0x0);
+	smartdv_spmi_writel(sdrv, REQ_DATA2, 0x0);
+	smartdv_spmi_writel(sdrv, REQ_DATA3, 0x0);
+}
+
+static int smartdv_spmi_wait_for_done(struct smartdv_spmi *sdrv, u32 *irq_status)
+{
+	int ret;
+
+	/* wait for cmd done status */
+	ret = readl_poll_timeout_atomic(sdrv->base + IRQ_STATUS, *irq_status,
+					(*irq_status & SPMI_IRQ_REQ_CMD_DONE) != 0,
+					REQ_COMMAND_POLL_US, REQ_COMMAND_TIMEOUT_US);
+	/* clear all interrupts */
+	smartdv_spmi_writel(sdrv, IRQ_STATUS, *irq_status);
+
+	return ret;
+}
+
+static int smartdv_spmi_xfer(struct smartdv_spmi *sdrv,
+			     enum smartdv_spmi_xfer_type xfer_type,
+			     u8 opc, u8 sid, u16 saddr, size_t bc)
+{
+	u32 irq_status;
+	u32 cmd = 0;
+	int ret;
+
+	/* program control register, master enable */
+	smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg | SPMI_CONTROL_MASTER_EN);
+
+	/* prepare req_command register */
+	cmd |= SPMI_REQ_COMMAND_NEW_CMD_MASK;
+	cmd |= SPMI_REQ_COMMAND_PRIMARY_ARB_MASK;
+	cmd |= FIELD_PREP(SPMI_REQ_COMMAND_OPCODE_MASK, opc);
+	cmd |= FIELD_PREP(SPMI_REQ_COMMAND_ADDR_MASK, sid);
+
+	if (xfer_type != SMARTDV_SPMI_XFER_CMD) {
+		cmd |= FIELD_PREP(SPMI_REQ_COMMAND_BYTE_CNT_MASK, bc - 1);
+		cmd |= FIELD_PREP(SPMI_REQ_COMMAND_REQ_ADDR_MASK, saddr);
+	}
+
+	/* request new command */
+	smartdv_spmi_writel(sdrv, REQ_COMMAND, cmd);
+
+	ret = smartdv_spmi_wait_for_done(sdrv, &irq_status);
+	if (ret) {
+		dev_err(sdrv->dev, "request timeout.\n");
+		goto out;
+	}
+
+	/* check interrupt status for any error(s) */
+	if (irq_status & SPMI_ANY_ERROR_IRQ_FLAG) {
+		ret = -EIO;
+		dev_err(sdrv->dev,
+			"sid %#x opc %#x addr %#x len %#zx irq_status: %#x\n",
+			sid, opc, saddr, bc, irq_status);
+
+		if (xfer_type == SMARTDV_SPMI_XFER_READ)
+			smartdv_spmi_read_err_status_dump(sdrv);
+	}
+
+out:
+	/* program control register, with master disable */
+	smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg);
+
+	return ret;
+}
+
+static void smartdv_spmi_read_req_data(struct smartdv_spmi *sdrv, u8 *buf, size_t bc)
+{
+	u32 addr = REQ_DATA0;
+	size_t len;
+	u32 reg;
+
+	while (bc) {
+		len = min(bc, sizeof(reg));
+		reg = smartdv_spmi_readl(sdrv, addr);
+		memcpy(buf, &reg, len);
+		buf += len;
+		bc -= len;
+		addr += sizeof(reg);
+	}
+}
+
+static int smartdv_spmi_read_cmd(struct spmi_controller *ctrl,
+				 u8 opcode, u8 sid, u16 saddr, u8 *__buf, size_t bc)
+{
+	struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	int ret;
+	u8 opc;
+
+	switch (opcode) {
+	case SPMI_CMD_READ:
+		opc = SMARTDV_SPMI_CMD_REG_READ;
+		break;
+	case SPMI_CMD_EXT_READ:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_READ;
+		break;
+	case SPMI_CMD_EXT_READL:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_READ_L;
+		break;
+	default:
+		dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sdrv->lock, flags);
+
+	/* clear req_data registers by writing zeros */
+	smartdv_spmi_clear_req_data_reg(sdrv);
+
+	/* clear read status register */
+	smartdv_spmi_writel(sdrv, REQ_RD_STATUS, 0x0);
+
+	/* initiate transfer on the bus */
+	ret = smartdv_spmi_xfer(sdrv, SMARTDV_SPMI_XFER_READ, opc, sid, saddr, bc);
+	if (!ret)
+		/* read received data */
+		smartdv_spmi_read_req_data(sdrv, __buf, bc);
+
+	spin_unlock_irqrestore(&sdrv->lock, flags);
+
+	return ret;
+}
+
+static void smartdv_spmi_write_req_data(struct smartdv_spmi *sdrv, const u8 *buf, size_t bc)
+{
+	u32 addr = REQ_DATA0;
+	size_t len;
+	u32 data;
+
+	while (bc) {
+		data = 0;
+		len = min(bc, sizeof(data));
+		memcpy(&data, buf, len);
+		smartdv_spmi_writel(sdrv, addr, data);
+		buf += len;
+		bc -= len;
+		addr += sizeof(data);
+	}
+}
+
+static int smartdv_spmi_write_cmd(struct spmi_controller *ctrl,
+				  u8 opcode, u8 sid, u16 saddr, const u8 *__buf, size_t bc)
+{
+	struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	u8 opc;
+	int ret;
+
+	switch (opcode) {
+	case SPMI_CMD_ZERO_WRITE:
+		opc = SMARTDV_SPMI_CMD_REG_WRITE_0;
+		break;
+	case SPMI_CMD_WRITE:
+		opc = SMARTDV_SPMI_CMD_REG_WRITE;
+		break;
+	case SPMI_CMD_EXT_WRITE:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_WRITE;
+		break;
+	case SPMI_CMD_EXT_WRITEL:
+		opc = SMARTDV_SPMI_CMD_EXT_REG_WRITE_L;
+		break;
+	default:
+		dev_err(&ctrl->dev, "invalid write cmd %#x\n", opcode);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sdrv->lock, flags);
+
+	/* fill data */
+	smartdv_spmi_write_req_data(sdrv, __buf, bc);
+
+	/* initiate transfer on the bus */
+	ret = smartdv_spmi_xfer(sdrv, SMARTDV_SPMI_XFER_WRITE, opc, sid, saddr, bc);
+
+	spin_unlock_irqrestore(&sdrv->lock, flags);
+
+	return ret;
+}
+
+static int smartdv_spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
+{
+	struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	int ret;
+	u8 opc;
+
+	switch (opcode) {
+	case SPMI_CMD_RESET:
+		opc = SMARTDV_SPMI_CMD_RESET;
+		break;
+	case SPMI_CMD_SLEEP:
+		opc = SMARTDV_SPMI_CMD_SLEEP;
+		break;
+	case SPMI_CMD_SHUTDOWN:
+		opc = SMARTDV_SPMI_CMD_SHUTDOWN;
+		break;
+	case SPMI_CMD_WAKEUP:
+		opc = SMARTDV_SPMI_CMD_WAKEUP;
+		break;
+	default:
+		dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&sdrv->lock, flags);
+
+	/* initiate transfer on the bus */
+	ret = smartdv_spmi_xfer(sdrv, SMARTDV_SPMI_XFER_CMD, opc, sid, 0, 0);
+
+	spin_unlock_irqrestore(&sdrv->lock, flags);
+
+	return ret;
+}
+
+/* devm action callbacks */
+static void smartdv_spmi_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int smartdv_spmi_init_clk_reset(struct smartdv_spmi *sdrv)
+{
+	struct device *dev = sdrv->dev;
+	int ret;
+
+	/* read i_clk rate from the device tree node */
+	device_property_read_u32(dev, "clock-frequency", &sdrv->clk_freq);
+
+	sdrv->i_clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(sdrv->i_clk))
+		return dev_err_probe(dev, PTR_ERR(sdrv->i_clk), "could not get i_clk\n");
+
+	if (sdrv->i_clk)
+		sdrv->clk_freq = clk_get_rate(sdrv->i_clk);
+
+	/* no clock rate is defined, fail. */
+	if (!sdrv->clk_freq)
+		return dev_err_probe(dev, -EINVAL, "i_clk rate not defined\n");
+
+	/* check for optional reset */
+	sdrv->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(sdrv->rst))
+		return dev_err_probe(dev, PTR_ERR(sdrv->rst), "error in get reset ctrl\n");
+
+	if (sdrv->rst) {
+		ret = reset_control_deassert(sdrv->rst);
+		if (ret)
+			return dev_err_probe(dev, ret, "error in deassert reset %d\n", ret);
+
+		ret = devm_add_action_or_reset(dev, smartdv_spmi_reset_control_assert, sdrv->rst);
+		if (ret)
+			return dev_err_probe(dev, ret, "error register rst assert devm action\n");
+	}
+
+	return 0;
+}
+
+static void smartdv_spmi_process_ctrl_reg_dt_param(struct smartdv_spmi *sdrv)
+{
+	struct device *dev = sdrv->dev;
+	u32 ctrlreg = 0;
+	u32 reg;
+
+	/* read control register parameters from the device tree node */
+	reg = 0;
+	device_property_read_u32(dev, "smartdv,master-arb-enable", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_ARB_ENABLE_MASK, reg);
+
+	reg = 0;
+	device_property_read_u32(dev, "smartdv,master-id", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_MID_MASK, reg);
+
+	reg = 0;
+	device_property_read_u32(dev, "smartdv,spmi-version", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_VERSION_MASK, reg);
+
+	reg = DEFAULT_ARB_RETRY_LIMIT;
+	device_property_read_u32(dev, "smartdv,arb-retry-limit", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_ARB_RETRY_LIMIT_MASK, reg);
+
+	reg = DEFAULT_PRESCALER;
+	device_property_read_u32(dev, "smartdv,prescaler", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_PRESCALER_MASK, reg);
+
+	reg = DEFAULT_READ_LATENCY;
+	device_property_read_u32(dev, "smartdv,read-latency", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_RD_LATENCY_MASK, reg);
+
+	reg = DEFAULT_ARB_SCL_DELAY;
+	device_property_read_u32(dev, "smartdv,arb-scl-delay", &reg);
+	ctrlreg |= FIELD_PREP(SPMI_CONTROL_ARB_SSC_DELAY_MASK, reg);
+
+	sdrv->ctrl_reg = ctrlreg;
+}
+
+static void smartdv_spmi_pr_info(struct smartdv_spmi *sdrv)
+{
+	u32 prescaler = FIELD_GET(SPMI_CONTROL_PRESCALER_MASK, sdrv->ctrl_reg);
+
+	dev_dbg(sdrv->dev, "clk %lu kHz, scl %lu kHz (ctrl_reg: %#x)\n",
+		sdrv->clk_freq / HZ_PER_KHZ,
+		sdrv->clk_freq / ((prescaler ? prescaler * 2 : 1) * HZ_PER_KHZ),
+		sdrv->ctrl_reg);
+}
+
+static int smartdv_spmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct smartdv_spmi *sdrv;
+	struct spmi_controller *ctrl;
+	int ret;
+
+	ctrl = devm_spmi_controller_alloc(dev, sizeof(*sdrv));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	sdrv = spmi_controller_get_drvdata(ctrl);
+	sdrv->ctrl = ctrl;
+	sdrv->dev = dev;
+
+	sdrv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sdrv->base))
+		return PTR_ERR(sdrv->base);
+
+	platform_set_drvdata(pdev, sdrv);
+
+	/* parse control register parameters from device tree properties */
+	smartdv_spmi_process_ctrl_reg_dt_param(sdrv);
+
+	/* initialize clock and reset if available */
+	ret = smartdv_spmi_init_clk_reset(sdrv);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&sdrv->lock);
+
+	/* Callbacks */
+	ctrl->cmd = smartdv_spmi_cmd;
+	ctrl->read_cmd = smartdv_spmi_read_cmd;
+	ctrl->write_cmd = smartdv_spmi_write_cmd;
+
+	ret = devm_spmi_controller_add(dev, ctrl);
+	if (ret)
+		return dev_err_probe(dev, ret, "spmi_controller_add failed\n");
+
+	smartdv_spmi_pr_info(sdrv);
+
+	return 0;
+}
+
+static const struct of_device_id smartdv_spmi_of_match[] = {
+	{ .compatible = "smartdv,spmi" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, smartdv_spmi_of_match);
+
+static struct platform_driver smartdv_spmi_platform_driver = {
+	.probe = smartdv_spmi_probe,
+	.driver = {
+		.name = "smartdv-spmi",
+		.of_match_table = smartdv_spmi_of_match,
+	},
+};
+
+module_platform_driver(smartdv_spmi_platform_driver);
+
+MODULE_AUTHOR("Vamshi Gajjela <vamshigajjela@google.com>");
+MODULE_DESCRIPTION("SmartDV IP Solutions SPMI controller driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0.317.g454f8302e1-goog


