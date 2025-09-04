Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B077ACA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdNjcvphJ/u6942JWBxLl2gRP14Pu6hsUfn7F+OjzTk=; b=HvqPLj9cPPpqJev8pBpze2g910
	mX5f+UpQUlfQ8neGMzegkfa5/+ump14MASaNBu59ovcIxH/xndHtrhXvrKSzOVLOHFnG1TS9J5DpC
	xl+YuYwMAB11qAoSwzyE2NaGl+9rVKx6VA9ovnumrLfoDTGCWBkDQonuWNYi7aEsFzfBt+xdFCog4
	xeDw8YLyyvDUcGveLeq/lcYvraRaSVl8qhh85crcrvmkte7Al4x+RjBf+tG5DByfR1tzWBVp4QmOY
	RzZ9cghGGtBWigRRuux6YjdJEQmy+qr0XWL84GV3hvlGV151Ln+J7O37lSdtOn0NqHyr1VO2s2n3R
	nGTDwMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0w-0000000Fy70-1vHh;
	Fri, 05 Sep 2025 02:17:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzh-0000000DioS-3eZF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jdNjcvphJ/u6942JWBxLl2gRP14Pu6hsUfn7F+OjzTk=; b=bO5YCtgT6YD/1hnz79TgR3NhaJ
	/dthe54W5F9oF50o6npatJIk86yTXH7n9pFg+1agMjatPpNmCM4ttK3QD3XPCFjWow95im+aW0+9R
	Dmdkr6BakPRpMUnTyyvzQLN3hs/CkpiAQ8Dfs7i3g3c86gp/+79hBNS7zkROmVYjAPWZ3Oqw49TVa
	bQ1r0LUPPbghtUaA8dSczWWfxBBpEK1qawOjM2nzM7Z2FWUSBKqfXvS5p8vrR0RhbDw8hfsoZ/pNN
	cR8wabjp+hSP3xFQjLHArnfdkDSFPlYb8GWu3PGxsjsFSAV/v0EheyjnXuxSbjL92O5/Spn4UJRwl
	rnjKQgIA==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEzd-00000004P8c-3XWV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011622; bh=+DIPCOfdi3/lgp7sVgAqqtTOYSfs5oNo4lw7KtfH1YQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DkdykGaHsU1AESIbpWLYI+d7OhfGsxCpYC41djcENfQXf4Vv7ywNIrOuMLko6iuwl
	 B0jrsRu4oUhDrqX1u46wktOlLO4J95nitrjpBphiH4UI5+pUf7D/iBEraoTiEj9LmG
	 oIdg1GL740Z6K2QsFy+pFustMkVaG5akDvsHqw2+JKg+W6B9+CvpE5R5CH0E27BG3h
	 zw1HK4iaBzv064BoaR+f5LPt+/UB6aGp7bcsIeFtg9p9l387k4naHnzULTWsBWwtk/
	 9STzfEZHL/k9bfBL+jwCprCvGF/aj9qvaXQNBvs15tQ7oD3yn46pecQw6cPbRrlETf
	 29/YV2GRGTI2A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 0A03A3D2182;
	Thu,  4 Sep 2025 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011621; bh=+DIPCOfdi3/lgp7sVgAqqtTOYSfs5oNo4lw7KtfH1YQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSgeJP7reqmgxzw51cfbl9C3Tgvr+oIN8atuhKSZRmsoK1z+4LB84LyyhiP4m+PjN
	 v8+sVt1HqzHt2Nnq2hpa22oJBcz3BYp8/QmHiHKjBM1CmADKdTE5vM++cKeZNulyQP
	 ggO7WLk0Lj8k95Sru1mfyGptMmqYAsX79L5vsbBodTub9r9pi9MrAfxQ4xYZygcD2D
	 urn9EYg6mLTZhQTFk9F6DyeuyL1SWilWif4lvyjq3Gl028Kv3nvZoIIxRuWP0YgxPu
	 HMjwQ155d9THjxOp3VrimMj2CLoNl8rWqnyBH/JWuVJYZHM5BB09pdcFOYSX93Y2xG
	 rcNqkxU5/LgKg==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH 2/7] ARM: dts: lpc32xx: Set motor PWM #pwm-cells property value to 3 cells
Date: Thu,  4 Sep 2025 21:46:42 +0300
Message-ID: <20250904184647.397104-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184702_070699_622B4FCC 
X-CRM114-Status: GOOD (  11.81  )
/bin/ln: failed to access 'reaver_cache/texts/20250904_184702_070699_622B4FCC': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184702_070699_622B4FCC 
X-CRM114-Status: GOOD (  11.60  )
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

Since commit 4cd2f417a0ac ("dt-bindings: pwm: Convert lpc32xx-pwm.txt
to yaml format") both types of PWM controlles on NXP LPC32xx SoC
fairly gained 3 cells, reflect it in the platform dtsi file.

The change removes a dt binding checker warning:

    mpwm@400e8000: #pwm-cells:0:0: 3 was expected

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Cc: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 6cf405e9b082..916ab38f0a4c 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -301,8 +301,8 @@ i2c2: i2c@400a8000 {
 			mpwm: mpwm@400e8000 {
 				compatible = "nxp,lpc3220-motor-pwm";
 				reg = <0x400e8000 0x78>;
+				#pwm-cells = <3>;
 				status = "disabled";
-				#pwm-cells = <2>;
 			};
 		};
 
-- 
2.49.0


