Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5C2C54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkA5bD0XlpvaIYFOt5cNeDmC1WybOZvDlF7XAEDOJaU=; b=rMtpbz3CwO3KFRRbXmezKCXkfF
	fOUYQElA5E6jRc5RmiONC1sWgBbr76uNCFKG8RYTLmalnd4YRFfDpjYf7VIE8A5kFddgci7dXkLPP
	ir6GuHOpWPvGJmt88R0ar+km4oeel/p9E/t5p68D427TlP+NTbVXWh9hy9+XxEddKrcbd3K2CvenY
	GMVaH5HLxtyvXJ/FO9gHFcv/I8l1iCqTuID34j6SDkUwHOrlfpkwuPtQtFFEG4x9wGxPndYr1vdIl
	M4SVVTQYpbK8FQ+hSMxgAnUEUHLgkbV+DHYHX7W/Jt1eyRA6aljbkY3lQUVqQ3zyMyZ8h5CrcWLyn
	CMUyZ+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS7s-00000003uDI-1hIB;
	Fri, 23 May 2025 13:07:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRsc-00000003rL7-0b2h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 396964AA96;
	Fri, 23 May 2025 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFEA6C4CEF7;
	Fri, 23 May 2025 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004725;
	bh=T+XZ9Epqso4lamigfMKzOTzFq0QKydck3UHjfbzbL0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jJH1G3k6M1gcIKBZOws6ZG5yVJrbrhYYjas6Q85v45SzQ5sfzx5Fl8ieln9YbfULK
	 uEXncf+eo8Di3iSpOJfYdZGDeo+7zdU0X6FyKs2VndJDOuV4nXdh9vOi0mveJTrFhq
	 n6EsCwhnSx9pgLdfRNPBj839047xLtsZ83eZfXS+lgZQTjuB861qEUctlCg+TNR0CT
	 zTT1nd5178kGMq/F4b6x3EX0OZQFyvUTxnD34ElckHnRWtF22Hb/jUZnuhrdVJ4m0L
	 9+tolsXX9B6LvWRu7x2N+RGEA6uxXsKVmwdFJ2QmEUgrEgRS5mFmw+uUJQvOoawgvD
	 j2KJHzUBGsnrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3211C54F2E;
	Fri, 23 May 2025 12:52:04 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Fri, 23 May 2025 14:51:47 +0200
Subject: [PATCH v4 4/5] arm64: defconfig: enable Maxim max1720x driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-gs101_max77759_fg-v4-4-b49904e35a34@uclouvain.be>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748004727; l=716;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=yx0SuiaIbKa84b0oToxMe11+jBYaoqB6+UxBMxg24/I=;
 b=+HwIBAXAC8BjutDhA/xCZ5g4yO5J7kIk9EGyWOsMV/nIFWSshktuIfocSezpS24C1WhKv6M4N
 9TTFwiM+o1GBEtE/F+qBfAK56/7rMgHzMn80HZGV23/UnCEX0cHfY+t
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_055206_211723_C6C9B750 
X-CRM114-Status: UNSURE (   8.52  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Enable the Maxim MAX1720x as it is used by the gs101-oriole
(Google Pixel 6) board.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..4feaebca340b1bc613c4f4ea9f1ff3b6686b092d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -687,6 +687,7 @@ CONFIG_BATTERY_QCOM_BATTMGR=m
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
 CONFIG_BATTERY_MAX17042=m
+CONFIG_BATTERY_MAX1720X=m
 CONFIG_CHARGER_MT6360=m
 CONFIG_CHARGER_BQ25890=m
 CONFIG_CHARGER_BQ25980=m

-- 
2.49.0



