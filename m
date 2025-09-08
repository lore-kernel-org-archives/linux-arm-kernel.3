Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B35CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjpt8Wfk2LLSDqvXhNKwiJHgJRa+rYaAGISREh5isEU=; b=PxzQ2mj2m2VdNOe8vHwJH4gFxn
	6OHwdZhXq6auECYnj/49b2kSh00090ALkMX/X1UT7TRO4+Pdoc+oArz83WJuajVFwgKsu2z81w9wb
	RwZWUmuxOhChOv3FTz889ul8FNZSPtdQqKDuAV8Nfl8GbhplPJqkN1CBjuQj68GzZp4p8mzrZVltZ
	CHFbcAFJNrJPP/vThq4PFk4mw94YH8LSzoh7CZOmEQ8TFZPWAuVfwfoAt55tsdFTjNG/JC3LM3mmj
	YP6sfchEAEBetIaXntUSf5z6iRy7TmdgGmlNtM9MpvRscaHviyI5/a8B33ekMJS1CRn2RMX/OfKBm
	f6D/yKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWNg-0000000FKNd-0Lov;
	Mon, 08 Sep 2025 07:33:40 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWI2-0000000FHxb-2epa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:27:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757316459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjpt8Wfk2LLSDqvXhNKwiJHgJRa+rYaAGISREh5isEU=;
	b=cSwe7GFmvaTFQOm0oDcdoeV857jqy/DP++daEEF2HzKkEOuEi4Le/uQ9S8igvHxrNo746m
	T3LBE9GDv0SzZXw+jDfu8DpalxI2/5k/uGT2YBI2AE9G6AxtDiAGz+U+NgWyupSG8NtOWq
	3k4fo/99OCliTWqMStrI++nfcGCBdm8=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 08 Sep 2025 09:26:55 +0200
Subject: [PATCH v2 1/3] ARM: dts: samsung: exynos5410: use multiple tuples
 for sromc ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-smdk5250-sromc-v2-1-e91b2375d4e1@grimler.se>
References: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
In-Reply-To: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=henrik@grimler.se;
 h=from:subject:message-id; bh=jTp6dX+KTbrPXH64j5P/UlCrVJyk8SPU7cS21XqAE9Y=;
 b=owGbwMvMwMG4gT3Pk7swMZvxtFoSQ8a+1rhbF+a+sLAvf7GJLXJ+xbaHlw8mXdjoIuGbmdcSv
 fZR58kDnYz+LAyMHAyWYoosOvWa66Z3yqdIrnx0FmYQKxPIFGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICp7o3kYJi0ccZT72fXpnm2X7Roi5HSy7Wvm5VgPNHz9ub9/DnfF70J0eCe84t
 fkn3ea1k1tcqPSamuQo5fNVYvLBM+WZSUeN3+4cIH4jclCs7vKn9S0qB5iDeQ5ZuBwZa4wBMfzT
 Z6s4txL5G9c5VrX8XM9qRedV6L1KADj64+/3e82Ml7pZFqn/fNNUv6O/0+RX91eXjwkV+f5ZtGj
 R3bLRZXrYjQjixfuSJKomWprZexLr+7a97SpaUL3v2QbP/IKPuadY9JjFhmzgNW1VXx0w6e+Zx8
 oX9HTvx15pgFJ6pkT1vfZPujeOb7p7+KT266skqWBl+OS5X5fkFM6ORScyXZ1MNlW7LtVVhsXq5
 Q+pHCCAA=
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002750_823824_CCEC1490 
X-CRM114-Status: UNSURE (   9.78  )
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

Preferred style is to have comma separated tuples when multiple
addresses and sizes are defined in ranges. Therefore, change the
format to clarify the node.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/samsung/exynos5410.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5410.dtsi b/arch/arm/boot/dts/samsung/exynos5410.dtsi
index 546035e78f404d764cb653ce25b73778c53fac0b..350bc8d6aa5ce8cc7c28606fb56bbcd748fdbf68 100644
--- a/arch/arm/boot/dts/samsung/exynos5410.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5410.dtsi
@@ -372,10 +372,10 @@ &sss {
 &sromc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	ranges = <0 0 0x04000000 0x20000
-		  1 0 0x05000000 0x20000
-		  2 0 0x06000000 0x20000
-		  3 0 0x07000000 0x20000>;
+	ranges = <0 0 0x04000000 0x20000>,
+		 <1 0 0x05000000 0x20000>,
+		 <2 0 0x06000000 0x20000>,
+		 <3 0 0x07000000 0x20000>;
 };
 
 &trng {

-- 
2.50.1


