Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D439FCF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pt4+H06TM6qgswv5vwD87h0lsny4oyy5ArHsOSJGz3g=; b=d9yObeJ8bGeCMb
	FrlmaRfqdXGJxfKfQiMHv3n01RysmqAXfLlHl1ygGl2XgwKrsVlH/Gm6ibWjFbGLKqQkNYYyCaRdH
	l87abyLaOWN9wWxTClBnyPL2OXzntMnGrbyX8t6xii5TB8/hnvPl9A/72kKMWlOyeHke8921lTzH9
	LVBimYJjq3OIxcNJhchFeAKZsq7swMTES4t5Q6BFlRb0MUe76sdY/X0g36aGJoa5rl8OabPijlvPE
	kjzZt3xEX4OOFkXn/o+qpbtJSfnN+/UGFWqPjOtySCQlkwn09/SEBtdKvFjqSn1JCHKrsIestMXKB
	AlBpBigL8iec5xRK50xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2aj-00000006YMp-3U2y;
	Thu, 20 Nov 2025 11:12:45 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2ah-00000006YMA-1sk9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:12:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 20 Nov
 2025 19:12:34 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 20 Nov 2025 19:12:34 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: [PATCH v3 0/2] Add "aspeed,ast2700-pwm-tach" compatible string
Date: Thu, 20 Nov 2025 19:12:30 +0800
Message-ID: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ73HmkC/02MSw6DIBQAr2LeuhigWrSr3qNpDOKzvESEAP3Fe
 PeSrrqazGJmg4SRMMG52iDikxL5tcjxUIGxer0jo6k4SC5bIUTHHiHliNoN4eWGrI1lrZpHrVR
 vsGugdCHiTO/f83orPkfvWLYl+jvxhrcFspYn1fNOMcFGWpbPkJOmi04BccpobG28g33/AtX2n
 GioAAAA
X-Change-ID: 20251118-upstream_pwm_tach-57fba779ce84
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763637154; l=1125;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=7YzUe3MK3YytK0uTkt7q+giwkUEjWEmLwPZCbjl4/JI=;
 b=Ry5JJo5yb1rgp/9y2Gm2lB+FTnU50rMEHcFxnSx6NUIjuhSdtP3/KQCXVtUgQ4XlFp6bbjYdd
 K2HZHLO2OsGBLd0Juo3O4Up1/SkTBXOLJicdrC3q/W5x03+b5ouKuTV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_031243_516679_0188175B 
X-CRM114-Status: UNSURE (   8.49  )
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

Adds the "aspeed,ast2700-pwm-tach" compatible string, which provides
fallback support for the previous version of the hardware design, to
the PWM/TACH dt-binding and driver.

---
Changes in v3:
- Drop the comments
- Link to v2: https://lore.kernel.org/r/20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com

Changes in v2:
- Reworked the binding to use a two-level compatible list with
  "aspeed,ast2600-pwm-tach" as the fallback.
- Link to v1: https://lore.kernel.org/r/20251104055112.2679087-1-billy_tsai@aspeedtech.com

---

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

---
Billy Tsai (2):
      dt-bindings: hwmon: Add AST2700 compatible
      hwmon: (aspeed-g6-pwm-tach): Add AST2700 compatible string

 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml | 7 +++++--
 drivers/hwmon/aspeed-g6-pwm-tach.c                              | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251118-upstream_pwm_tach-57fba779ce84

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


