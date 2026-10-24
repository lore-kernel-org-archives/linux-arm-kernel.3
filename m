Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B256606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2g4udeTn;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzgD1vHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=; b=2g4udeTn6CbKiq
	MyC3ejt/P0fQh1NqNLNPssrCm3IDh1CCwl1dGNk0WWRYcff2jcPmC+M5hUi3FkRmQWGuA77e6ieqv
	XbIkU2esk114cc/OkVvxROdPCilFeUCYoVxRUEsSsLiWg7szPtJl0Mz1cKa+EEGQI4J7qBYPDbiXX
	Z0JM7aHI1ArkSyxfOrSrncXCeKmZsJOvpSdXYuH51MRp/ZA05qfoyoKuLgpj/Af4vZ48RGICv5SBj
	ESFfrIo4OdoQOXyHJOz6BQZunLuzJ1oYk6b7V9f5FK/nJT+gVIQ4OdzEXtiRsmYfiRkIQVSk5XWcT
	rRLaRQ87r1f6ys4vNcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGK-00000000V5y-3n7P;
	Sat, 24 Oct 2026 20:22:45 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGG-00000000V3w-1g0P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:22:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1624077a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873359; x=1793478159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=OzgD1vHWyEHcD9ObLLVr5kqY7ALHU3xFGOyOvsLPQtbTDX46X5bSxJ+xzgxej6dNB0
         NIBq4ilZK5z5xy+Kf0GNXZWWxn7Ck2Ll9zanRPNaZrBQMOBaai/522mXOsLj+tCUD7gD
         WUCA0woZ9yQGdt40dv+IVkfsBY4Bob5EftC49UEssn4JpTFXRzKNhgmh8i1836t/OWct
         rBelUWV1M3tl2ioEUgB4v4e5uH5TATyRO8JKoyclP4NkZ2MwTMekOYswJtI/XblZC2gC
         tbk9sXWB/QFbTNM2Qgc2zCgjxXucYNqFrTmvD+GgaKhI2fm/W+GUdKbH4sAcs5OSntch
         QwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873359; x=1793478159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3d25DrrE5qm1Af0idWzUzDlmbOi3iKehZeUeGURamQ=;
        b=Q3rfyaL06nlfdGImqRR4vW3CnlOcQPCNXaaaU5zyUfTQQz+KTjO9/PVnQxoWYTNpRU
         dtSUQzhyByOo/HtwaXQa7pvn+pKJ78bO/Se2AcLS1Gn+VLcZ0ahZQiW9TRGCGrKpLn4j
         gcdbnRJ9Af5XGiFbtP0s+L3e42N0jZIvOJLw0m82LZoawSEAIFfQdxaAgg8BZFk1KHPp
         LhOgz5PL822DM4kUwDnrLxO5n7mpfMbwIFdSjhIlUJoTomW7Q5JeFymdhi9kk2rWpusS
         AjpTeIKa5ewt1uUtW7oShb6CG1BvE/bJS+eqMk9u7CJHStCApmEV6JKEhWmexhnPEP2h
         iTTA==
X-Forwarded-Encrypted: i=1; AKwUvBxyhk6mrMeTk1PAfpuPo0nWeYYFTu0sSgB+g4+kIXGHINHXn5hqLcZntNrO2HWwoFvLtypjLG0so+R337ZsUfeq@lists.infradead.org
X-Gm-Message-State: AFq9FYLblUE+khfBMwUB02Mkth4MVyQ4cNJXF90yC3AynNyJzEUZuBkp
	4y23QJBSZJvMgRfdRZIrZ2pCsffo4HOcd2wfRcZO0xgcbCWuI/mKOYdT
X-Gm-Gg: AYBFou0tuG56KQaLPrsKBSuVubb1SgLD0RfPXuUMVNVAIOc7j/If7YIavzq0JJLy1/D
	UCQrGfhia4+oq2jYlgTWfrw5wf1xZ4vrF4PiljjhuPL9Js7Sm7NKSlYcFXHIRiikqUK07tks3CA
	MN7ddRcyz+6HAFHd9EjHRXOfQkJRi6Y2lF252+7JWVmZjpNM5Gihemuo6wqcCu/b3RTqZK/DjD1
	eX04XRSzxQ/WSL0c97JMLwNphe0uZYdWAaMXzgQG0y78146kZgUmNv0XoguSPE46+zFRefUWTsX
	jgcAM+HyylEYeUVrQqzg99uKdFw8vWMBarVUupt+8UiZlzBQpQ89f5etbCWOIcqI9UZNcUQ8N6v
	ka8Y8B7i1H7WfZrRgeaEXdo0DyVrl15nu7DyiTYInu9NWlbM7r1y4D4ej0dhtNr/zrGssR5uQAP
	Ch49qskEzJlca1pCecTF8VLMcBIf620mmjLzmPpPMlVYPoFO+GAgmtIczm8XEoYC0B7lj81dy73
	mCrTR/jbSySHtVBNRfsP8Ruc00NqZutxCvEJk5USZ2tONCx2dIj7vMx6wbx5k1DQgodwF44f58A
	MNjW2ATg+PDum6MuAdlDlXcIkwXmBUdvms0bGUgxGgNouTp4hwX8lWU5N1yUo/lUabxi9v9nc9o
	Vno9+fxOEMosLvms3R2pbiSBsLk5fEcx+Y1lJ0KJExgyAbmOWi1Rbkrkr6eijSy+1OkITliEGOv
	qv0AMaLE2ojZY0Vy3Nq6AHK2L7
X-Received: by 2002:a05:6808:3099:b0:4c4:8ace:cce8 with SMTP id 5614622812f47-55bfff7e006mr2363837b6e.8.1792873359652;
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:26 -0600
Subject: [PATCH v3 4/4] arm64: dts: allwinner: h616: describe the UART
 integration and FIFO size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-4-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_132240_458374_08E5A55B 
X-CRM114-Status: GOOD (  10.85  )
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

Identify the H616 UART integration and describe its 256-byte transmit and
receive FIFOs on each of the six controllers. The specific compatible
selects the register layout and receive-trigger mapping, while fifo-size
provides the capacity that the component parameter register cannot report.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e86259ab..a80f26ee0970 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -538,11 +538,12 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			dmas = <&dma 14>, <&dma 14>;
 			dma-names = "tx", "rx";
@@ -551,11 +552,12 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			dmas = <&dma 15>, <&dma 15>;
 			dma-names = "tx", "rx";
@@ -564,11 +566,12 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			dmas = <&dma 16>, <&dma 16>;
 			dma-names = "tx", "rx";
@@ -577,11 +580,12 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			dmas = <&dma 17>, <&dma 17>;
 			dma-names = "tx", "rx";
@@ -590,11 +594,12 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			dmas = <&dma 18>, <&dma 18>;
 			dma-names = "tx", "rx";
@@ -603,11 +608,12 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			fifo-size = <256>;
 			clocks = <&ccu CLK_BUS_UART5>;
 			dmas = <&dma 19>, <&dma 19>;
 			dma-names = "tx", "rx";

-- 
2.53.0


