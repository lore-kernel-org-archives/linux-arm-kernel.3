Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB0ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJIQiWkgB4AInE9n12DbAJF2fbihCnUqwsNzAIdNdKk=; b=n1BogFYaxvXE3EZrlptjAs80KO
	jzS/NosVVOE6hbqiqqLNMt589/nn2WJIodHjCUFRRxDZH3zP1ylngaNeTKkcEhbFPH41O8KyniN5d
	Ob40mxiSPuF8yuM7hYr5uoWUBjoRys5U/8HXKTOCAPTd6K0yMAbwpFv6opOpnSs/aefTl57iSP8aw
	Lsdjl4SwIMEMlTw7e5kEEoL5T4H7xUG62/1UDnv05PNsc41jOIH+6p3peAobCZyVDDk7d9TrceXqq
	8NQEwpTkqYA/FTSjug7H2bB1AlpIsbqapO7mbA/4CbIrxQ5WRKnlE4juSH0+qd0uU1GNFFZeNW6FW
	FVh4iA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWW7-0000000FO0k-2KTE;
	Mon, 08 Sep 2025 07:42:23 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWJs-0000000FHru-3sjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:29:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757316460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJIQiWkgB4AInE9n12DbAJF2fbihCnUqwsNzAIdNdKk=;
	b=MTTgnw23A9YdbEDCSM7WyTzhFLgqc4Qd7TY0vTs5kKCzidQnR9fUAYyMQDD2jLUIINp4U8
	76Y3VnGW+vT2P7C19kDIXYU8gPed8+OsTcl2gBj4IK543MH56YRLYuKQ1fJs33FjWsfdio
	3+yq5vdTeSO799I1ugNbwa2KVKZjyDo=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 08 Sep 2025 09:26:56 +0200
Subject: [PATCH v2 2/3] ARM: dts: samsung: exynos5250: describe sromc bank
 memory map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-smdk5250-sromc-v2-2-e91b2375d4e1@grimler.se>
References: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
In-Reply-To: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=henrik@grimler.se;
 h=from:subject:message-id; bh=MdZEy+mKc13tFn5n0EEYzZw6bxpGTPBNamn20XR+u4c=;
 b=owGbwMvMwMG4gT3Pk7swMZvxtFoSQ8a+1iQd5hNph9YvyJFW/nTF+k+YVccMjYX7rt0+a1UYy
 qO/1CGxk9GfhYGRg8FSTJFFp15z3fRO+RTJlY/OwgxiZQKZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVHULs/91+SLufMeoKZOJvZfko43rs1ZpIo08mEh2htiy3F/+bxFYRwHdvG6+
 tZFthaHSe6/O7UpVrJobGdbg7qief3Hyqzk2/vHuulcv6iVFzkrcoKp9k2PjktGS6+NGJzPmLhF
 705ie4uYjJ985436RzZNYGaak/ndsvr/FY/elH/TkvfR/LA2IdJQzbTJd6PJu4tV5pzsEUJ/7V6
 3o319xWY/E8OOP44iZu1UkfVqbV6Nsf++VZtPvxvAN1/xvSK39yT/MWdnl5hEdlYpF/5xoZ7dqm
 RbOOc26by7pJUycs3S0j+1zp2Q8+JcJBO1Xy4g5p6Whc1Xj06Nr24NYlU96HpIQFCfxcx+jZ7Kw
 u+XMXAA==
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002945_096108_6F741F65 
X-CRM114-Status: UNSURE (   9.10  )
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

According to public user manual for Exynos 5250 [1], the SROM
controller has 4 banks, at same addresses as for example Exynos
5410. Describe the bank memory map of the SoC.

[1] https://web.archive.org/web/20130921194458/http://www.samsung.com/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul_Public_REV100-0.pdf

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/samsung/exynos5250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
index b9e7c493881804647534b1d7395f6eb62a07fb92..4616794b19e8c5c341d7a7d3cfe2b16bbd8c840c 100644
--- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
@@ -1214,6 +1214,15 @@ &serial_3 {
 	dma-names = "rx", "tx";
 };
 
+&sromc {
+	#address-cells = <2>;
+	#size-cells = <1>;
+	ranges = <0 0 0x04000000 0x20000>,
+		 <1 0 0x05000000 0x20000>,
+		 <2 0 0x06000000 0x20000>,
+		 <3 0 0x07000000 0x20000>;
+};
+
 &sss {
 	clocks = <&clock CLK_SSS>;
 	clock-names = "secss";

-- 
2.50.1


