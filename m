Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7317CE73156
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2gDNomUNwmnJl6VxmmkxpFGGqk898OHTio0Y7SMPa9o=; b=XlxCunr+N93C6m
	fH9AbcMYDthlc1D/ckf2t42I7f2FgPLX78gCf1HzdFD7g22YEvwtr6vXA4DLUmioG/yi4QEeBpbA7
	ng+zwBQRWi9YV+miEsm5cMh/kAnA/DZJ7hPuloNCCRJav0uW93QDRuaywd+udRGSl8QMYMgQkH+KD
	8h+tcY0G7DUNzWSKE2e4Dnqm5VqLfjOXphpDyoVQReQ51BZFLfWgo0VrPgk7H+2zkEf4yOplXjJyF
	sDaBRyLPbsbUEgzbPeulp1Js6kABE1zsvpLnfLffNhsV357QCUlhj2aKdaviu57bkp1E/3yKsNp+J
	+ygdNAVa/5E4iH33g2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr9q-00000004p1M-2ID2;
	Mon, 02 Feb 2026 10:27:50 +0000
Received: from smtp-8fa9.mail.infomaniak.ch ([2001:1600:7:10::8fa9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr9m-00000004oxe-2sCl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:27:49 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f4N986l7Yz8n0;
	Mon,  2 Feb 2026 11:27:40 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f4N98059bz5sw;
	Mon,  2 Feb 2026 11:27:39 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: fix Ethernet PHY on Theobroma
 PX30 devices
Date: Mon, 02 Feb 2026 11:27:24 +0100
Message-Id: <20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TnANLPpKdJBacy8mGmGIf0+6D
 MxhpkKmxJRhERUSPZz5Cl1wELB7G06SfHQHrbRROCoZSwfdXkb/SjMZZ3FGQjTQk5jIcfl369b
 aB+vsMXheAAAA
X-Change-ID: 20260130-px30-eth-phy-676fa181e116
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022746_876163_C4649B1D 
X-CRM114-Status: GOOD (  12.09  )
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

This removes the reliance on the bootloader setting up the Ethernet PHY
for the Linux kernel to be able to use Ethernet.

This is due to the HW default of the PHY reset line being active and the
MDIO auto-detection mechanism not controlling a PHY's reset line such
that we need to hardcode the PHY ID in the compatible property for it to
be usable by the kernel, regardless of what the bootloader is doing.

We only ever had one PHY (DP83825) for both devices, so it's fine to
hardcode this way.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Cobra
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Ringneck

 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi    | 2 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 4d310797262f0ddf129e76c2aad2b950adaf1fda
change-id: 20260130-px30-eth-phy-676fa181e116

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


