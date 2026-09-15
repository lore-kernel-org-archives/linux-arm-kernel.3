Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C62C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MauySCxsOfy+vmF8SmaRKTKNYl9WRlgP83hpjirQ3XA=; b=M126PhbGn7lEcS2psaJLs3Ho3w
	/ChImytqLnHtlknnzw++LXurGrMNSCy43cCtUtZoSKbpaWZcocXeWG5H8s1uz6DtXIy1jBR9J3OSc
	rJV3r5uihbOc40xUCzLdH+5DG/gpz6Lcecdq9O/HetWlYf7pJXOvSvuXzZFs8+M9WLVmW6ZnMotOo
	ZqXaaUNeq8p10Gcy7+4aRuK3KuoEs7XFOi4icr6mzzJJchX1zHe/DDtrNEd9aCDVEwg8VRKmbD+0k
	LZC56K5YlTytMltUsAmMlPW9v/AHm7mM51eRGSRKpccSbbiRZ0viiBVUO7zdDR0E8XXg0X9Hg14//
	shzrHVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R8h-0000000648m-1hr7;
	Tue, 15 Sep 2026 11:15:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R8X-0000000642Z-3Qhv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EF3F4403D;
	Tue, 15 Sep 2026 11:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF62EC2BCF6;
	Tue, 15 Sep 2026 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789470941;
	bh=n2PC5Ygmm3kKQRsnARaZvzzaiZN9N9d+mwOfSpacRzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E69kr/0m5BAlGRa8jw4ulZGfkHPczIJNp8znoI/FdqRX03EkPyqXek76Byn/ByVkO
	 QYC0wziRaR7+bccM6GPD1/x3H5C6EEQTWSqFJRdSvaAyQyMEX2ZbyEbi2vHsldkEwj
	 wGP2urzUbeUxqCoSY4NSyW6BKcgTZb9oTctBzUcIKKOLDMgc90e4k4gm50+NPC+cyS
	 X0lESV9m7QfCyTqauahSqpiA3/4YUg4pNJVFOPH65V0/RlFdwRKQ4NPfvV2+9UYLFc
	 q4mSe1Q6VD2r6TQCCHm2n+A41Et+csMUVlBkCCoVD6MTWrl8uvakoTUQeFxEKyGsG9
	 kO0TEj/T5GJcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF256C88E7F;
	Tue, 15 Sep 2026 11:15:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 15 Sep 2026 19:15:32 +0800
Subject: [PATCH v7 02/15] dt-bindings: mfd: syscon: add Ambarella CV75
 secure scratchpad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-cv75-v5-v7-2-3297d3fbc9c0@ambarella.com>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789470938; l=934;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=sWEDtsH7Lmq1R/x+RLJKvlPiYjtNzkc/ykiOxa9OBkU=;
 b=/aXM2DKJKmjB7zZ3cVJ5aDZYDN/WogqsTuW5UkshbYkYVPjH4/h8N7f+ZV2ZGeyp1kbwlXWji
 V2dFAdWH3JUDCH5oKG/ss+Zr/1HXTx0PD+7EOSuDEIHlu+tDAo+9CCY
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
scratchpad registers on CV75.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index fe882d3f828b..9ebf702c06f1 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -32,6 +32,7 @@ properties:
               - allwinner,sun50i-a64-system-controller
               - altr,l3regs
               - altr,sdr-ctl
+              - ambarella,cv75-sec-scratchpad
               - amd,pensando-elba-syscon
               - amlogic,meson-mx-assist
               - amlogic,meson-mx-bootrom

-- 
2.34.1



