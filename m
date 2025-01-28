Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4913C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HveFmXR/A9BMslJD4oOv9yisswDFwrDeEZeHvWMl81Q=; b=a16S4/fkmkzZ6N
	ET7wnfQKHXHbbjm2p4D2YaW3XHHy2z1HxQpFiYk9qMUbOZwqtvfDEMtB8u6U4ZgKxZK9IUHO6t920
	qhnU78yIqEXo8ABhJ7ukBg6CofjCb2Y/5digriq+btE+0s9aLWe5SMaRrdfdI//TdjLiGdBwQKNHF
	6fLg6DsyB4anUbkQ+F9VwBByhwIm5N3vz4Tej3R4npobo7uEfCZahXJgnEchBdfXJd62fFGSk09HB
	ZirxX1BijWNY6iM+N70G9RHxNsL2memhYl9MlVE6jJ5zKQ5B46o+6YDwy5v9YIWzYarAP/AG353Ir
	TXQ1pGSDgeQxPrhytTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tclI1-00000004vHc-1FcV;
	Tue, 28 Jan 2025 13:06:01 +0000
Received: from smtp-42ab.mail.infomaniak.ch ([2001:1600:7:10::42ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tclGf-00000004v3L-3uJ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 13:04:39 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yj58w6jZkzYZd;
	Tue, 28 Jan 2025 14:04:32 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yj58v4jkjzdbV;
	Tue, 28 Jan 2025 14:04:31 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v3 0/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Date: Tue, 28 Jan 2025 14:04:12 +0100
Message-Id: <20250128-pre-ict-jaguar-v3-0-7be2f09d390a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMzVmGcC/3WMOw7CMBAFr4Jcs2jX+VNxD0Th2OvEFAmyg0UU5
 e44kSgQopz3NLOIwN5xEOfDIjxHF9w4JMiOB6F7NXQMziQWEmVOEkt4+DTpCe6qeyoPbYNWWea
 6NbVIUrqte+3B6y1x78I0+nnvR9rWv6lIQFDZssTW5G2F+qJ79n4+GRZbKsqPXiDRry4BgYrKZ
 NQg5vZLX9f1DX5vCmHrAAAA
X-Change-ID: 20241206-pre-ict-jaguar-b90fafee8bd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_050438_098736_151018A5 
X-CRM114-Status: UNSURE (   9.42  )
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

This adds minimal support for the Pre-ICT tester adapter for RK3588
Jaguar.
GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
rails and can only be used as input and their bias are important to be
able to properly detect soldering issues.

Additionally, this adds build-time overlay application tests for all
Rockchip overlays to try to avoid future regressions.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v3:
- removed Fixes tag and intent to send to stable as this patch almost
  doubles the size of the main DTB. Let's not potentially break users of
  stable releases,
- added Wolfvision PF5 overlay tests, thanks Michael,
- added comment on how to add new overlays (via tests), and the side
  effects,
- grouped the overlay application test target with the definition of its
  dependencies (DTB + DTBO(s)),
- added trailers,
- Link to v2: https://lore.kernel.org/r/20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de

Changes in v2:
- add overlay application tests for Edgeble NCM6A WiFi and Rock 5B PCIe
  Endpoint+SNRS
- add overlay application test for RK3588 Jaguar + Pre-ICT tester
  adapter,
- Link to v1: https://lore.kernel.org/r/20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de

---
Quentin Schulz (4):
      arm64: dts: rockchip: add overlay test for Wolfvision PF5
      arm64: dts: rockchip: add overlay test for Edgeble NCM6A
      arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
      arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |  36 ++++-
 .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
 2 files changed, 202 insertions(+), 5 deletions(-)
---
base-commit: 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
change-id: 20241206-pre-ict-jaguar-b90fafee8bd8

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


