Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23AAC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPogXZSD0eyQy6V58LcvPyXV//Q3m8n9AMwYJDepJ4k=; b=Cxq0aTGa2ODdJVQwykAVvJLFTr
	rN+crJXxZHTP1qCL8wMgwe5MW/8+R47tf+FjV8OjdblI6I3f3pivlKoR1N0V88AU4C7V0rdXJx1BZ
	tD08DQrMnXdE654BMspc8+hmi3rj0n5ycWBm9TdyvZPbWCg9/cfkaZNlKz0x3PNsXTTW8sQ8SMk6Q
	k4To9FGgIXwn3kbANIuYKb3hnFYukhMk8qcRdTKIwqWYB6VKBhoWAoIf/YTmLwsKoi12RzAmCxoxS
	hDIdpUxce0mjB6VrIEcesvD0FDnnJfRz4QkkKSYLOeGIzxxcOKiiaq62ars3iHkx2Ub0OS9gXBdJF
	PGPy54Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcum-00000001OlH-2JRm;
	Fri, 17 Jul 2026 07:23:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcui-00000001Ogq-3viI;
	Fri, 17 Jul 2026 07:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8328241966;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66865C2BCFF;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=8M5ME01DAx3H/18R/A9EATjtt4h2M0LHA9HSUgIuY8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CGQ+Gdd+X1QfFCjsdzaIKEKN74zxe+hH41qR40daN1iY8pBjvuLEBBCTx4Xq/pQIx
	 n5e1WDstGbNz/9oYOKyAcZnUWv7xt8TfY/xKjiI/L6mqE1bjBhx67nRLN5BMTmRI7m
	 vtm4Oi0XSbVZkaJcwED+9ExykrRtqoVEYTIUIuKUaVAUx2eBm66KnAV9UUsajFpbwH
	 GCDxpnxMflAVQoFFp2MhB9euaUDINlfzdekNN0PGUSMmxYR/w3yM2oeIZexSr72OY6
	 vzqHA5krmwhIKUlz27LYfXEhE/8ONWuyuSBgHrMeRcy1gTOEfJY9oJWz2sxACJQ7zw
	 HuFPN9jjVOe/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5408AC4451E;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:08 +0200
Subject: [PATCH v4 10/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 comment to gmac phy-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-10-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=906;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=QZV8naTWO4Z+iXnYHi+nrsqgVGR4DEKSmwg8FlaLRgw=;
 b=tYfTv2yqkLDSCkvEfKNfqWf4ODEA0oGLjxqwQ3om+1OaOzCTUsXFk+DHDoF59UnrYdmlmQ+Q8
 M9u7GalHOMSCHe8lioqgjjBQeeGGoEfEr+UbJsnpKzP7bJ8iKTiU0Y5
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Add comment to explain rgmii-rxid phy-mode usage. Note that the actual
delay in ns is not known. The tx_delay value of 0x42 comes from vendor
DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 309cac8902db..b33e7b15d05e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -199,7 +199,7 @@ &cpu_l3 {
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-rxid"; /* Vendor provided tx delay value below */
 	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2

-- 
2.55.0



