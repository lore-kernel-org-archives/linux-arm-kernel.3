Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5567606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+aSeNME;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=P2PnUFFT;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XYj3T8fe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=; b=k+aSeNME5kLs9Xs5XgiEvIhZ5+
	SEmORpO6vTYSc1tvpr5eDJnnrh8js14YcUOmYqkOCLEmtUJqxjrAINEmVY2YFU3LNxI0FlPrdKBxs
	kgEzmrITQB9X0SoTUwLgSgpB79Q8hn5hkjKvjRCLdK8bbsiscj983lwaTmqGwWTlGk6WWIgSEt/gu
	oLS8bONP/09p/qx5HY+B6+cFe8RfYGERwBn23g8sQLUtWqg/ISYhvQEres3Uj9cj6USnzWiMo3Wo2
	BHQePyaGDoJBHeJ3kIxD7QSm3y2sjeJrkmIHMwRdHqeYM9yBgQ02Vdj1q45yUBQoIfl5fphthlgb8
	Bq+XzO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJROv-0000000BIzL-0HW6;
	Wed, 21 Oct 2026 08:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJROn-0000000BIuj-0msf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 08:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=; b=P2PnUFFTOhspHxobitatAX2V06
	Eb3ydxpMlgLK+SlrXI175qBlzc+sskW1g0er1kpJlGsSI8N2ta2Mu95lMqIqYCF1f3BQE15hWbdPk
	/+UtTiur45THgvcpb/9tJBVzM1BE9C7AFkXrL9JCEsox7Pw4I15cBl+Dv+5AI+QeMX9kZwZ9pNG1Y
	oT572RVw9vp+aVT+LjpBkgEo93NYuzakIrhx2Q64uIx7godTNs7PSeeCT2/jaWoEx0Tvipxxbmb5Z
	uuaQg5UwU47e/FcBnlWkaQlDKen8NrYxWURfTN6zfIzVJ6G2REQGVU9csmKDkKNVQqV9LA5xwcY0u
	J/IXmV3A==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJROi-00000005a01-1MXE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:10:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33F934E41298;
	Wed, 21 Oct 2026 08:10:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 091FD606E3;
	Wed, 21 Oct 2026 08:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACA7310328934;
	Wed, 21 Oct 2026 10:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570199; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=;
	b=XYj3T8feERm2tTvVGFaDfxrHgs1EWxdJJzrU9wkdtHBgOQuKu3dDPE+NPH8LhqT8mcjaHv
	O+jcrh/mYnQI29Xf0CFIZSa9s5XvFOkTC/TKPqXGW09qMiGAv3Ya6bt/8nyBwPEXEeaB2h
	VkFub8Wy0S0GDxdY0fOiCSySBHOdoxmCSe+Eo5oQqPDUkrLhcfKVmCefba5a4HELc1Guy1
	izsBNm3YMgGdVaPYV6/n1FE82PKt5YPXkCMavExdgG9dy4hqKR7KXUo6xoEO+h326Ucll+
	o6k8VSXFyUX04Lm8glxWYYwOF2b9klCLd37bDR26VAq2nEUDdPBdD7w9XQqhVQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v5 4/6] arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:45 +0200
Message-ID: <20261021080947.3747284-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021080947.3747284-1-richard.genoud@bootlin.com>
References: <20261021080947.3747284-1-richard.genoud@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_091008_669350_55B0F55D 
X-CRM114-Status: GOOD (  12.99  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Declare a carveout memory region to store LPM metadata on J721S2.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index 5253d028da09..010d20d56927 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -95,6 +95,12 @@ rtos_ipc_memory_region: memory@a8000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a9c00000 {
+		reg = <0x00 0xa9c00000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -189,8 +195,10 @@ &mcu_r5fss0 {
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 	status = "okay";
 };
 

