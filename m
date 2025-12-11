Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD682D41D7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ENKBbaXbg2+BUWbgD1mFntBGL6FEZ8Zh/IUdJouMMHE=; b=tSGSZNjlaMmRrkTFoRLi8G8etK
	+9sgW1mmvQwzDLQp553CQoRisxonrhvQPj+6Wk5uKG4mOEup3iyAfF4Of+xXnkYC46SLtgcf/bDOg
	Mr3AOWj1nd537v2U6PZ2/5ySXYR1qDvSDegkksCCRNy9HB/ou9e7R6nmx4GJWycRnNB5GgS8KUyrQ
	ZR7e82Jlt+DTxu5f3Wl7gSoBZ99wSVowA0vHiOBr6wJPclE4Si2NeXQh0aLcrokKTCSN/+033Egs6
	1KJZ/DmBU2M51TleKuGLUPTxdw1BxvvXeKL+HCI9z0sCOWveoO7ATbiLcQlo65sURXysBRyv/ft7K
	8+0jz+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmVF-0000000HAjm-2l6Y;
	Thu, 11 Dec 2025 19:39:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmVD-0000000HAjM-2mcn;
	Thu, 11 Dec 2025 19:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04BA5443AC;
	Thu, 11 Dec 2025 19:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37ACC4CEF7;
	Thu, 11 Dec 2025 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765481942;
	bh=Xl69JDXYKkAoSKOBQC90OSMp2s2zRXEzwzcWdfo54LA=;
	h=From:To:Cc:Subject:Date:From;
	b=Mp+S2WszdjG6CT8Ev3tfBpEdcGkU3dIakM4u7BxVLc1bFl+3UuGyLHjfPxCEV/5xA
	 9SEuGxInGg8baIvD3S7MBr2Xh+DMRvEAzE41g2y6LUY4sca+0igZYkp4llbn6+fg7X
	 P8Sf/+n6K7nwrdvZYEnyr6CZ9tpV0VKpRJigkGzEoyl4Ix7UQ42fgL8NBeIiRes5Wz
	 n4QvbR+KDIwd0wcTTqh2mFSVHtGuo5uBQtB4QWSg6r57PgeZ7UhS3SitVKOob0Yfiw
	 qHJ5e3OwGnOHPfnOfkxlCTmngBO5Lbjs0Y6y90LnK/6tXD5FBYFgqAeF4sIHf0oe2I
	 HH+3mGPypf/GQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: broadcom: bcm2712: Drop rp1 overlay
Date: Thu, 11 Dec 2025 13:38:53 -0600
Message-ID: <20251211193854.1778221-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_113903_743834_7449728B 
X-CRM114-Status: GOOD (  12.18  )
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

It's a requirement that DT overlays be applied at build time in order to
validate them as overlays are not validated on their own, but the
rp1.dtbo is not applied to anything. The rp1.dtso overlay doesn't work
on its own as there are additional settings needed as seen in
bcm2712-rpi-5-b.dts. In addition, the 'rp1_nexus' node is applied to the
wrong place in the DT as it should be under a PCIe root port rather than
the host bridge. There's also a duplicate overlay in drivers/misc/rp1/.

For these reasons, just drop the overlay to fix the warning until all
these issues can be fixed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
The missing applying of rp1.dtbo is now a warning in v6.19-rc1. This
should be sent to Linus ASAP.

v2:
 - Drop the overlay instead of trying to rework. The addition of
   ethernet0 alias complicates that.
---
 arch/arm64/boot/dts/broadcom/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 83d45afc6588..031875a277d7 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,8 +14,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb \
-			      rp1.dtbo
+			      bcm2837-rpi-zero-2-w.dtb
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
-- 
2.51.0


