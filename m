Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF0CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkWeWZJ7OaUkC1X3RA6ZmwTpiZVwf7Rem3pqOW9gu1A=; b=e3bNc93oT8Lw5CvZoEiyrwwrt7
	hkhtKxpb7rZgYdKw4+bLmDzKcvTVLYSEpzlZ7IKr9O9xM0qYFTDRegHZ4Zxyg68KQfXPRIAnedJ/9
	JuaZUEeMPsXUhynnbTEFVGvgQGpkNYZsttkrPLrPn+SsRx8Zp4Jb5/Xu6CCjtp0zmCUH9t13FTwUQ
	oMVX4oIymL6DC9YHDa2bI5dOVmIdD6b7t/BGLgajxIx6q0zfz23Q256reRzDzrNl17jTDD9W3bsdl
	VceOmwpDZH4QpCpRB3gvjSmd3NglROJCprf9m6Xp/I4v17U2smAvO1dgqE+Ku+k8cCO8rIM7AgE60
	GaG/WTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO18J-000000028Vz-3WE8;
	Sat, 07 Jun 2025 21:31:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO167-000000028D3-1LBL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 21:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96087A4145E;
	Sat,  7 Jun 2025 21:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540EDC4CEF0;
	Sat,  7 Jun 2025 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331742;
	bh=XHrP+0GPTa7TRd2JvYw/E9otF7QNFDMpfbQMlQ7dElg=;
	h=From:To:Cc:Subject:Date:From;
	b=mY86qNwLX6I8JsCEklNFAVUsALMNhrv3Un7nVJZOgfLG8Vjap7lU4Dh33SKVCpxtT
	 /s/YxErxfMieOAAzAKULW93ulhJ7UhvK08BaLkSUQ9kW4mWPPLX7a+1rpaUcFKZw5H
	 SXUbrHbaVghMnhV0JWmCLG2mUckX++JyqQyBL1QkY+rzjR9HGFr7IknJak+oQtfkIf
	 mfmlSEp3a/AR1em62nYh4xOQrR/CKWt4nCXzh23R8mNmGDt+YPzeJfnc4uSyBiSyDH
	 Jz+xzEkKXFvccncEX6UV1j4DVRSc/OPiZgC2EX42LbSMsqk0JTKrwS0+vtrG24Gy6h
	 TMhT68ouW3ueQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
Date: Sat,  7 Jun 2025 16:28:13 -0500
Message-ID: <20250607212813.747203-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_142903_420682_8798BB0C 
X-CRM114-Status: UNSURE (   7.89  )
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

The $id value has a double "//". Drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 234089b5954d..b43df10c5ef4 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
+$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Layerscape Reset Registers Module
-- 
2.47.2


