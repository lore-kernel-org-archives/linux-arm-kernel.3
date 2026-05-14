Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210B8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NA2Gtf+fFj04PTND+0t9TktuWb6JGQ89xyKhXYc0Ko=; b=LfJR2TDHmi5Gg27aNqOWuXo3mM
	QPwq0bqxdNMIB7zvR85vhFJjXVuabD31O/Z2nHTnDzw+QhAiIIoioKbTXOF3vviLkQ8by6UNqTjmh
	V3baJUF5m91YiS1nxfThRNyJ18X5YMWq7OXJZz0Bu6BYHi45MwDKx7x0w8UH4IRNSI5vxqcEa34ee
	MJHv4VtVxso3T4Y7i7TY9WpdI9TImnuUvc6PgAmZi5KBZkkPItDjYnaLlzl4Ye7FEMgBzz3CIAH8E
	Pbw9yWUMP5A7Jq55WjuZXUh+uA0BfF++erBS5MHWuF/yxOR2OB74+cbOpud5rtaOQg7jvkPBNH5Nx
	1EFGVvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXTL-00000005nyX-1Ma9;
	Thu, 14 May 2026 14:55:35 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXTI-00000005nwk-0zbl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:55:34 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 6FE2A600025B;
	Thu, 14 May 2026 15:47:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id lD8sePFOM8qE; Thu, 14 May 2026 15:47:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6FAAE60020C2;
	Thu, 14 May 2026 15:47:28 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NA2Gtf+fFj04PTND+0t9TktuWb6JGQ89xyKhXYc0Ko=;
	b=SOdhjUARqCKdZbYd3+mDEviLLdgU3eHXwCvuH3/HrD9xWUHHGowHA692kRk6UAefc6L2h8
	xCPEB11f+RRaT/tVOwT0cH/iR+uen/MAC/uBVFIo+73Lj9qdtvgHmLZjcXCpeSkEKwCuPd
	XvnQVMT6uTU7r5GZVlb0r0DoSRei6VLwBoweMN5k899BTKbcZ3BOwNppBrTjz5Rdig5fCU
	e2p+bv0S2A7PePTGPnvwaapk2GJr5S7XVhGyQoVUyfJ2Z7ap2JfqEeWe58OnJaTgnzmiLL
	udvL3zYZ8nalY/trLk8XV0XE8IVsbTGrUrA6v8M6lPJbk7FiGzS+4JXJBY0yrw==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CFB77360275;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:20 +0200
Subject: [PATCH 2/4] mfd: max77620: convert poweroff support to sys-off API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-2-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=2514;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=JA8yV+QK8BosoCH/4FosyvERNGhrrE+s1PDY8QHwMQo=;
 b=/6m/rVtf/FFgBTVMU3mf1D+Nq4W2412regH0ZRKIDlq+HysxVx1mFgB+mH39nKoW6Yk48uCWe
 WWU6XsMiq/fDeyer6NtnFNpnkWAsnJeCIq42/DXH+speBG7hh2pJ5RY
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_075532_690646_7025D2F0 
X-CRM114-Status: GOOD (  15.30  )
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

Convert max77620_pm_power_off() to the sys-off callback prototype and
register it with the sys-off API when the device tree marks the PMIC as
a system power controller. This also removes the global max77620_scratch
pointer by passing the chip instance through the callback data.

This modernizes the driver's poweroff handling and aligns it with
the kernel sys-off infrastructure.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/mfd/max77620.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 3af2974b3023..c4f89a9681f3 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -31,11 +31,10 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-static struct max77620_chip *max77620_scratch;
-
 static const struct resource gpio_resources[] = {
 	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
 };
@@ -484,13 +483,15 @@ static int max77620_read_es_version(struct max77620_chip *chip)
 	return ret;
 }
 
-static void max77620_pm_power_off(void)
+static int max77620_pm_power_off(struct sys_off_data *data)
 {
-	struct max77620_chip *chip = max77620_scratch;
+	struct max77620_chip *chip = data->cb_data;
 
 	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
 			   MAX77620_ONOFFCNFG1_SFT_RST,
 			   MAX77620_ONOFFCNFG1_SFT_RST);
+
+	return NOTIFY_DONE;
 }
 
 static int max77620_probe(struct i2c_client *client)
@@ -501,7 +502,6 @@ static int max77620_probe(struct i2c_client *client)
 	struct regmap_irq_chip *chip_desc;
 	const struct mfd_cell *mfd_cells;
 	int n_mfd_cells;
-	bool pm_off;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -573,10 +573,14 @@ static int max77620_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	pm_off = of_device_is_system_power_controller(client->dev.of_node);
-	if (pm_off && !pm_power_off) {
-		max77620_scratch = chip;
-		pm_power_off = max77620_pm_power_off;
+	if (of_device_is_system_power_controller(client->dev.of_node)) {
+		ret = devm_register_sys_off_handler(&client->dev,
+						    SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_DEFAULT,
+						    max77620_pm_power_off, chip);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					"failed to register power-off handler\n");
 	}
 
 	return 0;

-- 
2.54.0


