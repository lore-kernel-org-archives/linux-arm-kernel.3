Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2mUUQrO;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Sm3AaS8n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mTvncITSrmjlfT0ndh2hw1OrlpimSBkCjP2VnMZnln0=; b=Y2mUUQrOyEn64l
	RHd+uKzo42rWSDb6FgGJXt3BbEuPMBxUfE4B2Ezf5C4ifznLD/tPWDB0/puKVjMid+hyiiIh3qoTJ
	qxkrOA5Y34IOOvIzJ+J3AlKH+vBFrxowqG62Q0VIDZOzbtBg4jFv0ImKb3HQ8zEkbrkwkKbQb+oAK
	22/mEiWGLBl+b0rcQjKRretpb0JeaCzyVWzxassefkDUYlnNjy7Dsy7O7S4MaoPjtmBg8+Jfdi3pm
	5WV/aNkEhTiHU7UWN4GMvO79Ea9SAGV2QMeUUNPLwdszMaKqtsQWkcDWMxHRgE8uMtQMkFtappVDt
	kFR1SIo+Ib9+jaiZrIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKP61-0000000HD2w-3tfg;
	Fri, 23 Oct 2026 23:54:49 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKP5y-0000000HD1r-07RG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:54:47 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-353804b591eso2350347eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799685; x=1793404485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTvncITSrmjlfT0ndh2hw1OrlpimSBkCjP2VnMZnln0=;
        b=Sm3AaS8nQXsQS/HJFYVBdBCv1RKqz9IemXjj8efCRsEDCDKZNxeR2pkM+FjwvazY00
         kjOe4Zy8IOH6Cd5c/itxO89htYwAdIybspO+Hvpy7ze/JMVNj0y/BIIKrrbFw6oB6Zfb
         a8IUFQMMXLlHjvflSfwBf9b6ZSXnYWR2qXmk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799685; x=1793404485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTvncITSrmjlfT0ndh2hw1OrlpimSBkCjP2VnMZnln0=;
        b=DtJuxMvvUy/zy/vq7TJzf7iaSBpdhcRwxarYfUH3JIiIEYWti++42Of779XtoSFCso
         /9Wy8OggIciHb4OeynxQvLr9yC3mpfCPjBSTk7KD96vLxBJoiaaUhEPkfdAwsWS9kjHZ
         QKK4GJramt1XIkfvyhBxtF22YEel7UAA4y4hVR7a/tG3Efq8z636wWoeGssJSy5hqekr
         RtWg953AmU1Q4SCfzX8Y6rJL3I/zL8Eo4tzK6qDcb6TxlValyN85LNLZAX+P9vTsvNU7
         onEbSjdKfjTQ7lMzOEhElqNU7Whu2Xtttzv61OEHBP/004wOF+QAuNLlkpTlrNdvtYVB
         lyyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5SfzgIITjy9Ih3ATOigzAMsL38XRuw/X4ZdLycnXxxD6I53veBgxfRjpiHsrXGeC6XJhk7L5Cpa9SVc+Q3STM@lists.infradead.org
X-Gm-Message-State: AFq9FYLugbFT7I3WHSi3/T+EMXiPaf7pDOQ8AWLF2eiTKlFnloSw7XJ1
	uZW7H/b8mw4V8LcPi6Cy5sXHGbqCt1bvlf1IUu0P5qgJ3mEltrSaGoq/cNK0SVzwwA==
X-Gm-Gg: AYBFou3GkEbzrMy+Phk2cIYrwdogvw1T5dHOXvCxnqeLXSpmN2OtId29J4YdnJr8rVA
	YLLTlH8o7EteROU18yZia7iT6H5zaOdioGqC20jwhFDsjgv4szl0UQfAYz6CsDTJq0Eujncb7kG
	v9cM3bdXByrQ/Qy8je27gxv0xcenBrHlqrFloMudxlVJ6xXEMHz+CL/ImvoHQA7E5mTH5yeMdzZ
	9suqSmez33cKMEYJna41McFx/oT2lHIiQzFMVazJdLpKgr79e1HktjqGEGwEXZJUgSvUqWxKknj
	HC31FTuHSEjVlOkAB+jEWZkRswLStpOW8S0Sa3mFn09OPS3yTkaSeJ6tvMniWtchoK+jCN8Ldel
	mTXhwjXrg4MI3k3LLWitfcR2MNNcydmjaF7E8kiNAgOxI9h/P5+ms9P4FM9+Gj38Z5SMGhWXy3b
	BOstcf7J5GaTvKPinZWpWbfQCOlYE2oRFJW1QTL86XVPuHFNnbEo9BZ4FdO/4H+ymo1gRt72pOJ
	NH+Vz0LnvaGCUD0YNZgQNhNsfSwkffwSuAIV8AwNZapk5nKazGmXPTdg0xPoVEUy0yNCfmxEtDe
	mVgRexGMnrX0PCH33v1u3uOt2DQxV+K79K+0JKJi
X-Received: by 2002:a05:693c:4153:10b0:369:21a:dce0 with SMTP id 5a478bee46e88-369e847a667mr1124175eec.6.1792799684880;
        Fri, 23 Oct 2026 16:54:44 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
Date: Fri, 23 Oct 2026 16:52:20 -0700
Message-ID: <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023235408.3063350-1-dianders@chromium.org>
References: <20261023235408.3063350-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_165446_095725_C53512EF 
X-CRM114-Status: GOOD (  34.30  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce bindings for the MailBox Array IP block present in Laguna
SoCs (AKA "lga", AKA "Google Tensor G5").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Rename binding file to google,lga-mailbox-array.yaml.
- Drop generic "google,mailbox-array" fallback compatible.
- Add "google,tx-payload-words" property for queue-mode TX message size.
- Remove unused labels in DT example.

 .../mailbox/google,lga-mailbox-array.yaml     | 226 ++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml b/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
new file mode 100644
index 000000000000..f265993fe71d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
@@ -0,0 +1,226 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,lga-mailbox-array.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Google MailBox Array
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description: |
+  The Google MailBox Array (MBA) is an IP block in Google-designed SoCs
+  starting in Laguna (AKA "lga", AKA Google Tensor G5). In a typical SoC
+  that includes this IP block, there are a number of instances of the MBA
+  controller with each instance having slightly different hardware
+  parameters and intended for communication with a different remote
+  processor.
+
+  An MBA instance has a "host" that is defined as the processor "providing"
+  a "service". This is typically not the main Application Processor (AP) but
+  is instead some specialized co-processor in the SoC like the Central Power
+  Manager (CPM). A processor (like the AP) talking to the "host" of the MBA
+  is a "client" of the MBA. A given MBA instance only ever has one host, but
+  it may have several clients. For instance, the CPM (an MBA "host") may need
+  to send/receive mailbox messages not just from the AP but from other
+  processors in the SoC and each of these other processors can be "clients"
+  of the same MBA.
+
+  The "host" of an MBA instance has full access to everything in the MBA
+  instance. It can access its own private set of "host" MBA registers, the
+  "global" MBA registers (if they exist), and all of the "client" MBA
+  registers.
+
+  A "client" of an MBA instance has access to the "global" MBA registers (if
+  they exist) and one or more sets of "client" MBA registers.
+
+  These bindings are focused on describing the MBA from the point of view of
+  a single client.
+
+  As per above, a client may have access to several sets of MBA "client"
+  registers. Each set of "client" registers represents a logical mailbox
+  "channel". However, because each channel may have different configuration
+  parameters and a mailbox "channel" in typical usage means one of a number
+  of identical channels, each channel in a Google MailBox Array is typically
+  referred to as a full "mailbox" and the whole collection of mailboxes as
+  the "mailbox array".
+
+  Mailboxes in an MBA instance have these features:
+  * 1 to 256 32-bit words of shared memory.
+  * The ability for the client to ring the main doorbell of the host and be
+    notified when the host Acks the doorbell.
+  * The ability for the host to ring the main doorbell of the client and be
+    notified when the client Acks the doorbell.
+
+  Some mailboxes may also have the ability to have counted doorbells. This
+  means that the receiver of the doorbell can tell how many times it rung.
+  This is intended for implementing "queued" mailboxes. See below.
+
+  The MBA hardware doesn't have any specific directionality. That is to
+  say, both the host and the client have full read and write access to
+  their shared memory. All mailbox instances have doorbells going both from
+  the client to the host as well as the host to the client.
+
+  The mailboxes can only be used for communication if the host and client
+  both agree on conventions. These conventions are described in the
+  device tree as they describe how the remote firmware is expecting to
+  communicate.
+
+  Current known in-use conventions:
+  1. An RX mailbox with payloads that are of a well-defined size.
+     On mailboxes of this type, the host is the only one to write shared
+     memory. After placing a fixed-size message in shared memory, it rings
+     the main doorbell of the client. The client reads the message and Acks
+     the doorbell.
+  2. A TX mailbox with payloads that could vary in size.
+     On mailboxes of this type, the mailbox client is the only one to write
+     shared memory. The client always writes a payload to the start of shared
+     memory and rings the main host doorbell. The client then looks for the
+     host to Ack the doorbell. The clients of the mailbox have ways to know
+     the size of any given message.
+  3. A half-duplex TX/RX mailbox. This is a mailbox that can switch between
+     convention #1 and #2 above. Since both sides write data to the start of
+     shared memory, the two sides must have some convention to know whose
+     turn it is to send a message.
+  4. A "queued" RX mailbox with a payload of a well-defined size.
+     This type of mailbox is only possible if the MBA instance can count
+     doorbells. On mailboxes of this type, the host is the only one to write
+     shared memory. When the client doorbell rings, the client reads a
+     fixed-size from the next "slot" in shared memory and then updates its
+     internal state. The shared memory is treated as a circular queue.
+  5. A "queued" TX mailbox with a payload of a well-defined size.
+     This type of mailbox is only possible if the MBA instance can count
+     doorbells. On mailboxes of this type, the mailbox client is the only one
+     to write shared memory. The shared memory is treated as a circular queue.
+     The client writes a fixed-sized payload to the next "slot" in the shared
+     memory, updates its internal state, and rings the host doorbell. The
+     client can keep writing more messages as long as the circular queue isn't
+     full. The client gets an interrupt when the host Acks a doorbell and can
+     tell how many doorbells still haven't been Acked.
+
+  Conventions will be supported with a small number of properties specified
+  for each mailbox.
+
+properties:
+  compatible:
+    const: google,lga-mailbox-array
+
+  reg:
+    minItems: 1
+    items:
+      - description: Host registers (not accessible to client)
+      - description: Global registers (not present on newer IP blocks)
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^mailbox@[0-9a-f]+$":
+    type: object
+    description:
+      Each sub-node is a single-channel mailbox.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      "#mbox-cells":
+        const: 0
+
+      google,rx-payload-words:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 256
+        default: 0
+        description:
+          The number of 32-bit words in each mailbox message from the remote
+          processor. May be 0 for doorbell-only. If not specified this is
+          assumed to be 0.
+
+      google,tx-payload-words:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 256
+        default: 0
+        description:
+          For queue-mode only, the number of 32-bit words in each message we
+          send to the remote processor. If not specified, this is assumed to
+          be 0. This is only for queue mode where we need to divide up the
+          message buffer into chunks.
+
+      google,mba-queue-mode:
+        type: boolean
+        description:
+          The remote processor is expecting the shared memory to be treated
+          as a circular queue and that there may be several outstanding
+          messages at once. Only usable on instances with counted doorbell
+          interrupts.
+
+    dependencies:
+      google,tx-payload-words: ['google,mba-queue-mode']
+
+    required:
+      - reg
+      - interrupts
+      - "#mbox-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ranges
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mailbox-array@5240000 {
+        compatible = "google,lga-mailbox-array";
+        reg = <0x0 0x05240000 0x0 0x00010000>,
+              <0x0 0x05250000 0x0 0x00010000>;
+        ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mailbox@0 {
+          reg = <0x0000 0x1000>;
+          interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,tx-payload-words = <4>;
+          google,mba-queue-mode;
+        };
+
+        mailbox@1000 {
+          reg = <0x1000 0x1000>;
+          interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,rx-payload-words = <4>;
+          google,mba-queue-mode;
+        };
+      };
+    };
+
+...
-- 
2.56.0.257.gf7497c7d27-goog


