Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E506F0180C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H9HXAgRVAYQcuJJWvYeHrQsZqCjZYlhl99Fp10e/NA=; b=Na0PvrY2zb9T9Vd7GifTLWDdkr
	O5Zaq4bFrzVt+XYiGoUbO827/EbBFs49PqHvEQTVVi40H8qc7fTu56abxcfzjSjZhEDTCzyzs4naA
	ZlyHx+6dzzIr8UdvBXjg7SHmN3PP55QXba5tbfV4XUGq8M6ipBSaDyXwRV6m4Bn8iSVTETfLXsiAr
	LviMbXgFfrfZAgujkTKjUvch1Gl65t0OaqcJfvzmUzH15CpLG3OvAI+rme9iPoVOACShBzlvDGY9I
	bSMLmyVOBgqQvjWhm+fcE0CWXn3Fy7AM1JG4gRsL1FX3UxSJIRMAu7l6BbmKqJ85eqUkBXLBmQHEM
	9IRCGx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1y-00000003BiE-2Au8;
	Fri, 06 Mar 2026 07:55:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1s-00000003Bak-2nVK;
	Fri, 06 Mar 2026 07:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+H9HXAgRVAYQcuJJWvYeHrQsZqCjZYlhl99Fp10e/NA=; b=pzlT/lEvYnGtl8YcEKQmTLvzyT
	2zfjX9+AFmPua1VpJkAtW+U0ayM3LPdYJJhvmnvXINNMBBDFt3riVSO0LIMJYcGM9oYCHaJqfwo9y
	9Wx1+//7NDEsMaShAJdfVP5F31bvlG3X0MCyCvHbPZnvXNpjP3YF9pqUcBVXHyp/xMd+/zqQm4VXH
	asjkLu0doiV59zdxfDpABKRpdpyvImrlI8A0TxxFElkASa0EoCSWgXAnTiRxdEf+jDYRNTfXbkUul
	d+YukcrVh8krzYmcpw6zMQ/RuhlcZabdYKM1GBbE1x+zhtIs9mwql2pvw9GzYdabrBtFCiY0sexvm
	Pfu0WBSw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008ELI-2pyz;
	Fri, 06 Mar 2026 07:55:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qlxK72977165, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783567; bh=+H9HXAgRVAYQcuJJWvYeHrQsZqCjZYlhl99Fp10e/NA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=J2NYdWeg+OJ+50WlEhG3TIaXkKgzWKwJLIqGeN7exrPg8RQNNO4ibe844CiuMb/U3
	 Ue7fDCn9kXc5QwIMq6LQ7ahfBZSrOe52FOYQD5ow1acfS5DKZ0LN79pNEXIfN9hXbd
	 nH6efKs5RFBVA249Ew9yYzxSfogyFobfBPFVGmAio/vlMRuL8bm6+1o5B5d7mt1XcY
	 h9I/s5eECJicPFYRC1Aqd2ZEWWO72KB19RQZs7eDRlrH59GCJ5jZW9/Xe1QiwvA4EB
	 HBKTIbuIGLqU//44uLP/S38xAcO16hE6Hzr6mcR4sKXyV5KqiD3dyctYLPZl43J/86
	 FuquqB9i1gH2Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qlxK72977165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 08/14] pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
Date: Fri, 6 Mar 2026 15:52:38 +0800
Message-ID: <20260306075244.1170399-9-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_610939_66181A10 
X-CRM114-Status: GOOD (  11.68  )
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
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 94b1d057197c..d131db29aad8 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -56,6 +56,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_INPUT_PS, "input skew delay", "ps", true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, "output skew delay", "ps", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_VOLTAGE_UV, "input voltage in microvolt", "uV", true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -202,6 +203,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
 	{ "skew-delay-input-ps", PIN_CONFIG_SKEW_DELAY_INPUT_PS, 0 },
 	{ "skew-delay-output-ps", PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, 0 },
+	{ "input-voltage-microvolt", PIN_CONFIG_INPUT_VOLTAGE_UV, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 89277808ea61..63c43b6a9fd0 100644
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


