Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC278C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WcqpG+BYolhuyDeMZi6qI20BSLp3GYG0+vieo87EGmk=; b=d2waz0YNlRn+PHxzP+2TuQFPTl
	FCu8RtC2dqkaDs8yTQy5g8LdgLFh568b7wTQyEN+yzU9tWOtpOPRMZMh3oR6iDb6vZEUWYX+cqHm4
	YkdtakhORzxq9zrF3IME7mp37P3pnHraBQ48COH8+8E4x8EY40VSkz6VtvfVfR1qqKtPfwIV6O9hU
	BNwNMHoe/ZjY9wVk/LjiquyIC3zda2xwPi8CwD8xxy84FM/mwYIbYaO7vVix3s8yi0LuM8IrYoMyb
	znc0gBvOjy9Ub/J2ANKzt1XJVyIbdYVwBlOcM1TdR5r9K9czRgD2rbHfwwBifN06J99L97QoqpUpP
	KXEECiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk74A-00000005n8k-2oQv;
	Mon, 17 Feb 2025 19:46:06 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk72i-00000005msZ-0SCL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:44:37 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ocExaFjsgLFVQzh8ijKBYhiO9N1lKDnf3zFjEDFvKJwAYlJT8gGMCucPkiD/jb2oyZYBV9oLWOAwWuO8+mhv//oT1tq/MYqYNYjs6eov+EY5lGc6I7zuKbUKg4zXyyss3Y9ro4VsAoZ+ppbnUC5Cm33AydgVOI4kVMyHBIi1kn4P+YMQfJkH+j9NEWmdTBwedT+IqOfVEiG/Mib81I6Be3fdrzb1qvFGXXnwu0Zvur6Y5fePvzn6dsY78JtM/OEvNUokWGpV9w+Z/S9gMPwjeuSn6QhX+XZng5NwvyLyTh2ct0QegEl8giXyINQHwvBQqqQqaUmKV6qM2MkB17DAPw==; s=purelymail3; d=purelymail.com; v=1; bh=IgmrKZQ+U6jM19WQ1y4s62f1uaoWol9FnsSA1ZFXU+4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1112335277;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:44:15 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 20:44:04 +0100
Subject: [PATCH v2] dt-bindings: usb: samsung,exynos-dwc3 Add exynos990
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-bindings-usb3-v2-1-3b3f0809f4fb@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAIORs2cC/4WNQQqDMBBFryJZNyWJWk1XvUdxEXXUAZ1Ixooi3
 r2pF+jyPfjvH4IhILB4JocIsCKjpwjmlohmcNSDxDayMMrkyuhMwraTZ2uVrJFapJ7lh+tUPrp
 SdYW2mU4LEddzgA63q/yuIg/Iiw/7dbTqn/3fXLXUMoW8NYXRjS2b1wS0uHHc2RFMDmlEgsB3H
 3pRnef5BbmVk/LPAAAA
X-Change-ID: 20250214-exynos990-bindings-usb3-6f80f7194137
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739821453; l=1933;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=IgmrKZQ+U6jM19WQ1y4s62f1uaoWol9FnsSA1ZFXU+4=;
 b=B6t7KTHxA+iuFtJA+yAANoa5OJat58KmWVxgOUSKRZvxMNtbaoOTTAlv4dPWmlT5LWwh2Pu8k
 q6eEIZ+JUKrDuBKPF+X1xlb64anSsoZh8AOFx9Q0WEbW2fD/l12oaJy
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_114436_217847_9C5ECE1F 
X-CRM114-Status: UNSURE (   9.65  )
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

Add a compatible for the exynos990-dwusb3 node. It's compatible with the
exynos850 variant when using the highspeed mode.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
The Exynos990 SoC embeds a DWC3 USB3 DRD controller.

The controller's design is compatible with the Exynos850 design
for high-speed mode.

This patchset adds in the new exynos990-dwusb3 compatible.
---
Changes in v2:
- bindings: re-check, fix picking the dwusb3 compatible
- Link to v1: https://lore.kernel.org/r/20250214-exynos990-bindings-usb3-v1-1-3e5d2721c98c@mentallysanemainliners.org
---
 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml     | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99106f3b6201ab31d4d9e3fcc55627..f11e767a8abe1d2fb7faa6d6b5be09970c5c9b37 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - google,gs101-dwusb3
-      - samsung,exynos5250-dwusb3
-      - samsung,exynos5433-dwusb3
-      - samsung,exynos7-dwusb3
-      - samsung,exynos850-dwusb3
+    oneOf:
+      - enum:
+          - google,gs101-dwusb3
+          - samsung,exynos5250-dwusb3
+          - samsung,exynos5433-dwusb3
+          - samsung,exynos7-dwusb3
+          - samsung,exynos850-dwusb3
+      - items:
+          - const: samsung,exynos990-dwusb3
+          - const: samsung,exynos850-dwusb3
 
   '#address-cells':
     const: 1

---
base-commit: 5cbcf2652f4cd84eac21f5e88fe2a0baecc601fb
change-id: 20250214-exynos990-bindings-usb3-6f80f7194137

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


