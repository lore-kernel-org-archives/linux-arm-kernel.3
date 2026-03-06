Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593BDF0180A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hk9cKusVEqnv1IRZnljnfT3bHzCERxVT6MhllyxHpHo=; b=HSWLg9vsrcyVbjY2SfFwgkVEkk
	AU3JyU2ywFsH34GRug07hVchyhFayVhckvIQuy+xzVJ+LyQaTj4kUAI9oGuK5X6CADNkfo1QhWWX6
	kxqXDfRh3lYgAvHYiuVIWYiQeFklLRayHUTHhI7gIHUfbPOgunxP6wV63VFsKMqNq7Z8MGp0hCPfq
	/9X15d2T9gtDjvuUJ8kWhGuFO0gJZ5pnEdQyj08MwcUFh5hyT0vWpwlWsMG20LlLnwPNrdev+mUy2
	9Ag0vikUp4mb2BGE1R0LCdo+c8LHlY6GNBSEgyEgGqk61I9nUxIaF/n05xzVnsz91aLlBOYfgr8rJ
	smQPtwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1v-00000003Be4-3Riy;
	Fri, 06 Mar 2026 07:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1q-00000003Baa-2hVj;
	Fri, 06 Mar 2026 07:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hk9cKusVEqnv1IRZnljnfT3bHzCERxVT6MhllyxHpHo=; b=E36ojqfS0wiFsw7pZieMYH8qjm
	JxTCwZgmiLFXZavk1cdioNoIpaw9/YiOEqVHGgPbZ7U9JXeQEmiKrEb2WVUblOOgjErfjmmAYlo/E
	owY4eQle2qthUaufS60UhRS4QantjNucLk/uNsjsK6z0w/UiSQ01biL+5l51dnLSpYooxQJWD9dgd
	/MDkURkUEDmpNaUBWbfM3n+53Ejkh7MdlcY1R4+ibu/fwyTDbnL/DY6SnwGZICV5iTOlHZ26amYLO
	tHv/wobEnQJ0dOq1uV9ptCqYZxnBW7cSUViZ6SwkcLikE2eIddMvhg11ncmR+iIhqYUi683yILlhe
	cqTIjm2Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EL0-1NWJ;
	Fri, 06 Mar 2026 07:55:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qlW232977169, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783567; bh=Hk9cKusVEqnv1IRZnljnfT3bHzCERxVT6MhllyxHpHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=O0EtMG5uM2IcncGDA3v25nnUAskWNKzIE0yF1ViyeyO19k4SfUtB93bfmNga8zjsI
	 DrNoouBz4y77snb3XeFa0IpY5i7kKu4LFZDnAxYp3D6JPY8QcAcGVdKVga6SNJjdGL
	 cjU4JLQgx4T9qyMMKExjA2k7E/sN2a7qBFYkI7IKuwm35snbDMy51ixRp5gt/37lg9
	 TEi7MZCKilrICUZXhVdtwRFAqTiaeegHJ153rFdgEpWQsmNqtkkAdqV2XwrE3iPu2s
	 xYqJiH2akDLjWR1a4a2468rLwUzZb1PV1nWcAGSfKHZ+l+qTQoB0tXGiPOCNGMHTj0
	 pbj1cs+l2VvzA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qlW232977169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:47 +0800
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
Subject: [PATCH v2 10/14] pinctrl: realtek: Rename 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Date: Fri, 6 Mar 2026 15:52:40 +0800
Message-ID: <20260306075244.1170399-11-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_310303_6A1680E0 
X-CRM114-Status: GOOD (  10.70  )
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

Sync with the dt-bindings change to rename the custom property
'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60dfb39bc986..d9456f3d908b 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -36,12 +36,12 @@ struct rtd_pinctrl {
 /* custom pinconf parameters */
 #define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
 #define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
-#define RTD_DUTY_CYCLE (PIN_CONFIG_END + 3)
+#define RTD_PULSE_WIDTH_ADJUST (PIN_CONFIG_END + 3)
 
 static const struct pinconf_generic_params rtd_custom_bindings[] = {
 	{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
 	{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
-	{"realtek,duty-cycle", RTD_DUTY_CYCLE, 0},
+	{"realtek,pulse-width-adjust", RTD_PULSE_WIDTH_ADJUST, 0},
 };
 
 static int rtd_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
@@ -443,10 +443,10 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = set_val << n_off;
 		break;
 
-	case RTD_DUTY_CYCLE:
+	case RTD_PULSE_WIDTH_ADJUST:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc || sconfig_desc->dcycle_offset == NA) {
-			dev_err(data->dev, "Duty cycle unsupported for pin: %s\n", name);
+			dev_err(data->dev, "Output pulse width adjustment unsupported for pin: %s\n", name);
 			return -ENOTSUPP;
 		}
 		set_val = arg;
-- 
2.34.1


