Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645CBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqQOe8MfzuC8spsP7Zqy3hWAWRQHTjK1NFcKHUE4s0E=; b=UKDOiEmvKzCbUf7Jp+sleFo+E2
	ioDZ50Ef3xZ+XyUj61YsanMO9oERCCMHvzLA7cRdkQ9fdLpKxJb4F1se4SX0AkzOPFbO0fxbWyWqa
	IQmUMuc9oukCKaDEQ2KEeJ6+EoRE/NpftaXm3RNQvcXfTFVHMEnlOXKID3qqfEKrAroFmr2fkESJz
	uzbPvsDAmDqM+/h3rfAHQ2A4nhSMF/1ZfLez6xXA1NpfAxQRBg3lReZX/2/Fr8vhob/d8cy9vLGYo
	fXqV4jvpCs5u7le/3JsMAjLoB0IFRYYnleQk5xcLGgz0oOeWJJb4MIhme0FvNjXS7G2CjsCTa5nYM
	QIapbjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EuS-00000000dFC-2DNO;
	Thu, 03 Sep 2026 21:23:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EuR-00000000dCs-0F9T;
	Thu, 03 Sep 2026 21:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D5BE447B6;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 638A8C32782;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=TV1Nlu/Lb5aFsrXrysuPrkDA+HDo36n/f0fYgi+xaYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tjSjEtnPW2V0qt58oNLO8K8RtlD8T+iuO3KIvnhL9tiYkuwz2/rpilXwTmLhSh8OW
	 AOWcuKnFT+EjC/afCtRqtgBleLLGHrvuliU8nLJnbaBEr40QrbXuebFvGJt/dQzxwF
	 fD/BzErxtpncsqE6SyhqRMxzGCvxcxPNgJkxt4Q+lY191qMr5zwVFzMQnaAxp+FrZw
	 iZrxVCruS32hjX23SLt7WZ/eXtx1vyaCrZkgOOfVBdpAYAljP+8Eoax+C3KP3xTXu6
	 WnCFkSEezCA5b29JzR8zQCv6DDxLZwqp97jrMRbQ6vJ9neM938qW2r2hsaIL4sgjEl
	 anQ179mABjWQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52661C79F82;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:17 +0200
Subject: [PATCH v6 05/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 pcie2x1l2: add clkreq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-5-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=850;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=zZZsCZdGw1nc36iqIT9VghSAmTcEW35W4wGMmfXzvks=;
 b=+Pgvt1M3/eFQOQ0W4BVgJQFU7UzERa5QjsQbnUH6IMH24JzyPaVzFCKAg8FbagY34JnHHXgbh
 wsXGPqJ9efkDVdjVzy4jmfn6l05lxgiqsZB3JChibspIAh5aB6AZplu
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

The clkreq is present on the board, so hook it up in DT.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index f2b15e03d5ef..b120dd98241f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -369,7 +369,8 @@ &pcie2x1l1 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
+	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
 	status = "okay";

-- 
2.55.0



