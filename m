Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6015FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEPA4CEja7DfYqV5mONLFrg0o/2JUWTL90rJ77G6XVs=; b=PagmGgyVycDQjxOURmOf8fNm56
	ShVjVc4TPtQJOeSSG1T8FQ5ycPPOr4XiEwfONELeDwC+LzldFQfaLohIOTcVVB4weeFr/5BdLfBTn
	/QagzqC1jDKXonD5LR6nvDdePJLnNpRvsyyAcBxuVX/r3Wb1PS95/hlZ04omUbgLhd7Nc+F5mO4mU
	GRVRFP0NUQmO9tiGl0a03LaUyhJEAOLsZhZQ13/IrrEhA/v0oh1fj4Lws0DOzm2I09CIvSHTrH4Gy
	jE6u1FimAa0qAOPuYQD1JL0w0ronNHNKUiNisBnDobS/+yNVeD7GzEtpjIIFVNQj/mH6FHSggEe1t
	VGuOXOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUvC-00000000iWX-1YoD;
	Sun, 06 Jul 2025 19:21:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFl-011A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31AE0442CA;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF877C4CEF3;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827629;
	bh=4Go0MW1lNueOVC6gmf+7/91l89KKwhKe4dlIKHzP6fQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aSklsBqXQOIXwZacbLeEwMgBXOGVUj5t8h9mHHdOq+YBIDV9jvUz4uDJ4G42TnUd0
	 GapSCPEo/A6f1sXrJCBDNs+iyeXY8bkpeadf+Y8LOSIwjWEJ6Jq560HFWXbAKLuSL1
	 fb/pC7QKjZs3qVsgIhNJZxr04bQpGeiRAB2pNLzb3AFsGN0MmD4ZB0unXVNfql5U0t
	 YiZouDQTphVrKqVWshnWJyKLjSpgED1IRQ5oNTDOHRoC6fu3NMMCHiLG+Ci+guNdTU
	 h35FmaDrpIYEPJiQ+UoQvYFuGWUnczLsh8N5nsDFe17fDyoRdu3hj/UOi0JmuQRj43
	 uyzh+lhnMEG5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1D6C83F03;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:46:57 -0400
Subject: [PATCH 01/11] ARM: dts: lpc18xx: rename node name flash-controller
 to spi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-1-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1063;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6m2OSalDvDTCfCB99DCue/9d4bd3iaqflWbmUZP2bls=;
 b=rLn7PQwT/q0/86RMYLYAyz21Paf2qNzYr0Awx+18IxDv+lT+Z7/NDdAVYe/1Ny03d8O3hDaM5
 Z+UzuUf74cjAyS1ABs2+UZqZpriLfW3MgoT0Fe7cZk6mHJbfrZF9ERv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_081412_0FE86CB2 
X-CRM114-Status: GOOD (  10.90  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Anyway it is SPI controller although intent to connect qspi flash.

Rename node name flash-controller to spi to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: flash-controller@40003000 (nxp,lpc1773-spifi): $nodename:0: 'flash-controller@40003000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index 6dd73290f0c6392a407e5115551cbbeaf654f94f..e17298e89eebf4fc7e3f135dd4a20e563db48ed3 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -100,7 +100,7 @@ dmac: dma-controller@40002000 {
 			memcpy-bus-width = <32>;
 		};
 
-		spifi: flash-controller@40003000 {
+		spifi: spi@40003000 {
 			compatible = "nxp,lpc1773-spifi";
 			reg = <0x40003000 0x1000>, <0x14000000 0x4000000>;
 			reg-names = "spifi", "flash";

-- 
2.34.1



