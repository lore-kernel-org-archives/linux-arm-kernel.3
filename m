Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677D0F44875
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4GNYk08qocSjMmlFQv9r58JfdZ961NOnAm9HRPCHcY=; b=ADxrGkLo1qzJ+CIpt7aPIytOzS
	viU6T32t3s85kMpcuW9oAzq6WQUy5zhMhja5HbN26ZkW4CFyfc7yYE2tU7IAac+Knunez4GTxEzHs
	2hBDWTs12NxxNjBlZNjb2bxxE7yF2MlzjZ9kJPD9Q01i3XBWsnN4b6MBEDNDuwvkf6WA8ejTYKmLy
	CWuKNW18s5OacD6cOXMHhTQKzqWUm729dNMKmssmqTpUoHZsxLnsa0K4wiEf9UX5x4TbPV9rVYpp0
	z9IbQlTqIZSbjpdWAZFqWSn8OtKHXKITUvf5hA54Vc3jdQZ7yzVO9XCe9oMf7lp1Aalhz8947028T
	A/QU91dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVs-0000000CMHF-10o9;
	Fri, 10 Apr 2026 14:07:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVp-0000000CMF4-0ySY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 14:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=b4GNYk08qocSjMmlFQv9r58JfdZ961NOnAm9HRPCHcY=; b=VsNNbkarRLNUVVehFJTOHenkHU
	2PHrfrOaGLujQx7VxwPv5IZ9u+vQ64XeAYKZIyhjPrCSBbRTuSNOT0wedB6kEUzu9q8cvKcHAtGXn
	dbhWxJ0zF2nPCxjh0q93Q8/MSFh3PjEsb/LJmVsZAQSBTtjwPQpWv67dM9zLA1cNFHXfOAMVqj2EP
	35uWUklZJ72cS8PzMsYgecLkmMV/lSX2PPVyZ2TRqoLPv/rTP9GGlpVInucsHFsqftz9+H0JeZEWu
	avVGv7CJiqpDWiYTiFvf06CbeqWH5ubGjPN1FCYzYOW6qDSr6X+6PwQC+ESbJ7yFq26oTWG5CX76J
	G7saVdgg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVl-0000000Dczc-0Jk8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 14:07:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so31937335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775830023; x=1776434823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4GNYk08qocSjMmlFQv9r58JfdZ961NOnAm9HRPCHcY=;
        b=UwOYYkC+N3+Jnl/ToUsuU155sLuyn9U5JuV5hRmDIw39Cqn6YZC0LOV37YWhF59VdF
         lcF60XEcZjz3nVULQK0FvoHB+H7EftyZnPGSGqyqXkgaXlB6cXOyWhkUsovtmfPMd4p8
         SClDggaTYQoj7xfB2RKCZ+6lxa0og4xWoCiNn5Vk3jgFnDRuwrM7K8kP+7sydv769Kec
         VhsbNECb/AWRPGt48+QQAboBfOq/AudRg0ioXAQlT4Bp+W5ox/Qn0O9vFBHMHm2AQ8m/
         ZYdgH1/JkVEruGkGC2c/mF98oYMrUDObARKg20ig7l0HyAOVZQXbUxwZG7EBg/ZpouK+
         nstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830023; x=1776434823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4GNYk08qocSjMmlFQv9r58JfdZ961NOnAm9HRPCHcY=;
        b=jD03KnNUgZWpqPm95Irb/sO4zA/pJgB5pqXRc/ss+WaKrytbBbPpPzHGvdseBc7vLx
         dy2G/gD8p4MqGOzBbjlXBLfTbRsOwa0Uj59fNvLl6uliNSmxAZu0BCROKTpBEQGOGOSI
         RHAn3PUc36Od9KrRPEcMg6eDB1IDjPUaolRbzutJNikC3QMnGLygs6WuPSavSX/6CyM1
         l4xrkUx7A4F0PLaPB3FK0fr0i7j/uyyvsnOIk1j7rhCNU8YGK/ZLaqbKaqxZIshbIGft
         PyghuHpWTI5C9/ty6LHwf4p0TLzdVlgSRt/6Cw2qyFfF98aYa53gggwGctlKa4IDdJr2
         ugXA==
X-Forwarded-Encrypted: i=1; AJvYcCUswxWvi4PKK1KJtenfjSA58j2IfMsDIL8++15WURrVrY1Gg2oM+XFSk8Ruu2nOxl+XOuXQ8xZXXyYiQdLmoHak@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj35OT+lvXtjFqR7khrdX7tcIZIvHn2ZKscZsOBcWuAgnlVe0A
	+xDzAAUYvvnRQGOviSV/DTLCwxY9iGKJD4NTO8IWGjK2E4g/gamLNrSPZUnFuMYJbJQ=
X-Gm-Gg: AeBDietkE1RGRwIbcY+LhgApkEIEW8zwFrCY1gx6J454JIYyvT7xE9IM3bQ6H4Rrbo+
	FGuJQjkA+dPgXc+nZYHwgWT6ikbG8VFmnU3mPefc67eTD8/N5+UfOhxIBVov0qggKIjT+9zjfkC
	BsvUoa2bZfmhf3k4wJ9YijBm7pvWeFYmuJgC9SkLEqHoCCH+tZl99VGp1ezK1jRSTLMbk1g2LV3
	ZT0qeSJS2K9WtIZOqyFzZfNlrXOvNLjsViOsmJlTS9kAHTqtMnuDiPMI04R1519Q+jeQPMOMmtx
	8jHdj7L0CNHIOYA1Ncd9xZ9L+ATJqxJcd2f2GxeVYD6Arto1E/4fqJsZ57NMH9/55FwA+HyboQw
	X0hg7cBXcSFg/sC0FoCyJc0v483towz5+kdXjIyWHYS3KqBKSoxt/bzMn5g6SVsDaNqkrMBaNtM
	0Cit2GwjHxH4i/K0KnLpJ0YoFPrBjDPY6zmQDNdK871GbaWH8mhQ==
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr46582625e9.9.1775830023400;
        Fri, 10 Apr 2026 07:07:03 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b46ffsm27847985e9.6.2026.04.10.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:07:01 -0700 (PDT)
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
	mbrugger@suse.com
Subject: [PATCH v2 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Fri, 10 Apr 2026 16:09:57 +0200
Message-ID: <6f0fa1a817b5af5040b652320daa7268297932a9.1775829499.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775829499.git.andrea.porta@suse.com>
References: <cover.1775829499.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_150705_165106_15EB9BB4 
X-CRM114-Status: GOOD (  15.10  )
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
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..6f8461d0454f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,54 @@
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
+  fan using shared registers (syscon).
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


