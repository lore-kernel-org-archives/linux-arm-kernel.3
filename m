Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B420CD3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfE7RBxeKysNsLYVJ2cwyFMHF548EzarJueuQZE4RQY=; b=qZu4KlLn52OfYAAzklPaR8Fsgb
	i2D09kxGuzevEHxa8LfAOtUguRuk18W5/jPTmlB//A+3AWxjj+xpTA7L0xm0TDkDj6qf7xJNKOaYA
	I7Tpf1Mzn0VwPLQEVhZz0BnqZX+1w8i07MbPR7bl3nbyi2VQMpX3gxSc5qjhyD16VBXAfjjsCEWOw
	z0trNozkig5gSlGMYNrS/N6FRkxaS5NvwREo3mh2RGeUZh7yLUy3Z0dN9lrp4/NnhzBbC0TDIE/3M
	f5mDirOveTUhabBX3RQoEcbB6a4p52JrCp2tNRp72eGxC2hTrSVpcnIjPU4TjB6SBkJ4Igeyt0Dd6
	7J3tIiaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKg-0000000GP6s-2ifU;
	Thu, 11 Dec 2025 08:47:30 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKe-0000000GP3w-1fmH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442846;
	bh=DfE7RBxeKysNsLYVJ2cwyFMHF548EzarJueuQZE4RQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RJemCfSdq0JXdxkb7HL2R50Lv5PpvyLoZ8fHKRLKyk8aD/UfEDsVm0BfbxMYHJ1Q7
	 UiZAw1YI0JCxH8fMqCfxXFJhqnt0SwO/YNM6bnuH2g+hHRaT86bD9nd4TuhBK5dSBA
	 uYn9mX0CnuoMj7+jtMKJl8Q10shUS6xqmz/1+ULToRO8+7GJtOIupkMCMfoU7hgrVW
	 ZjFPKIIeWlwdMtbMP7D0u6w/zWKS/AgRfVXwuAXJp6w9xF+ugiHBgm1l7at3LMNqG7
	 2o9gNHEPDJO0vII0adr4LWdlc1kI/Xwqru00aTS1k2TZfCxUizynayTdIX3YLJaJ/0
	 6pqGngsMgpuVg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8D6A87D6B0;
	Thu, 11 Dec 2025 16:47:21 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:53 +0900
Subject: [PATCH RFC 11/16] ARM: dts: aspeed: Drop syscon compatible from
 EDAC in g6 dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-11-21b18b9ada77@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20251211_004728_637181_391E5340 
X-CRM114-Status: UNSURE (   9.83  )
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

Its presence is not required by the binding, its addition was not
discussed in commit aac82707fa45 ("ARM: dts: aspeed: Add AST2600 EDAC
into common devicetree"), and its inconsistent with the g4 and g5
dtsis.

Further, the corresponding driver instantiates its own regmap rather
than fetching the syscon regmap, in theory breaking any users of the
syscon, but of which there appear to be none in-tree.

Drop it for now, and we can add it back with the necessary rework if
it's ever required.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 1ae816087f6b..86b30e38fa25 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -74,7 +74,7 @@ timer {
 	};
 
 	edac: sdram@1e6e0000 {
-		compatible = "aspeed,ast2600-sdram-edac", "syscon";
+		compatible = "aspeed,ast2600-sdram-edac";
 		reg = <0x1e6e0000 0x174>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	};

-- 
2.47.3


