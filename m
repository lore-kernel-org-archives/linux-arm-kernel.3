Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AE2FB5EAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IOz1LeEwHLjcPSJYdWgY3GSPhYy9olDEozsEtHKrbpI=; b=CEEh45PkP7+R0KNUlcU/GClzVD
	TmwAG1dH3XiqQRV8NhCN9EJUEjmCA/ifLH4pJFazkyg1/biGycXIrq8rHSd9nfVCU94u3WJn6H0Jw
	ecaU/h00T2ur7R00IU4UIkN6G3gXkOGCKLjMJ2nc5bdMSMUWQMbSGHu9sDMoTIS0T+ppoMGq80dgs
	+8vscpqHiamG1HLoU3EMjCqVEaABuOYqbNWMngHF7Og7fEF02FWRihDen03wyvUo227jrOTKQs6hF
	7MIVw11tuOBD/lItkk4dA8RvZd5rVuNIb8O/mHzb0R0fOD07OAwLhnaCTWtz+SFbXYRu6CJJHJY5f
	ga0uOncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Va8-00000006dMC-2N6b;
	Tue, 17 Mar 2026 14:39:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Va5-00000006dLf-23ZV;
	Tue, 17 Mar 2026 14:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773758375;
	bh=Af4KFyu9G462PBzFPcUbHdbzV8CZObDoeMRMMguLwig=;
	h=From:Date:Subject:To:Cc:From;
	b=oLBSxm5zgGhreREyqEyUzYn869Xp060RkmQkC7FaFgd6fIGSuqiYIrCUc/HVHQLS5
	 iXS3FsB8jBciScQaaR3SM6COLva3lEnWOxVbHm7y9xbcOtqlry2Ks6AbZoUs8O87eP
	 u+BZQCCqTcdFkl6EjCTKY3tNg1Wl4kKiRENFim4LKanN2Xs1WRs5TxOO050jBSLO/f
	 35j7MAfRF1EMJ+p14juEBxfDKTjbPesxUfmqYFfujmHKlFfMBb0gslxf1U2oJftQXt
	 10n5G5OWfJoGhzEN9/zQI0ijVV8BYSuZL1FoO7AahiL+2ywvXK0T/LJ8q5FMR2Icsx
	 jikZnVLB586EA==
Received: from jupiter.universe (dyndsl-091-248-085-025.ewe-ip-backbone.de [91.248.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F21E917E026C;
	Tue, 17 Mar 2026 15:39:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A2DAF48002A; Tue, 17 Mar 2026 15:39:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 17 Mar 2026 15:39:30 +0100
Subject: [PATCH] arm64: dts: rockchip: add SD/eMMC aliases for ArmSom Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-sige5-mmc-aliases-v1-1-ee93a1571802@collabora.com>
X-B4-Tracking: v=1; b=H4sIAKFnuWkC/x3MSwqAMAwA0atI1gZq1SpeRVzUJmrAHw2IIN7d4
 vItZh5QjsIKXfZA5EtUjj2hyDMIi99nRqFksMY6UxYNqsxc47YF9Kt4ZcWKnR2JbGOohdSdkSe
 5/2c/vO8HAyd6uGMAAAA=
X-Change-ID: 20260317-sige5-mmc-aliases-4e62bdd270d8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Af4KFyu9G462PBzFPcUbHdbzV8CZObDoeMRMMguLwig=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm5Z6alpHKfAvXq7zL1PZ3iPAInwi3LN0/S+
 /t2vGkmeNpyfIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuWemAAoJENju1/PI
 O/qao/cP/15PNIpmb6DW8m3mBXgyxNr8Ess3FS1i7Py89+4nu/uLkj8NXNyRwF9M8eTfwsIjTq+
 2jCxyd+BUxGIhwrwevqziRtfitG/SuIlm8f8ZsK6CnfQqUYy0TnzrunV/sKdaULU77XHrMRHCyj
 svLtcwVfOrStoAf9RBtqK90gUrwlWIKMZsCjtTwqy0xtg7ICMhCEX9qbDoUYxzDSidIg1Q4rbfj
 L6uJ6JBN3sr+Nx8GUqeFg6tyhSYBnhUHt9boeg1rWmpAZg7PEo4/fZmHeLV2d5A8dBdn2hlg4rY
 ZMg2+4vPdCPOv0Q9X3GfOqiEWaz9TKofEnm1x7Oe2nVOeEDxXBwStongX828QHEGz7t/T/mOT6S
 p3hfg1a6blEIMFgIoyVF0F7hfIztIbDxj4wIfFspiE3J3FB64QYYrToj1nP6wZGaZ2NElzSJzRT
 KP/kdZRANLbcBKO/aJr5TOpzrCT7x2grx/xt/bqWzwfEU+O9kPF1Qc3sO0d9shQ6iNS4k/Yu3IW
 Y3RBEM6Xme1i/isQGjeieIKzJbb0MRhgqfkJA/tMsneuDNR+dtBGWf8ljdj80E5NFhn70xR6qoZ
 isv1jIuX5EM2vmRwTLll62Cr5oykz6y+4xxiWqGJOHZfndRimQ7RYArg5ggT3rDGA1cMbh0MbX8
 ka+llNC8HMM01jYItr6E0qA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_073937_675983_75180C80 
X-CRM114-Status: GOOD (  10.78  )
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

Provide aliases for the SD and eMMC interfaces, so that the operating
system can assign stable interface names.

On Linux this is only relevant when booting without partition UUID
based root device identification, e.g. when booting without an
initramfs. In that case booting with e.g. root=/dev/mmcblk0p2 is
unreliable without this patch as the device numbers changed based
on device probe order.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index d372ba252af8..1c100ffd1518 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -21,6 +21,8 @@ / {
 	aliases {
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
 	};
 
 	chosen {

---
base-commit: 74b04802e23d970099c522b711b0d94e9a29dd74
change-id: 20260317-sige5-mmc-aliases-4e62bdd270d8

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


