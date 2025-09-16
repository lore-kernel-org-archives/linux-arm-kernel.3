Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E15CAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDwpM/ECSBZKl+3aMgoIdOQnaa3pJsckrh9jyso2Q3I=; b=Jf5McVLily8cuj01UfcNeGV7sm
	myVz6BIRldsKn5yorBmaYiMcUTTox68HzbG6KB9gqOveljuFRDAjOWc1RBibtTh7wbwP+f+HxIWLB
	NVAC3TOZWXUEfcikhESc4MRREHQcbcOt+hDu7JKbFn2hnxqErAa8n1ZJNh0kg1MWR/1eH08kxABp1
	Xbd+pz9sutJ+NMVbGr4mnHe/4+0je1Yb4gVeE5EMbuz3o9xepfZfQj5jy2ZMnH7V5CzF0bz6J2RS1
	nKmOwKmcDUxTOcSFfQN+VyEDoXm8az9Ak0utZmRHUQNtBI3ElUSvvblXiVuZEl5uvoaD27+mAx+zw
	aX+ctZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFP-000000091EF-07xd;
	Tue, 16 Sep 2025 20:25:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEx-000000090k6-1Kza;
	Tue, 16 Sep 2025 20:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C641244D3D;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D156C2BCB4;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=z4pBrQcTtXZinSTJ2z7/T+NZA1J5YMX2432r92KbARY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=scV+PQn964rxS3ZPctvG+R7FhPeCSWfGf9komgdbw6iiuybNidlGvoDSt/xlkW0oc
	 4035P0m2F65qcztXQziIXfYUzzeAMXmfe0IKlGgpFzisjSvzHB0O5Pu0EvxA5gYG5Q
	 ycgEz0pF8VrUUAk/RSq6cpMrhuIyNGdfbQfwA2m60j6uvYCEYR7XKD8M0RQPLkar4y
	 ELufdydE/YKRaPQA78fbloBw9QejQGg5PQswdCf7rq7ahsdQVF02gE+j6wZ3VXfcGp
	 U9uWeolxbW+kUf/0aHZ3ZY2TSKtcWCBElAhxP3BSDy2dA/A+5gRkVTAsOr5Qy+0Aps
	 ieXYUVKmmH+MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50625CAC59D;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:04 +0700
Subject: [PATCH 07/25] ARM: dts: unisoc: rda8810pl: Enable Real-Time Clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-7-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=779;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=CMytnUCPsfWK+Zir9iDw5CkhUnTaS4MnLkyTK6BwbAk=;
 b=8EhQxw0LLMM2LDVQTNZ8vl25jTC3/GCxaDYQ7uSwHCHHdz62F1wVQJjmy1WNmtyxi2SS9g+G1
 ldz7HeyKeUcBO6vdkIEyJR4XdsV1mIPJnTtzHx2ZgUV1OLieWUsiZ6x
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132527_403499_88B73EA1 
X-CRM114-Status: UNSURE (   8.77  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

The RDA8810PL has built-in RTC.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 6553fc102c6751696e75e4de614fc3428d182061..609359aa91537168435934077e736b216adf50f4 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -39,6 +39,11 @@ modem@10000000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x10000000 0xfffffff>;
 
+		rtc@1a06000 {
+			compatible = "rda,8810pl-rtc";
+			reg = <0x1a06000 0x1000>;
+		};
+
 		gpioc: gpioc@1a08000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x1a08000 0x1000>;

-- 
2.51.0



