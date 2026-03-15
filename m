Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C8DF3027F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GNrPEyReGCpd+nrV1NbW13LMkqH8in4zXquUe9AF9E=; b=WnEk5Bo2RPPEuvyr3QRVTxcDOn
	pua3dpOc25TlqGy33VKiQQo4qAijh7c+9Dtj3eBO41IFFZqMlDaoca+PigOWvBgFrZV28ehI4p5zr
	Dn1iWpeq7oBEjI0w70KrVH252zCkZ/IH4G3v/c13AuVQtiChSnhSNKmc9OP6sBL0g+YpPSIC0aEc/
	NTjQcsH5Tc64AoI4RGycCHAsS93Ct+VBP23TfKVu5L+HzTXz1xK7kTSuo9vJwJPcPz7tPI63ZFCSr
	e0YMFh2ZmBbIzhqhsSgbxZCyU8WT8o74Go61amFCN97ct/XtkRiw0auEmqxOObvZB2j0GgMPtigSt
	Y4g6G1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qaL-00000002pRP-2gN9;
	Sun, 15 Mar 2026 18:53:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa8-00000002pIl-0zOg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27DB644706;
	Sun, 15 Mar 2026 18:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D600EC2BCFA;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600774;
	bh=DRN8Y2azyPABZr+mUTsY8ADaTpvTOyUxWI2eOU/dWp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OAeXjpl+VhkelY+3qCifOb7WHdtRSrnVmMkjj2LOJIvj23739HrT0R5pLuubtxWro
	 nxJRoN+orRQTNanig4BZJRTpXvYGrNeR5k1UIJ/y6HTSGgwiN++0+4R6AMrzLUs4OO
	 KGKBZpjV+wfMScHLKwiWp2MugwoN3KxnMxHc9rM1NC2hlsN0P/VSqedJlJpqElBkUa
	 DGCL4yrw2aoTHlL27dtpH5mXMsInCogpBvjKz9iYgBLQurJpppz2rjfe2BsDSZtul8
	 8QS7zI6rkq5X06ji/XjOpXjXmCgWgAVUyOyOOGxtVKeYTUMs4L5sa5nXx/bvOK2EqT
	 MIrjlWubT30uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDDDF30282;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:47 +0100
Subject: [PATCH WIP v2 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GLiD2nULc18ENMziPB9JyYEPA1R8XKpCMXaNSc0DKdU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/6OhC8SocPmih7wGnZLPlUoktbgC3LKcDkk
 rb7jDcfKtuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+gAKCRBgAj/E00kg
 cjyAEACecNgd/QeeVImpnVd0/qO9+NmYGuaGVLUdkOlwiR1azyYsPURJ0BoyOPVPUtW2SARrkbp
 /8y+IyIkP6AfVP++jl5EJ6Yb7RANAZofa7WRVNE7EPvM+AinjYj7tk5DCxmS+XbjjG+2fsOZL4n
 Dl0gV1yktFmywT+QT8MjjBZDsgbfZpLBjqJxQmtL4QLcK4bgb78wF0XiWrL4LRdHzKAU6OlpJaI
 LLZhvv4S1aZDfByji/VpDBP7wd78ADZmLqgk1qJrkzJGUpvMdkBWuNNy0ShAPwPQ/6qBCLxBMfi
 KGv68gmommlUQfPd6LWmEX9MRo8aVQloJoeJsr59cRpxKhqYzVENlAF0F2K02rH+CYwz+L1mrER
 z0r96/B3M1MbE3+C2x0pQaXCgiROmD9uWKcQdaURbtuTU7ZPh8a2o/HyfGotrhpkp7dpHd+gaW6
 nWbiiAQACYEfnCaawvKmRL5nX4eUXAN95YFnE9twgQpyQDKJjRMmpAmPpjqF97P3p7LTMpuutth
 cGBOEnjMVoyfpjhAt1qL3bw8zlbnbds2TzfEgRV7jZTAC5o+q6oR4UwDc7HpU3jorAULWVBzD+h
 T88D7ApzdQs8qIaVXoxc9Tf55Dwv6W/74Eed+xnAqYOhVLlW1Knj7K8nSzP+kO6QAFxtb8DY0I4
 yXJg9gbgW+l2ccw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_115256_390228_67EE5F2B 
X-CRM114-Status: UNSURE (   9.86  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..48d7e7f83c285 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -26,7 +26,25 @@ &i2c2 {
 
 	status = "okay";
 
-	/* ST,FTS @ 49 */
+	touchscreen@49 {
+		compatible = "st,stmfts5";
+		reg = <0x49>;
+
+		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
+
+		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l19a_3p3>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2160>;
+	};
 };
 
 &mdss_dsi0 {

-- 
2.53.0



