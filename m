Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2074AC61DE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQNZeBiAnxKYiWCyD1a33b2P2Qe8jLzBI4Do6/Hfgc4=; b=IYljnvSg3OrKaS5DxyTwIgVdbl
	cwUg3VgsXczj2F9FWc9f5LA53uqj+zrVRVFhduz98mCxP8NHXzN26Wq8zpFGrGEWnZthzwFuzZB3E
	Lo2hIPk4/WVLtRp5CyY9ujw7CKLZzR0actotoaaqRVGEh/k+xq7eDRi8N+I89VCO9YfbSTVjUZO75
	9qoy27Xd8c6CKneDukvY0vwyVoLolheVL+DrUK1CbXBopcmHYjwRHSPwJedRSsXS0THlnQ7tBbwxV
	RAWJa5n+ovFLPqC2CZnpZMhBTtrU8Yd2N8cYfG1v/CzHlbjNSVzQN78tDF3MjTvlKHtz/uWW3ug2y
	qeSK3PtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrW2-0000000GEUy-0z7e;
	Sat, 21 Feb 2026 18:15:42 +0000
Received: from ms.puri.sm ([2a01:4f9:c012:9260::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrVw-0000000GET8-0GQc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771697732; bh=6qD4WxlgSPhVsvrYvovWSqRW5CeLnWSLVEIuD0nudn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=vomIkakDhqc7ckGditKPSVQJgTR81T9qO8QthHrcgF19gPCvhDIuOx1L76lsEUYPe
	 6zj0MPzJO6J0OpRzJFDMxJoFHQ7XiBDXeV92pa+fdwR0a2NH9THiVwwKpjca9dsGRr
	 z8kZlpu1dNH0aLxaC7SsV1d9FQSWFfmybquYJvUmOijg99XrI9EW5XHreT5Dz25BAv
	 f9BlzMzSw5iHSJkvrIL9NK62chqMRzMj6UndhbW6mOaQ713hGoKb/Aw0i7iSjrSnJ/
	 3ScBzG/1d6oOxuPMGc0KDzm/5Kii20usIEjbDwFbsrKaXWn7pFJGhsysFBW9oKLwFZ
	 60KIWLtNFrYpA==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id 7B95E1F6B7;
	Sat, 21 Feb 2026 10:15:31 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 21 Feb 2026 19:15:19 +0100
Subject: [PATCH v2 2/2] arm64: dts: imx8mq-librem5: Bump BUCK1 suspend
 voltage up to 0.85V
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260221-l5-voltages-v2-2-dd8885bb9331@puri.sm>
References: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
In-Reply-To: <20260221-l5-voltages-v2-0-dd8885bb9331@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=6qD4WxlgSPhVsvrYvovWSqRW5CeLnWSLVEIuD0nudn0=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmfY/yZm25YPcks8kVOiZpmQMkUlzf4fAbTMtK
 i5qav26UFuJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZn2PwAKCRDo8jXPO9vD
 /wA0EAC7xmej68FmfWdPdQk3Dw2u3qHJersdxWmVMKT0J+JxvoJIGhvLcIzXayfwpV55P/2xRbe
 wtaknjtOysVw/9JXJs5fbhpYvotz8FqYVt6WUkxZsLdxFc9eLNScL9JddkponP6+1uhU/h0VWnG
 wpkGcGUrpRfYNmhZLThrOCRHr38WS4caL6tUgcn/TC7amEl5FKARztx8DEwo9hAKaK15ELMIxKE
 ta7gjtz0TUsby6uKRpoXg/yX3FQcC0B2HpO4rrG1UD4Ynnt3tdG26yHFzTiW84Q8zAxY1I2ycT4
 c0WpQszde2NK2L89oEJyCx0NSjZVri9AwuW03xBbVRSc0BABbFZR3iFPIJ2UeHwe2hNvNvDfU+9
 LzA0Bt8jv9Gi8XFyGGX/5B1b7WEFPO1VejsTIBPd/KYuVmm9gADkFS04T3JQPMtfiIKolNzAaef
 xesvHNOCGmIf1hD/dlDTIMy9ZqSsxa5pZbxMhWjMz/BZ3r6TGMdzBTRlAb00mKetMEWx2fnJtGe
 dpGlZkjgC7omVXQd7B9bxGJIZI3VwKjXXEaaluOEKqJvRlK67aS71VIYmZM3bbdA1HwHLUqRlKM
 oPjl0ncstpMteakUnQIRPdGPXri8e+wABtKVdIbV7RPloU+fF+lkahf2w9bcQ4hgMW+REDZfKGx
 sifqTFzG9PkSsJQ==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_101536_278439_BF80BD46 
X-CRM114-Status: GOOD (  12.01  )
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

The minimal voltage of VDD_SOC sourced from BUCK1 is 0.81V, which
is the currently set value. However, BD71837 only guarantees accuracy
of ±0.01V, and this still doesn't factor other reasons for actual
voltage to slightly drop in, resulting in the possibility of running
out of the operational range.

Bump the voltage up to 0.85V, which should give enough headroom.

Cc: <stable@vger.kernel.org>
Fixes: 8f0216b006e5 ("arm64: dts: Add a device tree for the Librem 5 phone")
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 7818d84f25a7..f5d529c5baf3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -882,7 +882,7 @@ buck1_reg: BUCK1 {
 				regulator-ramp-delay = <1250>;
 				rohm,dvs-run-voltage = <900000>;
 				rohm,dvs-idle-voltage = <850000>;
-				rohm,dvs-suspend-voltage = <810000>;
+				rohm,dvs-suspend-voltage = <850000>;
 				regulator-always-on;
 			};
 

-- 
2.53.0


