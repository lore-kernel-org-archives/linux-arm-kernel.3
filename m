Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36065D16819
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy88g06uz6Ng3NPolM23Xy5/bDIBtoIQDQpYB0kANeM=; b=qyfnBCOfsYVFskT6F+xa6GbJu/
	f62EUVfXZYqwkOFTsO8ZK3dli1/MYyggEmJJ0WDH2YupXNXyuIb9hVsDnyJBNyNclmYikdMDrJxCK
	G1ljsGg5DhIw0YAW7LZH+CIs8Lv8jkdq/OVq3QxyyTmxtjgCOfZQr13BWGBZbHA2LdiRolm/9TaL4
	PnO+N+p8IxuDwdzQFfFEIQLIIQ4sqKmg5F7biNzLiroUIEWaqW593iBPQl5eeVEUwY0q+BEhs7eBr
	c0ZPeCodJ0CKc9tWriUPde+ARzkeFUmYls5Qo7RRlwciYhwW6jl6NGIJ1XklYl00Xj/QVn4VYqzf/
	EAU2g7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyV-00000002FDL-3yC9;
	Fri, 09 Jan 2026 11:48:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyK-00000002Evd-1meB;
	Fri, 09 Jan 2026 11:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959281;
	bh=+llngvhmnPs9HezSMeUlJSXb6LBNkWf6GCZ6nFhSGF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l6OPOkQdfD6UkhygUDWjItRGvG2RP16MQBWJEZYqct4T5QDWSGeojLxgrja/d4Hv0
	 13TluM/AgTRxuEFjRnADzr5LuMIiwgYi3k9wd1ys1Z7q7Wrxf8gnz4DxQLOp30uDcP
	 0qVhe8kQDeZXkJGZpoAIEbt3WrgN/yAjLX4fzLF0t/8O2DywZudLO1LQkoeT4MtOP7
	 lF5Jpwolvd5RrgvvUaUNtqHVwu9aHXxIIQM6t7Nx2fSjCLvfKefo5AB8EcpE17gTP4
	 XiaovES653Fd89s6rz7UZzZoyBmLavkWhGwQvodKciy3O+oDq8fv1RNILH8WmIpGBR
	 aXShuLicltHyw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1E8417E1525;
	Fri,  9 Jan 2026 12:48:00 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 08/11] arm64: dts: mediatek: mt8173-elm: Fix dsi0 ports warning
Date: Fri,  9 Jan 2026 12:47:44 +0100
Message-ID: <20260109114747.37189-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034804_647124_A116FA9A 
X-CRM114-Status: GOOD (  10.14  )
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

Since only a single port is present, remove the inner `ports`
parent node and just declare the single port as `port`.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 59813fff7833..dc064cdcedb5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -206,11 +206,9 @@ target: trip-point1 {
 
 &dsi0 {
 	status = "okay";
-	ports {
-		port {
-			dsi0_out: endpoint {
-				remote-endpoint = <&ps8640_in>;
-			};
+	port {
+		dsi0_out: endpoint {
+			remote-endpoint = <&ps8640_in>;
 		};
 	};
 };
-- 
2.52.0


