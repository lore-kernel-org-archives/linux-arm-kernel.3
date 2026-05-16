Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC9CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 17:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDWv9YrP8hdAIlc8avQkeuY2v2Js4xanlx4nXuYWXko=; b=lybAATc8RWTTSrHRXLpXALdzVO
	ZeaPK2rpm6W2TsYNWy2yTRPqychDTr3shLkybos9j0czrbqTFRWdBdUteTwerP7HFq45B8AQiNaya
	YmImrCiyeMqCLmcBeLA5GTfzTJK4xnqGx7ZNl7GJ236cMwwElDRPfv5xhUovEQVNJaMCkdX7QEMWT
	dN4FYUmqM+SqOVMZIuvqlMAVsl3Q+f74p7OBGxGTZLH4paUWmmKLr2Y6kJz+0D703SWMyG9aiOFLX
	LaAKY+cPP9bRqqea30vchSRqrPpqF96jNL4kbD3z2IQ8tZVUz+KeQZqnU8yvROPyMtGwCDUXWMrx2
	aM+00c2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIen-0000000B5ep-3NqC;
	Sat, 16 May 2026 17:18:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIef-0000000B5VW-1iHB;
	Sat, 16 May 2026 17:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E61EC44622;
	Sat, 16 May 2026 17:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B13FFC2BCF5;
	Sat, 16 May 2026 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778951902;
	bh=fm/6sk7gCdpwISaGU9WT3cWYZ93Sf6uQPBQjjnBRxxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R2/gP6qh3cyks92N2UuNFBHalCc7hsnC2KEWZpMsgD+MsVy/mlJzAGQrkSZYkQkIu
	 amduRQe2V1iiwnY8OHJ5qobvAi71dk9XdFBu9VM8L33Yudzz0erYxqWAriHK4P0K4B
	 vSrYcdT94yVVZdc+e+oJUUNdnsRxmoHmTbhY1If1q+cWqJ4IXsQWzVtuFF/xqb0ptR
	 06a02re4/22JeNkY763AJqZVdJL6GpbUHyV8GTFU6C2ENmbY9xrl4lUwb3b6r2fsio
	 biLKlWw2D3bSZZDziai7gmbK521cK4q/zoyGkqz0UHxHRFY+6IyTgSlRPcp8Oaqqge
	 QLBoVxsLecpMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10D0CD4F48;
	Sat, 16 May 2026 17:18:22 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sat, 16 May 2026 19:17:08 +0200
Subject: [PATCH v6 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-add-mcu-fan-khadas-vim4-v6-8-cccc9b61f465@aliel.fr>
References: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
In-Reply-To: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=ReP9jX1LqZ1xk8srjfORg2VmRh0QSxflyWImCLygV1k=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxbHstsB3Uu+camfa9KbLV5qOpXbbz/HSsvY9j3LlcQm5
 XyMCJTpKGVhEONikBVTZOmfa3ni3eWjZ77uUU+BmcPKBDKEgYtTACaitIPhn/ZN5tis9Wyz7DzP
 bL8wqzqumkle0fJPcn7Ok5+HtRnWGDD8szP+tfWtY46nxVabPac+Gh7akSnNuVV3v+u0td5ijb4
 qXAA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_101825_616625_D2445441 
X-CRM114-Status: UNSURE (   8.41  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Enable and configure i2c MCU node to get fan working on Khadas VIM4.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..5d7f5390f3a66 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -157,6 +157,19 @@ wifi32k: wifi32k {
 	};
 };
 
+&i2c_m_ao_a {
+	status = "okay";
+	pinctrl-0 = <&i2c0_ao_d_pins>;
+	pinctrl-names = "default";
+
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,vim4-mcu";
+		reg = <0x18>;
+		fan-supply = <&vcc5v>;
+		#cooling-cells = <2>;
+	};
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_pins>;

-- 
2.49.0



