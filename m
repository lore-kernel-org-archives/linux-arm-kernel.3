Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJ3ta43y;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TzEspRV6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=; b=IJ3ta43y9YKLH1
	8MCci3yQTSbeSkojXdPeChMcf9YM5t8vTs6AUk6N12mQ7N02FQfT1Z+12mKU9eB6CQCcvWjJEu7zr
	ZtiQHDyP83U3+irifuUXbsww2HqeinRwEvG/eXJINJt2ChyuIPZ8VFLqnHmu3fbvxYNE7rkskY/vT
	qEE14sSzWasT+eI3JEe4wwW1S37/94e+UX652WrAe7r8hIQkOI1aBmtThaKs27UehdNRWBCMJvNuT
	0kU5DxUpvvfzWHv4cu7BEMku0jA2IvIYtEkePfLiCyf5JdDjX/HzpsF5QrG5Nplt7iXPJ5UgMDSJp
	priKCr7f5MNPX3MfzWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCGM-0000000G7g2-3YFL;
	Fri, 23 Oct 2026 10:12:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCG0-0000000G7UO-3fZ6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:12:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8060025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750335; x=1793355135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
        b=TzEspRV6pKQ3EZBQcFTx6wznsXi7Ia7A3q5uZvvvLHGrKwnldkqpvdFy8zuNzwrVIY
         DqR0l41uSq1awYCExi46DswiWjlh9Sfc1oyt26hhvnCSJsbP8RTv9UyiK4LwQCobCgpV
         rY/Xy74iZxUq0wZ0vCAlLMeX4fq0W0gU/zsKzgU9wME8XcYgLwB1GWbDekBfHBp2M4xu
         nXDYXgv0w977q9sKgQcjdnocV7kAHTKyxp31lgMSvFD7+fr9Qio8GD/VqZFsnwZr6HW/
         pxuP3OYwXz88nm30rURT2SPm+BPNOQm7YTftsWcjP56qck2YFLckzWeh7UCwmYb9dwGg
         lF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750335; x=1793355135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dq6GJJsBaSDY1IzgGawT/TFz8VL5osKrrjfnYgKJzYM=;
        b=Sr9HvFij/Zhwor0b7eHXPk9mfawVPPh/G2JGZvSfzbVqXoHBxo9egH1NDDcZ/lE6Q/
         O+cxGXXAnHhEMLv5BMn+BDkjHKhOWqzchY8/9nlb3vQrYLOYDu4mUWisf7iFPiNh6McB
         U9Y0AUB8HWboauEFeW90+VE+7rNhuFEpvJpB2QbbHj7DyU0YzUawJi4Z+VOE3oVUUEXg
         v9DGvy9uShRH+G7Ayv+EXE69ZdteVj7eDRSm1RN24YKP92LCXsi80XEcW3YD9KSjv1UG
         vMn/e0n2wtDKh4N3hVGFrTEelvtU9VyKAHojdPNOL62dS0av00XpVMXaj89gnHLdyOBz
         7WZg==
X-Forwarded-Encrypted: i=1; AKwUvByLTzaH9HYg+cj01Rjwv2vKRFgQs/uRBvsRSx7Lkpp2rU39znzQODugN1Zm2VeF6/H8B/oPFpprpwk+PSCuWD8O@lists.infradead.org
X-Gm-Message-State: AFq9FYIrwbPKZ6+BET+2bBEXy1Z6p0CVvHOPw54tTKZPrYH9qU3z5jB9
	HENks5nRmiVWqUZTWa9Wx6SFkHxrzpnFdusiNVG9ajNn7gqkWgCyZSK1s8sT5iYB/N0=
X-Gm-Gg: AYBFou37CPL3mpoMF/Hu1QJp6YgghRPttfGi1bvOA0x/IE9ScjBweafZNNzqp7p4LDr
	tw/F7HxvWUoSqeW35pV+ix30Q47uJbshDpieIBwlqBY/w18KBEQIy38Ah+L5dZUysdaPVcvCq4c
	qKMIKETaCsVRZlL5Qk7KWwEo82MVdO6TDDT3f0pCP1uC4iwIeJWnWs/bsZckCus7tvQJBdHa1TM
	MpmDLgaps/DmagX3/mnT01eYcBGEavDj6+Ui4vqSgoz3MG4EtgkRVfUcikGT8prTRhio1jHIHiK
	jeb9uJU7PIBcCswm7je/ELBFL4HTnodYilDQnAshVDTszE5K2elsUSJk/zshN6AUJXL3syBzmAt
	uCDqq8YIsO2xiajq9hyahJ7AWwiOISTpzsTgpXLRUDLa0aKwg4pqbcXgj29NwCdqyeAtIU5EoyZ
	EfNLwM7zDfQ/gndwXEg4MIEt1DFwGD+wwkDJEFqPw67bO5+Nnmdi8TmCqkfUdO5/1KWScrXg1Wf
	g8dWU081VvC4HlyTlbsvPWzxLcJCbwEXGji1zQMTg4fQs/wNdbcIxk=
X-Received: by 2002:a05:600c:4fd4:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a211f3a5f5mr23914985e9.35.1792750333373;
        Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b898d2sm50139165e9.4.2026.10.23.03.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 2/4] dt-bindings: hwmon: Add Raspberry Pi RP1 fan binding
Date: Fri, 23 Oct 2026 12:15:55 +0200
Message-ID: <0a9a27c58336449e5a2e243b987a8bc85b05aaf8.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031216_995426_83268C9A 
X-CRM114-Status: GOOD (  16.46  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Raspberry Pi RP1 is a multi-function southbridge used on the
Raspberry Pi 5. Its internal PWM controller block includes a built-in
hardware tachometer logic, which calculates the fan RPM by measuring the
tachometer pulses. The computed RPM is updated by the internal Cortex-M
firmware into specific MMIO registers within the PWM block.

Currently, the Linux PWM subsystem lacks a standard API to report
hardware-calculated tachometer values back to consumer drivers.
To avoid abusing the standard 'pwms' property, this binding introduces
a custom property, 'raspberrypi,pwm-tachometer', to link the standalone
hwmon fan driver to the RP1 PWM controller node. This enables reading
the tachometer MMIO registers and exposing the RPM via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
For the rationale behind this design, please see the cover letter

 .../bindings/hwmon/raspberrypi,rp1-fan.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
new file mode 100644
index 0000000000000..53e5b67fa856b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-fan.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 fan tachometer
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description: |
+  Hardware monitoring driver for the fan connected to the Raspberry Pi RP1
+  southbridge. The RP1 PWM controller hardware contains a built-in tachometer
+  logic that calculates the fan RPM. This binding links the fan to the PWM
+  controller to read the tachometer values.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-fan
+
+  raspberrypi,pwm-tachometer:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the RP1 PWM controller node that contains the tachometer
+      registers for this fan.
+
+required:
+  - compatible
+  - raspberrypi,pwm-tachometer
+
+additionalProperties: false
+
+examples:
+  - |
+    fan {
+        compatible = "raspberrypi,rp1-fan";
+        raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+    };
-- 
2.35.3


