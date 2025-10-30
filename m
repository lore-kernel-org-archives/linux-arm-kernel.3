Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A1ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lFtM9W5IZANXUk3rqslmJvdpLsYf0BwN6/pXxkiNynI=; b=ml3vTjrhdhncM9
	XPkdD2MWlXZx+/3A5WVoN3Qz+UzwaCf9FpjFJP0Y4n8UxroZ6rsLkZq2ZmReHj+7X5lVLwr+XatoB
	4gO/BelX/UBR4QCcLicWyIW3xPiFwBGBw8dpF02Gk+GOo9wtr7lgkGg9D7y4Q60yII0uXXC5ZnpxI
	haNkb1wjzrVErs4izK4HdQQzAoP+ct1IoX0jIJFrrkGQkmbEoYl/T12LBr1cquLsVnldiL4AONe6Q
	ZnZQHz9HCJkdn01s9GekytnZGvXeEQlA8UC6kEl7+Qr+bHy3OVNv6YAPo8nQgw8kZ/3FyrUxN7Wdt
	JW5sIgaLCYcnxkO/6U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCO-00000004ezu-1OVO;
	Thu, 30 Oct 2025 19:20:40 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYCK-00000004ezH-22bv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:20:39 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1808B25EA8;
	Thu, 30 Oct 2025 20:20:31 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_NXAww80c-F; Thu, 30 Oct 2025 20:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852030; bh=IYJOq+ujqd+8XfRFQ0ewJxumqLNJx+CR3RO7H11Z2vs=;
	h=From:Subject:Date:To:Cc;
	b=j7ZIfUUWXLaJPjbZzcI6PPj19nKODpBlvokRYps6Tcdy4Gh0BBnSKqW2WFcfFJ55V
	 VPbzzENQ7uFINwnG9tdibMNjV0y5EwCN0U7iMdMb3FqGsxbYoYAh4XqHZd3GhVErEz
	 CfPSq8lzQrikjUCihVHHeosOSqqCKH5y5+eJU/sSFcP9KQOTrNGGQd8HyTmZnmABmN
	 pOW+aP/tSyRWrek50zRYmge1owhJCk5Abl6JUpkJfy1K3GL4w25KAKz9KBHKdbj/qR
	 9kfY+eS0XEkpQm4kxR6yud05+4wcdL1vfA2/kj0xleAyh6aCUlc+2tiVX3oR6n9s99
	 YzcNaoBStEzrw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/5] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
Date: Fri, 31 Oct 2025 00:50:14 +0530
Message-Id: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG66A2kC/23NTQ6CMBCG4auYrq0ZpsK0rryHcdE/sAupaQmBG
 O5u1YUaWb5fMs/cWfYp+MwOmztLfgw5xL7Efrth9qL7zvPgSjMErKFGwf009zGTJOAuXbkbMpd
 krTYkKqMVK4e35NswvdDTufQl5CGm+fVjrJ7rm2sqXOPGigOX0gKR0m1jzdGFnGIcdjF17AmO+
 IUgrSJYELfXtUIgocD9I+KDKJSriCiIMeSkrwlkA7/IsiwP/HP+lUABAAA=
X-Change-ID: 20250523-exynos7870-drm-dts-87ccab731ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=3984;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=IYJOq+ujqd+8XfRFQ0ewJxumqLNJx+CR3RO7H11Z2vs=;
 b=QXdiWlefBGv5P9zjTJlBxwrKWK/TfGPMG46QTZYDb1x59FEHN+0drQqjxsASVZoQwByKzct9R
 x+Z6vv4RdynDUSr1dvqinf3+cBxPVUbpCLpdv+5EXZTFS69cYcH6J3p
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122037_097202_80459383 
X-CRM114-Status: GOOD (  12.65  )
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

Exynos7870 has a IP subsystem in its architecture dedicated to display
management. Notably, this block includes the Display Enhancement
Controller (DECON), and the DSI Master (DSIM).

The following series and its sub-series implement all components for a
functioning display pipeline. All vital information which helped shaping
up the patches have been retrieved from Exynos7870 vendor kernel sources
as provided by Samsung.

Testing has been done on all three devices available upstream, i.e.
Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
(samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). Regrettably,
I've only been able to test the functionality on video mode, as none of
the devices have panels working in command mode.

This series implements changes in the SoC subsystem, which includes
devicetree additions. It depends on all sub-series listed below:
(Legend: [R]eviewed, [A]ccepted)

exynos-sysmmu-resv-regions A https://lore.kernel.org/r/20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org
exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
exynos7870-mipi-phy-fix    A https://lore.kernel.org/r/20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org
exynos7870-dsim            A https://lore.kernel.org/r/20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org
exynosdrm-decon            A https://lore.kernel.org/r/20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org
panel-samsung-s6e8aa5x01   A https://lore.kernel.org/r/20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org
panel-synaptics-tddi       A https://lore.kernel.org/r/20251009-panel-synaptics-tddi-v5-0-59390997644e@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v4:
- dropped applied [v3 1/6]
- replaced exynos7-pmu with exynos7870-pmu compatible to the list
  allowing a MIPI PHY subnode (krzk)
- Link to v3: https://lore.kernel.org/r/20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org

Changes in v3:
- fixed minor issues with devicetree in regards to compliance
- added memory-region to framebuffer region for decon device
- added related patchset to list: exynos-sysmmu-resv-regions
- replaced exynos7870-pmu with exynos7-pmu compatible to the list
  allowing a MIPI PHY subnode (krzk)
- updated compatible string and dt node for j6lte's panel
- reorder properties: ${x}, followed by ${x}-names (krzk)
- Link to v2: https://lore.kernel.org/r/20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org

Changes in v2:
- modified compatible hierarchy to use non-deprecated syntax (krzk)
- fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] (krzk)
- removed simplefb nodes instead of disabling it (krzk)
- added dt-bindings patch to allow mipi-phy node under PMU
- changed clock names of dsim node
- Link to v1: https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org

---
Kaustabh Chakraborty (5):
      dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 +++++++++++----
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 ++++++----
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 +++++++++++----
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 84 ++++++++++++++++++++++
 5 files changed, 195 insertions(+), 42 deletions(-)
---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20250523-exynos7870-drm-dts-87ccab731ba9

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


