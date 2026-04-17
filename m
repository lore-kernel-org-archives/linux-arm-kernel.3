Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606F4F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GR9/A/hNZTXKhRvSR861tqyCyThHRTUkf4TwCWShFA=; b=urqrSmSgOHQdV0W/vr6NI/RPEB
	Wpp92C+UzaJM8K5+wq1CGitlzfqfwlgMz/aOkoRIrCLp4v7f64/UjbhJ3aEErDQWODSLa6XA30A1c
	GRylD6P10VF0i1rB0mkuKuk/EJvz445X/09sjoA9+AftPf/k0KfyX6afiQlHc3ZAXwWjlKFzhK/Y3
	7A2JVWmhWQK5Dsm55FmrmWWWqreeH9OlO123Ef4H12wEhZOIsP2tE6JvLBkXAGkw8MdQXNMiMQBw5
	lHGPWYpcIJlgkyPd4DGrZKcMGWXzMSrrxelfdGHXEeywJ14KVyHsiJrXE63e7ZWNbC2wfonBNAszC
	cojIYnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmBz-00000004H3P-3i7Y;
	Fri, 17 Apr 2026 16:37:19 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmBr-00000004GrK-0UyZ;
	Fri, 17 Apr 2026 16:37:13 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776443828;
	bh=tWFcpje6b/UPuUaynpp5o+HzSsytJcZL6uVNyAgG8qQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UKyaeMjWUcKnD9zAv8zJPBSrnqk2n1SMU4oVAjw9yGbs0yL6FDVhoo0Ric2waZGe4
	 hU+M+CY4LNI23hIXLtuDmxtraU8btUsAvPfa/ZYQbvn2BYSliD+8DZYPg9+RiUAD6z
	 IbSm8Gw5L8PY1mio8dSEBIoojMvYTcvZ9Xj0kaPw=
Date: Fri, 17 Apr 2026 18:27:24 +0200
Subject: [PATCH v3 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-add-mcu-fan-khadas-vim4-v3-8-a6a7f570b11b@aliel.fr>
References: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
In-Reply-To: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776443818; l=969;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=tWFcpje6b/UPuUaynpp5o+HzSsytJcZL6uVNyAgG8qQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN/dYkD2B0h67pd/skbXv2YwanXlJWZMFNrSgKAnH7oN6KvpXQkf4z2/bVVV+yiQemeyiyg6rem
 mlbNijAs0cwo=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_093711_397201_52930FE9 
X-CRM114-Status: UNSURE (   7.19  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Enable and configure i2c MCU node to get fan working on Khadas VIM4.

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


