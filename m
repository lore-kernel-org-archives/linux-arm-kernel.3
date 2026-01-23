Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8ACD72345
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OblqumAF9NiAcSleiI+cSnH1Mm+ViWrsYKgUqu17glM=; b=JFS1XQAUIvVKnn1Km8WGcZIHqW
	npbDoG7lL2S8sK8GtocaECkpbZarUV7F6SIs6ZyjnkwFb0mv2ZPEz//g5TjOr39xJ9ZIzXrXiPjOF
	VEtFI5pmqwkN6wNCiyss/UaESMeK0/PSibby0FjAeGK2KN17mh6rqFrTL7WspvBiL9zt6GAmFx+QF
	+HoW2Qh3k3BpMtT2IL4ZAIYlwH+YQ6Z/0ngzScNJ/i7rA64JiOGc3izbKiXH3scd+fvnhBAccKGw5
	+Lrp0Gelf1rbSwMRx5zmgAd8ABDDoRyVB+VQl9booxvMMA5fgfleD5jjT9uV6j5dcQZ8Ln6XDDk7M
	3XU1v6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCYr-00000008TXi-2TC8;
	Fri, 23 Jan 2026 08:30:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCYp-00000008TVs-3cOH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D03C344579;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1CBFC19423;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769157030;
	bh=hwCyQcZBbd1CxtM6jAHkplhjj5WWWGRjHESp3qHcyz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I6BWgXtHd5gAZjJiq2vT0WQ1ByejXBFYgRVHFSkMmRC5kdgM6nORIw9xr+fka+xl5
	 7z/uPY3ybJHQCE7drr18XFM54cfydmgTgckg2xAhxNOOb5mZOvODobkePGk9SutV6c
	 csf1D/woMpLQIS+HSjCfmBSbkZMvPAqRCpkVoDFE1Y1UZLWtG3TiFzlZnHh3R6HHPn
	 beDJS7v5nyEWLK69sWhShz2zvAO98Gdq1wVknV3x0dV0MPu6aGViwx3ChAi3rMA+0/
	 SMdXGKtfWNpa7IalSEns111cY8Oh3wj+S1aHBhRvKjJh1MA6a4McR8A4OT695JUw+y
	 8ThWNzmSrdlAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D53D7234B;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 23 Jan 2026 09:30:28 +0100
Subject: [PATCH v5 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-mini_iv-v5-1-29bef040f236@gocontroll.com>
References: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
In-Reply-To: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769157029; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=FPnVFuGZ4VvNvtuoCGBWX/d1Nj9ZPjClvU+nyhEftj4=;
 b=JSjU4HbXvU3WmGRV+yrCT0RszWCpRZI7l8CjvSvavtnFF3OXVmOK0FdMfFlIqgmfnC9JkIEDm
 fAmziTVDOAoDlmv+zmHqFgVSUa+qfBbrJ4oKPapHRoqw8b23t4kmPsG
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_003031_949972_1C7116AF 
X-CRM114-Status: UNSURE (   8.84  )
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
Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM that they
are based on.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..c76c1731b4f7 100644
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
2.52.0



