Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F69F0180C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqong6ONpLV7i4pGQx7rPiXI4yfULcIEHX9UrfhOolE=; b=jr6dyybH3/R/Qmn5kza34+bmcV
	bpodok3iTUGoC0obZzyU5FNqfBq2LvdIS/2oFWGZqLFJJXwxxQvBUnEvjrb+5BuKq6gR0dSm5c6g6
	OPfIisDU1IgPdEP0h84b4pbxMN2fJoDSQES4lh7PVU9TyDhEUl3tSWGrzgGzcUdHl6u+/k6a/BpYg
	ULuCmrSotnXZHUNFXApxNZXWNnFIUE9I/VVg4jEPtzgmUw8wDEOekQ34ehSKuFXObLhXicU3GLsUt
	9yUNmzcVhfURcMTyoSC6We9sxEP8qE5tzARb3hEzAmwyP8i3pmSX8MHKysygxj2i4PgSlh9yXh1rt
	/NsH7x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ2E-00000003C34-2x43;
	Fri, 06 Mar 2026 07:55:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ22-00000003Bnd-3i9o;
	Fri, 06 Mar 2026 07:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fqong6ONpLV7i4pGQx7rPiXI4yfULcIEHX9UrfhOolE=; b=DFWEH9THTwPR2zC+Yom8PY88+U
	ApMNflFssXEweBPdnWCps7uZMfml2m3ADyjh3KJVJgIaNwlcdfwXoWg2+uuCzSongunT2LzrUoKpz
	CkK5B1zQYqzUXhCE5qzxzWRUTOQbuIl4cdNPy1/8IHtcrJVgOJ1aGqF7onQYhF63F536AFaD5GCRq
	b9UbkiB/5tfqRFUQgTSs/JEfRJwCaCT1Tol/txUNBfXPMF6q5KIQeqwLKpTTLspCgR7LJ2k+sacXO
	ieeoL/xTaV1FXHTfScxaTMUhZhT6nNrwZLMhvLCuuX/TDGqSE/YUZoIhFBj0kOZDQ5JMsBpaOQLFU
	5l/Cb+zQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008ELP-2pvu;
	Fri, 06 Mar 2026 07:55:32 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkunF2977157, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=fqong6ONpLV7i4pGQx7rPiXI4yfULcIEHX9UrfhOolE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=gkNeZCYKpgdHd0vqbMG7lRGCvKE8g34E5N8OPNrA7k4ttWahPbyGPMcszVf3ClWqm
	 gjusY4q8pN1GlsPuDcIFglvuACMW/kkbppEVfpWHx8M4ZDExwSWpfoOoCpuzVOBdRg
	 AbdQPO8h/ObMA+n+USgCkKsn98QeH1ZmDz++B6DmTB3noZCoiNkm3jV7Fal1fupEdZ
	 HsJzShQQGdVLh6WtC/aGEQ2Xgs3Vl6MZh7dzFoe7BjfqLFQ5faZwLPEKCqf7HK8SuD
	 AGlyEd7CjVkrU/vjOA7JeYf6rEw92bNC7l4/fl/EOFHc8f5HH7k/zoJbUYvo9K4Z+q
	 JxjOUKJ1QUUVg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkunF2977157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:46 +0800
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
Subject: [PATCH v2 05/14] pinctrl: realtek: Fix grammar in error messages
Date: Fri, 6 Mar 2026 15:52:35 +0800
Message-ID: <20260306075244.1170399-6-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_611705_FF67C1A8 
X-CRM114-Status: GOOD (  10.78  )
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

Correct the grammar in dev_err() messages. Change "Not support <feature>..."
to "<feature> unsupported..." to improve readability and comply with
standard English usage.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 382bdae54bf3..5888a36babba 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -293,14 +293,14 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	config_desc = rtd_pinctrl_find_config(data, pinnr);
 	if (!config_desc) {
-		dev_err(data->dev, "Not support pin config for pin: %s\n", name);
+		dev_err(data->dev, "Pin config unsupported for pin: %s\n", name);
 		return -ENOTSUPP;
 	}
 	switch ((u32)param) {
 	case PIN_CONFIG_INPUT_SCHMITT:
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		if (config_desc->smt_offset == NA) {
-			dev_err(data->dev, "Not support input schmitt for pin: %s\n", name);
+			dev_err(data->dev, "Input schmitt unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		smt_off = config_desc->base_bit + config_desc->smt_offset;
@@ -313,7 +313,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support push pull for pin: %s\n", name);
+			dev_err(data->dev, "Push pull unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -325,7 +325,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_BIAS_DISABLE:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support bias disable for pin: %s\n", name);
+			dev_err(data->dev, "Bias disable unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -337,7 +337,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support bias pull up for pin:%s\n", name);
+			dev_err(data->dev, "Bias pull up unsupported for pin:%s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -350,7 +350,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		if (config_desc->pud_en_offset == NA) {
-			dev_err(data->dev, "Not support bias pull down for pin: %s\n", name);
+			dev_err(data->dev, "Bias pull down unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		pulen_off = config_desc->base_bit + config_desc->pud_en_offset;
@@ -384,7 +384,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 				return -EINVAL;
 			break;
 		case NA:
-			dev_err(data->dev, "Not support drive strength for pin: %s\n", name);
+			dev_err(data->dev, "Drive strength unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		default:
 			return -EINVAL;
@@ -394,7 +394,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 
 	case PIN_CONFIG_POWER_SOURCE:
 		if (config_desc->power_offset == NA) {
-			dev_err(data->dev, "Not support power source for pin: %s\n", name);
+			dev_err(data->dev, "Power source unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		reg_off = config_desc->reg_offset;
@@ -411,7 +411,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	case RTD_DRIVE_STRENGH_P:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
-			dev_err(data->dev, "Not support P driving for pin: %s\n", name);
+			dev_err(data->dev, "P driving unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
@@ -428,7 +428,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	case RTD_DRIVE_STRENGH_N:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
-			dev_err(data->dev, "Not support N driving for pin: %s\n", name);
+			dev_err(data->dev, "N driving unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
@@ -445,7 +445,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	case RTD_DUTY_CYCLE:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc || sconfig_desc->dcycle_offset == NA) {
-			dev_err(data->dev, "Not support duty cycle for pin: %s\n", name);
+			dev_err(data->dev, "Duty cycle unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
-- 
2.34.1


