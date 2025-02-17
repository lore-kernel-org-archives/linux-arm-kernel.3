Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13533C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2CJ2eL8NgXBAF2WEIqt6vNhbLosEkokyOF4KYhgw6o=; b=HpFvjAqzu3c9tk
	od1aQhUQNL0SvT3fVnxljXORUSHkwGuFQUEfe8AOAYy27tyaM2qzy3LSO64YfVA2BsMXDqIuFeI7Z
	8sGW10xs+tzrO4YgMw8CTKtCW5U3jwMuUO4gRL7Ll1MjqtJXgHZ6TaCYzTzxOaeyiZW6qYkSS10Gi
	16H/KMXfm2w5oelBXkCYn83ObWSDfuNIK+D6cC5loO3n6K/XWeSvnJz6OKTqGkA+BMwtOR6eI2/tr
	AGwkzDMgm+mKKHKDrBoaAdpGE06nGnXTQZXRc9WiEI2tlXVfE32v9ZJHBl9fnuRsMSszWhulQEKhC
	9tssFq3zDe6Zz0nDFzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8os-000000062dw-057a;
	Mon, 17 Feb 2025 21:38:26 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8jR-000000061VG-1X4G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 21:32:50 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=YLeO4iF3jLlJiCs8yTJaWttLqRAHhXkgkMLxU+TnRgqCp8KUjCs0TQ38YmD2h2Pl7w9OVOHJggMexqr0Pg2JAKuZ3aoa11IvfxIUiitUII4/uSytPZYwcgsMiZuXhTW39g8AcRwcMmDV7TU1xbKRX+oCd4RpJX9B7saVE0p4noXpYBJ50ly3MUAfRXnO0DHmUrDJvWuzTMeRdFfSfTR2MILbV69baiOPgK7gl5Jbuo/Y2T6i8s/tn/kClXbuWO29r5U7gdBgN6VNb9LkHBjtfssQ+6pz3QH4SQsRnfL1JB78gbpbRty8BKznHUYSGT7zWHcv7ce1vmUfe4O1k1c0nQ==; s=purelymail3; d=purelymail.com; v=1; bh=WqeFbzv30O7RaX+m3emlybcx2+Iz8b9iq7nsHwVXm3c=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 42194286;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 21:32:32 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/5] Add watchdog and USB nodes for the Exynos990 SoC
Date: Mon, 17 Feb 2025 22:32:02 +0100
Message-Id: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOqs2cC/yXMQQ5AMBBA0avIrE3SNoS6iligU2ZT0kGIuLuG5
 Ut+/g1CkUmgyW6IdLDwEhJ0nsE492EiZJcMRplSGV0hnVdYxFqFbsM/EfQ07H280A+jrguqVWE
 dpMUayfP57dvueV7fewLUbgAAAA==
X-Change-ID: 20250217-exynos990-dt-changes-febuary-fbc184e8049d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739827951; l=1901;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=WqeFbzv30O7RaX+m3emlybcx2+Iz8b9iq7nsHwVXm3c=;
 b=TIqcWcN/3cdywHBBFciP9hhZz+iljvZrBnGi/wNrATN9PZu+WWmjTtxO0upwL2m/0g0RdqYq4
 VCAkZfdA19sApd5ckbAR8naTrWqa+qbj2ITZto9w1hvsHGXwDRZEsPU
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133249_509662_F0FEA33F 
X-CRM114-Status: UNSURE (   9.61  )
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

Hi all!

This series adds the nodes to enable the watchdog and USB support for
the Exynos990 SoC.

The watchdog consists of two clusters (cl0 and cl2). Unsure why Samsung has
skipped cl1 on this SoC. Both are enabled and working - tested on a
device from the -x1s family.

The USB controller of this SoC supports full-speed, high-speed and
super-speed operation modes. Due to my inability to get any of my
Exynos990 devices to enumerate as super-speed (even under the vendor
kernels) only the UTMI+ setup is done - as such, only the high-speed
mode is enabled. Dummy regulators are used in place of PMIC provided
ones until we implement PMIC.

This series depends on the following series:
- Watchdog commit: https://lore.kernel.org/all/20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org
- USB commits:
	- https://lore.kernel.org/all/20250217-exynos990-bindings-usb3-v2-1-3b3f0809f4fb@mentallysanemainliners.org/
	- https://lore.kernel.org/all/20250214-exynos990-dwusb-v1-0-d68282c51ba8@mentallysanemainliners.org/

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (5):
      arm64: dts: exynos990: Enable watchdog timer
      arm64: dts: exynos990: Add USB nodes
      arm64: dts: exynos990-x1s-common: Enable USB
      arm64: dts: exynos990-c1s: Enable USB
      arm64: dts: exynos990-r8s: Enable USB

 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       | 16 +++++++
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 16 +++++++
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      | 16 +++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 55 ++++++++++++++++++++++
 4 files changed, 103 insertions(+)
---
base-commit: 783ef70f458b28640a63dda599ae8628c3c7aa2e
change-id: 20250217-exynos990-dt-changes-febuary-fbc184e8049d

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


