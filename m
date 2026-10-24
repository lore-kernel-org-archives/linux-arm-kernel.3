Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RnvT8Hhj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVn9m/rO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=; b=RnvT8HhjJ2Yc4V
	pAfwA+weGTlbLkt0uVyk0Jf8/Ibzpknovbb90F/4iwLWmy/kmNF7k8kNA+JU0QZtK96xBOGIUU2dn
	halvKcG50L7xF2U0gF8sK3eLR+V5kXTfoReTEvZV0xrvhXxQjjjjgmDdpJ5yvBYlTmUDR3nPUw+OR
	QeVhDErCGV1r1MS3cGe35nLm48fd8ZVPTaWgDHgZkqPQcyrPxINKhVEgK8n+CDDPqnuZ2UVxDBHOQ
	4RGIjA9NzsdfQ8LZUT38Gnf68QCazToE/Poz/dPWpjlhbAVd/SvIEK76D+qezqH4l/jIncP9jYvbJ
	I6yQPjpiIsdwfVY7v1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGK-00000000V5J-2Wmm;
	Sat, 24 Oct 2026 20:22:44 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGD-00000000V2f-3thR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:22:39 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4c5d8c7f326so779111b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873357; x=1793478157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=HVn9m/rOWiiEukLJPCK3YIz4SFtkPPQLrfZFdGN+v2IsZF2ZgxFnXZor+kaDRbqw72
         oh5vYV89vsOc1sZTXsgWkGMLIypLQEpTsLCzMtaaWkpwKVN08WTqbFiopTnvIxrWfODU
         J+FGdvqW3koCD8/M0UOOaRZwGKz45mO5rq5nBCHRfyz8BY8yf9/ZwJHpLdmG7Xpzq+IP
         coS+Vc0AjUUMbr90B9ti9O4mLO6PpTi0eYR9Zf2YNxHzH9v6w8nJ6nWMOjNmXYuKbmsm
         113Qa+vYIyB0YGR8e88Dh+82CNd47nlVtMMdjQ88ryKw7uCkAyLMwkvERE98cmI7c93m
         Z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873357; x=1793478157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=wKhM5TdVoEq3iko7s9H7JdXCCFxccpHqcMKKe5qgZN/VVfQ9wyUwhKP+zfziXMql9A
         0pr488a/LJMfGLiEjQ+OOSf1Ou7Fq/nZEuAhW/DIpeLK7hU1Tr7VW3GDQAsBPOsCf2CC
         VewU9Sjr7xydYFu6J+GbzN6RMjuATINRWFKdjgx0bav5anxxD8ZsLDJTuWNuJbc89srB
         CeWc5O/zEbrkzQl4u5h90xspVpnU56ipgvFs3u/K3tWOmkhYvcX01qQfTy+sATVqUqke
         VpragseVdKMTfus0EuSzUpPrtLX3P2QQehmlEbdByUBzoplWct9EzneV5V487J5h0O7+
         dpJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcP+prMjEuLn5m8y27e6drgsGMGUiN6S4stI7a6Lw2yeLyJA879ES4rMEV/+pr66aclLbsFJrn4Da9CP2/Lgjm@lists.infradead.org
X-Gm-Message-State: AFq9FYLyGb3XFALXZn0AAtHWgyZF9Gzf2ogjFgSK0zUj/KUN5sm7HVJf
	GzKiHqnobcKkyfB1JZkycQJr0063rUcmmxB+vK/TJcYOV0yP/DlSu9aO
X-Gm-Gg: AYBFou2p0JsXbitJ4t/TqI13nEzoF3PmK3iDSoQdWQeShJ9CidhN4JIUWzi3dNIuYCb
	AvOx4UJ39LOLsJ6DiAxf1LmLlga5cdpNDCJLaGU3hHtwN4Mb4rR9FNfDq4XfNwjz75FHCgvbkSs
	ZUcsIpLMlvm3mF8Huw50fXleElVIgZ5g9a+gozHTOMZrJMQz02khU9p2IJn4pfKzdF01GBKAIXH
	eq3J8TScuJBt6+IkVUA/DX169VVd3WQ23eG9w2M9kz1chVnOxXmGYIgVZkTvsFRQnXD3iJjtkM5
	x/CVsou5wCEaAFy6TqfL9fJSeftIEQIAz5e+AZHYkbgwyibF0XrmZVBntjCP9DIJi+JxbaIME9C
	CzSrQEcHrBj+I+bZtRrzeK6nwafFvQ/T2NrFUX9RbvUx8dJeSdGALjJuPEdnndBYYxu1ACxseMZ
	HJh/3gTFUANwYL/7IMW+4rWQUdVqw9lRyMf7jOvHBUy5V6UT+uOhpOoKQ1mVRJS/FxO9phBF0BM
	sBy3+Cjk00XsThRLAEvKm/qHUZudsd6H3O4UlpBWGF3DYrYLXO13RgohU+1R6uy4rOvZ04Oxxa1
	TyMN0OWqSltgv1OmB8gaIt09HLYMnTD3Vc90Mg00NY707r9OpG3niB6rXv/UJ11912RcMVkFN+g
	Ftzu/SAlJ88LHDGoEcQykS7QgOslLQZsBZpv9EQm7r4tc1/ovR8XtVYCmMvF+xmsTq+7olCjzN0
	k1AKBw
X-Received: by 2002:a05:6808:ec2:b0:53b:8f8f:ae87 with SMTP id 5614622812f47-55c003447bcmr1551104b6e.36.1792873356787;
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:24 -0600
Subject: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_132238_003957_0B4D89CF 
X-CRM114-Status: GOOD (  10.76  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible for the integration and allow the standard
fifo-size property to describe the capacity. Require the documented
256-byte size for H616, retaining snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..0f8fd0485879 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -13,6 +13,18 @@ allOf:
   - $ref: serial.yaml#
   - $ref: rs485.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-uart
+    then:
+      properties:
+        fifo-size:
+          const: 256
+      required:
+        - fifo-size
+
   - if:
       properties:
         compatible:
@@ -60,6 +72,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
@@ -120,6 +133,10 @@ properties:
       - const: tx
       - const: rx
 
+  fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit and receive FIFO capacity in bytes.
+
   snps,uart-16550-compatible:
     description: reflects the value of UART_16550_COMPATIBLE configuration
       parameter. Define this if your UART does not implement the busy functionality.

-- 
2.53.0


