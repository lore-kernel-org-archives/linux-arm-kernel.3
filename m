Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F98CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7ZAexcl7NA+Yx5jyarUQkkoImsrTDPo+86HgrQfNaw=; b=WQObzMFpjgUB20gNBCudxlYoXo
	2GfWyIfEabaEdABZw58F8jKGgjmOgrfoV2O51Za4VesW7jf+3EcB1vz/AowwgP63NJmWTqxUJ0bv0
	Y2SEiF0S5dTgtXBZQdR2HL8a1HLX63WBJGfYs81ajJASZEnd5LwX0THkA/qdLKM4++Yq3i41bpKii
	cFFxrVLfS2PhxSkjdb5H9ZvDS3xzPzDDG5M1XQJj5cvYRCaShMEzKi65QfrP+cf+tm4fLk5oUKxFs
	aasV0srvppGvhVf1BHd7feo77ZB3NpGfDsDw9H2NSaOsCsjpCubBbT529U6lbOfxgQPK2eyBN/gKA
	1I4K+mIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Jn-00000009Tyh-0uto;
	Thu, 04 Sep 2025 06:19:35 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3BW-00000009RBp-1uB4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 06:11:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756966260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7ZAexcl7NA+Yx5jyarUQkkoImsrTDPo+86HgrQfNaw=;
	b=cG2eG5xXds808wU3nuEWB6Er2ulibXKlSPJNLqTW0LmflDACh57LiEN6ziu2GOd8XjmnDe
	OiVhHsLfvrhqe2xY9yORam2uNLyFtVlSxmMggXDr2CyEqA6RioRp0ZnNzrMMX7wFv5tjd2
	j3Rtu4XUMf9qIk+p6y0k7yCYfsH/12Q=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 04 Sep 2025 08:10:11 +0200
Subject: [PATCH 2/2] ARM: dts: samsung: smdk5250: add sromc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-smdk5250-sromc-v1-2-b360c6ab01c6@grimler.se>
References: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
In-Reply-To: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=henrik@grimler.se;
 h=from:subject:message-id; bh=+RqIKnwtu57DKNAvk31YMXlcTX+OWZxeh3S/lJS5aIU=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBouS1sON8k/3z9OyHSqL6ujTUeUuezO/9jrm17a
 k1vOsgJHq+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaLktbAAKCRCwB25JC3Fh
 a5dMB/9EeVN7NTfjd0ja0jjzlrzz6T4MZ05OSDqMtcNECYRZy78B2rId76xLOynzJz1hc79Ita1
 Hdx8yo3NBnlA8M9BYIRr0VvHpKCOSYR8xJZzycn+EiHlFbNzB+XsUaunxrhDFDL7zlMPDBiC3jd
 IDt+avz6eUgBlP/ocyG92bxh+C2ePyqQYABv/SpkVHzIgFVkkDE6u0df/b/beYfP/fFfasGKJDA
 qET4uNO8Y3LiVHzzbUikq4jJJSqqHHRlffXrlB4SeTIr4j2EwTbhy1UwSLS276Uw5/YSL5ZJeel
 OJYCfjky5g7FoRDdUMhFgT+dgGfHm9GTy0IgK4WF6LkjNz+Z
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_231102_639523_D96D60DE 
X-CRM114-Status: UNSURE (   8.85  )
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

The smdk5250 board has an ethernet port which is connected to bank 1
of the SROM controller. Describe it.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index bb623726ef1e614c50074ec2890072b2b37d212e..6af1f64c984ba6e8344d759d2feb7fbfa320d81f 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -422,6 +422,43 @@ max77686_irq: max77686-irq-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
+
+	srom_ctl: srom-ctl-pins {
+		samsung,pins = "gpy0-3", "gpy0-4", "gpy0-5",
+			       "gpy1-0", "gpy1-1", "gpy1-2", "gpy1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	srom_ebi: srom-ebi-pins {
+		samsung,pins = "gpy3-0", "gpy3-1", "gpy3-2", "gpy3-3",
+			       "gpy3-4", "gpy3-5", "gpy3-6", "gpy3-7",
+			       "gpy5-0", "gpy5-1", "gpy5-2", "gpy5-3",
+			       "gpy5-4", "gpy5-5", "gpy5-6", "gpy5-7",
+			       "gpy6-0", "gpy6-1", "gpy6-2", "gpy6-3",
+			       "gpy6-4", "gpy6-5", "gpy6-6", "gpy6-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+};
+
+&sromc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&srom_ctl>, <&srom_ebi>;
+
+	ethernet@1,0 {
+		compatible = "smsc,lan9115";
+		reg = <1 0 0x100>;
+		phy-mode = "mii";
+		smsc,irq-push-pull;
+		interrupt-parent = <&gpx0>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		reg-io-width = <2>;
+
+		samsung,srom-page-mode;
+		samsung,srom-timing = <9 12 1 6 1 1>;
+	};
 };
 
 &usbdrd {

-- 
2.51.0


