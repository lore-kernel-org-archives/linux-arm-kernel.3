Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDAEC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Lx2PnIoFdh3u3WgeJdYWbjSdw/lfRSDSG42S8SrFNo=; b=i+GmshWhj/lGLOYLV9jNjuIvR7
	vKs5xtjtyvVmlhNkMkYFf+yGzNH+pWGLjFlsJ+pO3bXX8zleSzf61q2yrtRPCU4r8W6cJ6GgCkh/K
	Q4tCxAZILuR9diTa6eYpHpfM4Nv6wHHX1p44LdBvoDLzj/U8Tc9EWIS4BDyRyi3Z7m576ByaTwv2R
	23WkXfeO+bUOpfans4ynm/dr5hriIxwdfRvRj2OdtmdASkh50/MnurnNGleVdToSLftwhv5d1DnWP
	6qgqx4v7mPJdnahkewGrD7ph6tN1SdzJp9PbJwaRlnP2yx/okh5CbTw7vNIVU9pR3DrXSXm96TGRl
	7z69GuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlO3A-00000004d53-1Rzs;
	Fri, 21 Feb 2025 08:06:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNyt-00000004cHv-2rh3;
	Fri, 21 Feb 2025 08:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19C8C5C5670;
	Fri, 21 Feb 2025 08:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA1EC4CED6;
	Fri, 21 Feb 2025 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740124914;
	bh=ydI126qNyrfXk69jbLpcK3VubbDbZV/HSA4iho0WmC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BK1RMUgLpLBNgBGrekqfP34atBUvIBgFKkphxlHOA0GNrzOumWvuJ9OeH9nQM1E8D
	 ecmYW3BeCRqxx1mCNiZ6gyVsFev55o/zLPrb3TINNL6sCQs/ntmkthqgTjdKxefjrv
	 f+W4M3Hm/IeIb36H6jnTMoozKhcyy2s2+RbOzCfc83sRFG4JTWDYycQ3017zpsQHDb
	 h6YUGorpsB62WwuBle9rJXPfucW0x6g82U1S5Ftsot4Yry0YX9g4VVYo8Kq7DijuS0
	 C+mPX4usw8WBkoVGXTaK6kMD8Een3DLB4+mR4MABh0aNf5KtMbMDw4QX3IQXjf5nrt
	 f/YTtIB2eTAGw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 21 Feb 2025 09:01:16 +0100
Subject: [PATCH v3 2/2] arm64: dts: airoha: en7581: Fix clock-controller
 address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-en7581-dts-spi-pinctrl-v3-2-4719e2d01555@kernel.org>
References: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
In-Reply-To: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_000155_769447_53BA34FA 
X-CRM114-Status: UNSURE (   9.67  )
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

Fix the following warning for clock-controller node:

DTC [C] arch/arm64/boot/dts/airoha/en7581-evb.dtb
arch/arm64/boot/dts/airoha/en7581.dtsi:176.37-181.5: Warning (simple_bus_reg): /soc/clock-controller@1fa20000: simple-bus unit address format error, expected "1fb00000"

Fixes: 7693017580e9 ("arm64: dts: airoha: en7581: Add Clock Controller node")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 9a419796594d3a99e1187dcca622469bf5a888c3..26b13694091735da7af977e42f8f546d7d5cb078 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -173,7 +173,7 @@ spi_nand: nand@0 {
 			};
 		};
 
-		scuclk: clock-controller@1fa20000 {
+		scuclk: clock-controller@1fb00000 {
 			compatible = "airoha,en7581-scu";
 			reg = <0x0 0x1fb00000 0x0 0x970>;
 			#clock-cells = <1>;

-- 
2.48.1


