Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035AAC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofIHb4pRR2eKr0nGrL6enBVnfUnnhPw1khTMmJlQkZ4=; b=uYenESPdB8k4EmhrUxmjtvsy3a
	zZBoz65YRfcC37Y6QhpdSYa+kfthNSRFszrQm+uIG1MUFiFNCjHSxFn0O5JgHgbSS7szQ6nEiFw82
	BkoULT0/yzu9P5jQfJSXJ8ZHcxsv/cF8Eu8JLRQ73cd6dgDWgdHhrA8OoXaGyojiEuMSUlW+nlvl3
	MUCWfzFeoGF2Rzi/LNTeDOIujwF7RoGtwlHE1pdintHBazrzTcxR5EeMd93ERHYH5f2HJVthnhOIw
	B68HH5Hsc9n7f0ExQ2WQ4wquWG2M1pphWdQEsqwPDJqhe8AXN7ukCjuyrUtITCfRJcAOvidPRCFvF
	O/EouKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCaT-00000006BQN-3tWg;
	Tue, 08 Jul 2025 17:58:37 +0000
Received: from [37.205.8.231] (helo=mx.olsak.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC5o-0000000677o-0LA8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:26:57 +0000
DKIM-Signature: a=rsa-sha256; bh=ofIHb4pRR2eKr0nGrL6enBVnfUnnhPw1khTMmJlQkZ4=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1751994600; v=1; x=1752426600;
 b=surX3g6tk4GjKAj77zuA/VclmokR1Hl2O951+8kC3pxl6fPBLp5Af7YstOoY7wdDyeqKvmBB
 jNXPL8LRMLSlXqov6t0xRU4xqnluC7+0oAGTNhQ18De9qaVGsgdyM6iCPRSpPHhRpiJdgpm4JM+
 NJuYe7C7dpqvFmiLKSsRKYJFSRx23hj2mL8C61n5eY3ZwP8+Bv8+bC71c2KWeVCjK1CJHNPtMb6
 23yHSVv9k7TdRGleHe9lJU68ExGHEeB9OUsTduiHd10nr5MFNZt1rVHgSIHpP2eJas/g73F2SaU
 jt4SZpsDQuaM5ELyL2m9bKVkTxwDjNpBN79GJ8edbsBrQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 629382b2; Tue, 08 Jul 2025 19:10:00 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 08 Jul 2025 19:09:47 +0200
Subject: [PATCH v16 2/5] dt-bindings: marvell: Document PXA1908 SoC and
 samsung,coreprimevelte
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-pxa1908-lkml-v16-2-b4392c484180@dujemihanovic.xyz>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
In-Reply-To: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 soc@lists.linux.dev, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=ZyJeDMREaDBgVnlMLZh6vLVIemFrkTRCk7Pdr3JQPjw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBm5AY+N6p+df68vtma9f6cA3/QX0Tz/2032yew7HfXjW
 cv3O+qHOkpZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAil9YzMnxq3W16+Fzwi4ID
 J+tPH7u/MP/V/Fnm4cezj5zj4uk2lBRm+B9yr6ule+m7q/MEZjXHfKvf5hmxVls3nNush2Xpo0/
 J3XwA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_102656_268647_B4D92B1D 
X-CRM114-Status: UNSURE (   9.36  )
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

Add dt bindings for the Marvell PXA1908 SoC and the Samsung Galaxy Core
Prime VE LTE phone (model number SM-G361F) using the SoC.

The SoC comes with 4 Cortex-A53 cores clocked up to ~1.2GHz and a
Vivante GC7000UL GPU. The phone also has a 4.5" 480x800 touchscreen, 8GB
eMMC and 1GB of LPDDR3 RAM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
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
2.50.0


