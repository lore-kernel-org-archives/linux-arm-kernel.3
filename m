Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57999CCF9ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 18:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXvC+cpea6VJnQ0B5yli7LjVJmmWX99wab1EyMVPdqM=; b=YpFY8Viokxiu2Nu+ysdCrDuR7x
	AnnEGhyosG8gLmlQn+5BnylUKzm9BXQ9TEsoB1SOmydVcBwsRDSj6FCgkt7VcddRjeKbMlILk7kMN
	ZkEDt1+KVfsG2oyS6yM2GlTrxutkPlAiHoBjvzUqfSfIh553MOG3IM7dgEnP4aRDo3hZXxwvWsgg+
	GHFtlapCyRSAWs1wTGkCaPFt/HyzWaj4zIDpg2braxi9pnjXepMMTJusOvejkKYBZjo/IN73EA35J
	dh+norcnZZgAQRJNzlnldDqyUIuqVqIxUY5S6UBcZrhMwHYm25pVdLx4wuwlyq84ZJZqlD9LQLNi9
	9CZYzsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5TA-0000000Cd7q-1jQB;
	Sun, 26 Oct 2025 18:27:56 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5T3-0000000Cd5J-0SLe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 18:27:52 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1761503221; x=1762803221;
	bh=kXvC+cpea6VJnQ0B5yli7LjVJmmWX99wab1EyMVPdqM=; h=From;
	b=nc/kNpfLOmnmOYmYHzI1PNp5IcU//eVt2rbfKh2nJ9dwaGyvovdduaF9oa/oAealW
	 B/272boPVasQRGutlh3EnNq+lK8HQih7Dgf90cXevSdCjIVEw0QjYJ9/ZMVXmQiT4a
	 tOxXxgcxsCcGNlwRojtO9jQKC6CPVrtKn+0wsFLtH3FliEm4rtW2OWb2dVtNc1j3LB
	 7kX87C19oeSEiYQb/6b1QWqrBR12qrpNamOuNuwkwldv/nQTIoAP0uWoB9ykdqQQGs
	 HoWQLoSvtppXNsKdZ5Zdg387LugtXV35q8jpjS1evZxN30TvhiGDvEaXgYRxeOs3d9
	 sZEI9qXFqOfng==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 59QIR0MQ043059
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 26 Oct 2025 19:27:01 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>, Jeff Chen <jeff.chen_1@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [DONOTAPPLY RFC PATCH v2 2/4] net: mwifiex: add support for the SD8777 chipset
Date: Sun, 26 Oct 2025 19:20:39 +0100
Message-ID: <20251026182602.26464-3-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026182602.26464-1-balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112749_803601_C94A51B3 
X-CRM114-Status: GOOD (  14.12  )
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

Marvell SD8777 is a wireless chipset used for instance in the PXA1908
SoC found for example in the samsung,coreprimevelte smartphone, with
which this was tested. The driver seems to be compatible with this
chipset so enable this support by adding the necessary information based
on the downstream code.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 drivers/net/wireless/marvell/mwifiex/sdio.c | 21 +++++++++++++++++++++
 drivers/net/wireless/marvell/mwifiex/sdio.h |  1 +
 include/linux/mmc/sdio_ids.h                |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index f039d6f19183..a1adb78fabaf 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -318,6 +318,23 @@ static const struct mwifiex_sdio_card_reg mwifiex_reg_sd89xx = {
 				 0x68, 0x69, 0x6a},
 };
 
+static const struct mwifiex_sdio_device mwifiex_sdio_sd8777 = {
+	.firmware = SD8777_DEFAULT_FW_NAME,
+	.reg = &mwifiex_reg_sd87xx,
+	.max_ports = 16,
+	.mp_agg_pkt_limit = 8,
+	.tx_buf_size = MWIFIEX_TX_DATA_BUF_SIZE_2K,
+	.mp_tx_agg_buf_size = MWIFIEX_MP_AGGR_BUF_SIZE_16K,
+	.mp_rx_agg_buf_size = MWIFIEX_MP_AGGR_BUF_SIZE_16K,
+	.supports_sdio_new_mode = false,
+	.has_control_mask = true,
+	.can_dump_fw = false,
+	.can_auto_tdls = true,
+	.can_ext_scan = true,
+	.fw_ready_extra_delay = false,
+	.host_mlme = false,
+};
+
 static const struct mwifiex_sdio_device mwifiex_sdio_sd8786 = {
 	.firmware = SD8786_DEFAULT_FW_NAME,
 	.reg = &mwifiex_reg_sd87xx,
@@ -516,6 +533,7 @@ static struct memory_type_mapping mem_type_mapping_tbl[] = {
 };
 
 static const struct of_device_id mwifiex_sdio_of_match_table[] __maybe_unused = {
+	{ .compatible = "marvell,sd8777" },
 	{ .compatible = "marvell,sd8787" },
 	{ .compatible = "marvell,sd8897" },
 	{ .compatible = "marvell,sd8978" },
@@ -954,6 +972,8 @@ static void mwifiex_sdio_coredump(struct device *dev)
 
 /* WLAN IDs */
 static const struct sdio_device_id mwifiex_ids[] = {
+	{SDIO_DEVICE(SDIO_VENDOR_ID_MARVELL, SDIO_DEVICE_ID_MARVELL_8777_WLAN),
+		.driver_data = (unsigned long)&mwifiex_sdio_sd8777},
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MARVELL, SDIO_DEVICE_ID_MARVELL_8786_WLAN),
 		.driver_data = (unsigned long) &mwifiex_sdio_sd8786},
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MARVELL, SDIO_DEVICE_ID_MARVELL_8787_WLAN),
@@ -3201,6 +3221,7 @@ MODULE_AUTHOR("Marvell International Ltd.");
 MODULE_DESCRIPTION("Marvell WiFi-Ex SDIO Driver version " SDIO_VERSION);
 MODULE_VERSION(SDIO_VERSION);
 MODULE_LICENSE("GPL v2");
+MODULE_FIRMWARE(SD8777_DEFAULT_FW_NAME);
 MODULE_FIRMWARE(SD8786_DEFAULT_FW_NAME);
 MODULE_FIRMWARE(SD8787_DEFAULT_FW_NAME);
 MODULE_FIRMWARE(SD8797_DEFAULT_FW_NAME);
diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.h b/drivers/net/wireless/marvell/mwifiex/sdio.h
index 65d142286c46..c6425191ad84 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.h
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.h
@@ -18,6 +18,7 @@
 
 #include "main.h"
 
+#define SD8777_DEFAULT_FW_NAME "mrvl/sd8777_uapsta.bin"
 #define SD8786_DEFAULT_FW_NAME "mrvl/sd8786_uapsta.bin"
 #define SD8787_DEFAULT_FW_NAME "mrvl/sd8787_uapsta.bin"
 #define SD8797_DEFAULT_FW_NAME "mrvl/sd8797_uapsta.bin"
diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 673cbdf43453..61e95b5a528c 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -95,6 +95,7 @@
 #define SDIO_DEVICE_ID_MARVELL_8797_BT		0x912a
 #define SDIO_DEVICE_ID_MARVELL_8897_WLAN	0x912d
 #define SDIO_DEVICE_ID_MARVELL_8897_BT		0x912e
+#define SDIO_DEVICE_ID_MARVELL_8777_WLAN	0x9131
 #define SDIO_DEVICE_ID_MARVELL_8887_F0		0x9134
 #define SDIO_DEVICE_ID_MARVELL_8887_WLAN	0x9135
 #define SDIO_DEVICE_ID_MARVELL_8887_BT		0x9136
-- 
2.51.1


