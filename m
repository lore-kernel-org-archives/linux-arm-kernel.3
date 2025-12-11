Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03654D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu4TPpF+5DGJ5DsE0F1CuqneX0MF156KpXyPhzX8E5g=; b=mclGnClRwHC6g+6ev4dRjCMLJy
	lUJDAMijfsNzPow9zsBcPlcn1n7Z+lEJngyS1WZf7SP+wQ1XBREXcRKHVUz6hazvuKu8LSLFZFCQ2
	4vyco1z6KVYQ8wrRvbYQvXtEqGkvsaV62GK5jrOo146l6DaQ0wO973XvsZuiU0MTP6CpAUeUgWnKR
	nHMe8OWB0nex3Kj5h1AuqwLuPQtjxkFnyhiWxgmoO5eOEUcGsLknc1kV6oai4MV0tKJ5nVBKEnSjW
	iJQBgNcpTI6fKYkIHwkWQJIc7od88wEz4bv9/b4j5Ko5NebfIbcjx/hyKwu2Ly8WsaMc17wtPil5Y
	KnmNXtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcL2-0000000GPQd-1dKg;
	Thu, 11 Dec 2025 08:47:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcL0-0000000GPNN-1JLr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442868;
	bh=Iu4TPpF+5DGJ5DsE0F1CuqneX0MF156KpXyPhzX8E5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N1eYzek21eihrgNsj8tfP6CntNClLcV40Yb1a51mjY7eg0yL/BrWQNrdx9pLiWhkv
	 +KxqQcpc4uO2vTRr/CDKxIwJwUjVZbciI+mbbY+fuaKUhBEiQunPivRGTgFDjHYjoz
	 bDogU7VIRPjZxrkyzdG5rS5D5rZxxK2TGpgixjqSB/a/Ku8N5+ldco7oaUunkhI54r
	 KRVQAhnFYyF7m451J7ZK4fYDvovtQiUXGyyJN74EYUbVUfaZqHFh0C0dgJUoL66Xih
	 kRsciCepHt/QvVh7vnqTDAq9u4nXM1s3XLB3cGb1OQaKIbnQA63Tez0mwQsFWmRO2I
	 Xd39AR6ftlHPg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60BD77D6B0;
	Thu, 11 Dec 2025 16:47:43 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:57 +0900
Subject: [PATCH RFC 15/16] ARM: dts: aspeed: g6: Drop clocks property from
 arm,armv7-timer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-15-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004750_546388_8E97EC6D 
X-CRM114-Status: UNSURE (   8.42  )
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

The property is not specified by the binding, nor used by the driver.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 4583c68748c2..567f8040eb8f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -68,7 +68,6 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
-		clocks = <&syscon ASPEED_CLK_HPLL>;
 		arm,cpu-registers-not-fw-configured;
 		always-on;
 	};

-- 
2.47.3


