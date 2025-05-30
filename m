Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBDCC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 03:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB6XsHy8r+i6IAvkX7X085TB7ho/0b/vlulO2Z1TZSA=; b=T3Xx00Ef46vAwJbk5sQt7npJnR
	yCrg1zVlllpkWtBYzdOk3DvVk9pb0HrwkUP441bMWgOeWRFR9Rz6cWcFUu9ufaHhSn9Pj9zv+Pj9I
	cPDJ9pKcSAimrXi3h20QB5IYii/yWrxA1WphLC/PT4qxTOTEnW6Z++mw6ocz9RoKbS8YbXikxEygh
	zmnG65eTs3rNhGWOQDSFSueqw1mcJdzNn+M/PmnSzUr65TVDJS3Xn1nKkyUgiACVHE9KS5vSebku7
	lr7Vi3I1snEHNxmsDNyV6HX/v2xCTF76cQT6ckqscZpnj+eneVmpANvXLrjrYDu51+PvjINncasTS
	IBZOjyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqGx-0000000H1Ih-3Cyx;
	Fri, 30 May 2025 03:19:07 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqBm-0000000H0ru-1nZ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 03:13:48 +0000
X-QQ-mid: zesmtpgz3t1748574654ta3bc7e8d
X-QQ-Originating-IP: bFSBAXbZGjY65746zkohba5EnhI/xku4pGYbgqCLo3s=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 May 2025 11:10:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13257807080784473651
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Fri, 30 May 2025 11:10:45 +0800
Message-Id: <20250530031046.166202-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530031046.166202-1-i@chainsx.cn>
References: <20250530031046.166202-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MACXe2l6e7j9jZ8ARCgOLP4V77PbUUzCiwXJKlVriDKiKuoA0n7dqGPu
	E3mQQhk8WN6XXqaZRI65+Tzc1jrIeFUGJUkHjOrmX+e7M2VeLkR6o/XYJedWJJgV9RMqgLG
	kA2/U4H/A7MYOgHuO+BdIhx6XNbrDfV2r5wNb2RtuJf7PX9j9U9j3z/2WvSTIpUzcBsaNGc
	gBhNS5ybl7aNjOsL8K3maFXxPxzS9cXSC9+lRzOoYMIQ+aatPWxUjcRSJmqvFV+17XWaqbk
	5QxwbDLqBmENC/JC4W7EzHm/qUgQL50oIT4UOFxRVp71O5o2AKETwjn7b8WScdC3tnZPC7g
	ftA3SyKb4nW8R4oqM6sJ2UZKGdjpn/UZ878GZWwwhgwd+FNzb0mcdNSoymBhAT9MeW0sfm+
	HyCe+38yQshvQLAMNDFxr2Y5TvZjyqBKgjNmtywp5r+qwUwuc2M0TkufdXaMp3r9n9SUx2u
	aXHfr2hQHzWKsCze/GBUOlfsLZ4s/rUBG/5x9VpRVKURkHvRNuVnLz3RiYi7mnKXgDNX5Qx
	ABZY1C+MKqa7zcUl93XobhZ0RpTUv54gkIv3LMcLgyrseYj+yT3jJ9dK2Qo5eDDl2J3Z7Tk
	uwzzuV7Oo84UZ9CrWrb1udDiuzcgO5hL5d0mWxA/268nIsD101RXr/CvEJJrjcc6jxdrH2Q
	F+naRz69IFmXGidGsAjp2HbneE8kb1TKKrusmDeDd5Td/nJrCHUz92ZuFVcWaEQ9ekFDNB/
	d6TDsMICpeoCV7nqhKDWk4iHGK4qhXB0Vyet2et7OHtLSWDCmEdamVPSPnGkTrhSa0BRPtl
	c430XmcLQ2Slgz3kA5r27Y8dFdrXsvKDN/oUNRO/I5O0jMrLPGPeP/r9rbovfTUUUgQaEgk
	g1Wc6Fgfu8dOHlXt7MtoekoepE0Zj/yIpwJymWILRWocr0+KeIBchCh0THErl6vHotIZldE
	m1oFcXr2PHw/gQ43QkqXXCWuPteXYzUa5j2u3yLD7VZADKNtktqctCy+YpxNlwqRkU3E=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_201347_286677_95E200E5 
X-CRM114-Status: UNSURE (   8.90  )
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

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


