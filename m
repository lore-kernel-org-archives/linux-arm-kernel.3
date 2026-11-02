Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kleg9Utx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHg3byId
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=; b=Kleg9UtxdgkKxp
	y80DFz+M4KR6qsHVr2Mk7Ud7FInEpR6ElEiRJ3sPF+v3B31PPfdbXA3PteB0bh2C/1uBOfUuM0cTX
	6o3fabwQOiF17Xzi2XMGfxA/25tHbkomaUAGW1jrhA3QuJjqXkJBBUpN5lGJOD1Ns7x9eNUPLRjIg
	FVvIsPlljV5Ju+8vpBGWvwM6ZvL2Jqo4HJYc6kZNuU7inHU775Na5Mn+l2R9pI/gCcnvGvAeH9/eB
	GcTEx9qLrkhVqJTdeudQnxHz0kt1isGrHrIPIPUqDKXlgsotMncnb9z2sA5cl0tmh3SQdvzDaO1Hx
	yfe0v4G0jxHLNag2IbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0s-0000000FviV-3Mea;
	Mon, 02 Nov 2026 09:07:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0o-0000000Fva0-3HKm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so22020355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610449; x=1794215249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
        b=lHg3byIdAbJ7BDWK65oHbv2428L2miBXG+0VKRwOLnwnY0jT80ctFJbpCVWo/bmibF
         m1yEsNan4nn/E1amFGt+ptcCm2l4LOGbSrRRWIw03N5Tk742uZ3kg8IUz/vR3sUz4Gfg
         iubw9aYX7DDwzCIqujUYKElaa9Rnvljpwh4sXcZmLMo6m/s6F+Ddg2dYGOzBZ9i+u/0Z
         ElnwlG0KkNtRymCVgm3HBp5eGzVn8mwGbjDIPRG9PbhhOJXOp/qFf0gca6QjKDVhC6RY
         MIcUfbDTHdoJWfDySDBPqTbPBkJLP8EXWnBZp2P+j4zzzSyLdpYdfIw8qbOKaPm3HQyS
         nUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610449; x=1794215249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
        b=ew3hjxQFICDEOAIcdLpFdm73eunIRsO9UQ+GcOznkH8e2joiiga3MBoeTcIu6Y7KjI
         7lhcbw2tN+GvyF1G5Dus2VsaC0eMwnxVHEh7zblWr87uVcf6sZygUpUeX3NrNjrs83z5
         NCuDbgXs/7fpqv5SAhtxOyfzgsBNT84r0rhyaK/1epHsWuTPwI+dOCXyfc3UljbrWpmI
         z1BvAKoEZlHO5Xx/CCSEE1+Q1Tch0+RlUyLDUizFJwCGPhc58oP3H0I9S9H5tLf2t7xD
         iCoXPQn06IR1yuV+TQ6i+F5kbeaXYqKZwUeB4DvIzheo9MqwsbiXtOWJ454hNTQT2RuI
         O61Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbCHcgscfH5I7GVWeguFos2kfrH0ZmsRJH2sd9RYNxfkm2t9ZO5Cfiym7btSsugm/ZqLSgPAQRgJpsBNBamVCT@lists.infradead.org
X-Gm-Message-State: AFq9FYKIaMmIT/b16uJdE/JZdBxu8KP4LM9rl9eeh4xjNxus6tMTy/ez
	Nvc9SbRpNdEhRfFGv2RbsQb0V/gTQNRrcvFjUJ9NVljQE0x2e+IkW8rF
X-Gm-Gg: AYBFou3N3f3Qi7sXZogk3hiREvYaZE6v0b7eanWdZBXql2eI+zY643g5UNcDN7lo2qg
	O54wk3TDIxnsxDCXJ5Q40+t0Dv7gelfos9JGR+S3XMKml35aEJC95R/YjLQBxRwZe6WZRgIByRI
	xsZIbIcqeTXbB85K/zyMtvYYIufA9OQaKWKBn0Uh1/G0eC0PEIaUNsVgtuPZZxT72vmV0okj4Bt
	RQ+m73gfPwrmGSX6NZTK7xZ8wtIMypwXKp+lu2SkllaSv9De7ijxQ7DOd3l4g9BRKBRoLA7u4KX
	8/1UQGfqDTS3FqRIKJJBLzd2HCJ4SpXlQrk1gXA7tnLWR7Yq3WksiO7P0NHTC5Fc2HgmqVRqZNV
	pDBiAtA03gTcSwEbJpsnn4YKTkAMbsVfjurJMkUWTzg40d7B4QFMxzkXyWezoKLgBslgZK7Mlay
	5e1COdLk45pdDh5Rkb0UpeF9Cjpu9qimdAOImoG6gOLYRkcFpicZ1Vivlsf8zOPDjExDVFo/4KL
	o9QpvvkiyzL2+fSBC07I1MfE2QkECnrmqonA82NPwLh47VzABo1ZNWVQGraquS1jiJT0/Cy/EFI
	lxJHgalF25aMIelvGj9AAfg84FsZVDuESVEGPOv7CxKFpot3wMXzZ6DA3g7LkVnlkwCUrmXNnpl
	VaCVy9a12CUka5rsGJTurNtQtomEJoCyffpLRSAX0DlRWvitwz36JovbABrmRu6McEe+71AUdSa
	Wa+XnNQXKJCMzh
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr235827335e9.20.1793610448975;
        Mon, 02 Nov 2026 01:07:28 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:28 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 6/9] ARM: dts: bcm2711: Add 40-bit DMA controller
Date: Mon,  2 Nov 2026 09:06:56 +0000
Message-ID: <20261102090713.896324-7-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010730_846311_DED80FF6 
X-CRM114-Status: GOOD (  11.03  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the four DMA4 channels (11-14) of BCM2711. They sit
on the SCB so they can reach all of memory.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb393967..9d70bea17b11c 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -602,6 +602,22 @@ genet_mdio: mdio@e14 {
 			};
 		};
 
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x7800>;
+			status = "disabled";
+		};
+
 		xhci: usb@7e9c0000 {
 			compatible = "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";
 			reg = <0x0 0x7e9c0000 0x100000>;
-- 
2.56.0


