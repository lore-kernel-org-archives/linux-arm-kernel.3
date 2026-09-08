Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD899C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLWuVusCGV3pgHBSm8DCR4mm3LfWtjn5xx4VNK3JMbc=; b=258JXNl5VBbAnQmdPSVzGfTSnO
	+sniUYR+ZCTisZ2UeKMzXuqNN/X7IJRxjAK661fKdmcIWOml9WwjCbUbPfQt+zcRI/o2FAlIf2+rm
	WWzilOWIYeFLlyTsSrb28VC9MVzhPH3EmLActNlbvls4gRGglQ+QXGVADiFIc6rmcMILsrQJs9LBB
	nu3QIFPtl/3Pd0tgt0wWNmVU3DcWrycaE0+1w5ojzWx2VhHgyMhjGiUKq1ATDQMeE+KRcinVwPZf0
	oWtODyXRI7n3CeEWIILdl8dFMcmzzga5eAENFHGN/+MYsDTA8sdZmei2ggRQyJhZCTKsTxe/TboMx
	AaWsc4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydV-00000009enE-3Reu;
	Tue, 08 Sep 2026 16:25:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydT-00000009em3-1cN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF67E601FB;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59302C2BCFA;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788884726;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PoUiJUMDJhbR3OD6Y2Om8TgqoI58GhCiOWBIKdvWquvIGRHbKVEP+DGjjtRAgJsXl
	 d/mKl4Dfn5N7XHy8ASw5oMPkz5kR0i10D72BtKsdZnbFZ8BAk7Hwg41c+nGLu7/Gob
	 Wxe6rtyGS/5pTIJbyb5j2Z5tvFDjmHjBdMzOvAwipSLfk4MRcseZhuDYjjlMq2YTvo
	 CyZTNPz+as83o8kVwsP63TaGq5NN4HjVQ0YEufU4yEbLtVhkO3xjrQ8EuRbNCOlPUQ
	 /Zf4DdaajbyUGOp9vnaEe/tgiT9knULnCR5thjgd/Tzwxr7CKE8N9guYa0LkLePyBh
	 HU8WEkM1cDQOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E4BC79F9E;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 08 Sep 2026 04:12:43 +0200
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Free Mobile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-for-upstream-nbxv3-dts-v3-1-1d88b2c11680@free.fr>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788833565; l=855;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=GS6HXtqxwlBUlcOkCxh64ErhDBGMmoQtgCG1FanLSW4=;
 b=U70+sqMTAWrFPrEAjOpft0RcCaTzxKHPw7laRKf+GSb2sKKzcE2KM/b9FZ5cRdxYj+fX4TnMB
 Tf8O54YSlDKD9rQ/ufSnyO3Fpi2OCNAmIwU8GVjJy1gUs4PbCln/hBL
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..e467da45cd7ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0



