Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB19F327CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIVgKNfgffVMWOXygW28hZLiTs45qb7bepzWyDmIFWE=; b=AEc5w9KXJv0/wU
	A1QFqR/4x0gRwsfeX5VqWYVEwLlneqYRTMnhucxpPYjFyHNVbXXkAi0vabC6IIy3rPd6xx4iICFGv
	UoB5GBd8aYl7qe8KbRWbvie3KgCq5AiEe3Wiu2syiaPz+KFOHQViZ35lMxcU6OUG8t49exxVQB0gD
	nwPeuAGaMs5EcaCSixxKWCmi1NyC68vPNYGl3ABtLcFkyibX5zYe42SNsOTmed0n6goSBfZpp0pyp
	dHptqTP0XIAt6F93/z0vxRIfO1ki2pF1tBhYFNcrd62UwA0OLkSYwnTlI1Sv31ml+XAsmlcSOR8RG
	N1YeicFbzcIwE4HEFUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fj-00000008M5F-271p;
	Tue, 21 Apr 2026 09:45:35 +0000
Received: from smtp-42af.mail.infomaniak.ch ([84.16.66.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7fc-00000008Lz2-0sgR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:45:31 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g0HXL1FVbzZgZ;
	Tue, 21 Apr 2026 11:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776764721;
	bh=kIVgKNfgffVMWOXygW28hZLiTs45qb7bepzWyDmIFWE=;
	h=From:Subject:Date:To:Cc:From;
	b=JHJycwIXX42FlfTd+u4A59doxw/P/8wi7aixczLnYwx8rPbJEKMk/ee5UOgb/sfM+
	 HcRSNQebL02r9z6JsNllBFBpeBJyMq2AZ5ynFjou5Y9z4RaTM/lFkZiFj54HuEALDe
	 4Cza9BPIM13DNIE3MIK/nhcc9GaX2v9pZxGnh0dhX8+Z7KlqfqKKFao3WGRibTujCN
	 BX2C/BDJt7qsImvlfW48kUJQGIOiIOTyUpke7j7ecN9ybKR+VyCby6YH5V8M3gTUwP
	 57PLkL1Fb9m+mBUcmMGB+UNQxAXd95vcurSXc7KaeEiI/AvFxditWLZiQU41mM4jl+
	 bn95jv4y4u28g==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4g0HXH6wHbzZxF;
	Tue, 21 Apr 2026 11:45:19 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: fix Ethernet PHY on Theobroma
 PX30 devices
Date: Tue, 21 Apr 2026 11:45:04 +0200
Message-Id: <20260421-px30-eth-phy-v2-0-68c375b120fd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMOw7CMBAFrxJtjZHXgeVTcQ+UIiRr7Cax7MiKF
 fnuLKGiGWme9GaDxNFzgnuzQeTsk58nEXNoYHD99GblR3Ew2pDGVquwCnhxKrii6EK2xysyIoF
 cQmTr1z337MSdT8scy17P+F1/IcF/KKMSsS2dX0ynmzGPwXGM5TgydLXWD6P5EimoAAAA
X-Change-ID: 20260130-px30-eth-phy-676fa181e116
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_024528_699433_B6840072 
X-CRM114-Status: GOOD (  19.06  )
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

As discussed in v1[1][2], even though they suffer from the same
limitation, only the patch for Ringneck is targeted for stable releases.

Ethernet is currently broken if the bootloader is built without Ethernet
support for those two boards. Cobra is a product for which the software
stack can only be replaced or updated by Cherry. Ringneck is a SoM
supported since kernel 6.1, the user is likely going to write their own
bootloader support based on the motherboard they attach the SoM to. They
may disable Ethernet support in the bootloader if they don't need to
(e.g. to reduce the attack surface or have an easier time certifying a
 device when arguing with an audit company).

Ethernet-less bootloader was supported until commit e463625af7f9
("arm64: dts: rockchip: move reset to dedicated eth-phy node on
ringneck") for Ringneck. Because I do not control what our users have
made with Ringneck, and that it used to work before commit e463625af7f9,
the patch fixing the issue on Ringneck is a candidate for backporting to
stable.

Cobra never supported it due to its support in the kernel being added 
with this (unknown at the time) limitation. Moreover, Cherry controls
the whole software stack so this is already patched downstream whenever
required. Therefore, the patch fixing the issue on Cobra is not marked
as a candidate for backporting to stable (but if it ends up being
backported, it's fine as well).

[1] https://lore.kernel.org/linux-rockchip/38452338-6e65-47ad-a696-b90c02ac42f0@lunn.ch/
[2] https://lore.kernel.org/linux-rockchip/b2f12140-ee3d-45bc-864e-d51317c83b8d@cherry.de/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- removed Cc stable on Cobra's patch,
- Link to v1: https://patch.msgid.link/20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de

---
Quentin Schulz (2):
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Cobra
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Ringneck

 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi    | 2 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260130-px30-eth-phy-676fa181e116

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


