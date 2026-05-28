Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7F0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EBV3X2CT5wvPPlNigyabRnWFm0Oa/W4TJ8EeegK3Yw=; b=bA2F8LRZFnPUhL5U5aUAvg6cjc
	JesPQEgD6raIQMA9l4FKvr47N9SxUizGzNMw6y0aIeY2/o05ArcFjEEtSsQjUyGoP4P+AV11C8GSy
	M5+fuL+e1SKIs06i5ZRZVVrBGyKV/UFwKepdxt3+HvxfzisXzREpb/mq0Kj2d54LPR2V6R3ZTTCVh
	MyVDkag5wmNKfxp8P+qLt+e7O4hoqlJXW2jjL2+0BAytKBcxzKBcCJZtr+9EcWAiKt5yOh7BEQdjE
	JlZXbFwGAn3vN4WwkB1DV8m+uxZIq3GLD2wJSjVZJWLK01vUHV4EIzkXmPreaHDyKbH4/MkF/2sZC
	2uMMY7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFq-00000005kEK-1sYr;
	Thu, 28 May 2026 12:54:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFg-00000005k9n-1B0Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:54:21 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0324419A2;
	Thu, 28 May 2026 14:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972836;
	bh=SNa1gcsGI4/garWl0WBM8uVhsAHKPf8Z12h6Qt3Twro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KBmKtHrPk5QelRbTn629gxRE1nuSEAVSCPADzPPvl5IlLI+7arwTzVLwFmrAiRuaW
	 UX1PNUzXkDWbS+OEGTaFV8+/bfOW0NH7zZsyRrep9TMYBbxeVBhk+siPaVSVYM2PZT
	 1bzPOVET57lF+Bg7xvoKzaw5jY/PehU/zjY0tuhc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:46 +0300
Subject: [PATCH 5/6] dt-bindings: soc: ti: ti,j721e-system-controller: Add
 more compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-5-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SNa1gcsGI4/garWl0WBM8uVhsAHKPf8Z12h6Qt3Twro=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDryJQMr7/6KpHYnLiy2mQMWP1xfHbBG6GICR
 DVFsiCeGj+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68gAKCRD6PaqMvJYe
 9ULUD/4uue9IQGqeBFP/t4J/kUs5dCi7fahRaM+njJYOnWPqmAtkvn+XC12a8CBWPAY6dQgu+Hj
 3O5PC9YZ06Fssa95R8NJjRpzp6WAOj1rlC5SXzjviUdGMg+cSBiK3RiMVo9PQAXSyDD5FsU2FY9
 X/wZ8VPn2V6CzoiOEQWz1VLSWp3p4y03R/2W+U/tTlertR9bo3Fv8HZPKQzm+HTnRAW6xaOB2CE
 whG7BHIZ5iaPzEXEt+R9DDgbab2vKf/312pS79IBZ9hp9cWT9lgTTbCoe0mAXrVPVB1OdbDY6o9
 yoqNmmEhJ+D7+/OLgIlKiwORlj0QSBAGbDa2u9laxuPQ30JPdqz/VZ55QPyN/v9VAKz7VQSUV7n
 nQiNl6+OBGVrPXNHUBHOZ+zTRgZoENG0NNlxzjBwbTJWmKZ0HEk6HGZF3byQsfrzq2p0I6kM4XZ
 JHp2cwRZiL+obPONe+0wx2dKUbyz8p8+VLwuG26kmb4Gs5S/ADya7Qfqx6VzlXqovYuXvRDCSS6
 Crp5HIQz5y5uvw1kXFDPR3+dWmsoNaKhHh0IQsC/KbFIlCsqZZcbuhtUYYoWzn+b2FI+PfDl37/
 uTjMSD1pxLIIDHAscn44nQNmS+drlJhXazKR8cm808UnGOkZsD3Kn7uDtUCBnRcmkN7wsOUbR17
 igesmJxen5APNYw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_055420_464403_DBFF75D6 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

Add the following to the list of accepted compatibles so that we can use
the same binding on these SoCs too:

ti,am62-system-controller
ti,am62a-system-controller
ti,am62p-system-controller
ti,j784s4-system-controller

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 56712ebdd01b..11365cb9fb0a 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -26,10 +26,14 @@ properties:
   compatible:
     items:
       - enum:
+          - ti,am62-system-controller
+          - ti,am62a-system-controller
+          - ti,am62p-system-controller
           - ti,am654-system-controller
           - ti,j7200-system-controller
           - ti,j721e-system-controller
           - ti,j721s2-system-controller
+          - ti,j784s4-system-controller
       - const: syscon
       - const: simple-mfd
 

-- 
2.43.0


