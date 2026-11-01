Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F4606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmpuadvs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lf+UPqIz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6PppkLHzhftU1CpGaVXNcPy7ndzJqJy0rOwo4bwxoSA=; b=bmpuadvseM4bTl+jH7Zk8Pwheg
	FpmtGW14PWItQJWnOTkYdB6lVWo52VNCWoMslvdNoVK86LAGAf/vOzx++olsgUrPJI+Jq6E3ikkXx
	mt05zbFWY2BNoSpUMnDjsZjhpH0p/Qb6+gR1mPVR5AfWgg5EVOWr3rv0lH/cwsDaS824cpw7mV4jP
	zH5In6Bgva103MQuAEsowCqbxjvctezdvNKJ0EqlgPINcALIbNrHTIC62dghfGfHYMV4u4J4Vx3cg
	8gvoFGW8RQhnkP0+VU6YgbmLXgVIueRTOUdJsMN1x3tVn+7H++TiLIbfq8pWa0NyXp7bl9GZhe3u1
	ZK27oGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdc8-0000000ExPQ-33jH;
	Sun, 01 Nov 2026 22:01:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdc7-0000000ExNt-0pEx;
	Sun, 01 Nov 2026 22:01:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D82F60054;
	Sun,  1 Nov 2026 22:01:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570478;
	b=wGONsqRXjGalfHxQ9t0uQI4rwcHlbzBlKsQYGpU24fqKM0Pbx1x50n5XDsMS/5qXeEMo
	 YEzhLyxb7V+Tm1DdCFW8Ex4AbIltYOIckjqkD2ghN3/JTEBk/ijHyl+WVVp5pYUUbkHuM
	 HnV6AWt8m7B1hJg6Jb1FEFn36EzyqWsemcPdM0/Q/2dDjl4ayYul0ItaosRE+9XDFs8V4
	 rkYqXNY2xbw6Zev8/Cv5cFsyqtHTc0D7gMNS/sNC4uCUQ7C0ut53VbDHKFn1X9gPwnGw9
	 rOMGbXzGgb6+IpLcoIcage4JllygYwJOofy/EcBHrg1r1iTVwKquPeHYppPs0j06R2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6PppkLHzhftU1CpGaVXNcPy7ndzJqJy0rOwo4bwxoSA=;
	b=vin4ZzNZKRSDdE12+cyPdD39CIswyVidxYjlPr66OjaP0fZBhYRpCtthuGzUG15Qw7F7
	 eTDBznGBZgiyrV47lESEIoU9KS8wk1aIaYqYFrHjUam0yMmXMA9gmR04JB5tIMs0WzDw3
	 U9xt0yFzueoCnQxypY+Zly4FVmJCUnur4P8yCHgRjQtaV5hPM0VAzx3VBFKPvAUGrHomF
	 4PUPMXbUaLCx9nCTZt3py7C9avTmTokkZ1Nv2bsvoW8doD+yon/oocYoDaCmv6AGTV0/J
	 gRJqzIQ4Sanxh3fTiNLSNQrQMX7ox54P0TBBX+PoXFP8dsSRFNsKVL8QoTicl4GvxMw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93B521F00919;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570478;
	bh=6PppkLHzhftU1CpGaVXNcPy7ndzJqJy0rOwo4bwxoSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Lf+UPqIzUW8taX8eImjy2725bNO8W6SqZCBMBno8xyAR5urEgST8cWpxmAcl+5aCE
	 tXsil40d19mhOQ4Cic05sfz4GxNFKdtZXnZ5thhTU4TnrionCdJB+EtPjclZiHTjG4
	 nr6KvMLlafhf0O2j/xfHgyQwfKEx2ovrVsK/WCgRxkhyGDF30iViNQ6dXrX8vtSAUN
	 TFksHrQPZ0ClDyiJXN42Ka7aJRVfYKWnRSlXLGYju4qTE0J4xP28sGpm6z0f1SPBSe
	 N3bNU3THYROjFJuZrtCWhLdo2vNOkKzJIFjpqLb3ZwbAHA9d5TNBERTmPGWdD3BFps
	 YON1k1W4moe0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1060F462A0;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:00:53 +0100
Subject: [PATCH 2/3] arm64: dts: rockchip: rk3588s-nanopi: switch to
 generic eth phy compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6v2-v1-2-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
In-Reply-To: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570476; l=947;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=LlnCbbgiuToElbilUWpX/P/5aagrWhUu+VZZ4pw6CDA=;
 b=6r49hQV1GiJbQRNgRFAS/qwjocmblPV1giqOE2nGW7zep3X7dR33B7QnaJGZLo/P/d+Vye0VA
 NCSSWtlwmbBAhNQNJwAYGj0ICgSkGXI1FJpnp3xDj+EJJztAoUgD5on
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Use generic Ethernet phy compatible for all NanoPi 6 boards. This allows
us to easily support the new MotorComm YT8531C phy used on NanoPi M6V2.

Note that the Rockchip vendor DTS has used the generic compatible for a
long time.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 22b0cdee22b40..4977ccb668f39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -269,7 +269,7 @@ &i2s5_8ch {
 
 &mdio1 {
 	rgmii_phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id001c.c916";
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rtl8211f_rst>;

-- 
2.56.0



