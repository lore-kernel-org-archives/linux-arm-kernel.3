Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ECFC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=; b=n/2CqLIGjfYnfbd5QoAVLrBZu/
	otYeluMvhE3vJjiX7Xm1dAYR9ySyHUo50IglfBnAXM9ysl7YzBWMZwZgd6U1Q/mSO5BGKAM67BgGe
	5o6m8MbP+DeBV2BuQ7LZRCBGc114NrWzH6OZVM/op1ybMmfPygdlV/cfTniVpsbrvfyme6gP+rQ3w
	VNh0XscuB9HI4638Cldi8C3L1m2VqYYgg5kBCp331RCqFGeFeAbH5fbl8fTdDf0gqsFzZtaqgVrAf
	aFss1CMls6xXfLhCNch6oTwEgJe8SK5NaA24W9IeF8Js7lo+7BWOsI6PDKEgqDLGSndGacwqlSjqE
	AaHWe3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zuc-0000000GO3M-04s1;
	Thu, 03 Sep 2026 05:22:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zua-0000000GO1r-0755;
	Thu, 03 Sep 2026 05:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1A73601DB;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7079EC2BCF7;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788412973;
	bh=DK6eCsjwuQHkUAYad97gdQ+0HLjq5RiXz29EsyvdagQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NBWMbk+SfPkF5fIKKsyeasILC+5YO7+v0MlJ1QFa9PYJ8mN0f7P7iSjWCby+vlIgJ
	 A5+7/ZHZz1UCKZTF26YtQ4yRtU60H7tRbHIljr0LW/Khf3phGqW6QmCcVrlWXc1pkt
	 goPtvTO7oSIRZ4dqpLLhAHb8pzz0kSXunvJiOeeZ43WtcmDHy5hBga53MHmSO+w9T6
	 J1yv8jM2yQl5iBnMyNQdcvexMUzErzT1herrEADr38tP9Gchs+m01soTusRBOogO1U
	 xNRapl0hfKAiqe6wmTN+Z0+v37lzqPFg4wkXj9n4JAiLCb9GQJJ21YbChxs9Up2FB7
	 ec1dHMOC4ydSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DA5C61DD3;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Sep 2026 05:22:44 +0000
Subject: [PATCH v3 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-a9-ir-v3-1-cd471c667c15@amlogic.com>
References: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
In-Reply-To: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412970; l=1145;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=rmPAoSNSZx5LMEoeF/b4E+Q1f6fRs3+ubaclp6Z1pc8=;
 b=UVChLc0NVkl3QVl/QCyOm37lsUQSiO6wBtFhfc+JAn4rEOrdSc3vAXDMIByeP9a0unHRPiU5I
 ooMhivOj3QvB/Vej7ConQAJmNzWh8J4wgwUvJ3LPt3js9GQqfs9tlxJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0



