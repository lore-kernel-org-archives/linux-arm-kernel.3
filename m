Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E70FCCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyZxhzxPnZ9Ycaw9Ku+2VcbmUDL5kMB61oTwhgMi++I=; b=tBxL2gml9k6V34nLLw6aP59Qwk
	8+oaZKcTXHn1W417knkc2x62HDOMQpYeELQvXrA3B6WUmK07FkAIOuFqwqOf15nKQpmcGo/rSz3Lj
	ZoyoVJFk5mBIcvOxmD8KgwpgTHlvWoh2LMQbWeWMBEm4j1zbVzNABf7x1GOie50xNa8Su7yX5s8jE
	nOgUNGXSa0Cc00817wonrs/dRVpaChLrMEFkKA4niUGocXzOl/4p5aN+AMnK8FmrpWKv8Z9s0oeg+
	iVf2kxowjmHBC6LbUm/f1LLZ7jn4dSzu5BRtG6yvSLr/GLNKT67AR5i2KBmj1d8ep/FltEgHHB4E3
	6BhbnoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMGJ-00000003ZGL-1TyQ;
	Thu, 30 Oct 2025 06:35:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEMG7-00000003ZCO-2EmV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21D104508A;
	Thu, 30 Oct 2025 06:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9D88C4CEFF;
	Thu, 30 Oct 2025 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761806141;
	bh=MRjyLFhNnmEThxQJhty+Y9T1BGODxHrx6VqoEsVDfyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X/5ZLdAlSi/9aROkQFC9207CW5LMM90r2nxtIML00dXbp2AvrAxNXb33rDOAG7qdf
	 fDVPs9ZrbKl+AFOXwB2OS0It+8Ia/2OcZng01hRPkH4KrVBuczY5NAMwg3L95YnHoe
	 LrvpaXKH9zkax67A1Jcv6raJSypu4kviFuMmjS2J4dCvNcmfhFw/+hFG//c9Lzb7Lk
	 IwWji7ssZ9nPPwJ6meH8+ndugP/TWO+2awxt9JdHQvjKmPvoO4zpy6sAMyhyrJLUfG
	 UjmQNEgfFqyybAxeD/bPU5VT5POnx8JFLcCsUGXkBMAs8cP5AB3zgR03uKQZ7CLht4
	 S0jcOdb+QNp4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0C7CCF9F8;
	Thu, 30 Oct 2025 06:35:41 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 30 Oct 2025 07:35:37 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mini_iv-v3-1-ef56c4d9f219@gocontroll.com>
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
In-Reply-To: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761806140; l=1113;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=tfRcDJr6DCYSghqJPzeKfdQ0Q36PL56RBp+svwUFt0w=;
 b=Yps2XiXddeMSZx2xMsLbImHLDdANDBLh9a3Cl+dJi6cKPgjGoVdbMepP+uba8tcXTxoRy0YLj
 J8fm8gjsy0LBM2hZgq+hi5/VAghkvDbiAeg5sAc26b9UlSF0jtT8/41
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_233543_713844_206EDCF4 
X-CRM114-Status: UNSURE (   9.22  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Document the compatible strings for the Moduline IV and Mini.
Also add a compatible for the Ka-Ro Electronics TX8M-1610

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..15000923b648a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -996,6 +996,14 @@ properties:
           - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
           - const: fsl,imx8mm
 
+      - description: Ka-Ro Electronics TX8M-1610 based boards
+        items:
+          - enum:
+              - gocontroll,moduline-iv-306-d
+              - gocontroll,moduline-mini-111
+          - const: karo,imx8mm-tx8m-1610
+          - const: fsl,imx8mm
+
       - description: Kontron BL i.MX8MM (N801X S) Board
         items:
           - const: kontron,imx8mm-bl

-- 
2.51.2



