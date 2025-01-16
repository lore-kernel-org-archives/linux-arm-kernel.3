Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07E6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EeLUwm6ssNt2rR98SDPDmMx+ezxDZx2W4wXzkpHdz60=; b=C7a8WaH/cpSi2N
	WUpbNbDyR7zYXpeL0ThmsiAYzIqMsJbWF1CSqxiTIVtB8uRx49pNWnBG+uxjF4ykpDcJ5XIV85LGo
	QyF4VGpD0HliVqs/Dex/H80ukxCRHcFptNeEJ0lsViUD9GtISSw/x5+qjuRpnvsufRoRZ1Vl/ARLh
	THxDnxrsiZS8GKYvah6+lP36u3F2x1y7zirc4M2ves4wMeM8L7mKYre9Aqzxunu/71SoMsFbC3I4O
	X/Lwz5srBbkyjxRSoiq1XnLSjxhflscio5M4ggWYoa9rLbCRGm+Ns1LTIRAg1YpniAnJLkFNqC6Ig
	IQZwLGw6NGpiPrJIRuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRE1-0000000FF8B-12cc;
	Thu, 16 Jan 2025 14:52:01 +0000
Received: from smtp-190a.mail.infomaniak.ch ([2001:1600:4:17::190a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRAA-0000000FDsA-18na
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:48:04 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YYm1j07dDz91y;
	Thu, 16 Jan 2025 15:47:53 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YYm1h1Vhdzbd9;
	Thu, 16 Jan 2025 15:47:52 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Date: Thu, 16 Jan 2025 15:47:09 +0100
Message-Id: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0biWcC/3WMOw6DMBAFr4K2zka2hYCkyj0QhT9r7BQQrYkVh
 Hz3OPQpZ57eHJCIIyW4Nwcw5ZjiulRQlwZs0MtMGF1lUEK1UokOX1yV3fCp57dmNDfhtScajBu
 gnurs4+cMjlPlENO28n72s/zZv6ksUWLvu04Y15pe2IcNxLxfHcFUSvkC+Q2A5qwAAAA=
X-Change-ID: 20241206-pre-ict-jaguar-b90fafee8bd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_064802_479360_E33135B1 
X-CRM114-Status: GOOD (  12.49  )
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

This adds minimal support for the Pre-ICT tester adapter for RK3588
Jaguar.
GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
rails and can only be used as input and their bias are important to be
able to properly detect soldering issues.

Additionally, this adds build-time overlay application tests for (some)
Rockchip overlays to try to avoid future regressions.

Notably, the Device Trees from Wolfvision PF5 aren't migrated (but
should) as I do not own the device and couldn't figure out from the
introducing commit logs what the possible valid combinations are.
+Cc Michael Riesch for awareness

I'm wondering if we shouldn't backport patches 1 and 2 to stable? In
which case, it would make sense to try to have the Wolfvision PF5
overlay tests merged before the addition of the Pre-ICT tester adapter
support for RK3588 Jaguar as that one won't be backported to stable and
backporting the Wolfvision overlay test would incur an unnecessary
(though not difficult) git conflict to resolve.

I also do not know what kind of tests we should have when overlay
combinations are possible (let's say there are A, B and C overlays that
can all be applied, should we have base + A, base + B, base + C,
base + A + B, base + A + C, base + B + C and base + A + B + C tests?
maybe even base + B + A, base + C + B, base A + C + B, base + B + A + C,
base + B + C + A, base + C + B + A and base + C + A + B tests?).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- add overlay application tests for Edgeble NCM6A WiFi and Rock 5B PCIe
  Endpoint+SNRS
- add overlay application test for RK3588 Jaguar + Pre-ICT tester
  adapter,
- Link to v1: https://lore.kernel.org/r/20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de

---
Quentin Schulz (3):
      arm64: dts: rockchip: add overlay test for Edgeble NCM6A
      arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |  14 +-
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 182 insertions(+), 3 deletions(-)
---
base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
change-id: 20241206-pre-ict-jaguar-b90fafee8bd8

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


