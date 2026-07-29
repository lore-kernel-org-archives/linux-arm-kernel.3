Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60A4C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jywl9hNRxqX9/ziXXjY4TdCTiZ0dW2gF28EYukBVWGU=; b=onyXKCh11Ar8h7eHx1MpR+oENf
	YCb9Iy1bVGBn5mhdlOGj7LI2hZPKRq6Usrd6LtfYgkjRZTogCUNL7Zk7VQQ0pnuuB/fs//QpR97xR
	Zmwo8oKOAK0kWvvOcexNRM1AzryLGzfAnXFziRzv0CxVrhlJ6PISz/N7m7y4g84nST8OpqQfMwrpF
	bNim1zJ4KUbyQV+qxBbkYGTMV9MitYxtBJAw0p6MJpVJNbKpVPD86ilXcs3mSTf1/llphfg7LpaM9
	kyWTIqTWSDe6Dc030qYKY7Zs7ThRV89PJgVlx5UyTTzmg3i6A8oQZYm3DmCjCK6J9jfLQN0wzDerT
	XKyZzdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Mg-000000086Zq-1sCf;
	Wed, 29 Jul 2026 13:30:30 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4MV-000000086SK-3ZPh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:30:21 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4864ebb6268so382951b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331819; x=1785936619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jywl9hNRxqX9/ziXXjY4TdCTiZ0dW2gF28EYukBVWGU=;
        b=GepTHKvQH4+dUHwxfqgIhgm/O70aAIM7vYbFlylbhCeAUP/0v7tIsuc3PJmIPUHMQ/
         5s4ZNfOboMB7rRbekZLMn6GfKdHaohgWob7ORwIKmLb9y2d5Kw3nzdyp10YkIsAXhfmL
         PVV3kKYNsb6qob8twkLFKcWWGsbWJDI/r8+HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331819; x=1785936619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jywl9hNRxqX9/ziXXjY4TdCTiZ0dW2gF28EYukBVWGU=;
        b=Qse4DumwemxTzs0SfTIxC9gEpCc/9tpeTdOwPi0OITPagVdYlUfLk7025fA2RPXSZ0
         iFAdZiS0MUk4siaI1ayATuNykEIe92Lwy/e2EE76pGnJfXkUoN9vug2Oy7EF79TPzYdi
         W6ByhJ6II/E9yTACiOCNO10mPNlZuezCRPWart+WaLk492R1tn+gGdZCUSrSPRBRlstq
         nmgsMS41QQlRbMpUz30zzh0pOAC4R4L6a+gJfk3X0VmqS9gx5nn+XPjjClZdyIL+tHsH
         VVy07CWs4fnApE1KwCvWZiWUJc2g8YN1C6fcE1MS7WW96h/HXQKE6gGqPMamtWqBfFMf
         r49w==
X-Forwarded-Encrypted: i=1; AHgh+RqSZtnKbNVUR3orTT9Vh2OjD5l5xqeJ7zzaJ5P2dxBb8+pnD3n6vP8pu2xSruhXLcMKsnF8GIW2cuKHaqyzBFaD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh47+MTexpsrqmjk6EFhp05wBWKaxeyRySmPkvlmhoT/YQ/AWJ
	uD9COexZoXp075Pu+JRC+PfmVah42OboYkD+hXHXcoTtW/Z3aocLeMytvK0DAZaeEQ==
X-Gm-Gg: AR+sD10JIsKBPg4Ar9vqc2i9KTb/BFx1uo1h1L36RTNcvJFjRKVTSlLe+anCC92hJV4
	MQziGX+FeomNINAkugU/E+l1CYFLsiPGEuYIXhCGNTolejXBU/Y96ZYMQsuTduSJ+9sOrdZ4LNR
	10Es5+wjdrTnpFeC4gBblpfm8bSp6GLXENsXFlqdRMBp6MgyyWOldfSmDraTCHJUpAQ5AkVawbz
	yjd89D9ZAg62vvGDmwPo9hOwcrcQUzDVzG2HqEwccZUFHEq37I1K/zqElRACrS4ZA4M80B9Wg2e
	twI4wLtggtkNg7Ibw6RLLLUsuqBuaP2oivYEd8E9s9gAj57NHQAHXL9tBleZRwYid6hw2dW3Imv
	2s/VhQAwjBz5AmbE69+YwHC7fviaThxcQhQsxa4qnV08TrtBFjf/vOcWsJxtJgrMlgzessp8n2S
	uDWkZxBdWfZ/eopqtUifJBLDcBhvNrwf97YtUFMjxGLIdK5XoxCaAzGWM=
X-Received: by 2002:a05:6808:17a1:b0:490:315d:e0d5 with SMTP id 5614622812f47-4ad5b9dbf94mr4510454b6e.16.1785331818689;
        Wed, 29 Jul 2026 06:30:18 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
Date: Wed, 29 Jul 2026 07:27:26 -0600
Message-ID: <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063019_897347_3073FE1E 
X-CRM114-Status: GOOD (  10.69  )
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

Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
IO control (IOC) register block rather than grouping the registers of
all banks into a shared GRF region. Add an optional rockchip,grf
property to the gpio-bank binding so that each bank node can reference
the syscon for its own IOC block.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- Add new patch for the per-bank IOC reference

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index bdd83f42615c..774e9c7de606 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -44,6 +44,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node managing the IO control registers
+      of this bank, on SoCs such as the RV1106 where each GPIO bank has
+      its own IOC block.
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.43.0


