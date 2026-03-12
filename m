Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772CF105A58F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYviwW8kDKrW3gTfMtQDJZ0P+wnpGdcbPJFi/LTFUFo=; b=TrCJcMIg7FcvUlXg6jW53ngEYT
	pEy9Oyr1pkBxCKsE+MTD8UVWZLfGC2H8sol5c/z1jk/vKfj5v0PB1tpFO9ZO3/8Xx35I3kv3j5VIr
	7yw4t016nDCypDT3IhPPseMf4xqFSxn+TVSiOtC5FxGgSbDCczEAtOOAlq3cki+VDkWZGFn4y4QoI
	fY90NcW+lZew/NAotzhTTxHijtaoD/C0XendDkZUUrvIMSMImX4jgrRlW4eugC9ocdWPCkvxPcBta
	CX1GCkhfdU/XuqYFIJ2RHOqZdctnQLTToo7y0IMcrIR0T34BTMloIJRakOnJlZWAxAKGiCAsV5BOP
	jbSDHp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eII-0000000Dx9j-08af;
	Thu, 12 Mar 2026 11:33:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIF-0000000Dx6m-2oXf;
	Thu, 12 Mar 2026 11:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QYviwW8kDKrW3gTfMtQDJZ0P+wnpGdcbPJFi/LTFUFo=; b=ax1vzFozLuF2v0jNIJX/aiCgUY
	a2FIjfgyHzaBeLhzNOrzNGJzqakAzWlTijonpSXm2LFbBme9pw924maqmhXg+/SPh5+vYx7LMDfau
	7sJbP5Rg0zhPUGE2sgpuZYGDfyr+MyZKMYMWWADAii0M4rVRsqFcJIUdwfhheo2d1mKbJexjLxPcM
	hjjykb2LgryICU/j/HsT7ULAUmmqwdTvDBT7iDl7L8NoxDk+cdH0MaZKyTVWXyWGY4yu21TJLO5EV
	qMVQUCYvA5p03dAeaA6HwNyXdLtojzjphYIF4EPkYJqDsN7QPGtnWphewofo2dnuAPjp15tdwn3HQ
	srxD1InA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eI9-000000011UF-3M6d;
	Thu, 12 Mar 2026 11:33:30 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUfC222456773, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=QYviwW8kDKrW3gTfMtQDJZ0P+wnpGdcbPJFi/LTFUFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=fTeBKPVQjLYVgnKOKIAtEgat3A+N9r1D9qpYnRrDF2kze2v13cFlMxQDAzdu1gXyA
	 I+fOviJxy61j+5PplY1+QyNRrhs7GDYvypDRXj3eGuGUdkNIz3eMS0/AjkB+Mqj+J4
	 Mb/+6mGvpd0lXFM+4a6Y9QqqJUUBXE4vmdW8qtZXv21YGY10N0m0cnKNhNRFFQt2nF
	 btpXJnZKCkk4DZXsI9IH6jm3vLgsIReWtnHNUA/jUjArqOt6K1TeE3730rt7LmXciY
	 0dwinGT5o45r6TxmJbB0Tgjqr9j9OHHdPRm6gqt6fx4CAtUm+cDBfwHV5sjsC8ZeDB
	 KIDyEEy0kJFuw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUfC222456773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:41 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:40 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 2/7] pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
Date: Thu, 12 Mar 2026 19:30:35 +0800
Message-ID: <20260312113040.68189-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113326_925362_BB768CEC 
X-CRM114-Status: GOOD (  13.04  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add a new generic pin configuration parameter PIN_CONFIG_INPUT_VOLTAGE_UV.
This parameter is used to specify the input voltage level of a pin in
microvolts, which corresponds to the 'input-voltage-microvolt' property
in Device Tree.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- None
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 855ca973a1c8..06cdc885a442 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -57,6 +57,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_INPUT_PS, "input skew delay", "ps", true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, "output skew delay", "ps", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_VOLTAGE_UV, "input voltage in microvolt", "uV", true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -203,6 +204,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
 	{ "skew-delay-input-ps", PIN_CONFIG_SKEW_DELAY_INPUT_PS, 0 },
 	{ "skew-delay-output-ps", PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, 0 },
+	{ "input-voltage-microvolt", PIN_CONFIG_INPUT_VOLTAGE_UV, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 531dc3e9b3f7..a5d4b2d8633a 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VOLTAGE_UV: this will configure the input voltage level of
+ * the pin. The argument is specified in microvolts.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -145,6 +147,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VOLTAGE_UV,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_LEVEL,
-- 
2.34.1


