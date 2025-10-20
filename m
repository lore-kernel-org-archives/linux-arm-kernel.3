Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69632CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHFcmsNZxPjCN0PuRuFzV6HzJ7Y7FUg2bMao6+29mxc=; b=f/bhoKSAWOLYrMRpqwmUq5KThz
	9iWRK/UIZzt3BytDYmdenz/BKli1aqklQwoKzA4YIyYlECohyqaH4JOdO/QZW1puqfe57UsWsLJrX
	rOFEnfdDieutp171/uncid9icuXcSsZIIVTsgxuTc/FA4tVJgnpu7PufhkrMQPGfRltHa1mODC7/t
	H9WA/RzgTkTCdJ1rtmMdrmGbiPF2CMYFX7/RquJnJH83lRmxX+8DrzbL17OKbtBoG50unsAoHFTJn
	5TP3hc5vze9+KrpL7qritrONLYghB6lhlky3KUVXB/+Ug/vVDyah6oPZqzaiPcEBC+lktC9KZM0VR
	Cv1CGNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoH-0000000Ckln-39i8;
	Mon, 20 Oct 2025 10:08:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoB-0000000Ckh9-1xWO;
	Mon, 20 Oct 2025 10:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FHFcmsNZxPjCN0PuRuFzV6HzJ7Y7FUg2bMao6+29mxc=; b=iZDwWKlDNpaWIBdH0T6NQJaTif
	yUbb3RJ2sGmTYQIpRpPZhKl36mx3fnwXPeIgIbYQ5ik45DmRuRgMInWdDfSDGlIRgqO40vedtCC86
	OH06WokermLMPZYK11pUmpyGk4Gf0ouYOr+ULe0Cdnop2bh6fQppQDRYznPynlR5dyx6EZ3a5rlJ6
	j0iwGV/gFahl2B3bZXCywbZjgP4MbpGLXvFCpsESgP8VhnEKX8JlmGFbvZZK02XtBQvEjT5IMuCbU
	qYiECMGc/Rw6ejMdZdOYPHhvjfuEQreAW48iQO9Lk1VtGmISdujTQ5Elz6QD2/i8uUfViA5QLZztB
	8zdMbG9A==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmo6-00000009hqm-2nIr;
	Mon, 20 Oct 2025 10:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=FHFcmsNZxPjCN0PuRuFzV6HzJ7Y7FUg2bMao6+29mxc=; b=OdOpTtlOmDz98ST5DMjqWG+Ore
	N+dNNvZvqwWtBy8uhe42rLKvQeCfCzolFsC35+Kn2aVmHwKJmGV5zakGcKh70dsPTBvjSOKF6j+wc
	dKkGjSjKQj6bTXXd8ektKTCJqDOt5oXvQoKQLqpkev+pd0CNLQ5alFvTRwZwPXCWai0fBYrdROGNd
	shcwmvUOphb9hbRP4AitujI9OBP62bpm+cqiz+HQwJ3fJPiGoKgnSsvUJKrQlDmU+b2HIP3nWULB5
	pTWJrjqZQecU/h1stBq9OETrzhc6XPgzqivknGhJPlXrEZrnTNuNYlReSF8fF83kmtpYhEfWLiuCE
	dDZs9kDg==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAmo4-00083f-6V; Mon, 20 Oct 2025 12:08:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/3] arm64: dts: rockchip: add mdio subnode to gmac on rk3368
Date: Mon, 20 Oct 2025 12:07:56 +0200
Message-ID: <20251020100757.3669681-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020100757.3669681-1-heiko@sntech.de>
References: <20251020100757.3669681-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110803_212702_B152E969 
X-CRM114-Status: GOOD (  11.05  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

This is needed to actually describe the per-board phys connected
to the gmac when needed.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 47968032afdc..98d350768fd2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -501,6 +501,12 @@ gmac: ethernet@ff290000 {
 		resets = <&cru SRST_MAC>;
 		reset-names = "stmmaceth";
 		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	usb_host0_ehci: usb@ff500000 {
-- 
2.47.2


