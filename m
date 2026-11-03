Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C83606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=13zSqtkQ;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HOFL742i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=; b=13zSqtkQPgHHcbsvQ4XEXHN8fv
	kIRcj5V/XElDYJae+8dS2BMnrRaUQrZypf3z1wzAsdhpc2vo7Mnk1nVRbuxOoaiWe5h2fYFd+SXJG
	GC8wdBVo0sul/Jtewc4B7fEQQEETMgjSjojRzOxPPGFmisKz/2J1uYsKd37xQmzEQFOk6AWK9XLvq
	MGSlptb6BE6Jl9yhdh3zghF9geOwoIks3iX7JXS5sPuqQATeVxLFwtW8ZA7HmZXCtyYjtUNwgWBtD
	4GUep/eeemDogw1euQnA6VGbxx1/tVnCcBu3pG/AYJB5/vBvQFfF2KOfHGADqIsQkSRR3OCPZKI0N
	xllCuj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66f-000000012kB-42qs;
	Tue, 03 Nov 2026 04:26:46 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO66H-000000012bo-3z1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:26:42 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so4064691b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679980; x=1794284780; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
        b=HOFL742iFHcLgMlCmxfs2UQcU8iEO3zdigi/QHQ0NmMfnXwz0atOsxme9/F7rkdGPC
         Ny2FwpEZj3jWrHqKKBAJ34kVLFWYFoSEAgMusbqrOqmoN3DxIb+z/LzTJ1R3lvBa6Nf+
         mz8N6bC3ZiIVkhu8Cf7m6VHOGr1/L/9JHYA//4uk+iqO6v03g5qQsFPpR/EiLDWunXyh
         EO0ue/0lyT3uhp6a0944ghMvCGOv0pSJwpLxVgCJdWkZ2GYJa7Rhe1dkHtdiWXqHOI7i
         aeFgsMbwxwUqMDdWFt5kGwVsEOA1cGMYhexHmWYV9YD0ABRPWXIWF1AvkSCNgiyH5bDU
         FDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679980; x=1794284780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
        b=C1swdZRDxKrosT3vKAW1q/TuMJCV4gQbrdKbXHejW33pwLEf1Mg9qLFEuwqetf6iJG
         p32mywJcvVxq+lNLWNvEHLE2QTkP5AnVbvIgdSum4IlnAIRiOgAmySMNEpcECY2go2f0
         fQNeQ7Bg6fyrzA6wy22sjLsbQbcScgx+GNNwG92EpMz+LgAkK9RPlVKyBW+wf6bHxq89
         2l60VqJk+VCeTGnBni81YXOITRz7viKg4OqKCXecYbVrB1lv15hgZPH+xLz0XKWbKAZH
         NEwv+7tPLx9cGqb9gQ/SRFiv6K0nuxMm5SaHi6UO/8+yy6fsMH/lTmgtTeNNgBFFxC7Z
         XoQg==
X-Forwarded-Encrypted: i=1; AKwUvBz3G0hz5/j5O2FqOZzmU77BzUwvoEHEC56fxttBz1I5iQJKFQrRRdmhGj0PHqdC1Uu7ue7w3+e8jqw15aoEVPck@lists.infradead.org
X-Gm-Message-State: APuU4Z/IRMjN7taArzGZ6s906jBBkV2KzkYh5ikU9OdqQywRr9O3gkX9
	wQp8JvfX+CXnmZQ9cz+NKPuOlmlx8tknxT72omC3kzN3scJxve2DHNWwi2IATnK4najvK7aEJaf
	jwacnMX4pqWVuUA60RVcaqkXVupkJbNFdeA==
X-Received: from pfbli8.prod.google.com ([2002:a05:6a00:7188:b0:8a2:7343:1d03])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:118:b0:3e2:83bb:a61a with SMTP id adf61e73a8af0-3e928a7d42amr11416861637.5.1793679979791;
 Mon, 02 Nov 2026 20:26:19 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:06 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-3-vamshigajjela@google.com>
Subject: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_202626_553841_2A0E22B5 
X-CRM114-Status: GOOD (  20.41  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-31.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

Document the device tree bindings for the SmartDV IP Solutions MIPI SPMI
master controller ("smartdv,spmi").

This controller IP is integrated in Google Tensor SoCs starting with the
G5 generation (codename: laguna, canonically written as "lga"), so add
"google,lga-spmi" with a fallback to "smartdv,spmi".

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
new file mode 100644
index 000000000000..e0512e60d932
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SmartDV IP Solutions SPMI Controller
+
+maintainers:
+  - Vamshi Gajjela <vamshigajjela@google.com>
+
+description:
+  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) master
+  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: google,lga-spmi
+          - const: smartdv,spmi
+      - const: smartdv,spmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      Core clock to the controller from which SPMI SCL is derived. Optional if
+      the controller uses a free-running clock and clock-frequency is specified.
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Input core clock frequency in Hz when the controller uses a free-running
+      clock not described in clocks.
+
+  smartdv,master-arb-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      Enable master bus arbitration phase (0 = disable, 1 = enable).
+
+  smartdv,master-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description:
+      Master ID for the controller on the SPMI bus.
+
+  smartdv,spmi-version:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      MIPI SPMI specification version used for transfers (0 for MIPI SPMI v1.0,
+      1 for MIPI SPMI v2.0).
+
+  smartdv,arb-retry-limit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 32
+    description:
+      Maximum number of times the master retries a command when losing bus
+      arbitration.
+
+  smartdv,prescaler:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 0
+    description:
+      Clock divider value to generate SPMI SCL from the input core clock. Writing
+      1 divides the system clock by 2; more generally, a non-zero value n
+      divides the system clock by 2 * n.
+
+  smartdv,read-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 32
+    description:
+      Number of SPMI SCL clock cycles to pause during bus turnaround on read
+      commands to allow the target device to fetch data.
+
+  smartdv,arb-scl-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description:
+      Delay between arbitration and Sequence Start Condition (SSC) when the
+      controller is the Bus Owner Master (BOM).
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@14853000 {
+        compatible = "google,lga-spmi", "smartdv,spmi";
+        reg = <0x14853000 0x100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        clock-frequency = <19200000>;
+        smartdv,master-arb-enable = <1>;
+        smartdv,spmi-version = <1>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..f44c597c2075 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
+SMARTDV SPMI CONTROLLER DRIVER
+M:	Vamshi Gajjela <vamshigajjela@google.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
+
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
 M:	Steve French <sfrench@samba.org>
-- 
2.56.0.317.g454f8302e1-goog


