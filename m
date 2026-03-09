Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4036CEA8525
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLBDSc/qArG4gyDHuMh0dfrINi0JDhK7HO9pbAg3ye4=; b=QySNR8HIgLSC+3JOjM++ixnzPJ
	gxrEfCRUka4tjkJr0QS9NAHmgeMT468vlJDRzwijN2QhwkZqoqAW8+NQVlUktr/EGbKpZeLX/XAgd
	Zsd5PyaUZJB7r9CHxCcDsReTD44vnK15WuvbgbJ5JSUfq6CctllsqFAxBcyiR2NgVnVv3bBQb91+/
	G38VdnQJcOtcp2iqdZlfm5Lq0jwYOfwJR+EG+c4rZ80jnrfj8y6n4306Sd03XLiJCkOtH/tmHLLlR
	ut8h26mzo0vEkncuUQ9710KyumbakO0SPGSVsNC6eE5LUEyzueRc6xjoTp0f+Vxp4RuvApQLLXrH+
	2WYZZo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRJR-00000006b69-30EV;
	Mon, 09 Mar 2026 03:29:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRJP-00000006b4Z-2U9p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F6D860131;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49392C2BC9E;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773026982;
	bh=VXVNmCClSvOwGpmi61YhHWESdYYhdf74iA37qmcxNDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LJZZ3fJ1fzhlMwc3mByIv+IenATWisW3tyGnJFlqSfme6o5dc3Y8UE2iU0bCQtXOV
	 RLf+feLAwBn4KDL39NotG8FR/8ZEWpU23cdMWTFnW0mDLwou8i9DRpLah4EaaqsZXs
	 2P/keSAq5JJdvyrLP07qkJHtJhpcwPPDg3fPK7jtqC+36JymuuVgCVBBBKb/NegUBT
	 TcKylZSoFc9HVlOWIJjqigTQFKv+3/zaXkE6OEcc+5wy2Pm9mSIfN1vseAMw0U0agQ
	 dsGcEw92S8Oh1mC11lhk3s897fc5MPZBdu8aYquNlTpHnDpk+YbVG6+IZfibLvUlWg
	 HBffZqXMM5OaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3572BEA854D;
	Mon,  9 Mar 2026 03:29:42 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Mon, 09 Mar 2026 11:29:28 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: anacapa: Add eeprom device node for
 NFC adaptor board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-2-45092310e0e6@amd.com>
References: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com>
In-Reply-To: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773026981; l=774;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=D46maPLCWSRhTgMfwUROFSf7IKYisSBqz2ghfKsQhBw=;
 b=hpjKx7Eau2uIwosBxKKNezj3WUOTJpS7Yy3dVZ3PCMzUp9UwtT5YxbTEWxVTj/+IJQpYSVmns
 Ht0/v19zq/hDXnBtIDGAtDjYW2OPLHcqCt58fD3cUJvvbI+JsIjXeTU
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
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
Reply-To: carl.lee@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 680108b00664..e1dc13cd3cd2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -820,6 +820,11 @@ i2c13mux0ch7: i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
 			nfc@28 {
 				compatible = "nxp,nxp-nci-i2c";
 				reg = <0x28>;

-- 
2.34.1



