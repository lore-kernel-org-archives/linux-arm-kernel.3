Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320B606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eFW4dibe;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gaIfR7Z/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jcrs75do3SplBoI37hg1MInUN49XcuGYOTz0cGN/Z2U=; b=eFW4dibeOaVnbm
	u02nd8dhJfnXhvtt4jEtAX32wNe8IRuSvdiCFxRced+MrO1EmhGHrSyYsLw0m92PYuQyfUl4GWUmy
	lTd1AY9wij3ge3YV3ooOZ6s8UVMHpcsa5k2kQ4R9AZDlxt/xNgQMnXL9XuI9iYANaLI40FGynuIlO
	ABnxozJcyCm4SEF+6LJO3UhWJXru+aAulCJjsniC0SilbKFp9BcOa+jNt5z6raup2IQIObCyD5Fnl
	a8GSjQIywMhV5COYXbE4U0JM46oPdHxYlWoufqW+pklhpTCu1meuippcVjOM9ForC1OUSXr8P81rA
	0q1Kx/VACQ6qsAF3qfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqw-0000000BVIR-0txC;
	Fri, 06 Nov 2026 07:59:14 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqp-0000000BVET-22Qs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:59:10 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C3691201E0D;
	Fri, 06 Nov 2026 08:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jcrs75do3SplBoI37hg1MInUN49XcuGYOTz0cGN/Z2U=;
	b=gaIfR7Z/rBK5v7/l5FOzbBZOTAeKLfInkphiV52Tw6o/Ll1d9W3wQqXEOehOJ/ePTA8nuZ
	ZVQkPOYlPdfMWjzqUnjE6Ml+xxiNqWM7qNQp+lOIQ1NrEq8tZNG6KnKHryk+9DGbo7sRjw
	x8isu4sjSTZUcA4XVk4aQyziJQNe3/j5rOzO9a1qO82gqKL5lP7nTUxo1Ju6bceuXeeTVg
	tsQEYiR5WAaTCTHUCXnI7JhmAvc34JSgQlLtdYOx03xOgxrcDghpOLarXExBmm6hVvQg1n
	qtJRI5qCpKXUBOTRW2JehP7sRJjrIuMtxUzv2a/TjfCU+Yje/pxfXHmqTkCqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jcrs75do3SplBoI37hg1MInUN49XcuGYOTz0cGN/Z2U=;
	b=fCBxgE3viVsRpP+rjwaXGWHKARDheIlK204FI1x+iXJwI5I2jAqsZXRUYyXTBDYPTjFnzu
	GBwRSZXs2LhJEBFfhHfkDowcimhYwEU7r0ng+HPl6i1urHJpDjHVTiaAx5+Y2DkMXTbFiH
	Ca8Cnl7ZEtZEXP/1oLkIa4h1Gj1jFkiEcZvLExkjaJqRjCjycb2CBN79TQ1WjyPEJMF/GD
	yC6sinPHbDLkAF2KY0uIbSkDqQ2yYHaOXWHtdAiRq3F9GHoaxLaPDJ7EU4pvui4fRLe0BD
	5mXWX7v+cHqzBWCC5F1SzOTbmuzp0zl5AvtEQ7gSqkUzjiK9pzzAG5czIPeKMA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793951944; a=rsa-sha256;
	cv=none;
	b=WSyx0Jgb6GNVRPcN38i9ytAWGLn+XNeqVhMxqbCCuOmkY6pQfUKpyFcSUpHydv021O4dVO
	4LOzThaEUhBy8jbBwsaoHzGnbHygE3fmPJT6zFMVFkM37eqWIW/22VgpdK5/U8OHQ1s8Yt
	NjAuwsDgrEeWE6UDSzcFwKiCiqWeHONrbm9Rm090KCOkBucJcHC/Hn1yO0Bb9TVEkXUMb1
	7mjaLuQi8O95aRj9E15WnyqqRWKF7CrEkuIvwnqrUcGmm0OKvyEqzsvxxRD3ScrSrbDo6j
	j9ofV/qu+q/Wr5mDJk1hY5yhjYksEvBCFNjHCkSph3tQwd6JwBV3n8IlrYQTKA==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 06 Nov 2026 08:47:27 +0100
Subject: [PATCH net-next v3 3/5] dt-bindings: net: dp83867: make
 exclusivity explicit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-v7-2-topic-dp83867-v3-3-45e1d3adf1bf@pengutronix.de>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=zOfh/nRl7qM9sGEpSyKo6sDagN6Ev7ZFJAk2eCa2Wwo=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bbjqOaF1p+5/yVfqW/plDsevLuc68/tH6YeDpjserpr
 NCaLumjHaUsDGJcDLJiiiwqCyv4RD0+eEZOE+GCmcPKBDKEgYtTACbCVMbI0Kng7ejBfPuk23Vn
 5WcrfllOevC+6eMBf2NNjRuLVOSypzMyNLt5lvls3Vmj0fpEu6nT/WHk6/ZowfpYDt6/X9eGR2q
 yAgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_235907_840493_D70ADEA1 
X-CRM114-Status: GOOD (  12.27  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The io_impedance_ctrl nvmem cell and the properties
ti,{min,max}-output-impedance are mutually exclusive, as noted in the
ti,max-output-impedance description.

As this is only stated in the description and not made explicit in the
schema, the binding checker will not catch if this condition is ignored.

Make it explicit in the schema that only one of them can be used. With
that, drop the note, which also described a precedence for device trees
that the schema now rejects.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 2cd8311ece5e..833540743bdf 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -7,9 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: TI DP83867 ethernet PHY
 
-allOf:
-  - $ref: ethernet-phy.yaml#
-
 # only the PHY ID, not every PHY with the c22 fallback
 select:
   properties:
@@ -67,11 +64,6 @@ properties:
     description: |
       MAC Interface Impedance control to set the programmable output impedance
       to a maximum value (70 ohms).
-      Note: Specifying an io_impedance_ctrl nvmem cell or one of the
-        ti,min-output-impedance, ti,max-output-impedance properties
-        are mutually exclusive. If more than one is present, an nvmem
-        cell takes precedence over ti,max-output-impedance, which in
-        turn takes precedence over ti,min-output-impedance.
 
   tx-fifo-depth:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -133,6 +125,15 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+allOf:
+  - $ref: ethernet-phy.yaml#
+  - not:
+      required: [nvmem-cells, "ti,min-output-impedance"]
+  - not:
+      required: [nvmem-cells, "ti,max-output-impedance"]
+  - not:
+      required: ["ti,min-output-impedance", "ti,max-output-impedance"]
+
 required:
   - reg
 

-- 
2.56.0


