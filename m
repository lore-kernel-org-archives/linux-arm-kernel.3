Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58874C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZLeOpcK8d38XmjkQqkUC1h4vgXICE4C9Nm+SuuEi6g=; b=uJfkZT7RLqPUDn+UhQ6fOMPiQI
	hPlU1IITr57KNJ5275ouC3oES6MsAMjl1H8WAOe6+6yq/+0anY58ZBg1cKyqrq/I3lIxq5H3Jpv7J
	nYozzytH6KP9sNmzLi7vMuisfItTfi/MWj9UhlTxcZLw8o2y9YMEU7h75kwnk66YEUbcL7JSmObO2
	FJoou+luu3ewu/r1sMPhRAneQSFfiJdY5m347mnvdNngv8mPKpeIP26D9xMHW9/u8O+2/h9A+tC7n
	Da7ohixVHYzYvyldVvK4CfKwR9M3LrBqw6A7m6p3YI+sF9gs3xT/B1EM/VvdhDrl4q+UUIPxtTh2d
	QiOGPjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5hDV-00000001ZXo-41tX;
	Sun, 13 Sep 2026 10:13:45 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5hDR-00000001ZWX-07iP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 10:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789294420; bh=yZLeOpcK8d38XmjkQqkUC1h4vgXICE4C9Nm+SuuEi6g=;
 b=F39YZTsdEL6e8IpKPmO6puy5UAKRLoZ+PPFnVyeEvCeVmMUUJsE5cusuDBPZIitAxDd+KPIHS
 M+EUxQmz2aM6vQ5Ind6bK1jzu3MrqSFldTPbEu3fNLz8Ep9/FqF3mnmLjcNmgnjnWINRT0UgpAu
 TddoCvQhAfLNa9P/zD5/inA=
X-Forward-Email-ID: 6aa677525d6bf3657bd82a58
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
Date: Sun, 13 Sep 2026 11:13:30 +0100
Message-ID: <20260913101331.198835-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913101331.198835-1-tturner@lineageos.org>
References: <20260913101331.198835-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_031341_140167_66292C62 
X-CRM114-Status: UNSURE (   8.42  )
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

Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
based on the Samsung Exynos850 SoC.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 753b3ba1b607..b4593319ee3b 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -233,6 +233,7 @@ properties:
         items:
           - enum:
               - winlink,e850-96                 # WinLink E850-96
+              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
           - const: samsung,exynos850
 
       - description: Exynos8895 based boards
-- 
2.47.3


