Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FDD6082BF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AD0UYkTZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=; b=AD0UYkTZodXttn
	UxGqxONnv7ZyhbFgiROZM3LJQpDfLuEQsTFqxR8agOOTmrx8YS37ZxNKpW/qfai08UpLZQpbsVnCJ
	a/H0q+V6jWXe8V6OKIFSvKNFmVtZy7/Vd7XBpu1Q46u74yJc+QUI3eptbYYXKzL2dbF/4hlohtWOL
	2HK8xkwH2jPFoufiMp1fFgPXhh0/MmohMAezRUq1OPbpmWBTaBz7wxyjwZuofNyoQCTftEA+Qdx6c
	2nDolNXMrvsRJusELMeH1AETZ8ZMH81OxmoGVzudOU48+4Ri2ZJrnDmFJjTeQn/r3WuexMxklhqMD
	m8E/UIsr0zMIzzWpctJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJh-00000008OEE-0Sx5;
	Thu, 05 Nov 2026 10:03:33 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJd-00000008O9e-3I40
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:31 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so10794675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873008; x=1794477808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=riOJeDHnKOl8qZ1I9NldksXV+t7kX6cUU4xrN1nR2eM=;
        b=X3+hTHewgUSakOtra7Xnvzg2Ma8aWlrqeyh6jJcvPpuEy6lACtfECIDfyYnWlOfoTi
         jF4iFZ4eORdqrp6if38UUzvgd8qhyAhD6NSQKjMfx2swRon1YU1iPZqxzUAOxXOgSoy4
         rRfvW1EcAtqycmPdWkRLGHqbSxpgO6jKynVqfVjIKEtV1dpDHSMetk5rBGiuBo49zu/F
         73mNjWSKmtIHAUA5QfDQydLUXK+CZ7i7qRTQfhNi8/9lcgbfhbeXei9yVlg/p0qtZ4wT
         DFOZqL72/sVhOpNj7BZdEqhSeBhNefP+Y+ClS502Ik8eOy8sGmb81O/ZHYDywYnXR2/O
         Wp4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaZbwM7kQoVbF5JleLKih6eyrEnDDRNWYbNhiLQqx0KWzIIxfz0Q5lMnQ+hQfF2yMQbjiarMYfZ7wJip3pNvLp@lists.infradead.org
X-Gm-Message-State: APuU4Z8zbQRjTSOjSudZLI4WxgK7euQLLW8SqjkH6GyON+2NEwx6Sfr3
	HEj2n8P92rvBRuL/8lj6/Hn0oiu9h8uALmcz6Vqq6oWtgKb7glCe+voi
X-Gm-Gg: AYBFou3NILbxaPFz6S/eL2aRjYWgj9EH/IrA+a8CRrEV+L8hx49chmwDwwhBQzVi8lI
	jtlE8ONVh/3LldxrgO6zD+QtbTMXSEuvFVAd7UdjoQUs0EgazcTnwi7HBumGQitrl5SRr6CAJ50
	2WpmCKcR5LDRg38xmBeNrRjhqC6XoyiaZZ0jscsHUeelPXZAtaKqpL0HiA8WU2Js/4JmcLTFY4z
	b79txGJlRc9Qj5cJVaEgyBNdruIa49T5WJOQz3hvaif0q30dqkWoZ1E4KIV4pwuWWP8Wve1QTzA
	PK3F9ntMjEJAYhS+azZMF7vvxIRIeq8OuurHbRiX/cnTWjTbCmQgBnyZLRrOg2ce6MfqD7XNDT7
	xdrxYlJq8lRioUzOee3KyFAtssirYMnHRzfzOq/RIJ3lP+oDDhY2JZb7xmWcI0zSNM791vPB8GI
	NX3k1amiknj1bF5MpSCsx3Ke7eafxI+xOxtVf08aftBpYlYO5fPY1M9lmf+6MhrBvgjNC64PWu1
	t3djg6eNRxFakBmRkkaTsZuVnxxWNdUt0FBNXWwE2aNwr6ZfKaiQCasWi4oypHL98l3UNshoq44
	YfmNNFhR7XIj7Sn4OzdNu+AstBp/tTbP6alCY7fpUzTpY7Y1MSDZr0XlQb68W+Buz6yEPj4X9Cc
	BFSetR6MY99cEkIj+NDSyusGvLw==
X-Received: by 2002:a05:600c:3b2a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ac1709a2c3mr391986775e9.15.1793873007590;
        Thu, 05 Nov 2026 02:03:27 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu,  5 Nov 2026 10:03:17 +0000
Message-ID: <20261105100322.37816-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020329_839398_1E7C188A 
X-CRM114-Status: GOOD (  13.56  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers sit in a block clocked
together with the MDIO multiplexer, which probes after the controller
has programmed them: the writes are lost and the port keeps the
bootloader's delays.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
the 2ns, and only the receive delay line offers fine tuning, so only
rx-internal-delay-ps is valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..ff5e50f65114 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -84,6 +85,49 @@ allOf:
         rx-internal-delay-ps:
           default: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
+        # The RX delay line of this glue is fine tuning in 200ps steps,
+        # added on top of what phy-mode describes. The TX side has no fine
+        # tuning: its only step is a quarter of the clock period, the full
+        # 2ns at 1Gbit/s, so the TX property is not accepted.
+        rx-internal-delay-ps:
+          default: 0
+
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
   - if:
       properties:
         compatible:
@@ -106,6 +150,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +187,10 @@ properties:
       - items:
           - const: amlogic,meson6-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0


