Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98EDCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=Sunl+STGohKn/2eITd9iCu6S+M
	3AxdXqfMztxAzSOzp5uEfwzwbwxNm8rXT6tkswvVFb0Zk6xZb9x5qMHt49r3dVIgF+jg25QV9Nlvs
	xIrGsFSYpvXU5Yefv7ttWIeirINub/LkURYeuwyXpWEaULT+oggeApj7vNVsR154USfJqxrF7SsmQ
	prwjNPjp6/9PeaspiLSX/gkeGERb6PWS1OR5dthgtHYCggZgfaKU/vmniTpmkuerblzJZH1FXlLBd
	69+bLR+wwEzzCF4JQYRaj+Tm/Mgk9bi/uKGsRED2OUIgl7hg5Mx1Ee2ZGkpJj1ns0qUL3ljp8xE8m
	i0OZI4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVZ-00000000nFG-0Eox;
	Mon, 28 Sep 2026 14:39:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVX-00000000nDg-3NzN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=Gty1o1eR17B875h9WvFomITL/O
	0ERWRsSloWkF7BNP2KVa6zYOqhY9hC/CC7bioFmRrOugIrgL2eGCI2xPjffJvDdk8NPtayrOce+bE
	2LwjlLLeNr3IB7seCGH8Nf2Bx6UlekgYT/uWy1nfx648cIMgmSRZXBxq6LndDIjvjpJA/1ut+zOnV
	n0KAtqUYASjAWeW2I16dW73I0OkjUM/brIbnxGuysBUuGrklQ/kPrzUez31CER/DbL3RWfLkeAZTS
	SW88Xtq0ahGxr47bQyuEVV4G0bMfxj7NgGSIx7/rfiWui7sqYMDWrQr9pEAN3Gd0i4VyXwGh6Fumu
	1sqHxZ0w==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCVU-00000001Zzp-15Qt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:39:06 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885d4825adso1898984f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606342; x=1791211142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=ebHvommajRW0k/583JDqsOOvzqOgw+afVtIG15p+A4Qrslsh5nLeNwZMecTwGKC0yC
         D9bpZZ4glIOr3je4pbO/97VJRJx3XlDK1m1eRcymHyLV7aBlBUdRQxiCLqdOilulDnIC
         4aY/dJTGg4gPsxPQoC8shx9+nZ/2qbuLiaWsOpph6pWdChnQORWR7TCWXQRjjzeic83w
         bOcC/29it3dsSV8Q+qicCTdfG5hHLCrl8selOs8BI1JedkmwsMWI8h2lbzqvyt4NxD/N
         492C03TD+6G53/gwPkE4fmVFbCMWeyEt5F1d7naIcGtJZOpaQEkQa3IZkGcKlgoMsPNV
         lNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606342; x=1791211142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=qYzLIhceLN4xi4jmk7oTm9DkQcUe3NJN4JlQYC5i83xkSbwzSmeb+9YTp1p0Elxbnb
         MgOXHet3C39lJXdvICJM5t0NVE+sERBFgMqi+czLIA5nRb87UZ6XVe+qkjqEn9YOtkdm
         Gmn/qeCji0aR9Zrn6VB2NdeMZySU5F6/Bhb8cqZjxYLVJIwaYwkaux53bfumOilmhxmL
         n29KHVtefCQ+Y3da+xgOegwvkj/X0zz/DdNOF+i3aBwsuo+En0F5dtCgyHHcXMxRXmk0
         KSnWz2l732pWUah1eC6M41ASGmmzAey28/eZ6plm7PxjCM6QGKL5iKCZs7TSPnbtqTna
         SXyQ==
X-Forwarded-Encrypted: i=1; AKwUvByOnfe2G3POqCmzmEW7jTqYQ2bBk+B5YQ6S1UufuV8CMWsJRlT6YLakOa/RTdlSNW/3+tkTWGwDeLfz1beW2pc6@lists.infradead.org
X-Gm-Message-State: AFq9FYL/MRzTo4l+opT5c3FHores6sZgE8lF7fw5a9U1TM7LkbG3fyz1
	ze84So33Oz95QtBgLUgu3nYSyU1/whGwoCO4rfiz0PHJvjoDVsS4dWVENjjM9oQyG/Q=
X-Gm-Gg: AYBFou0rMEXHKKp8sVIyQ3JwFRgQrKcmjFE0nAbT7ypXdQhcum4ViHL6V829WAwNtmv
	lkH0MEi+aV+y9fMJUbyojKQHo0HZD7kAwEjSGc3CuwouL5hYq+y4SeHXMoieONSGngcB3ohFR5w
	FkQyo+AhE3EFierm3+REqYNWjKhpFLPxrqGP4x9uvU+buyYvAJkLNw1pBeOJcr6InQSBxaUKVUr
	ZXdKDKuwBjVPC4+wdC/ZbD1RWq9RJnqHjluqiVvnToKtrjHZCtP593Aj35NwcpuD3M4L3BIgzj7
	8jImV+R4Tr7RLf/q5o7unx/SKebPQuiWAsNwjyKtB3p/frPWyJE5/qo6QrgyeAUOJhkN19iLu7G
	4r1gLRI7B6dtX7HnFL2LhhixVyCLMAu7I/gqZDbTgSdfd7DOw96j0Z+ifbqNTn6sfraejo2rjcg
	wknj3eNzNBo4EmpFaSHhJGCDfEblxnCnswFszkQ0uxbP1nZ9x41f8mJ59OiUAoooHziRSUBA==
X-Received: by 2002:a05:6000:2284:b0:488:89ad:56c0 with SMTP id ffacd0b85a97d-48889ad576amr11374823f8f.11.1790606342507;
        Mon, 28 Sep 2026 07:39:02 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm28425051f8f.27.2026.09.28.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:02 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Mon, 28 Sep 2026 16:42:40 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1790606188.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153904_394403_6DD23700 
X-CRM114-Status: GOOD (  17.84  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


