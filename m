Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA6CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G27RSxsisxK4W+nTsdWD3igziG8/4vIaJNzOSXN9zS4=; b=AoPgy6gVnHlvxciT1YlQjSInYe
	fv0VkIFbxIV1tFG33DqJ2lC31PWQPUetGQHua7+o8WaeovSg3dhbK3n8AC1AGlrErFu0Fz1M9V6Lt
	8kylqpMVoMGzecP4i+zO7YzZKyRe5tJwstrv68L91nmpzzkkrUa7P0D6yAav7BiM8g27xV+9cyMbN
	a1M8nvOFziqSvgghRPA3GJJlyr01Sm8jgAURT/M81bAs4n9DMePFNm4zCD6+ULjTJWJjW0piX2nhE
	c5/gWZPnN56FpIBm8/zmOJTz3g6aCmUXHyq0CPHPrbSqzxRdvheDCO0BI47K4QoSPpofPKQOMNxUg
	0b8cIJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM17-0000000FySs-2VoT;
	Fri, 05 Sep 2025 02:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF0F-0000000Dj4q-1bPR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=G27RSxsisxK4W+nTsdWD3igziG8/4vIaJNzOSXN9zS4=; b=L1Rv+v/zZoBX2TI6dkibdyC0mF
	Rr41RrJ49tv7EH52/FzRN6ajO4FM9+N7gfKX8NKFaYcGmZuzNBiPOWEmxV2GvBMnLRtJ5eM1Y8Wzt
	aouETYV3qSaPug/kkJe+jVRIrPvsuBwE68IgoeRI5JqsRTcdC9YZ19/v5b/ZG3gf0PjDeSmt2yEXp
	/gDbeTxL21k44+AMGEk6hCg22zX1cJUQtig5D0iP1eTUg86M7Gr7HIJwf5kI0aLjxljPxt7zbidx1
	mhs95CTtK+r1+AkUklzdnRZTRa/jfbgNXcwGisVtosudxvfZLuLyA0RPDKA/CTo4bgeWCGonaSNR1
	KoGrIr0Q==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF0B-00000004PA4-00EF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011624; bh=prnAyS9oB3iXuhsZrQun3UGULWKH8i7HvUSp/Azsj6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nt5bCXiU/Oc7kycmGmLua4QB1qLcJuO/X0X94EMYLeZyoumLHW0gMw/U1Xe0xySO2
	 980t9CSWi26AacHmVWO/gI+I2WdJoIxlaDdY1NdJJnqGhARQEC3lTD7c00y8mDKxa9
	 raYT+jGYQYRUxWP6kmbw1pYBXm+cJkzyz3giTuqeOdcg6YsgQGhHeleFJlFlDy1/k+
	 NQQyIg1JYCt2LHZ0b/uo8CVo55c7updjVKZQyalRh8C45uAE1XR4GWRc0xXd89Qxqk
	 +I2ZgsL/NOIML2FhR6glu9gOjAICYA5U4vKtmXvJbc4+KIt1UUpbfPprV3tZHDFxn3
	 gMm3hHScg0TTg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 610783D2189;
	Thu,  4 Sep 2025 18:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011624; bh=prnAyS9oB3iXuhsZrQun3UGULWKH8i7HvUSp/Azsj6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nt5bCXiU/Oc7kycmGmLua4QB1qLcJuO/X0X94EMYLeZyoumLHW0gMw/U1Xe0xySO2
	 980t9CSWi26AacHmVWO/gI+I2WdJoIxlaDdY1NdJJnqGhARQEC3lTD7c00y8mDKxa9
	 raYT+jGYQYRUxWP6kmbw1pYBXm+cJkzyz3giTuqeOdcg6YsgQGhHeleFJlFlDy1/k+
	 NQQyIg1JYCt2LHZ0b/uo8CVo55c7updjVKZQyalRh8C45uAE1XR4GWRc0xXd89Qxqk
	 +I2ZgsL/NOIML2FhR6glu9gOjAICYA5U4vKtmXvJbc4+KIt1UUpbfPprV3tZHDFxn3
	 gMm3hHScg0TTg==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] ARM: dts: lpc32xx: Specify #dma-cells property of PL080 DMA controller
Date: Thu,  4 Sep 2025 21:46:46 +0300
Message-ID: <20250904184647.397104-7-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184704_412236_99F7354D 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184704_412236_99F7354D 
X-CRM114-Status: UNSURE (   8.94  )
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

For DMA controllers it is required to specify a number of the cells for
users.

The change eliminates the next build time reported warning:

    dma@31000000: '#dma-cells' is a required property

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 522d616a9205..a38f3c6dbe47 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -83,6 +83,7 @@ dma: dma@31000000 {
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_DMA>;
 			clock-names = "apb_pclk";
+			#dma-cells = <2>;
 		};
 
 		usb {
-- 
2.49.0


