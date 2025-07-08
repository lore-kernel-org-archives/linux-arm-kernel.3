Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE54CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H444FZZ26Y/falHC/mRcuhbvMASG2hbu+jZAxqiMw+8=; b=GJSLcyKd8E60n6VcRUK68i44yo
	iy2Myd6aiNsq5yjzBUjUJ6N64yHxvlB4qpS4H2XzYKQ3OAle/+HDed2GxGAmoUh4OFtUvYAvZ7lhA
	lMcDJ8H2yoC1ZHFdPZVXWdRyk3jAPSCuRdtr0LH5ZKgqmxcqbEzJ43XCatprERzyNJl1Bn2nCvfDl
	kkCJgZzP6thx5fnu06cKSD/WXY8qzENY9MsidDpAfjKhk8KSguZJ2N8zXBRrpkHr4PlJOeVPgopyx
	ca+K4JyWANR5XFnH2ZO4wdxme9x/tARDbBlt0gGkvLJORftVO3Wf5cG2Xqrr8SdlJAScgTJq0XHhb
	ucryBWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFMa-00000006Zxz-2HCr;
	Tue, 08 Jul 2025 20:56:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElJ-00000006U74-0yhd;
	Tue, 08 Jul 2025 20:17:58 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso5587870b3a.2;
        Tue, 08 Jul 2025 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005877; x=1752610677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H444FZZ26Y/falHC/mRcuhbvMASG2hbu+jZAxqiMw+8=;
        b=Hf2DP6e04wo7rvKBF2Q5nvJuNKPXU0xOBN6hCnTIHZ71hVU13qrAPGt3xXol8c/OsY
         iPyduqWYtsMSVduQy2auI8KPpdHFhtD8ql0ZZLUE9LYOSzYTnZuLk/AuQV8q7nlEA0Ol
         3RswOeZF/wtrCxZ6hHJbUX58j09/8aw8TAs2wenrEEDHcSYcHOttF37WTGltFEGgvkcR
         EmPdJc0QTNKrHyhrbryjtxkVdcZ+PmOfP9WCE6dk4fRn7Yp4dJkqkX0/F/igaLl5ky5Q
         pte/fH3CdWC2paVx9Jj2aP8Al7NRdUUDcBIBnrgiYzKDG9tzkXvng6IPVSuUlQ9adIGU
         rhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005877; x=1752610677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H444FZZ26Y/falHC/mRcuhbvMASG2hbu+jZAxqiMw+8=;
        b=hlfNCo/acb2cE/In15PkvisNn7RJNZb4Id1F4ddINs0Jj4+toXT6c5chVIDODjJwwD
         6MD+ZDCHAupeOVbMr4uM5Su51q+4lQIANwhFc8ZbVXYBPUv6YHa1fDWeD6PGqNUcq/cG
         hTJq1ShlyBOh+IxLDyHnEoEweUznw205ffpwYkLIfHBefTU6IoX4vJJBRffEx5ja82Eh
         eWr0m6NEa4i9r8d9sfPQB5QYWvToGqCMvAOcUnhJtAejpwQdY2e4Xlv4jDCoYFBtvX02
         Cq0QbmqaG2ejEntpmQzJqXz4l7bp9h47vNtFdRqXYjHsPXNQsisWGp280+PjUsU1jIZ2
         YXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKX0rYS2fFfT9jmtJBYlFFGEubLK3qKgkff9fa78cUm3ppxhhVaFopOWzdsAdAMVhby9ESN1yVP2jvGRQ1Fy8=@lists.infradead.org, AJvYcCWk07i6XIqazLbCNk2nS/b+7QLgqDkslAz1erimrE/GWgfRopeZ31dyoNZI4vzAajHRQcwY6j2z3m4KEt4KCu/e@lists.infradead.org
X-Gm-Message-State: AOJu0YwaPS/FwhSMyg7EUFofClr4UV5bCzpy0ymcG8FLOKbh0BBGnv39
	zb4OQXQaw4sCxFpethqHQ5LiPhU4GM9eiCi+Vwa3m8pH0JPR6pS1Ie23
X-Gm-Gg: ASbGncsRPVmA2HtndAiBjmJRH61aeBRpynhl+rIZkOYjDUq2aUH3s9uRaVxQ4LNwHdU
	kzrGiXiu9Wdi/7yt/4h6NXyqFqK6w6wW7+O4PSIjU30djRJrLB0eqIn/CdLnBUyWZCucXYh8eqC
	g2ynt/enqdgv4a17OZH7ILp7VvoZi8sL8+moA0hvYYRNZFyhMJaah1FlAjtozYXmH/MWpWIv0QA
	7DqJ5UMFBRkz9dFAdaX+nBzfPZKQiZXHPnUT3BM2/79kaFanFbqtBEnCaMtPOLMeiyKi5HMelDH
	H/gU//qHMM3HY7Hn1tSMxC0Q5IDp1QNglqcMIbyfTu0=
X-Google-Smtp-Source: AGHT+IEzzxNAAv00TJG8Gk8h+YAcNBRVGpDbVFRbhweDtAvP5Qa6pIVfiWZvjxEP/RXGT1BW/sMzpg==
X-Received: by 2002:a05:6a21:a34a:b0:220:83e1:49a1 with SMTP id adf61e73a8af0-225b9f641b1mr25210715637.19.1752005876682;
        Tue, 08 Jul 2025 13:17:56 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
Date: Tue,  8 Jul 2025 13:17:45 -0700
Message-ID: <20250708201745.5900-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131757_275529_55A42264 
X-CRM114-Status: GOOD (  13.37  )
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

Add device-tree bindings for the RT2800 SOC wifi device found in older
Ralink/Mediatek devices.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
new file mode 100644
index 000000000000..0c374cd5adb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/ralink,rt2800.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT2800 wireless devices
+
+maintainers:
+  - Stanislaw Gruszka <stf_xl@wp.pl>
+
+description: |
+  This node provides properties for configuring RT2800 SOC wifi device.
+  The node is expected to be specified as a root node of the device.
+
+allOf:
+  - $ref: ieee80211.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ralink,rt2800-wifi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    wifi@110180000 {
+      compatible = "ralink,rt2880-wifi";
+      reg = <0x10180000 0x40000>;
+      clocks = <&sysc 16>;
+      interrupt-parent = <&cpuintc>;
+      interrupts = <6>;
+    };
-- 
2.50.0


