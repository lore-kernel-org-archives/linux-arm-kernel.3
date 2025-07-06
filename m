Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5222AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdcW0VnQFs0Zc9l3/0jVWKeNM2FNjEfnXjjrOHlfbiw=; b=QGajQ5SRBgJBPfYCmVSctwBvO6
	QBVnrARfMaRM5oNhUYqfoT+Tf8Uj1fKHjr+Yrx5jcFaLqS5aaGFtK9dc8Kfap8AQoZdjl541Tmo8p
	ZeahKXgK6l6dQqSBgISbPURJ17O/u9OXTJzZ+EkUAr7PiKAEbVnL2IMuFYcgWWXn5ugc6hECPB8dy
	7Y4zzgo/pcCdcJ5BBSn9j6gA9K4LlwggsikN1dqMEBDOXqPnWjFr1bVzDKjz84P0KZrc/CFBM/nD8
	yDXpp1840QALmK3LoRcIsImFMx7q0mcFc/wRGWi25fcVx2vtno3rOM5lhHfPAyERSktepYjGV+pp7
	h/zbBaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYV4O-00000000jAW-2WJe;
	Sun, 06 Jul 2025 19:30:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUON-00000000fFw-1cYQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9B1A5C57D3;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34969C16AAE;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=vvTSyVb1DLt2Kq3tMOfCIFV8bVMc9KjylSFYYgyQ9E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mq797MsbomJIgPzIThYzILSa0RhmJvJW6M7DSBtQV0oVDCIEYhVvO9DQCaWzeLoZk
	 jUEZ4315QFBhGGM4r6CV7Izi0GLfeda+G61NHhyFHGD7QKoi9by3El5aMJHf2KfVAk
	 uzQBUv6XcqqIA2ATvZczkWTns8DZX+DgfJOCV0RL0Zju9IClNF7Syv66dXVymoXofR
	 9t1wxvZVMzkursPhY5D+nGIIdc1HfaRBy8k+EWjmWX5fIkZ5YVsjX9K09tI72yF/q7
	 RZp/2qS8NeSFeULrROLmUCe2L3cPMVB5XdYqMvGWjBhWgyLQXCU0vDXemmI/MvRBnx
	 NbWtO5yS0zVMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB1AC83F03;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:05 -0400
Subject: [PATCH 09/11] ARM: dts: lpc4357-myd-lpc4357: change node name
 mdio0 to mdio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-9-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1000;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VS6QxcZGgSn5HvNmNyuuSrNEq64C8Es5AmiMzl1zdLo=;
 b=4rX0XHMxOOfRXW4fpgytGVAkbcqD5zWSdAnSlBa6GhhPIEbPyK3TmaGo+4MtCAtwpa72qi5hm
 nQRBAf7Om1tA5f86QTzU1qEk1SqEmJRMBi1Lc2dwFA3IoQzH/bfWwN3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114711_475005_5BE7BA2F 
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

Change node name mdio0 to mdio to fix below CHECK_DTB warning:
arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: ethernet@40010000 (nxp,lpc1850-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/nxp,lpc1850-dwmac.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index ca91bb8f6ada6c4c3e74d4d76a2382f667bd2649..d18f2b2caf687f58fc330d6049e0dc6f3c393f4e 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -544,7 +544,7 @@ &mac {
 	pinctrl-0 = <&enet_rmii_pins>;
 	phy-handle = <&phy1>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";

-- 
2.34.1



