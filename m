Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82D0D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8y+phS8eVbGbDVXIbvWNRHtmDaRLUOx0gC3A1l/9TT4=; b=skr2UwKNJ4Eq89ywwwfy/Tg27p
	WKWUO9q/1yvIZYxW8ifnb88bocRYi+txvIRLgzPphaa28o/1J3tUjaQyF7dZo2wytuICSmEsBpnwu
	Isn7K5QgdHQygiCfIpjQsk212mA2X/BwW3k9ghGweDXgZlZOJwBWAwHwfs79gal9jRekuIdSdsJcr
	IOOqk9PGumPxf9s6Rcr0IGioLbnOxayBn7vHkEMog4owQjy7syKDMprZAshYSRYKDri7zaDEC2guZ
	oKCmFK90CDVY6m5PxuFCidA8zvEq4QQMSDhiLoKp3bOVNdxfZH1r3gsHgaadxe8TXd8o9cF3c0ZZu
	T0x5oo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLY-00000005egX-2VHq;
	Tue, 16 Dec 2025 18:00:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLV-00000005ebM-2PZw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 18:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D9CE60187;
	Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EF9C4CEF1;
	Tue, 16 Dec 2025 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908024;
	bh=748kh0FainH3OLOBiond62jRSgjjoQL1Ejt+d9CgPLU=;
	h=From:To:Cc:Subject:Date:From;
	b=K5n3i8kS7LpDLhjkx+ywQZJCPGYrgxknj1jhWtrWuaSKGO0MhT4TXZ1G3/61XB84X
	 j2IVNIchKzDOp/tWhaWr+kCJ2yW448iZLdiqgfETLNjDFD8zr3BXzuoO1QLC2xGm7j
	 TXOdewX47vrnDjtePQLekkzI85FSG1PZhiSdeROPlU20o7sJYfvk6p+ECMB8RrHFDt
	 XqTw7Kxm6PK2q4usf2zL2DzD/CXMAWqOGveL9wbqMXkp7Yj6kcYDFnPcMDBI7QrQhU
	 Fkl0iOOANakXxfaAQlNgs5H/ob4pyiU1GwkTypqteqifdGSFpjrKq50sTSV4MzrVSe
	 ubo6oUMtf1Iyg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Chanho Min <chanho.min@lge.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: lg: Use recommended simple-bus node name
Date: Tue, 16 Dec 2025 11:59:52 -0600
Message-ID: <20251216175951.2791921-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Update LG LG131x 'amba' bus node name to 'amba-bus' following the
standard names for simple-bus nodes. Generally, node names and paths
aren't considered ABI, so it is safe to change them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/lg/lg131x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/lg/lg131x.dtsi b/arch/arm64/boot/dts/lg/lg131x.dtsi
index 4cb1e4510897..90988770cb5c 100644
--- a/arch/arm64/boot/dts/lg/lg131x.dtsi
+++ b/arch/arm64/boot/dts/lg/lg131x.dtsi
@@ -102,7 +102,7 @@ clk_bus: clk_bus {
 		clock-output-names = "BUSCLK";
 	};
 
-	amba {
+	amba-bus {
 		#address-cells = <2>;
 		#size-cells = <1>;
 
-- 
2.51.0


