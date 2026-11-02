Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HauIALof;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCKaab2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=; b=HauIALof/Fa8G/
	q11b6cpBpyw35Lxu4TQngvVxNtvTV1OGxGWfFrXtyw3QfOXjNjDSt5+bUPgAgFyQvbjAuX3LFIF7n
	cUtQ4uH0CxrhqRWdJ1GAqWiA1j7EFtAyAWSdL0s3gZlbgwDYUreoenZVToJbuOllpgZJ/ZsHa+InG
	R2qT10rgpeJ6ucVwQLETSvQEWSOvwUHNhr1xKtJXnwBcNZmz5o+ZRxXX39813P3/L7dMyMT9kH6l0
	3pPtGohpjpASAjNdwRisaRYeO7UZKFL3UeflllL+qTufAB40FjchcHEG5tQsq7tosSWWHyljMjNb3
	5yWnoWb+IXtK+k44t+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0w-0000000Fvpl-2bug;
	Mon, 02 Nov 2026 09:07:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0s-0000000Fvg7-0Kdf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17271785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610452; x=1794215252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
        b=rCKaab2qV7/jkLJZQYSqVpWlOForU8+NUKNmeYjvi8f5xIdaLI0oxPXYawS6M4Kovq
         g05YF7MGcXXQ7dOHo/d28FJJWCgQvCtdrcrYfHjL1+RAwak0FWCdLkJ/f2ZOS1hb7gE+
         urfWxMUNTomROV4fVuMKEq1n7HN4Yi0ZeJtMaduxVoRLesGZv1wX8fcur+GcpziVnbI2
         B/FxyE7KIDkSES1HKS6PMosbMP4XdwCbRNoAJyFDc8QMtAd7bHcTiLkIX1u79+P31c/G
         0qaiOCuH1ruM1LttDx68jBjuGiCpjn9HbfLDoKLLnRwVq+twNJOsxju2jAU4iNCPedFX
         WUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610452; x=1794215252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ca0mm6wOincCYsxFkpZ3alJVNygD9weGLU+HWZOKny4=;
        b=u4AIAClSqqIUUV7Y2R0xKlsYK2zHP+jSUO+YQhXpyAwCDdxN7FrofopqIRVRWZ6dOO
         +EDnIVPPhApjmHQonL+YHk9dMv+fqtogdHvopvNHALdnOBQJdmd6/cr3fJ5ZXNcAw/pN
         USMIokJWfFAEbRPmKj1ab4+G4+qzR8TmoD3g9HRnAgi9YqvRPmQx17eYfy6xgbQrQD5M
         aqk2x09CHKkTIqicK1QPF2e6d7/v4adH352BGO6PVw0c+e2BhDkkdG7J7HVsV4vqfh5k
         S5HbVMcGp0D0N2H74GnVKbSqWyetazTFvPOaBx7HC68GWHPY7pz4U4tEbt8Qptbs/hmo
         b4Uw==
X-Forwarded-Encrypted: i=1; AKwUvBw0cIdvBgp8oQTcNL9GcDhea8W/or9fAVjqqK50YF3pK00ZemaLTNtOsmunMtgreXGAYnBnne3WbEN8/Ay3k3Ga@lists.infradead.org
X-Gm-Message-State: AFq9FYKYMjnAo8YpDAt8B3mX/N1ZebrkPGCCrdzvBZJAUWMiko3c8fhW
	8ppLvTDbPDtjzMTbQCfZUuwTh7RXZpaiO19KJwrpwzECA2nQyNblShTY
X-Gm-Gg: AYBFou0Q7RWXyK9SLCrdEvN0t3V9ymCjXyAhMBJuCpjS28UHjpZGIQY4f7JWZFoP+VQ
	nDsEANgizrOV1aqIqnomLPovJMJIj1OnYhT2nMTfvMqsKV94kZ4TikmZlS49TIDgevL3lLw8228
	PSr55uWzrHhd27Jd7vMOBGYjqR9Lfk/7ccxwV0vobvyiFM566cwcBye462hrzuvapR+m2JdjhE9
	rzwwCl5BF9F6J4phj6Nhif9zVSCQOJe8mnrcdX4Xn8C6OP+En+F7BxSu/bRxod50K47NlGLLAqz
	txLR78KMmdBQcwv/+ewmBI7/ei4t9a/qNX4y6fWNvznLR242TDqD7ZcXvANGhGxmMNZX9lEl25D
	Mw6n/O7QLoUJK2PKrfJ1tTwEa7m3SifvHglugSClJEgOaNgJ6mRdQ7WEkGGxF34AWoSn+86zPOP
	io9Nz6B+c6GuMoPJnYtAoK2dNoT0BX3wvIXsBbqdNJ9ae5QUB+Mc87ui2ggSaYBnEciEO6jE3u3
	vz5jstWErIAf5gEwrFf2NGd6uZRP38rg4v19C717P6IRJcLeM5EdGqsyYfMOYoag01YB5rHwr8z
	71SjqJDV+Jg+WknTxI9uzr+CeB0Qp4YlBkmkCvoPF8uCvBpn3ztAB1YwW6cUM5QJi2D+86tnaUW
	RL9Wbyudoxv2md0TocvVsxr/vi7HJYfOFmXZCY983zLjuNIIwmwCxp9kTBwgYZzyba7f3TKHlOy
	DCsSj7Z+N+IG8kwDUMKlT18s1iKe54rnyrhg==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr210076365e9.0.1793610452115;
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:31 -0800 (PST)
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
Subject: [PATCH 8/9] arm64: dts: broadcom: bcm2712: Add DMA controllers
Date: Mon,  2 Nov 2026 09:06:58 +0000
Message-ID: <20261102090713.896324-9-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010734_152879_715428CB 
X-CRM114-Status: GOOD (  10.49  )
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

Describe the BCM2712 legacy DMA channels (0-5) and the DMA4
channels (6-11) as separate nodes, both disabled for boards
to enable. Node labels follow the Raspberry Pi downstream tree.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8d..be4e94c9e7695 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -546,6 +546,46 @@ axi: axi {
 			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
 			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
 
+		dma32: dma-controller@1000010000 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010000 0x0 0x600>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma0",
+					  "dma1",
+					  "dma2",
+					  "dma3",
+					  "dma4",
+					  "dma5";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x0035>;
+			status = "disabled";
+		};
+
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x0 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>, /* dma4 6 */
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>, /* dma4 7 */
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>, /* dma4 8 */
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 9 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 10 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>; /* dma4 11 */
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x0fc0>;
+			status = "disabled";
+		};
+
 		pcie0: pcie@1000100000 {
 			compatible = "brcm,bcm2712-pcie";
 			reg = <0x10 0x00100000 0x00 0x9310>;
-- 
2.56.0


