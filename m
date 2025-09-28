Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01890CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kv0g4M2itICCuzt+jdEKGTgPplonN2qqolJz3kJcvkg=; b=QAT/rWCDbAqf/l
	035WlOgjD93pi3Cz5V55m2f+Y62A5XCj5SI2sz0BckvK01ucKa34c9A413wrvBEP24IK9caDv0Dxg
	fA9LP4fyLej3m8/TuOJDUnv2GyaEAXmx+aCJWANn5aX177Is7tC+cf+QedfRktgE1TiMll/mgE4NG
	q6OwxLHBCPqelG0cx7efRZQ9ith67Cxe8kxJDMmvvXokGy5m9dUc6PgKuHoReIbseRwQq84npHbSR
	4DxxdcETcf1jJFjcLsk9SYuo9U3v1XpkLpFCtrk+AHH0wO24n3cHgOIKopfRoBnoSAwESTOvBPQbb
	LfDmK8rEYLTV+iCODpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVR-0000000Geaq-2RMC;
	Sun, 28 Sep 2025 16:44:14 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVO-0000000GeXs-1XS3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:12 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5422A25F6E;
	Sun, 28 Sep 2025 18:44:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M00hG7zezvcS; Sun, 28 Sep 2025 18:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077844; bh=e1OfZxzNPwwiaonitVzU1HpgjvpPK0JLXAurui8x2y8=;
	h=From:Subject:Date:To:Cc;
	b=R9CxUyk4oNQGd+cCwaYMXAsK12ipVbgx3Pc0ULbRephzT0/D6woVGD40hn60Urj4x
	 nF6BEjas8BqUyZ7Vx8IrYCE8ivGb+x6VpjqqhqFlpNCupjm7SiajICkBLHtDFCVQkb
	 Ue6ml2Pz0F9HoFcFA/M6y7RQ/qJtF8tHbXvtIJWC1VivtjAAwTkXSS6oLFMGm40PVC
	 Vvh87cDzvW58XjXf8UgIzkEs3C1Ux8LwEC5I60nuo9dxD0f84eFohSsHhRYqP0aR8e
	 ba8llvGWyhXsMt8ID5LSexTGU6t2oGkGeq92t1Uh/prtoVAMw5r828dYx+gQcTPXCy
	 48+yLauXmLIQQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/7] Another set of exynos7870 devicetree fixes
Date: Sun, 28 Sep 2025 22:13:51 +0530
Message-Id: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdl2WgC/x3LMQqAMAxA0atIZgOxqBWvIg5qU81SpRFRine3O
 D4+P4FyFFboiwSRL1HZQ0ZVFrBsU1gZxWWDIdNQZwj5fsKutrOE7kQvNyvO9eTI2IV9ayGfR+Q
 /5HEY3/cDQXTU+2UAAAA=
X-Change-ID: 20250820-exynos7870-dt-fixes-b4ad027cef67
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1335;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=e1OfZxzNPwwiaonitVzU1HpgjvpPK0JLXAurui8x2y8=;
 b=vOleMytmxLFyYirZlybtdfiVdvBrDujdeWsiASK9ZWdUvTF0FHgH+d4OwC8htEfp34J9a6qBt
 l5vb8AlS5mWA7O2QcrNTD4M4M3oOwUaypzJn8JStjcSmft1qPinF5wA
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094410_844982_0392E135 
X-CRM114-Status: UNSURE (   5.19  )
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

Applying this patchset will introduce the following:
* All ${x}-names properties will now follow the corresponding ${x}
  properties.
* bus-width of mmc0 node of all exynos7870 devices will be explicitly
  defined.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (7):
      arm64: dts: exynos7870: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-a2corelte: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-j6lte: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-on7xelte: relocate ${x}-names property after ${x}
      arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node

 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  21 ++--
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  21 ++--
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  21 ++--
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 ++++++++++-----------
 4 files changed, 87 insertions(+), 84 deletions(-)
---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250820-exynos7870-dt-fixes-b4ad027cef67

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


