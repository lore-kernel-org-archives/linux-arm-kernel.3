Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD30CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7Ptm6SPsVG8VTgTcEieeftVdkBihFqITk/E7N/gLcI=; b=wIFzrxh2IfhcFl5oCyMJ5hRe0o
	2JaGMeyAmMrTT1t65CDH+QZL78Wwyxf4IyTuK4bRyNzq43g5hNcoTqvMkTW48JHjx1gVqtEKklJTP
	31zsXQtSl1O4FakUlkiIEXFOE/7elcjYThvOg2eR8p7rikTD/KfipQ4Lv1f9I07LX4FeOMVshqRI7
	7kL+AfnuzKV4y7ZtRTsJoBFgvTB9RwAc6XpKaNOwBoxNBKvRgjLXEI+NiYwcQ9ndfGIQTN17kYZLH
	aEl+NhEDbRdQ0wU+gODCKPooh23WPbzJwkE7dQGpNmYQ5yJT501SdcEPvPEmkb6Ls588BsHRaUZpB
	J17RzdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4u-000000072I1-39D3;
	Wed, 10 Jun 2026 08:14:24 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE4p-000000072Ev-32bu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:14:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781079257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7Ptm6SPsVG8VTgTcEieeftVdkBihFqITk/E7N/gLcI=;
	b=I814W4Db1hH0tdqi5Rp4hZY3ua5uiZAf5+g46nVZGHyfME3gby6N7Ud9rX7owW3Z5VzyoO
	UvhmOR8ZIts/hRPiYQbrr6+gaoOheccoHHldzA/jA0xCPzQZ5mTH/zBHSDg5CAWuJYuFzf
	uU9tESCySXd2UVDoESOpu5I3PDPnzm3i0aA2R4+7aVcBa/NHerDMjOmgZJJflx1szfkg0m
	97uY3LuEUVfiNvOaPu/e9+SKvuYT1j1lBZ7rlrMjm2P8EvmqGR/nZqueboys/pbYYze/NO
	Ir3z0KICHEn18PGeFnrJk1ChI8Y7fe9tqQWNluHZI/6WMHtlu/YPrbCYK6HnKw==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
Date: Wed, 10 Jun 2026 10:04:05 +0200
Message-ID: <20260610081400.758687-2-diederik@cknow-tech.com>
In-Reply-To: <20260610081400.758687-1-diederik@cknow-tech.com>
References: <20260610081400.758687-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_011419_906368_759846C2 
X-CRM114-Status: UNSURE (   7.95  )
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

Several USB nodes were enabled/configured on the NanoPC-T6 LTS first. Then
those same nodes were enabled/configured in the NanoPC-T6 dtsi file, but
the ones in the LTS dts file were not removed, so do so now.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index ff855064be08..0ee67ee24f3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -38,23 +38,6 @@ usb20_host_pwren: usb20-host-pwren {
 	};
 };
 
-&u2phy1 {
-	status = "okay";
-};
-
-&u2phy1_otg {
-	status = "okay";
-};
-
 &u2phy2_host {
 	phy-supply = <&vcc5v0_usb20_host>;
 };
-
-&usbdp_phy1 {
-	status = "okay";
-};
-
-&usb_host1_xhci {
-	dr_mode = "host";
-	status = "okay";
-};
-- 
2.53.0


