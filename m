Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB46CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNZeCFW6Ifmhecwa74FRFc6g4qApyAN35acpApZF2B8=; b=hD2BxbcHiLy7nOBCFeEsOllWix
	5T8BRuNMUZXA/fuxx/Pz94h3WiDecmFKlFgo9MZBw8BrpIex9u1VLEVh5oFfhF+sEoBQQEKECjAw7
	Xs6RY4xsWUi2vV4zpkOq8y6Nf1PeGxofuHJEM3JtvFRTFzQpr8d2E907rmESWpAV3ZCWRhJp04LsH
	yd1EyEs2UM6DT6qizjqGdkIvmY7YRzMX08785y9CsBokj1rujC/v9s+raID1jaPpF56S1aVDFbZ/8
	OAhpi/8PjaY1rajpgz4/g+Hmtcy5f5Get7OvWwZ6m2gVkjRoKaa6GzAn+nXqFPin9cJt7K6QulWPH
	JDPsG99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFR-000000091In-2LBl;
	Tue, 16 Sep 2025 20:25:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEy-000000090m7-3JW2;
	Tue, 16 Sep 2025 20:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 344D944D8A;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E01F1C2BCAF;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=Pnv5+FFv2iFRwSYEkairmz1Zl0wNKr5bOgIcKGaNzuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q/zXKcbUevPgRlaTCib4V5P98tSX76eBivNWx8aALG6g89LwXwdkOWDEtegJwP8o5
	 tGfCaRb0U5ehZav9v3RBQ8a3F6v00Zil3B+e5QxFJvA8wxp+9zezYEkgBIZjHSFy//
	 WxzBFP3wIRZUpqfzQKWHq+MlptIZIQ81WW5jbFBOVoSZjKEtC+FpicXBwVQxmgklOq
	 r+7BVAXDyZa04CezBiVjDhAW0IVidoO2vqy+5dFINzxuez83g05w7TunPbBDZX8V5G
	 r9Yfyj6s/+FbjdJgO011hEw30hU/ez+Uj//nbHpf6OAIgZsP8W12J3E5bp1cAKDK+f
	 eGUK2k4pZiWYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D625FCAC592;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:13 +0700
Subject: [PATCH 16/25] dts: unisoc: rda8810pl: Enable modem reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-16-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=793;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=u8ofUfZnyL6AGUSAsraDhXZ8KtNj+jiTPktMzMifzHg=;
 b=fWZT1Fx32Hx9ZahhNzlPhngPS7qH4nNWfABkCpfT5wJanor1eQSweXur3kGePA0KRJvMK5TAB
 H8UQagjuGEgAjgojs4svCTAlHhh0Ir2INO/LHEgYgExeaecrkrYKpEG
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132528_937477_34BA16C5 
X-CRM114-Status: UNSURE (   8.68  )
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

This allows us to reboot the board from the OS.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 299b29e4df6e0a04c5769a568eba73ed1684a9e5..e90ae7845de7b79e55e9cd339a82313b423e0252 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -98,6 +98,11 @@ modem@10000000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x10000000 0xfffffff>;
 
+		reset-controller@1a00000 {
+			compatible = "rda,md-reset";
+			reg = <0x1a00000 0x4>;
+		};
+
 		rtc@1a06000 {
 			compatible = "rda,8810pl-rtc";
 			reg = <0x1a06000 0x1000>;

-- 
2.51.0



