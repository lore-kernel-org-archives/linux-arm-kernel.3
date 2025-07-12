Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64E1C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKPl+FPnp3Ba0e9JwZfuPZ/chVf7stgdpzJhCfjh7FQ=; b=dBo2NjG1UaBbf4g/cm+CAk2BRb
	dM0m7zxlmXd6Tc1VkpKwFn+UcBCsDqJkb5hR78+9GXiPEEWPZilp0gVq/b1ImKucdq/DdlxtrC68W
	i+9iMiFgCcQGEfsq1CzilwIeg9xv9NNSUzypqr+/B1xnGj2FEmDCw5ILQX7u46vJS/jYiVsnf6dk0
	bLJRRvsFGTUW/Nh2CY0gkmOB9hrmp2VjpbhEsHrqozDf99BesSoFO2NvETFb9ejAAVC1gMxYv2myz
	ww1npT0O/90HBf9cnTzLomCEbYx4YD2cFqMl47dYhc/tEEyHpimp8X/7Y5gFeJw7igErZH9CfEtDJ
	SsGvnE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaeI8-0000000GrBE-3HQt;
	Sat, 12 Jul 2025 17:45:40 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaeBC-0000000GqVi-1IOv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 17:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1752341909; bh=YKPl+FPnp3Ba0e9JwZfuPZ/chVf7stgdpzJhCfjh7FQ=;
 b=L6UiUCsHKn6c9o3Gum7NHS61p9fwcOlA8zWI95MJkjZqFCKadK5T57PHWnMMD524wd4g5P0yn
 t6RO2CPGJHHnmZeMN0Y4LhpKyHG0u0dVEcQJpBoIp9OJpp6dh9A/+JasSgDzg8cDeFnYTafLpdx
 k1vjewkiw8TNjTCEgwvUqI+fO76TKoVhjhmOCCctQ3zelWiDNr4/834Q9aDYQPO3J51keV0Lhw3
 tHo+OPj9I7y2TFmBYKMQxm1lDe0901ULs3Ie83WvZ8tazTnJoieu9Gj5BCOel1fWiZkUyYytOSn
 h/xUJZRtCbeiqIC7xTxKnJhGd3Z73euBzAXq5FuDPkkw==
X-Forward-Email-ID: 68729d93d7dd91652d16c1ac
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/6] dt-bindings: arm: rockchip: Add ArmSoM Sige1
Date: Sat, 12 Jul 2025 17:37:45 +0000
Message-ID: <20250712173805.584586-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250712173805.584586-1-jonas@kwiboo.se>
References: <20250712173805.584586-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_103830_431763_2137E890 
X-CRM114-Status: UNSURE (   8.41  )
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

The Sige1 is a single board computer developed by ArmSoM, based on the
Rockchip RK3528A SoC.

Add devicetree binding documentation for the ArmSoM Sige1 board.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3: Collect a-b tag
v2: No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index c5690098f2ed..43f6403ecad6 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -54,6 +54,11 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
 
+      - description: ArmSoM Sige1 board
+        items:
+          - const: armsom,sige1
+          - const: rockchip,rk3528
+
       - description: ArmSoM Sige5 board
         items:
           - const: armsom,sige5
-- 
2.49.0


