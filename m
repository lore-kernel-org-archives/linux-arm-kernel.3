Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DB6E92FD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMc9N3kKI3AsAILH21Km2vm4HyahKMpFfcgg1lqbGhA=; b=bYZKViBPuHiXlip5e/SnuJa69X
	XzqM3SXsIGkDdL1meoOQERDhkCFYFszB9iRaoweR4DURRhZWtQT7BkfqgezA3VmuGNtK6knxxYgaS
	ZVXNjpWDVXr+5SUQFvlq8MKR3YaSjtFJrFhaX21qrEIGbehwW+pu1m9qRrhFNA41UdBHK3XqwTzy/
	hOQcwSSiDKsrnJHz2CDgShbtG+/Oq5WaTLXzLJ6Yk90XGYLkD87nfhQqUasHi3YQ4DMnKIl1RxF/b
	OEXntuPRB/Do586JQlWNkZhocKfAqGq0JRvQwmDgMGFPc8M4oSzmKBj078grASlFkmV3VtoLWV4Vz
	QGdbPezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIkm-000000040F7-3zC8;
	Mon, 29 Dec 2025 19:18:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIkb-000000040CQ-2roY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 19:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 678E4443AD;
	Mon, 29 Dec 2025 19:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8F1C4CEF7;
	Mon, 29 Dec 2025 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767035873;
	bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hbAzqKEZmOT4OAvGjay6ZbKxfEn89vFk6+M+/mrBS95qYTDFYK6teKSpepbtbDVhB
	 zVXaWcqu8M/VicJWW81BU0DhomB4O89rfl91yekn8Sd4aHeZLh1lAqdIXm3W4czws6
	 bKs11DMTutMn5CWlVIk2rYic1zabSCi4UVuhtROByqkED1kK9jdCYbjbgflZTKzeRE
	 5REfAeRWGXVrAriI6asDhF59r/DM1zwjOyAbOEtqtWEsmKkivYmBW2eLrSMSvT+GTM
	 W1IlAnfSamIwk9sqANNok68HO6uzO/lVgGLgLPKspXX7NCfsu752o5Q/tP4l62R66y
	 F8+j0fB+S84Ng==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 29 Dec 2025 13:17:19 -0600
Subject: [PATCH 2/2] Revert "arm: dts: socfpga: use reset-name
 "stmmaceth-ocp" instead of "ahb""
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-remove_ocp-v1-2-594294e04bd4@kernel.org>
References: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
In-Reply-To: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=d2TRHYORZXsy2A1NvCNofvbS7eDma5sCMXLSKryxZ+A=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpUtPcHIcFizytq0dGZkNW22rpAEY2qpU74OH1O
 vbi6hJ2X7eJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVLT3AAKCRAZlAQLgaMo
 9FG2D/9jgiEwhyxfOr5Mo/+NnTLWSreSDld5RyR7AHNijUW/gR6BWUBKC1AHObHTYPrGVx4EIFf
 CJUPAZAzCSbL7Q9WViMlHQH4JQcyHA6kEOdiPMlFbqjuppjhr449jsqofenGJFm/gC3JT30vYPy
 8LyhPX1b7P4mMX7ySrXDVJx4B5RGB9Sy7Cv2175rjrgLV1CRpvzxdTVE+bU9/IpFa6sBMhBf0sB
 7qDwsSmc2vYHBWecOjM1CfQ0RGTecYFrnXzleh8jrZM3xJqDkr5o3wqG1SmYadsiukMQX6tRfTG
 eagGt829RmEzvNIO1mu2CQdsx34EdwcAclUW+h+AUUShShSlpbtlotxxjziaikFRHeQ/szfeLlW
 Z3d9IFkMSOcy3Yom13452NSZajaL1gV85ijQk+3yu7dznepFMvyso4iIkYB/zj9lq9dH1S3KK3x
 MURAtDLL+o1zvT/gwOusDI49QcziwRWaxjkabzuNxMujPGVHi9slExTjdOhL58gmBiPrGvk7Vmj
 yxzo7dmotSivdQ0KQnFKRlEFMBN8N+Gs1ASuYmFwTFSwpC6I/jzxxTy6JvXj/zvSP7pXb8pzxvp
 cZ3Ej7YqYzzecHH+lBIHAuS3+No+VvQP7UpBXdV4V7paWM4XpTMODhqmYppkELZVWfqatiIG9GU
 MWd8Sx8Kg4lRuHQ==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_111753_782431_44C22219 
X-CRM114-Status: UNSURE (   9.79  )
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

This reverts commit 62a40a0d5634834790f7166ab592be247390d857.

With the patch "add call to assert/deassert ahb reset line" in place, we can
safely remove the "stmmaceth-ocp" reset name and just use the standard
"ahb" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index b108265e9bde..6b6e77596ffa 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -440,7 +440,7 @@ gmac0: ethernet@ff800000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -460,7 +460,7 @@ gmac1: ethernet@ff802000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};
@@ -480,7 +480,7 @@ gmac2: ethernet@ff804000 {
 			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
 			clock-names = "stmmaceth", "ptp_ref";
 			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
-			reset-names = "stmmaceth", "stmmaceth-ocp";
+			reset-names = "stmmaceth", "ahb";
 			snps,axi-config = <&socfpga_axi_setup>;
 			status = "disabled";
 		};

-- 
2.42.0.411.g813d9a9188


