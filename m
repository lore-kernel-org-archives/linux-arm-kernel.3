Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8FD1BDCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTQYCq7UB1AsE+eKj4CkfRxAMXkU6GUGVwN05DAWQME=; b=N5EBOy7izqjTuXA+Zdd5UzL+KA
	iIEVYt5IMXHRGpq8+D4kynzy3OJJz0yyrw6QJKOE0S7hzEhALKNcDggodPbeG8rpDI9ywNOHKZgeZ
	l9+bAxvQjtdamfWq1audCPGNMlvVPYpHFF8XKBTg7/dpLIdRURnpKM/iWETq2udt7QVTEcUXqruyt
	bk+2TfjOjf0tmqQA7FWal6QdXUNqvVwJqlMU4Ph7WeasfxxqX1K7J0NIc1o+VMDXGn+BiIrDpK4vj
	2pXmxZi26jpbLJlMG2KmLZBsBGqtFQI1tngo+EC+dfLU77lLotRWxVPa0xqS7Nrx2COj+rjiIXJEE
	wh3X4bqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80V8-0000000ESPq-0qtS;
	Mon, 04 Nov 2024 17:04:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Px-0000000ER6E-3HkX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0823C5C4B9E;
	Mon,  4 Nov 2024 16:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2CF1C4CED0;
	Mon,  4 Nov 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739543;
	bh=L3DrkLCOcqjknCMhAQF7j0FUEZocm0qqzVclckvGYag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WORcV19bzEefchoBsg3LNt6oyUKOHKJvKTpEic5Fsghk+12jorMWhsyoUtmCYr4HN
	 j9CvBqCJcphPNEN5OW6NAtFdb+hAX145m7M0VQVNDwRD35H28T+U1mQ6U/eo2IIJ4N
	 iPiIAJVSnhD4J39V12C1avE01Z1UMb7O1bsAsMIBIbMAvYptsHGJIvsPJ+2mDwCebV
	 Sdf8blOBSw2i3SGQke+PexQ+MeQ0SfHeGGeMH6U3tveS+aFpjbeWFgMecywP5/LHzj
	 nEzjz7zs/W9aYHqbdcX2lLrDn4R86a7L0acX7KhoT+lpiki2Dqgp1gJLyv6ZiKbKjf
	 H0LddWLIxN/iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DDFD1BDC9;
	Mon,  4 Nov 2024 16:59:03 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:04 +0100
Subject: [PATCH RESEND v13 02/12] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=6nc60lajp3lpZ1HO45puIg9C6lXhIYLQzqwWa3+044w=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0M0jyo8t7+Qf+85C/u1tF6tlQ1p+3xSTm9fuuu50
 Y9dDya/6ShlYRDjYpAVU2TJ/e94jfezyNbt2csMYOawMoEMYeDiFICJNHYx/C+rZuufZ3Zqwqr0
 m7cztoqJHvGuUWCasXby0YMfhb1n+Wkz/NPVPjxN20L/Z8RbPsH0ZrYvL93rtvYc0Tp5wm37Qu4
 f/3kA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_085905_938043_F3B9A372 
X-CRM114-Status: UNSURE (   9.33  )
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
Reply-To: duje.mihanovic@skole.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index e02595316c9f4939ca5a7c61115f23ca4dc5e1b8..f83dbf32ad1838f25429e22bae14f6c74cb38d96 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,10 @@ properties:
               - ti,omap5-padconf
               - ti,j7200-padconf
           - const: pinctrl-single
+      - items:
+          - enum:
+              - marvell,pxa1908-padconf
+          - const: pinconf-single
 
   reg:
     maxItems: 1

-- 
2.47.0



