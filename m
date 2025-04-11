Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EFAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Hy/o3nG5Q0jilQ4tUZ6ieJrgo2oTBAgj+bIBIKbyKE=; b=RvaSP5FCwh+/Am
	HszgfRlPgFgcHHrh2V8bo4D2LkmiCJh++tjZNXZ61c+YTAPY8wxLwxUWkFh5hKpm8dj7AyWQtveYH
	eoxQAxp6272Q/A17OjheMfDgT1J4dc465vj+f5e2P8JmvSItvjEziTo0oplRlwnXpGsOphNh+NAYT
	Q/dwrrZZ1KbS0woIjk/Mhcpf4/Rd2wNedLM5xDWkw8DgaHokWoKi4+ZGv4S/t6dLe7iC3FHe+a2QB
	TCsaREam7WaYOb4xJQsD3i7m8Yih2upLs4L4zC6JJ96qjCFjdglS66GmxZYXloKS/FseBO9zHMJHv
	6wb56bM7KI9xMIcRSH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HXd-0000000EPcA-0au3;
	Fri, 11 Apr 2025 16:47:45 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HVm-0000000EPEb-24WS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:45:52 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A35B225F49;
	Fri, 11 Apr 2025 18:45:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvqhbX4tnDXa; Fri, 11 Apr 2025 18:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744389941; bh=V3sxT0qWZ/R8AKqPO0IIuyuOMKHgyM1WtuhpqaQCYEA=;
	h=From:Subject:Date:To:Cc;
	b=NAwYElFpo0iol0/zFsohXnhlAPzzFBZEmTZFfToU4i8W9UuCH1YYwHefvLtT5tJ+s
	 evjy7lZKmaCmbVZdKoo1xAU3X76MfsjOlqbDVQEnJPwNnObgnCGEnbkyFaZwdmCu06
	 QrhLlup+jYxNF3UkVMAZB2hSU30Gk0QufLcoTNAHCs/XskkWvVbQoMXl+QYkRgno3P
	 AoJ+22M3sPYjZMTt++IiKE5awT8aYSxnGytdkSBhyF/pMlWhSJ1yRKgKSE7fp4U5nq
	 26DxdrbTuNP41QR5uVoxjGdT3UPoyUQn+JmkE0JQPDNQVR7SB53HaSNMFRHaz5b/3u
	 PxwIVUJ82PHsw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v5 0/5] Add support for the Exynos7870 SoC, along with
 three devices
Date: Fri, 11 Apr 2025 22:15:26 +0530
Message-Id: <20250411-exynos7870-v5-0-6b319ae36c36@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZH+WcC/2XPTQ7CIBCG4asY1mIGhp/WlfcwLtoyKJtioCEa0
 7tLTYxtXH4kz5vhxTKlQJkddy+WqIQc4liH3u/YcOvGK/Hg6mYSpAYJgtPjOcZsGwscVKsbS6q
 3zrMK7ol8eHxi50vdt5CnmJ6fdhHL6zeD60wRHLjsjfPKmg49nFzIKcbpENOVLaEi11htsKxYG
 xQojCYPwz/GFRbtBmPFhI3yvREwdO4fqx/G7e+LWs5updZofdvLbovneX4D4tN85l0BAAA=
X-Change-ID: 20250201-exynos7870-049587e4b7df
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744389935; l=4583;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=V3sxT0qWZ/R8AKqPO0IIuyuOMKHgyM1WtuhpqaQCYEA=;
 b=o+VuDB2WheNDUMCGnoZ2gElnKolyJ2/lIWMiqlill+FlNKlquXCo55nvISPflRj0cTOuGaQkb
 c+ACMSG7PlLAZxrzpH4NDni4P4AsuXOIt2NAR9H+t6oK98rKddwnjCY
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_094551_082886_5ADB2D0D 
X-CRM114-Status: GOOD (  10.63  )
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

Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
announced in 2016. The chipset was found in several popular mid-range to
low-end Samsung phones, released within 2016 to 2019.

This patch series aims to add support for Exynos 7870, starting with the
most basic yet essential components such as CPU, GPU, clock controllers,
PMIC, pin controllers, etc.

Moreover, the series also adds support for three Exynos 7870 devices via
devicetree. The devices are:
 * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
 * Samsung Galaxy J6		- released 2018, codename j6lte
 * Samsung Galaxy A2 Core	- released 2019, codename a2corelte

Additional features implemented in this series include:
 * I2C	- touchscreen, IIO sensors, etc.
 * UART	- bluetooth and serial debugging
 * MMC	- eMMC, Wi-Fi SDIO, SDCard
 * USB	- micro-USB 2.0 interface

Build dependencies are in these sub-series:
 * pmu-clocks		A https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/

Other related sub-series:
 * gpu			A https://lore.kernel.org/all/20250318-exynos7870-gpu-v1-1-084863f28b5c@disroot.org/
 * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
 * mmc			A https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
 * pinctrl	  	A https://lore.kernel.org/all/20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org/
 * pmic-regulators	A https://lore.kernel.org/all/20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org/
 * uart			A https://lore.kernel.org/all/20250318-exynos7870-uart-v2-1-b9dcf145ae87@disroot.org/
 * usb			A https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org/
 * usbphy		A https://lore.kernel.org/all/20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org/
(Legend: [R]eviewed, [A]pplied)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v5:
- Drop the exynos7870-bootmode patchset for now.
- Add card-detect-delay and cd-broken properties in sd-mmc nodes.
- Drop the following applied patches:
  [v4 1/7] dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
  [v4 3/7] soc: samsung: exynos-chipid: add support for exynos7870
- Link to v4: https://lore.kernel.org/r/20250301-exynos7870-v4-0-2925537f9b2a@disroot.org

Changes in v4:
- Drop merged [PATCH v3 1/7].
- Explicitly mention sub-series having build dependencies.
- Include the following patch from the pmu-clocks series:
  - dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
- Adjust clock header file name to match changes in pmu-clocks.
- Change regulator node names to match changes in pmic-regulators.
- Remove non-removable flag for the SDCard's mmc node.
- Link to v3: https://lore.kernel.org/r/20250219-exynos7870-v3-0-e384fb610cad@disroot.org

Changes in v3:
- Added patches from https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
- Fix devicetree formatting according to the devicetree style guide.
- Take over ownership of patches by the co-author, upon their request.
- Link to v2: https://lore.kernel.org/r/20250204-exynos7870-v2-0-56313165ef0c@disroot.org

Changes in v2:
- Redo a few commit descriptions.
- Split patchsets into multiple sub-series, subsystem-wise.
- Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org

---
Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  618 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  666 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  713 ++++++++++++++
 7 files changed, 3660 insertions(+)
---
base-commit: 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


