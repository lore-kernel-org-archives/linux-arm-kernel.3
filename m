Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67742606EEB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzoOQozL;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector2 header.b=X4zgyPC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WhmXURw+P/Jtah3L7NcpKPFAtgKqQYMYidsJk5jG/Z0=; b=AzoOQozLx23F2s
	J7lnd1M+GCKLdQqZzbJgV+slySoRhc4SD+BtZ9h8V2qv7EHPeEF4cLrZJyOc9VsDMQrLXE8QAkvWA
	iD/bZKl7pglSjLgMi+7yD9fQFjjUR9pvsyEPLilJULQWylg8Vw54O0vkqcZbGDefk7vHsmA2MHyz0
	eWc9APIChX9wczXoOfG2QoYSYBQ8m1Htdc+2sPip4g0/I2R9neaI2FhMyMcFJRl3l1OMogu4qQEPw
	OIA8oeikeUqfHYEST3P4GeLuLVtcVTC8GylzgR2NXWqHkyBRE9lfJ8sYiMKuwNu9THXNOfFKUYYdl
	vuM8p6Fu35k2qYKwXXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFCV-00000002gHL-3HSG;
	Tue, 03 Nov 2026 14:09:23 +0000
Received: from inva129.nxp.com ([92.121.32.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFCS-00000002gGI-3ZIx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:09:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by inva129.nxp.com (Postfix) with ESMTP id 4C87F6000292;
	Tue,  3 Nov 2026 15:09:17 +0100 (CET)
X-Virus-Scanned: amavis at nxp.com
Received: from inva129.nxp.com ([127.0.0.1])
 by localhost (inva129.nxp.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSiLwKMnAJYV; Tue,  3 Nov 2026 15:09:16 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva129.nxp.com (Postfix) with ESMTP id C1CB5600009F;
	Tue,  3 Nov 2026 15:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva129.nxp.com C1CB5600009F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
	s=nselector2; t=1793714956;
	bh=WhmXURw+P/Jtah3L7NcpKPFAtgKqQYMYidsJk5jG/Z0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4zgyPC9JEBp3s7awz5oJLpcJgzsyxKTBhf0xRJv/CfsICyvlbEfeMHmVBYymVxU5
	 c+69u3XaJUcXRXFZtsDoo72KK7hPUsugZX9M3KFpj0x+Lqlaqp3fhw0Jb9+d94W/Ku
	 0qjhzV+tg76mPbyEhKkEzuexBAy2w77VbqIE2hdpySNzu7JgsIp/TBoi6Iu4/GnNUy
	 pQ9BQR7s0odbfu7JncaxQ0cjXxPr+ZklMqGJsBb/GxSXeAQ4AnqmpU/NmcVwOmdDb1
	 pJVhI5KBxIKJ/LNuOBO+rfMXEZz7w0iZ57Ng7VA70zJcFnaayGCGVFjw8Td46EbBO9
	 B2m5sOAWqNYTQ==
Received: from lsv15141.swis.ro-buh01.nxp.com (lsv15141.swis.ro-buh01.nxp.com [10.162.246.138])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id F0FAB202AF;
	Tue,  3 Nov 2026 15:09:15 +0100 (CET)
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: netdev@vger.kernel.org
Cc: s32@nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/5] arm64: dts: s32n79: add NETC IEP18 ECAM node for ENETC PPM ports
Date: Tue,  3 Nov 2026 16:09:09 +0200
Message-Id: <c76cf39edbce4e576aa7a3fe1544767fc7026f96.1793712309.git.claudiu.manoil@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793712309.git.claudiu.manoil@nxp.com>
References: <cover.1793712309.git.claudiu.manoil@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_060921_024548_D44E3F19 
X-CRM114-Status: GOOD (  11.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the netc_iep18 PCIe ECAM host node describing the NETC integrated
endpoint bus allocated to the first Linux cohort on S32N79. The bus is
enumerated via the generic pci-host-ecam-generic driver and hosts the
ENETC v4 Pseudo-MAC (PPM) PF and its VFs, which connect internally to
the on-chip NETC switch (not owned by Linux).

The node is kept disabled at the SoC level; boards that wire up NETC
enable it. MSIs are routed through the GIC-v3 ITS (msi-map) and DMA is
translated by the SMMUv3 (iommu-map).

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v3: none

v2:
 - Replaced the 'msi-parent' stub property with 'msi-map', as per H/W spec.

 arch/arm64/boot/dts/freescale/s32n79.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/dts/freescale/s32n79.dtsi
index 94ab58783fdc8..65cf65e828328 100644
--- a/arch/arm64/boot/dts/freescale/s32n79.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
@@ -122,6 +122,30 @@ irqsteer_coss: interrupt-controller@4ed00000 {
 		};
 	};
 
+	nwss-bus {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>,
+			 <0x2 0x40000000 0x2 0x40000000 0x0 0x20000000>;
+
+		netc_iep18: pcie@241200000 {
+			compatible = "pci-host-ecam-generic";
+			reg = <0x2 0x41200000 0x0 0x100000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x0 0x0>;
+			iommu-map = <0x0 &smmu 0xc0000 0x100>;
+			msi-map = <0x0 &its 0xc0000 0x100>;
+			dma-coherent;
+			status = "disabled";
+
+			/* All NETC PCIe functions */
+			ranges = <0x82000000 0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1


