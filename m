Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D662E606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ejm1YrD6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Bb0iBozt;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=Lnw43Rjo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2LWARo8MV/mGVlauERfT0VhLpTZNjWKl5HGBOJ/aaQ=; b=ejm1YrD6P3sTIVohNBa4MkcHKj
	3NfRORSUO4J2OW53qrS/9F57WvwA9DFauBaz+w/jks5S80PMKMc47XboIkIrT7KRhMVCPyctSPKyZ
	4NVMVAj35u47M7lM60VViCNQpzMVIQC+eLT3dmU8B4kNmViBT04Jkcavd0bLLxdwAPDvJtq9EDr8k
	ATg3VrSCXPFbySIOkClDTlpvZvS71JOf2qwIpJhz8VbrnTw1U22dbmjOx6MUUSiAm85IP1Z+U1wYA
	PqPW2XM31cRmoR5bK0OgWlcun6Fa1TfhfdOJvWG4wDKQl2E6M2QLBtsKcH6GT5pB9/Yp9JN5t7z0J
	DX/CkTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7I-0000000CYJG-0pA9;
	Wed, 21 Oct 2026 17:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7F-0000000CYF7-10ht;
	Wed, 21 Oct 2026 17:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n2LWARo8MV/mGVlauERfT0VhLpTZNjWKl5HGBOJ/aaQ=; b=Bb0iBoztiC57DLEQV1WwbzxtjO
	FDS/tT2AsK4qQ7mZ1rhvDANFfjJUyi/n3Nv3vNHf+/vdN6xrcZ6kZU8i2VdM9sWfuf2IM+SHm4Md7
	xDeshiSasXuoRV8IxdDxtE5tdiTO+/1dXW3uK0Apbl5woT9aDGd9tClmxp+IBqPyD9BgcYsHvgSmV
	UU4ZS4wQd7FlzIfCPf7CiUFHesxblsQm9yKvYnpqjRYbcKq3nBpIox2x8lG1nhmygEUwaODGjDWgl
	DrRu7NdfSp5VWRkbg3hzGKec/FXS+L2SKVk6EX0cdN4lYOlpDHdTGgH98C4RNi+9H7H7aMrii5Z+z
	VwnJQTaA==;
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJa7B-000000064uh-0ViA;
	Wed, 21 Oct 2026 17:28:40 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E52F5C0000E4;
	Wed, 21 Oct 2026 10:28:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E52F5C0000E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603715;
	bh=/JqeKYtSECU+27WszWV5PvE5N7tLSEr/HEiedmI/3Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lnw43Rjoo7WMEr5lSbFj+3+vUdKB08znfjLSjETJ50yT6sgV+7DuXEtQ2zV0BzNii
	 5mbjcEFbF0NLteDVHedAHhh/fI4Sz5z2E8e712JupZGj2Wnx1f2narVR4IuUmsulAU
	 FR2MJFmpzaRm+uLS2m7/F6WZkXF0oBLCgq8GuI8A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 4DA3FAEA2;
	Wed, 21 Oct 2026 13:28:33 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 8/9] ARM: dts: broadcom: Identify the NSP EHCI controller
Date: Wed, 21 Oct 2026 10:28:17 -0700
Message-ID: <20261021172819.668120-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_182838_367498_7FE920DC 
X-CRM114-Status: GOOD (  14.90  )
X-Spam-Score: -1.2 (-)
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

The NSP SDK programs the EHCI FIFO threshold to 0x00800040, but the
upstream device tree describes the controller only as generic-ehci.
This prevents ehci-platform from selecting the required initialization.

Add the NSP compatible to select its FIFO threshold workaround while
retaining generic-ehci as a fallback.

Fixes: 1d8ece6639e1 ("ARM: dts: NSP: Add EHCI/OHCI USB nodes to device tree")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index c3c33f18b92a..b3f0190d0d86 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -325,7 +325,7 @@ xhci: usb@29000 {
 		};
 
 		ehci0: usb@2a000 {
-			compatible = "generic-ehci";
+			compatible = "brcm,nsp-ehci", "generic-ehci";
 			reg = <0x2a000 0x100>;
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 			dma-coherent;
-- 
2.53.0


