Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08CCCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf0H7QoIfbnmILBxECq1C31tKiAGx2tzl4Q2/pUkfJk=; b=HT4S/zYFwUoROinx3/SedZuwzb
	1C3U7r+xiWwd9Bf8LUfHiGRgC3mNJcYkXpUBHiJ+RIx3sC66DJU7FElA5enn+3J/CYKdXkK5LUiKM
	E1h1CEAJzRMHbCKReYT+ko+nA7ntPTkhzgov3E342QqKSGE3Mb5QF4TuB//e2dVr5B2nuNyrQTEsD
	N4Kucw1jiNLBE0AnCxZPXfsq0KSOqPQHsWWpsnRyjOXw6j/0833xSyeJEAyQ8JfjPACAT8Z/PQODl
	uwMOJ+Cw2QOiVKomm72FxjWiVrHSr8AUbIXICOks940BfPR+cvYm7gPvta+pvCvyc/YLoJM2Sm1Ml
	KbJEio7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWKr-0000000FJ6X-0upR;
	Mon, 08 Sep 2025 07:30:45 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWHx-0000000FHsi-0BtA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:27:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757316461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qf0H7QoIfbnmILBxECq1C31tKiAGx2tzl4Q2/pUkfJk=;
	b=YAb9UJOdNfAdBdUcOr9zoP2B0m6jYnebtf1L6ZdPb5du+/zAHd99R92ALmkx57dEl2keWe
	B50lggUXp6k5CE/U7t878jAEQF6iTWtwfBeqnQG5ulOWAOKrSFj003iypRcfiarMUDCFGs
	/eHYR14EPkIfRimVgGi5wF/jRPVOUH4=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 08 Sep 2025 09:26:57 +0200
Subject: [PATCH v2 3/3] ARM: dts: samsung: smdk5250: add sromc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-smdk5250-sromc-v2-3-e91b2375d4e1@grimler.se>
References: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
In-Reply-To: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=henrik@grimler.se;
 h=from:subject:message-id; bh=KbAwoB544VyfCgkR76wI4YxdNXzKpy0aQUcINDilY6g=;
 b=owEBiQF2/pANAwAIAbAHbkkLcWFrAcsmYgBovoVmJ+CJlZHTjGj6B+4MqsiNwFEHTNeZ8+S7m
 hKBOOMUhHCJAU8EAAEIADkWIQQsfymul4kfZBmp4s2wB25JC3FhawUCaL6FZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwzLDIACgkQsAduSQtxYWvPrggAjttFAwf5leCiLCD6s5sQp7+yGr9EbxZ
 Y7ogrGP/po6WydYPPB0PeiPio4vClMpWLXqcmZj1RNHmrFkLdka/iRy9OoyK/GrKlQKtBbbtZPg
 QwElEOTA1RAnKlxDa6OcC8XRAfugGTxUrgpSBF7+Rwf34IMNzJU5Z8ZNBn+hn1xJZyX9VtgpT5H
 Of+hP7shbRGttGrbZEKGXGia4Q0L08nlWQms8psPaUC5UUbU/86GXZ0iFRNkTTRrmrvSmQAYtC0
 Xs0EpAIPt29KyRCTXxzbyg0frphNKJl4QYLE9Ur6A+vKntzP39hHU8FbvjpfAJ4Z86q/ExkRy6x
 SWFUCunGE1w==
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002745_776174_FCBB13CA 
X-CRM114-Status: UNSURE (   9.25  )
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
2.50.1


