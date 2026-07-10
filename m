Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSjxqBhKvuUCkY0uFAh9eDSKmUGHPUhq5d06lgZO9qQ=; b=3M0gNcCmt1zSQskQxIn2xF63G7
	L1y9mmh2LDEAH/rzBKEJpO3CLGBYxwDyPg93u9YPCQi8ov0zY6Lbp+42Z3R7Jo2/C0YMRkKh2GStL
	7xAsG3UiCqJAsNKzDdAY1CucjyvbXD6I4NrRZ/bEAEe9ctSyGiOLI1QSL/yr/1HBEGvX88PZD8M9a
	DLHDODaY8XFEZIfnsryDx+wQUDmIqfH8XTAQ4Hq4IN3sAQDy1IiV/0wUv8k12pYhqgO13Sl6n2iEX
	vm89YQzAHhyd8GA3p4RMBRd40glOj29UZ9E/cxPw8se0m6npG7LI7se5ECpEIPc42ELOGvVp99Hyh
	eY7wg+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJSA-00000005uGC-2YFE;
	Fri, 10 Jul 2026 22:12:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJS9-00000005uE1-1Y5s;
	Fri, 10 Jul 2026 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF9F343F2F;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABB9DC2BCFC;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=7kThHoU7NfVa2SrQo4njFM/R/gQef5vJsZCKo0knqPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TuC0gmQBy8xvI4yZhmmw4iCeFUD0mbcn2HX+O0M2q2XSYdeF68AtyISplxJ9PnHJZ
	 PKPJZUTQwt4GZWzD3TYdEtPro7Ak5YB5a9gsOmSY7CRwsfYE74hs1EuNUnhRXa0eDt
	 /Y1p9MZTUWCi+M9mFSilDm/TG1jjiUZd/XkUhVdNKlL4YxkoQ1D4YaLdjHaXwM5JBA
	 +d/rEsGQe89u7pwTVgiuN8JaWEqEPDiXzibD3TXxPboygCnrTpIskC3ddLBVxirbzF
	 ptWa3dj1xs0wvDqif1TU9qIDFwXqSdUM5gKA8aEa24vUt87svOsPZcRb2Tizdoi+R/
	 j+lNU5qT/vnHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970A7C44508;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:54 +0200
Subject: [PATCH v2 05/12] arm64: dts: rockchip: rk3588s-nanopi: remove pull
 up on rtc int pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-5-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=834;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=8bK9qjPaJeH5DZSNwTRXo86eIiea6f1QVJhbeEdJZoQ=;
 b=yxJ1F6wFUM1wWvQ+bxf+mrLZeZgYWPe5+TwQuiHbYErmcJ7MxBLrQldSkAnRvd724l0f1F1Rz
 kMkm6sLbs+hAuYC8ZDUvfcpi6HeSF1BeHIj8MSzEbxmSFJFRPhaRk3E
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

All boards in the RK3588S NanoPi familiy has a pull on the PCB for the
RTC interrupt pin. So there is no need to enable the pull-up in the SoC.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index a8f32b994b10..f3a240b48a2a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -331,7 +331,7 @@ hdmi0_tx_on_h: hdmi0-tx-on-h {
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.55.0



