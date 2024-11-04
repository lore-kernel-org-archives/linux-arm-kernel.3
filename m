Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00FFD1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w85kzvSZ3IriHg92ylPepyS/VEwvlAoKK9ARESeVl+4=; b=FzCCHZK0gpc6lKIcDlWshIl55+
	b7d7sf1l+VQiYqkneUxw6XJRp1LB9Bfx7wS5Zds396Sf5ms3sqFtZiW2JVQXjJWqvpfnezSNALi6x
	TbsGoqHPUL+/TEF/Uhjo+7eme0YzYi0j1+PLdgq9mKYmzFTQ5e+gi5TTssAZaLVMpvKa5b/vcslwr
	453xqUQgo/UeXJS4NnItqIdnK702ocjPa7+++Majnfy8oQG50FjjOL4ktrZAxpBPkBvXG3RSnpv2d
	5dDOl0o4Os10QAKCCyLAqvJdVDuvymyeGdgFagbrLeIjaVm2Ti3f8q6wdJKCqFRIIaSuBUDn09KMy
	/1rYJQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80ib-0000000EVF4-1H7k;
	Mon, 04 Nov 2024 17:18:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Pz-0000000ER8X-3PAp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91C49A4319C;
	Mon,  4 Nov 2024 16:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 611F4C4CEEA;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=4D8XOtjbC8UY5TysZkndfhmFBX5acb3YFTXYUgMYqgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IPLK9zERO09znRa4QzZ44/eMpgIcXm667HQQxVqcxTgvWk2MfTEJDKPNv7TYYw4lR
	 lVOJznEUuqbRhMuxHNL+rY3ZXn0aCZn0KfDc3xPgWPp0rzhOOhiNgflta0O+s84wVI
	 6ONg7+EGd/g9BCV3RrPfBt8xCvnMyze78OO/dMpDF0sBQReaNKFYNu8D8OB9hqsf7U
	 wHou6M0FRCGcJhCnQxjm66Ybg62RQ6Otg0XnnVLzDQnBwstLMgUbHtUveWLpmd2Wcd
	 VvI2R46TfYBocuCpLgif1G9yigL3LjXki11sqp822Ps6BgU3NDrYw9pCwLdj9PQ6in
	 OB8vZUbYg9pKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55471D1BDCF;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:11 +0100
Subject: [PATCH RESEND v13 09/12] dt-bindings: marvell: Document PXA1908
 SoC and samsung,coreprimevelte
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-9-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=15/cjXcDaPcYZAg2O4CmYNIfoTNEYP0hlzt3MbHnBig=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0NZpj6s7Q25skhCY+qbRc+FeZjllY07j/y+rCWza
 55P99H0jlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjIlWJGhsddXT2bXPSX+UrL
 /N0UoH3n5zTjV1+ZTmw5dLDs4IssXTmG/7nsH1f/3MC3ZeOq/wH3HnlVSC2UvnksqMNnLXP6vBQ
 2ax4A
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_085908_202924_D6EEF8B6 
X-CRM114-Status: GOOD (  10.15  )
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
Reply-To: duje.mihanovic@skole.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add dt bindings for the Marvell PXA1908 SoC and the Samsung Galaxy Core
Prime VE LTE phone (model number SM-G361F) using the SoC.

The SoC comes with 4 Cortex-A53 cores clocked up to ~1.2GHz and a
Vivante GC7000UL GPU. The phone also has a 4.5" 480x800 touchscreen, 8GB
eMMC and 1GB of LPDDR3 RAM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
index 4c43eaf3632e4ec8e7d9aeac62f7204e2af4405a..f73bb8ec3a1a1b9594eb059b72d95dcbf8c87c6b 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -35,6 +35,11 @@ properties:
           - enum:
               - dell,wyse-ariel
           - const: marvell,mmp3
+      - description: PXA1908 based boards
+        items:
+          - enum:
+              - samsung,coreprimevelte
+          - const: marvell,pxa1908
 
 additionalProperties: true
 

-- 
2.47.0



