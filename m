Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C385C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRcH/eHQm5mS4X7voC0Jy7SUfTjo7Kv8eDq6w4o/DDU=; b=L6b0Q65SkVf5M2pQr8TPFv1As6
	0oSmTc80JEZmtuqq01TI7eupvuqYLz+8+WoUmo6Pw5YN7A+l2ZT3aPIPP4SFO4hmqHj/pDMF7fDlM
	I429DZD9L8irVEiokRO8c6hNh2cqeXw94UnAfAaEoEE295g44J5NG1EzLZqrKZOJqb9rNg6A/6EN/
	MMBijUM1wcYbhcbPCms3GhoQVf7y7I5t2JKR+bR2vFIS2cODwoLClFoie12LxKg0W0NiomOs+S9+c
	IkZnrRkVyHzxFJj51kQT2gxMtI7AQc9atNjrcyQi4UStxTu4LjzXdZoQpHzO3SKFnCKG7NnMpOuH/
	WxuFB/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8rj-0000000633m-1P5O;
	Mon, 17 Feb 2025 21:41:23 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8jT-000000061WQ-2DWC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 21:32:52 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=eYj3ws0lIGsVHsw3N0VISHwu3eK10dmpNuKwriaKXMewIeqstQmYqcC6SVFx2RA2uj+TbwUKhSj5xi95BcoKWLPfUZsOwSfrA6BLo0p6t6h/wzS173iJnmVPwfkP4xUwuCpLLanKxk3HA8Am6v0slaeUeNMVUvP39pKJavIcyYcV4fiBE8M1GOe2emvkvXnJgMn+sBzH9fToaUd2ZV/FbVTpjX3pnTx8GQ0mEBOY1GUVVwmUA/9EswdvD4KMO3uZk90G2Au7S1zmieKVdQZ/aIaFfWBRkCNlxOjdR/JH9E82sUJ3Rejmwy/IUAj4O1ci/+4wokKB8gQAfXIsLgR32g==; s=purelymail3; d=purelymail.com; v=1; bh=d90e+aG/dLPhZ45Wax0yq+hKJxVgTdMsCYq09/QZQ0s=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 42194286;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 21:32:37 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 22:32:05 +0100
Subject: [PATCH 3/5] arm64: dts: exynos990-x1s-common: Enable USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-dt-changes-febuary-v1-3-99935218cbf4@mentallysanemainliners.org>
References: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739827951; l=1301;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=d90e+aG/dLPhZ45Wax0yq+hKJxVgTdMsCYq09/QZQ0s=;
 b=Obkdhx9gjqTphT/XZf+SeeVBwNcPUVVI4LdkeHzZTZyuX9KjyvyWQzNj5ap2XocW4QEGQPAOq
 fDOeWiQk3dNBUD31zENjl+XuJqR0tH+pZwbe15BUTRBTDCM3TTRHcgf
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133251_650000_CCB14A34 
X-CRM114-Status: UNSURE (   8.80  )
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

The x1s family uses a shared USB configuration. Enable both the
USB PHY as well as the DWC3 controller.

Since we do not have any PMIC for USB implemented yet, use dummy
regulators until we do.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
index 55fa8e9e05db8af51109d20d74cbd7b9a2af38df..7b97220cccb7442dbc5a9f31ae9b9124bee85c62 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
@@ -27,6 +27,12 @@ framebuffer0: framebuffer@f1000000 {
 		};
 	};
 
+	/* TODO: Remove this once PMIC is implemented */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -96,3 +102,13 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.47.2


