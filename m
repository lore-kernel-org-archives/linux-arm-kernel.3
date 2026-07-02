Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuFIKCMIp4rk2KykuL3CFyDI92ay/8qNKtBbRjiOu0w=; b=W8Rq/wcktJBL+EhgDZUPOCEW3k
	Z9D7aM1I/ZY2aFLdLwWY34EfgopYDwJrGWLE9KhZAzBU5uIo4ghu4ZILNnJ8qt5mA+vcF67oX381l
	o4TjQXDTTPbVcPPQF7/VFEXWCn0CAitRyC9ztTsRv+0vmzE48DsHoAu2cGgpo4ozQf8kUyuZ+FOMQ
	Oa0sSw+U1/nQz8EPoRBFsdGE2sQAN5Gmp9DcYzY54q/20MfOhQqfLcQ5IHEdvfHAn3eJsDSlJOBrs
	99Fe796ovJhwO7sw+2gNFhHXKVgBEoCdsZD+QtXEGBHatq07FdqIuVDrZ11Lpfgd3FjFbbj9npxej
	uXfrNSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPaD-00000005cSu-0kI6;
	Thu, 02 Jul 2026 22:08:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPa4-00000005cHn-3ogq;
	Thu, 02 Jul 2026 22:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44E1743F30;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24D87C2BD01;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=npo/fLTvxFH33okSDT5hZKC/JT24REZBjA22Ob+RouA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tbfKPFm5cNLvGh3Ti7hUVss6hgQl3Uga7qQ1qU2Uo5JGzds2mv8/sAruKFfEpB2rj
	 elZ/DDWKvAR7+EDIlmyEeJAM++LCefeoZaoifJI+CUi91w+WHFwzjgJnSwS9c9gWfr
	 kVImvVVAWRGFyjG7EriBW1rKpZWdZz9Ft3ErE2g3SHUcmlxdgHcGj5nct+DlFUfnFR
	 /uRa7dScOeUpUc1hgVHc7mWJzPiosMF3VcOivg1z+yTfOL6pV1R3OMuPHUpT6KXrkR
	 pJhTV9YDZn7jdBFFU1iCQg7xWewPj6fIQJFzAobALIsor50mckJjRKq2mDw5S2jTaa
	 w2Dis6TORGRgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12950C44500;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:23 +0200
Subject: [PATCH 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-8-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=747;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=xYuB/QxuBX7PA9bPdFQENsiRAGCOhRcwISiBdc/4PZo=;
 b=XXX6wpdDlGpIjN86dtfOJlnfD2E00S9bclySieflzzF9RhrlyPTGIg1J+Zh5MKBA1fCfbz4O3
 UstTJAAHtD/AF8uaxvYHaGabcPHyQnLw3J2NdrBr7KzZTZxpSSBbalO
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

Since the NPU is hooked up on these the always-on isn't needed anymore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index bcb2f5d63a61..463cfeddf270 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
 		regulator-boot-on;
-		regulator-always-on;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

-- 
2.55.0



