Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E65D39433
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+uHMPmn65nf4xfn83FGk5CdKaMUfgweu+nZ5kCt3uw=; b=pvgRbBveZF3FY0Y7oYmJsGrUVp
	1iY0TY2ExMya3+6dYTgrurMac8S+F3vfCR+jHv9D69Hu466ed5o0l/ZoR4HLZMpPlJGwfPQ2x11Cv
	t8KGSiYwm22oOwJ7TWVmX9tUkqNABFkeHtXFrMP8xxD3q8xyHbSYc+S0jQDsjU4y0F7sRuLj78Q4/
	i9iAFbgXILXUz7Iu/00jtWOjgUFmgPUxzD9UGZc18dAmhsFOa6o0vhVelz4HXtmzPVr/plYxc7/jk
	Q+5powb+7HeilvGFUXeDrDOdZV95VoPUll3MoWk6M3XG13c4CXKBssear/hf6Bq/p5sa6ok5yHThr
	7LSfhWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1T-00000000Kdz-48ek;
	Thu, 02 Apr 2026 14:27:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1Q-00000000KXm-0pK5;
	Thu, 02 Apr 2026 14:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f+uHMPmn65nf4xfn83FGk5CdKaMUfgweu+nZ5kCt3uw=; b=A/KjCqwYRp9KsEvGWeMQuV67bW
	30ge7WKo0/Wsdcq2ekmd6sptQ1kNMTAj/Kfg+W8WfmW4NuB7hg19I8V0xL1+/d+Deetktdza1Q1g3
	f/9QQSEHGdusd9tStPolFRInNZlr4xDsVIJremAMafxFlWjQhLzo/hFmXNLLHW7k7eiN0uavLblQK
	wEQJnPjvK0PIh2hm1u5HyioZzief47CpFHuNJV0OK1XsiPxRJZcC6sramiTXwheLDrjkvpEhNGdxL
	0pShNiVeI15xFQYagcKi+uqMryKkYF/hlRl3Ph1mIgmj7k+o3EnFu9yHPJyRu83EXlVG67pAzcjlG
	MSrYl7Ng==;
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J1N-00000002gBB-1QFG;
	Thu, 02 Apr 2026 14:27:47 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775140058;
	bh=Y66wwsu4uCJ5vCnrkH5iYoYFi2DeQ8efaTE8Rt+0Rik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EVMMjBIjiOTCaNxLLaCK+iDdH7W6EYa7WJTOUJ224aNjkEDqNF/dWqmRwPdR5dxzC
	 x0sicdGKv9SDHjWee1qufpgv9IdG+0LWxg1YA7A7vkS8Ug2caCPrzNNsZ0DfT3WE4k
	 nEyb3B7fWPDt/bj8ewJ8J22rcseXH3CLj8OBrv1Q=
Date: Thu, 02 Apr 2026 16:27:06 +0200
Subject: [PATCH 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-add-mcu-fan-khadas-vim4-v1-6-2b12eb4ac7b0@aliel.fr>
References: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
In-Reply-To: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775140050; l=835;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=Y66wwsu4uCJ5vCnrkH5iYoYFi2DeQ8efaTE8Rt+0Rik=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAOXtWVhdrgy5Ga2amx5vEFMrZwHcJBSErea+9F5XoCOwRPeGnHa0nta1SPanLIrQhlhZn2HmB1
 ThwIjU2gB3wg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_152745_590327_5F4ECB20 
X-CRM114-Status: UNSURE (   7.74  )
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

Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..e96fe10b251a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,16 @@ mux {
 					};
 				};
 
+				i2c0_ao_d_pins: i2c0-ao-d {
+					mux {
+						groups = "i2c0_ao_sck_d",
+							 "i2c0_ao_sda_d";
+						function = "i2c0_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
 				pwm_a_pins: pwm-a {
 					mux {
 						groups = "pwm_a";

-- 
2.49.0


