Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B765CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRbyaMHRjYoo/8Okcn1LEEpdp+beF/YqkbGt57n7LAA=; b=PFMdwamBtof64HslqtVwJM2Ajz
	d2s0gWRLplxT1Y1AiDRPpVhBcv5QU6mc3MT8lxV6f7h7CO7Atl2FHSyK98TUWLezP7n8vcaf+XEVs
	yGMDOd7ia/F5YJstE9Iui6JdQYjiXbaTp0gWYDe3DeiLQHxr12d1BQF5yPWOe5NTMSY47D9oRddDK
	PogF0VI62K7DHm/ZC/5uyFxmiJAuoj8GgzLpI2eeKH9ajJzJAhE+Ya5j3lbTIuc2L3ZCxQX6V/yiD
	ThtQGN+zqx5YsJnNCvWCLSudRSMp/MUtzOwNYvOU8p59t3APMkjtryMFaJwDK88hohi7tDaxeJ5pX
	bWQwe5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTBM-00000001qf9-2ISk;
	Wed, 22 Oct 2025 07:22:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTBG-00000001qb9-0MU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23908486E6;
	Wed, 22 Oct 2025 07:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB065C4CEF5;
	Wed, 22 Oct 2025 07:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761117765;
	bh=E8/kihkhTiu168XMirf3dOLHmK8izSyrje/VlWah0zs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vHNTd8Dnh6AOFAzLShHOGLutF/C2YYTJyRKnwdMBT1CQKASjadSocrqA/5aUmfQ5s
	 jjQeTaiktHe7E87KeUAQ2MNzPtsDnGmn1WavFG5M1x6xlh9eTJ7KgZgjc+HuS3QhZq
	 DxiyVdcprdUc/xCUg92Q1rApL2rTM1buGoyGzqwijJaHHiCFQe5tPG1687Iq58DyRs
	 SBvLU26pV2HDKM3qiNLTNWjzRYEXpZmaYk9+ff+vCpTBeGHd4reXq8MbzwrB3kIoaF
	 XXg49JKhRrGBlqKbsV8DJCKqpD0VTt00++xAIDPUxM3Z7LQHNq1tUsuH93AE0CndD8
	 cRqI9sf36q4nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBCBCCD1AB;
	Wed, 22 Oct 2025 07:22:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 22 Oct 2025 09:22:37 +0200
Subject: [PATCH v2 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-mini_iv-v2-1-20af8f9aac14@gocontroll.com>
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
In-Reply-To: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761117763; l=1088;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=xk1QHN6fEYu7dupAJB/GRXJerfPV6Gc/qAkprGWhb0I=;
 b=DF9KIyEso7Uhu/qgM5d8/mlZde9Vl+UPpGZJREQwlvEpGDdmgps97PtJZm0tPpZFYXmO9GqIe
 RarkcCwKj3jDYPSfSneQdEwvbojtCS+jh1Wogpfc2P/OgXKc0WDSY5t
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_002246_315233_C7CAA981 
X-CRM114-Status: UNSURE (   8.65  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..41eb19e3530da 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -963,6 +963,8 @@ properties:
               - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
               - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Board
               - gateworks,imx8mm-gw7904
+              - gocontroll,moduline-iv
+              - gocontroll,moduline-mini
               - gw,imx8mm-gw71xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw72xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw73xx-0x       # i.MX8MM Gateworks Development Kit

-- 
2.51.1



