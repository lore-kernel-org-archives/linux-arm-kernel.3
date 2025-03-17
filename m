Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+EHkmV+g81uXqwV9DQ+Z/qIc6Gj3dXEC9TtIp8j92I=; b=I2nXOzk8aYgvjwaL/L++RVGemq
	EcldWncJERykuxX2W3UZDttisTyhNiA7zxTXvZa1cNSh6jm3s7uXBdMlXD8km1MIM0UniTcq14bAp
	Eh3Oc/AyvX95eikVOH+8/phIy3B2wHBW0/4GfbETV2wE7SdfD+9T5nlmOjhXyAvh9TBKMqzxS1Yag
	iCmH177P/Tw+i/Iv6IxWNNOCiD9T/dvhAjXy9X4xXqUR5hkilhb9WRLqfoIzEDOBs1H2j19xCQ/bG
	Ta1rNjFzZQsjOD1hX5yoCwP6FBVxWhdrE7G0goclYuVVgiWNZetnbhwYYYKx3grr8nLoVzKPWMcbZ
	NXRBTfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4u8-00000001ZkH-2ym7;
	Mon, 17 Mar 2025 07:28:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4iW-00000001WmU-1gJF;
	Mon, 17 Mar 2025 07:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9656BA46D29;
	Mon, 17 Mar 2025 07:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E058C4CEF5;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742195814;
	bh=oxoucKNcYzlokTUMj0RVOyzYN7CVa0nZcJ14gXbMUjQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cwKLSESh3mV4ir0uJW47nVWadAarSWPK/0+sHQ8lb7GazxW9bwSFR0IujDOmboaHy
	 MDciwZQ64UrI98ObW78jIBEqf3JDJsrwkrpYR50WIgKkRw4hguv+v2em9QD7jdhQGA
	 +SzdqOWy2Dzk054JZ3dZPiCllQ48Zvzs4LQBk3+41Kdo/GZH1ixby3+mKUnXzNvajT
	 IYkjoRljboobMOvimGdgjC848p5RlCwzlvZI5NyKNGBXFb0D8qFxeq0uwj7S3rgpyy
	 MPZktxMiyPRJ3aGwfEQBVNnKfgoNyjHS+VnsfMLYzHmGggdbfI+TaGB9/AvqP/4cqi
	 h9/dRA3qdlmog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E38DC35FFA;
	Mon, 17 Mar 2025 07:16:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Mar 2025 15:16:55 +0800
Subject: [PATCH 4/7] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for S6/S7/S7D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-s6-s7-basic-v1-4-d653384e41f3@amlogic.com>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742195812; l=995;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8tWndSz2wgG4AKPpBkmzvXgp+1cbCi/8NB7D0Mgsh2s=;
 b=oGCmPQDQlNKAJdrYHGunPq9vAAqeWtaF/57Ac1nzwBMiRecNx7K5knkP/r7VuG6g1CavemmhE
 s6r9Mv9O4g6CvZVdRwyi7GI4Y+Y8Th7g2vtT8rIXbQA5R59TNBzWjGM
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_001656_533212_A5A70CCD 
X-CRM114-Status: UNSURE (   7.75  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic S6/S7/7D SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add S6/S7/S7D compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 0565fb7649c5..d8ad1bb6172d 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -56,6 +56,9 @@ properties:
         items:
           - enum:
               - amlogic,a4-uart
+              - amlogic,s6-uart
+              - amlogic,s7-uart
+              - amlogic,s7d-uart
               - amlogic,t7-uart
           - const: amlogic,meson-s4-uart
 

-- 
2.37.1



