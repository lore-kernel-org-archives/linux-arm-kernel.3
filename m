Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754DAD68B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AzLdEYWocJzcvwOs9QW6zaf0G7mUCi6/CpG3lyJBi4=; b=wkW+zkVTjDNqRApIh/zktZpgMh
	sRY87xGBmHzvSWHxi5A480BhCCnSQDBYP/WLYybdWM50v86nPoPRII9ysW2SECWUteNBeZtsS6dQF
	czLRm74TwJpDWjeAceFE2cvTW8qhTRbsjPFjRg1ViiFcXm2mOpUaafVOM9ssnKLLHW9CTCqx7gflN
	oo5RmsQfG4zl0AihYsO0DV045bZf1SHP8BUtyu73Dis7rWmSwF/SKS3oC6dPmgqYg2Qpsao4fHPbZ
	nDRcdTPhrmS/bs41uMRe2TpfiauXsWkRFoDTfmkZapdjcsFDL4scSSmhHZOPt/FCmICwCUyZsdsk/
	oHUjoKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc7l-00000000GY4-0qOg;
	Thu, 14 Nov 2024 15:51:13 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc5o-00000000FqQ-1UNi;
	Thu, 14 Nov 2024 15:49:16 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id ACC2610000C;
	Thu, 14 Nov 2024 18:49:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru ACC2610000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731599342;
	bh=+AzLdEYWocJzcvwOs9QW6zaf0G7mUCi6/CpG3lyJBi4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ONY1OLPIHNtrXIygBNIWANblBcCwFiQLFl88mNeGWZFyP8PnCF30oTcKrCNUpQSCN
	 b6+CD/UEubCvAo18TLsjKQaFcD9IFA0O15jnLHsfeK6hgQ2UC2cEVAzdJ+HIYIR/4v
	 Ly5LC2TKF74zutTetixZCSGrQqpIePG39uR+o3qS4fnqd1isMDcx4/qBXyRk7GeEav
	 R1ScHkaMk3U130TdFvqWM+DvqRmNE62maAtGV3lQlnA4/JuZvhfg5cnGWsKVeaVS7Z
	 AMSKcXeqHR4kXoaAtVZFfZ2kcoM4c9yVIIwiJc3+03G+ugP4W4jkLq9GF7MnRr7cPV
	 +wotGnb0y5esA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Nov 2024 18:49:02 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Christian Hewitt
	<christianshewitt@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: document AC200 support
Date: Thu, 14 Nov 2024 18:48:55 +0300
Message-ID: <20241114154856.3353691-2-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114154856.3353691-1-jan.dakinevich@salutedevices.com>
References: <20241114154856.3353691-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.45]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189183 [Nov 14 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/14 14:31:00 #26861614
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_074914_518656_FD683E97 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Add compatible string for the Amlogic AC200 board.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f5..ed0071695d29 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -193,6 +193,7 @@ properties:
           - enum:
               - amediatech,x96-air
               - amediatech,x96-air-gbit
+              - amlogic,ac200
               - bananapi,bpi-m2-pro
               - bananapi,bpi-m5
               - cyx,a95xf3-air
-- 
2.34.1


