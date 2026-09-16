Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8830AC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WX0aF21R2mP7RGx/+rzffx7XjP8BJ0d9+NlEMIeB3pc=; b=abpsSW3mXlMVWzEMSRHFVVS3Fi
	A7SR5WpWTLOenHzrN5fQf6KEUvJCkUkCKHh+Hd+tWo/mA7UK6e4HOYT2tTNCvslcft1U08EOS91Ij
	90iYwXQ9n8aTEot+no2az255P+KZvdh2/5cUr8xpShqxAq+Q2tgHzgkWVCFdjQ724FF0amunIXv5a
	isEFnrxhYrs3HxTzTFsigkZ6HSA03lxy2K8IAnz3BLMWI/2uXgwjP21J8yVZZaXlUyAWeUY+xlK1U
	1zCX56AHBEK0fxk5llm+3m26r6lW9o/RVuwlJ42qaAvSKxVJ2gXoeWhHg3lCz5uKv/rfSa39CFfeP
	h1NqjUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wfK-0000000A6kn-3XJQ;
	Wed, 16 Sep 2026 20:55:38 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wfI-0000000A6jo-1VvB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1789592134;
 bh=WX0aF21R2mP7RGx/+rzffx7XjP8BJ0d9+NlEMIeB3pc=;
 b=XJ/MvKGFCnKXJ+5lA8gHx5lPj1VKU2PYM6519CWP1QJlIl4uT/gMBYpoNmHUL4g2i6oGXQJCc
 i8JqquWpBL3Jed96ndEiV3Pb8YXnl7j2WJF6SX8QegnrJUNTtN4+RTNgr2aoLvKuY94c3BkZfbx
 f7nvgpkCln+dbTx24c3Hj7w=
X-Forward-Email-ID: 6aab024007c281602cddbec7
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzk@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	semen.protsenko@linaro.org,
	alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add Samsung Galaxy A21s support
Date: Wed, 16 Sep 2026 21:55:20 +0100
Message-ID: <20260916205522.159393-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_135536_408076_E5730F54 
X-CRM114-Status: GOOD (  11.60  )
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

Hi all,

This is a small patch series which adds support to the Samsung Galaxy
A21s. This device is part of the Exynos850 SoC and its device tree is
very loosely based on the e850-95 one.

Thomas Turner (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
    (SM-A217F)
  arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
    (SM-A217F)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 200 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 4 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

-- 
2.47.3


