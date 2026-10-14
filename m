Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D874CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G6pG/TL2S/24LN+vb6/9HQmPLkDOws0zY6rNCJymDZg=; b=EzrlIDSoC8MdF+eXp5Ls08I5lM
	iJmUW8mM2G1n3LxoZQuHWHD9pX9LW3TAGU1RnBGxdy4UINa8+HHRArVdI3MqPPbXn5dTYTkxbldj2
	X7vOLCIa3C4aJ+M5K67YSv4AaBdgh9Sos/H8Oz+fWjo5Rg2MQ1SppaU8Hwv4ow+iInNl2lNSC+g0+
	G2BbwQB6oSW5VkIMD1Nq0bpRt4G9Og4ISO8W9daGSyf6lYV+yqru+BDDQ6FDqtBgwY1cYUCdnsI2j
	m4eJijJa6fWkzwvE8YrzM9r0I5tqeI3gC++bS8g4S2oO3qfSPV1+xACRTMNrA56eyJfQxpyrtgm2D
	aTESZZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyY1-0000000FVqp-1QKS;
	Wed, 14 Oct 2026 12:57:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyY0-0000000FVqa-20PL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:57:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 955E060218
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEE11F000FF;
	Wed, 14 Oct 2026 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791982651;
	bh=G6pG/TL2S/24LN+vb6/9HQmPLkDOws0zY6rNCJymDZg=;
	h=From:To:Cc:Subject:Date;
	b=QbrHHModflI1KnYnIHMHYl/On9JtfU1H1MB0QYQrXyQublCCOt5gs1zjza2I1A70p
	 gNGl49Q58tIYtq0O/v/vkV/gl/hZ61rGBwsWPsXRdUoDpU+aLpzeiR5laUxoBSQ+Km
	 dcLQNo4vVaDcrY7BD8WF/AhESQAjPXf3fNZcWenHcwDGvMV5bfYsOIKMXo2dFDQc9F
	 EWQjahT8c4EzsLH5JBiZ1JJiQq9UXTNZ2vPjhGNVt+slKYbaIdDe8BmuMTtDcnYP5c
	 cAM35rk+jXpaJ9QKO1u44LN+XRvVjQH2dGxyiFrnQFVE+4R7bUJCUfaYcdR6y5Ftw6
	 rB5o6YEawGc2w==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: altera: deprecate intel,socfpga-agilex72
Date: Wed, 14 Oct 2026 07:57:08 -0500
Message-ID: <20261014125709.2106261-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Altera SoCFGPA Agilex72 platform will be rebranded as the Agilex27. Thus
the following bindings "intel,socfpga-agilex72" and "intel,socfpga-agilex72-socdk"
should no longer be used going forward, so we will deprecate them.

Replace those deprecated bindings with "altr,socfpga-agilex27" and
"altr,socfpga-agilex27-socdk" bindings for the SoCFPGA Agilex27 platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e7..c87d7725f920e 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -99,6 +99,12 @@ properties:
               - intel,socfpga-agilex-socdk-emmc
           - const: intel,socfpga-agilex
 
+      - description: Agilex27 boards
+        items:
+          - enum:
+              - altr,socfpga-agilex27-socdk
+          - const: altr,socfpga-agilex27
+
       - description: Agilex3 boards
         items:
           - enum:
@@ -123,6 +129,7 @@ properties:
           - enum:
               - intel,socfpga-agilex72-socdk
           - const: intel,socfpga-agilex72
+        deprecated: true
 
       - description: Agilex7m boards
         items:
-- 
2.42.0.411.g813d9a9188


