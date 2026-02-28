Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E954B1048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9N39ZcJRnL6b2T3xB4+gGFPS+W7V2QCIw4ow12jAHQ=; b=N1FbLdQmand/ALwg+Bf0kHHlvl
	OKOfaKAMu2BAqITg70LiolzS3Q0cg9iEiQLVc0p+4Kubw7mUGueFlzr11P8R/jd42qKQ5dnoRpuHK
	IXA1LGA6Az6j++MMEf9UqDoClIh1RWH2CG5c1sBHCbjtQ0qEneASp0omIgAOaEf7ZQvsf9eqte749
	vJ/ejTELIqKGuuoMfFpIbidNCutUnW1BVdIg/n6vGOpF8wwZ80h/Y/oxCu1RLjELXUlO0+WRsDcpK
	xOcpx10ENfOgrbgso4EIKZ3Urnvghe5lC5nBv0dk3YwP1oXKfEBrGa9wNQv+3+gKkwwhgRuS+J+wa
	X9rNwWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qI-00000009IMN-3VmF;
	Sat, 28 Feb 2026 00:05:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qF-00000009ILG-03j6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 782356132F;
	Sat, 28 Feb 2026 00:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBE4C116C6;
	Sat, 28 Feb 2026 00:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237154;
	bh=lOpOpGcPum1JnUIJAb5DSP7Q2DV91UwFGwFHhHgI4bk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dSvaJFnX83cUmMhp6GKH3MAGWF8Gc9zLyc5pjJRtWI1Fi/9NbPu7JzJFUI6nCrwa6
	 MZ1N6LywtvAKvf1gvKI2As/Bln93ll0dWgSbggPWf1egIrm9xRuK1cyYbT+dFfI16M
	 pJCulxhq0m9V7MRiJ706sTMvTvMkyDJl1jfsFm3zaf4eLt33Ep7jhT8hLfzNaVQ1i2
	 Y6LnPU7fLzawPNlFfPF+XGiTLGG7KHu/c/W9IzZzHMUYHTFL73ZCfJ4sC70jlbFMhk
	 L/8I+TIKB870OIu82bdgeeiBBh3+nKz9/vZYZYC6ss+NN2vmWq3R9zN+CCyNIzMIN7
	 FHe7LLCRoDuJQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:44 +0100
Subject: [PATCH 4/8] dt-bindings: vendor-prefixes: Add Verbatim Corporation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-4-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Verbatim Corporation has manufactured a few electronics items
over the years.

Link: https://en.wikipedia.org/wiki/Verbatim_(company)
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..46ec1d935a93 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1761,6 +1761,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verbatim,.*":
+    description: Verbatim Corporation
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":

-- 
2.53.0


