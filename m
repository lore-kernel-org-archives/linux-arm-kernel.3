Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC08FD874C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdmzHmBgDKqciU8FWsE6Six4Htcy+tUizytLGb7E7Q8=; b=xtCAa9c0O3pxLrTSy2Pjb6sn94
	YQj04Kf1F2YB9v1If95+IDAdJpuYmiG1bEm4bAtUQMzk4zSu0D4EmF9P7I79N4r+1hTKOktclaFjJ
	W9DVKt1nOAeOYNdXin8NISWd5a00ikH0ykkkIVlu1ki1oKI2zmzeJ1d3r8Q02fUjVH54zLjG2N1yh
	5/prX+0e31cSsmZen3lDavZVMSpUCzwg0uwlsyOOm8WAlSsLavgw5Cqu2Yz9nUkSgNQlGDKlJhwyv
	My43SG7XxbGar7JglT9kzJYS5izw7JSptSllvj0QXUNeHFzWu7elvIeftoeC5U1II4+p0CshnkQ0S
	QL6zQ9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2m-00000006FEr-10uV;
	Tue, 17 Mar 2026 11:57:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2b-00000006F8G-0mEt;
	Tue, 17 Mar 2026 11:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IdmzHmBgDKqciU8FWsE6Six4Htcy+tUizytLGb7E7Q8=; b=o5pHSgXte5jGSY5Cohrt+Rbw7T
	l8op7/bAdTHcOOKEH9qIcxwt7QdE9RxSc09+pPs/EBtS2Chhd0N7R9791Ka0fQPkGoXeiFp3D3WQn
	PSrL51YJryWu5KOpuwxoRhpD/7k05p/4yZfY7zKAKRRCvPgyrL/ujKJie/VKsUjlY3qOEb3bsPwmx
	6RVBd0rZ1UJev6UD/1yy09UXPckgangRjT3QBaYbKf6ZbhkzIZyKAnLiWQ1KzUV/inT5IVGoH6z2B
	TnggHAmTw8il0LAuNiuW1kQ59UeQsKcLifgOfL1lNbkziPwRA8J+CD6LPPj2/KoSWkR/uCncmDK/0
	/Fq4hhhw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008taQ-2qi2;
	Tue, 17 Mar 2026 11:56:51 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsCIs93851632, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748452; bh=IdmzHmBgDKqciU8FWsE6Six4Htcy+tUizytLGb7E7Q8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=P2Spfh1xWlqdW7cTmWJwO7fDRqpnNg6LivCrFDo82CrdS2qDn+0w1PH76MdPXfF43
	 CPuxxcKphFLDR8Qu/3R0twSAcpBxAwRxi5hAjpm6kdzAy2bvqcJEznuBT7Ju1nPskC
	 fGpsIG/p5HL/MDr1Q67Qmj33spWnfP4L6uijgKyvbl/g9z23qD6EgKeEPP8+worIdG
	 K5Go9R8bMJRis/zdjZBgHHwmcdwGmFAy00uK8o5T4ufVSVqsuTGX3r2vS8eQFQd/OV
	 wTqQGD3xzrLwUZ7nB72SaKcQ3gxnNIhHHpae5PLg6AWzMuC4oGSQz0DJmugX3r/T9j
	 drpm8KbUxGDig==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsCIs93851632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:12 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:12 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:12 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 6/8] pinctrl: realtek: add support for slew rate, input voltage and high VIL
Date: Tue, 17 Mar 2026 19:54:08 +0800
Message-ID: <20260317115411.2154365-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_284315_175D1A97 
X-CRM114-Status: GOOD (  14.51  )
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

Add support for configuring slew rate, input voltage level and high VIL
mode. This involves updating the pin configuration parsing logic to handle
PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom
property "realtek,high-vil-microvolt".

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add Reviewed-by tag from Linus.
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 66 ++++++++++++++++++++++++++-
 drivers/pinctrl/realtek/pinctrl-rtd.h |  3 ++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 16cee851393e..ec266c5b7fa1 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -37,11 +37,13 @@ struct rtd_pinctrl {
 #define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
 #define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
 #define RTD_DUTY_CYCLE (PIN_CONFIG_END + 3)
+#define RTD_HIGH_VIL (PIN_CONFIG_END + 4)
 
 static const struct pinconf_generic_params rtd_custom_bindings[] = {
 	{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
 	{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
 	{"realtek,duty-cycle", RTD_DUTY_CYCLE, 0},
+	{"realtek,high-vil-microvolt", RTD_HIGH_VIL, 0},
 };
 
 static int rtd_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
@@ -288,7 +290,8 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	u16 strength;
 	u32 val;
 	u32 mask;
-	u32 pulsel_off, pulen_off, smt_off, curr_off, pow_off, reg_off, p_off, n_off;
+	u32 pulsel_off, pulen_off, smt_off, curr_off, pow_off, reg_off, p_off, n_off,
+	    input_volt_off, sr_off, hvil_off;
 	const char *name = data->info->pins[pinnr].name;
 	int ret = 0;
 
@@ -409,6 +412,67 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = set_val ? mask : 0;
 		break;
 
+	case PIN_CONFIG_SLEW_RATE:
+		if (config_desc->slew_rate_offset == NA) {
+			dev_err(data->dev, "Slew rate setting unsupported for pin: %s\n", name);
+			return -ENOTSUPP;
+		}
+
+		switch (arg) {
+		case 1:
+			set_val = 0;
+			break;
+		case 10:
+			set_val = 1;
+			break;
+		case 20:
+			set_val = 2;
+			break;
+		case 30:
+			set_val = 3;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		sr_off = config_desc->base_bit + config_desc->slew_rate_offset;
+		reg_off = config_desc->reg_offset;
+		mask = 0x3 << sr_off;
+		val = arg << sr_off;
+		break;
+
+	case PIN_CONFIG_INPUT_VOLTAGE_UV:
+		if (config_desc->input_volt_offset == NA) {
+			dev_err(data->dev, "Input voltage level setting unsupported for pin:%s\n",
+				name);
+			return -ENOTSUPP;
+		}
+
+		if (arg == 3300000)
+			set_val = 1;
+		else if (arg == 1800000)
+			set_val = 0;
+		else
+			return -EINVAL;
+
+		input_volt_off = config_desc->base_bit + config_desc->input_volt_offset;
+		reg_off = config_desc->reg_offset;
+
+		mask = BIT(input_volt_off);
+		val = set_val ? BIT(input_volt_off) : 0;
+		break;
+
+	case RTD_HIGH_VIL:
+		if (config_desc->hvil_offset == NA) {
+			dev_err(data->dev, "High vil setting unsupported for pin:%s\n", name);
+			return -ENOTSUPP;
+		}
+		hvil_off = config_desc->base_bit + config_desc->hvil_offset;
+		reg_off = config_desc->reg_offset;
+		mask = BIT(hvil_off);
+		val = 1;
+		break;
+
 	case RTD_DRIVE_STRENGH_P:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.h b/drivers/pinctrl/realtek/pinctrl-rtd.h
index 7fb0955ce749..02e2d8d269b5 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.h
@@ -34,6 +34,9 @@ struct rtd_pin_config_desc {
 	unsigned int smt_offset;
 	unsigned int power_offset;
 	unsigned int curr_type;
+	unsigned int input_volt_offset;
+	unsigned int slew_rate_offset;
+	unsigned int hvil_offset;
 };
 
 struct rtd_pin_sconfig_desc {
-- 
2.34.1


