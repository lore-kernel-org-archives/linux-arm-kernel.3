Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63DA106F311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAZh6fbbBXqXofDMQlKrAFBiaup9TmttWe5kJTdw+Mk=; b=MHeEbx3ykYmBracfikQLorb8ka
	Dw+3DCexVuLBw5zkDkHGSzq3d6OJsBXxmAtewXEEph160UZgmbrTTICQJ/cQAI6lyNza1PVE53Jc6
	KDn8Lw7ZXeFiWBPCuOx46YTZxT6biRrrvR51q+9gz+aItuHx+2XRXzRQ260dE8lDW0F6XBjm3bcwZ
	9s8UBi/vBURx6DHPipJao6a9GrLJsEtgmB2sURDrTai8ukKGxYMBArftGWNG12NPXYzUDBYmk/wzC
	yg6R3OhJqHNbqAnbpSFQELN2MyOQalCou+3OUdiiMVAMMaedfJ4n4yn29kZV84DIwgfBbFXJeq3Xx
	39OWAl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXa-00000005Cy1-18L0;
	Thu, 26 Mar 2026 10:02:16 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXL-00000005Cpw-1etN;
	Thu, 26 Mar 2026 10:02:07 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519316;
	bh=4WK30/mE0MGHHvTXMGsXTEKwE0mrHfTNI8g5HO+FiMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oGrkkFd1zOs3ySzdOwyRM9EVn7n8QnnMAkuq/Bh+hlp8R/GKlC79PjVCw/Wy+GGKC
	 wy3l35Cg8swFuEQgw+tGIauuCUe+5n831a8UoaOO4JG+qqHSHyg/CQ1XmUSczc3QcP
	 XX2wDr4aP382F+na6GGdbYdcFnEooZj2VEoOlxWA=
Date: Thu, 26 Mar 2026 10:59:13 +0100
Subject: [PATCH v5 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-add-emmc-t7-vim4-v5-2-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519311; l=1102;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=4WK30/mE0MGHHvTXMGsXTEKwE0mrHfTNI8g5HO+FiMg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHjtzkCO+mbkgAitvZ1hKC/yMPbECLq55c68kPiBCAxtp5xAebFbUsp3xd3zSw1A9HKigUyGO8z
 qiIdWRfulZwg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030201_828420_68168121 
X-CRM114-Status: UNSURE (   6.46  )
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

Add amlogic,t7-mmc compatible string, falling back to amlogic,meson-axg-mmc
as the T7 MMC controller is compatible with the AXG implementation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 57646575a13f8..976f36de2091c 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -19,6 +19,10 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - amlogic,t7-mmc
+          - const: amlogic,meson-axg-mmc
       - const: amlogic,meson-axg-mmc
       - items:
           - const: amlogic,meson-gx-mmc

-- 
2.49.0


