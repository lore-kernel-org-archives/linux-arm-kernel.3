Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1A9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lXOszPbN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6vpx6bc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=; b=lXOszPbNM7spHx
	O2/wXcreD8q+JVnbQORfG3aFuNGF7Dq42GbwA91IqeO/W6eIQ599Q1u9iKor9GRvmDmtCRt/yiL6T
	iCUrzJ07J2Y3fGF58+uVF6tWGU0K0eC6XwT1TGme/NZs7ZVV6AcLBh++HNXLGJNNUPuexQ4U9niR2
	aeJVNrMptBt/eqtFPMdaFlvrHiE0X+2CUOXv9idBJ1PNoIhZJyRfvhcHQQDLMNlLXqaHvqJN4T+QT
	kdn11y6TXg1f5m6F80zcw8dtYxTP4S1ROkpqb5tGeQtURYYOTyM/rP3XubwoBHLoFau4WZc0akEYi
	m3wGUr1CMrPHjfpN570w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVAD-0000000AABK-3aa6;
	Thu, 29 Oct 2026 18:47:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA6-0000000AA6U-0LPS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:43 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-823b938464fso1709758a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299661; x=1793904461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=Q6vpx6bcpXlC8eGZQFfne/Qb3nSXSZq7bX50F7XWlF/fPPYbBOVGHeIDS6wG7yqv2Y
         mgWuQcoDQxHNkrbRnBI34AGf34CpNe4fL25CptvpV6I6nWc/+uU4qPJv/5GtU3Y5esbj
         e1WhEit0EQVBk+pe11zIvJOjP6zaaacIPU0g9yJta/jLV6F8PpitQHbigVDIcbDTCAKx
         vVLoH34onB4aILlBFGyckNRPgRGueJagS3WN5Gf/az8POPNuEKqpvDdRlOkWo4nE3AB2
         S1+SaqaaWw4SOuCSDDtLLkVpPE2h53owPq4qwCCJKdGQcMWEdozwVF19xq6imjCBBnm0
         hmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299661; x=1793904461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCqbgiCveDVRhli2P2PmmtvKmmMz/nrumey9OJpxfP4=;
        b=vjOnAb8Yq5N7wqLFs3jmwRJDhdvMXMgCJrlrd9xlXNKbnYlA60l243B2bdOGA+Znyh
         MLU6w33SVgIx7JlkUyUl6uItIhLGQSGWlxPPC9JS9u001+5Aq74F6eTS9T/PHIR/GP5y
         kWvt8eEViX1M0x9aBIG5tIPcKdmJd6rzBM3J5KLXiK26j/s4WNxeHW/ujAKC76rAgjQi
         +yBlP/2rSsdZnJx9k7eC1rceZrPCWxjYMWkfaNeIbCoTdWbibjqchXJBjUcgBKbG+zFX
         g0h9JVvl6qBaIJEVGHAm8drvGv2LkiQu1rXgWE5Ko+Ka/RIA47UPATsvZsVDOfFIOURp
         KNQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmr6YCzchGB34a5usiIuHasbWGXkdsOZ4DF423mBa4aYMywMq7lJaTHrgB1l+SRQil0mBJKyjcmLplmLW04mXJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJwrlxc/mWYf+KwxHMCAhqGIr8c5YQ3ne8ue8kVww6C7KYUFixF
	eDfZcj8VfNCvpsVICxBtS4e9QZiT5+kCYaQCsRZBfZ5j11LzhGW5fwr3
X-Gm-Gg: AYBFou0C5T4Qqll0xOMIoPkLdGenc1czfUVXaljVBi7bV0RwdTd6N9PYoF5+ErKchF5
	vXKZpgze2zWFa24cv70+/+MV9RGQ4Chv808iyESk9Fxa71PEuhijQpoAwYQTgzgTqt5mIFf3pgE
	UNJIcXBWrrYkQgPFF7uXwHLfMSoTTH40LOUuQQw6pXq1BPtKGkERSQyRqUyDBcW6Swk/c0HbBPg
	NzeenBBAfi7O+3zOOI7d9spEJJe5opF393rbSVH9kE3f9k4MuBOQ4950+WObOUKqBl/0BUl5eNT
	uP2tSXUz1f1QDYebfbEk0B9+vJGqdnODhx+4qtyKYP9/PJxvNpa0z/A9avWWwesgXbvoKYsfafu
	LYmmdG6B3eBcX2tCsYVTryfwoTxeKkhsRcc7vVwHfQP1Lz6szXNR452N7sd+acvb6nRO8J4FqQC
	TGRf5O9Dxg9JDTh0qG9AivPdfCChFan3NKyoSbbCQvL/0q+sONlyl/jpmXqbeoc3huovPiC+Gey
	uLkbPOkrzx6VONHUbaVszlDZUVxBM/wOcD772HKo5ynwMQgLBCjZSiWQBlA6OdxkPDXEq637Ydu
	/gOsScRffrW+G4Wuga5ymhufAM7bFy7qMYCaXAqR7G0MUJ+XR6LgYw2J6hDtuQrNsdAnJzLXmfW
	ANJeVcxBOdM2smQjRJUuoAT25f+VjOIy3oG0AJqBS1vOVE5ZV8KzpoywElaB/Aa4aI5Lxm2sIMa
	zOKqqNu0B2nKebWw+G0DH/Kh3McrqGtigMRalAgBdKNIgUfYFtPUk=
X-Received: by 2002:a05:6830:438b:b0:822:a76e:95c9 with SMTP id 46e09a7af769-85d364642f9mr40665a34.14.1793299661366;
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:29 -0600
Subject: [PATCH v5 8/8] arm64: dts: allwinner: a523: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-8-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_114742_226313_C28C6B04 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC and the
Allwinner receive-trigger mapping. Each controller supplies its own depth,
so the same compatible covers the different FIFO capacities.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0


