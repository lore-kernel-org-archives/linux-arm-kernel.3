Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41054606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4TF9QFP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SJZBY15X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4/oRDqwhi3VDoXLgA5GrAWXdmPaS/aW4+VhU7F5t7uI=; b=B4TF9QFP3Y9Svy/uQuI0LEwS1u
	EM2UjB/C918Xe6tMgY0P7Fqt8p1jb39Cl5UXtZ5cgqeSJuNgU1m8yXN/vQ1Ybf/7DR+FkoCX7CltS
	vibEFLq3llcYOhQoBNufjQBUkWJ52584W1YJQf2It/3jzz77hLKNNPj/xIAFTOhbt3VFKgcNue0P1
	MaBeKl7AVk17FNMlfsda8Htac/Fg4mxu0A0z0d/DB0WiSciiSivvwoFHx25p1qvkwHcIjCFRMspk0
	rpyc+QUsywPFRkN6ECckUCZiUZ420g0OxKQs0S3XeOqAWSqVlOOBorYuucdgeBr0WVum86EVaiLn9
	f/rm0Whw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwch-00000008xyO-0qgp;
	Thu, 05 Nov 2026 12:31:19 +0000
Received: from out-19.mta0.migadu.com ([2001:41d0:1004:224b::13] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwcd-00000008xwC-2wcp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:31:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LNzXwPtAzajvtYxI6EotRBLZdeMB3u0+426q1DrZgGw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793881869; v=1; x=1794486669;
 b=SJZBY15XH8s9rCV7Z4cE9+pIiP0zyWOrnxAYodoDIN+HDrugiIYKEnqbXzJddKHVEJNLtkng
 1Mak7BHk2elDIbLTO/HXOQPP9cf5ZBtLfJdfo+67CLQuJtRbiK/HIqsNdbIfg/R0v9G7+yb2Z5r
 bGfxkK4QT98gGHPXBFWYImLU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 63e722beeefc127e;
	Thu, 05 Nov 2026 12:31:08 +0000
X-Mizu-Trace-ID: 63e722beeefc127e
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 20:30:56 +0800
From: Peng Fan <peng.fan@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <aux3AIUFTEXUIbsN@fedora>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_043115_876636_06A20FED 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:52:59AM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
>while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
>a single "gpio" clock. The VF610 controller has no gateable clocks,
>so force clocks and clock-names false.

Sashiko reported:

[Severity: Low]
As reported by Sashiko on v2 [1], this isn't a bug, but in
Documentation/devicetree/bindings/gpio/gpio-vf610.yaml, the fsl,imx8ulp-gpio
family (including fsl,imx93-gpio, fsl,imx94-gpio, and fsl,imx95-gpio) does
not share a compatible fallback with fsl,vf610-gpio or fsl,imx7ulp-gpio, and
almost every hardware resource property now differs across the variants:


I prefer to keep the patch as it is since it has a fixes tag. But anyway
if this is not welcomed, I could separate fsl,imx8ulp-gpio into a new dt-binding
file.

Thanks
Peng

>
>Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
> .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>index a31f64b6d40b..d1d5315ee164 100644
>--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
>@@ -57,11 +57,13 @@ properties:
>     maxItems: 32
> 
>   clocks:
>+    minItems: 1
>     items:
>       - description: SoC GPIO clock
>       - description: SoC PORT clock
> 
>   clock-names:
>+    minItems: 1
>     items:
>       - const: gpio
>       - const: port
>@@ -117,6 +119,45 @@ allOf:
>           items:
>             - description: GPIO register base address
> 
>+  - if:
>+      properties:
>+        compatible:
>+          const: fsl,vf610-gpio
>+    then:
>+      properties:
>+        clocks: false
>+        clock-names: false
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            const: fsl,imx7ulp-gpio
>+    then:
>+      properties:
>+        clocks:
>+          minItems: 2
>+        clock-names:
>+          minItems: 2
>+      required:
>+        - clocks
>+        - clock-names
>+
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            const: fsl,imx8ulp-gpio
>+    then:
>+      properties:
>+        clocks:
>+          maxItems: 1
>+        clock-names:
>+          maxItems: 1
>+      required:
>+        - clocks
>+        - clock-names
>+
> additionalProperties: false
> 
> examples:
>
>-- 
>2.51.0
>

