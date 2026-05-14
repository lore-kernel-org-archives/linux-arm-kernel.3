Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FEBCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIIHohhxfreSLoAD8V86VP5969wDk4fLYdaYpGL5+hE=; b=THT05LgD+cSEQQCN4w8+E7vNZR
	0Wxe2tdGsJqyUcSe4CG13T5YaMmc/Kboi2k1DxAdCb3O9Sr6uVLKM9FRAcOiziomG6djKgyj/N4Zp
	GjI0cBtxZavG1zLdsgKNP+btgU+B65qgcj22SAH8XB29rMjL4sxuyYjduNr9Zq9MksUvrnv+E4OGq
	QH3WaBWF5QrFNI2HYP7An20mrkFN7tK7SLxMGxwHDCFnmWaWsO7FpeMsttyLc2GeaabKBYpT4I1T6
	/pXUi3PCC7SwLEKPbe3Fl5zK8hqUX8pLHUN8Sodfl4ePOT/G+3y7QgDsRumq73cnaVm2PUHttfE/a
	fDD/ejmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhs-00000005qej-3ei8;
	Thu, 14 May 2026 15:10:36 +0000
Received: from smtp1.tecnico.ulisboa.pt ([2001:690:2100:1::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhl-00000005qVK-0gJp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:30 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0AC3560020C2;
	Thu, 14 May 2026 15:47:31 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ZK7wsflRmjsw; Thu, 14 May 2026 15:47:29 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 11DBE600022B;
	Thu, 14 May 2026 15:47:29 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gIIHohhxfreSLoAD8V86VP5969wDk4fLYdaYpGL5+hE=;
	b=hDCTM9jpfH6mxlb0r21LnH72Q705EDZh1yiX+WmPT/akRA2rAmHe8h3+11srOT7UDQLw4p
	jZkZduEWEsyOVixPaFIr+mfSKNrViyeNowmGmAvuFS6UnX2YOBCfaSiPnubmLCBT78zep8
	zAGA1EWT2fMxGUm/OITeVHw7KV0cRHkZC0Cex0yzgRsVj2wgLmi+/wKFE9kNV1wJDDKww4
	VsMs6GDwov4q+6z66Dtl7eKcphYA6E5mLr/GpIvBvQvhidqRfTJMiSCovROH6NZxPg7y6M
	/5X3J+UCi9skguR9NdxwGuIZkAXFwv6q9VtTvpsza09N/fOZbQF4Nv62vTIztg==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 74154360260;
	Thu, 14 May 2026 15:47:28 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:21 +0200
Subject: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on Pixel
 C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=2174;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=EMOZ9KhOtUkr6GKfd7Yj0yXxYgXnjs2s04jA5kPD/MA=;
 b=JvvfsRUjLwodi/WBii3lHYcZxJOSU4Bt5SpfGjYqjnt23eP5enKTC44EU9YYmiXQ3+cP6SCwW
 e0UixKEGxEeDwXgdYZ1b+ophNehQuOJyU4OLrcNEAeLlS9bhbrjzBa6
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081029_368324_5E883F34 
X-CRM114-Status: GOOD (  14.19  )
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

On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
than the PSCI SYSTEM_OFF call, whose firmware implementation is:

__dead2 void tegra_system_off(void)
{
        ERROR("Tegra System Off: operation not handled.\n");
        panic();
}

Raise the MAX77620 sys-off handler priority above SYS_OFF_PRIO_FIRMWARE
on Pixel C systems so it takes precedence over the PSCI poweroff handler.

Other systems continue to use the default sys-off priority.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/mfd/max77620.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index c4f89a9681f3..3b1f3a2f3566 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -494,6 +494,18 @@ static int max77620_pm_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max77620_power_off_priority(void)
+{
+	/*
+	 * For Smaug  we need to override the PSCI poweroff handler
+	 * which is registered at priority SYS_OFF_PRIO_FIRMWARE.
+	 */
+	if (of_machine_is_compatible("google,smaug"))
+		return SYS_OFF_PRIO_FIRMWARE + 1;
+
+	return SYS_OFF_PRIO_DEFAULT;
+}
+
 static int max77620_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -502,6 +514,7 @@ static int max77620_probe(struct i2c_client *client)
 	struct regmap_irq_chip *chip_desc;
 	const struct mfd_cell *mfd_cells;
 	int n_mfd_cells;
+	int priority;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -574,10 +587,11 @@ static int max77620_probe(struct i2c_client *client)
 	}
 
 	if (of_device_is_system_power_controller(client->dev.of_node)) {
+		priority = max77620_power_off_priority();
 		ret = devm_register_sys_off_handler(&client->dev,
 						    SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max77620_pm_power_off, chip);
+						    priority, max77620_pm_power_off,
+						    chip);
 		if (ret)
 			return dev_err_probe(&client->dev, ret,
 					"failed to register power-off handler\n");

-- 
2.54.0


