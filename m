Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F6BC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLWuVusCGV3pgHBSm8DCR4mm3LfWtjn5xx4VNK3JMbc=; b=sGLNtqND27JqNhWSf9LYsSeXdk
	ensL7l7O3yfiJ8zxvq2x8hhw78VdPcHmlW9sZHTKBBqZK69EccZFsNInpNx2WWrlTDlzysHh9cwtS
	68PF5JzvvY+YMqSCuO5Md6msiC9/x/40qPPiyUYU0/l5rBD6c/5SCnweIDriBHoomagAccka11bjA
	wSkDyHHJzxPjjfViPNtL8LnB3xP3hIWuWUSWP6SsymwT7oi0uIP0aKdEDOxEjkyKRcCHssbhSyaZK
	D5orW2wULQ6gkuQOc1EPHhOsSf+GTozZyWPjrf6GGoIf8uOcadp/2SCQsz2B7TK5TXAWqHhhHET9i
	b+3cBlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cuj-00000007Rvz-0ej0;
	Mon, 07 Sep 2026 17:13:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cuh-00000007RvF-3Lod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 423BA41959;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BA55C2BCFC;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788801227;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mvQ7KpIcIo1NL/j0O52tOZTzoot6Cp2/HGxK7Oz5Ua5t+rHl1isz2OjoP3SlrAj5a
	 eEVhEqRk5d0wks9/WljlE0/C/LAkEWLyjPqnJ253VB112dXfSe9XD6EP/9E1zXLOFl
	 xAvXLmyvaijMwxB/JhXvfCN2z6CgkVtuBja58WttKNct62tYWGGMoEKuoGGdsV0orI
	 /W5dcPOj0EzslnCW2fwjapywvChl9SJtW5Ok7nVmnAPaL2OlFEM+1m3es/ur9KzWX1
	 GA3ZesivN3ZZ0Tc2hXdSGrncfQDi3Zai7W5bOIZZh+nwFIDJAmaLfVimV57HseGOIk
	 B+ayPCHhLH1eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE87FC79FA0;
	Mon,  7 Sep 2026 17:13:46 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 19:13:39 +0200
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Free Mobile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v2-1-6b4afd36180b@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788801225; l=855;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=GS6HXtqxwlBUlcOkCxh64ErhDBGMmoQtgCG1FanLSW4=;
 b=pZTrPdNKSAjqy369GEIvgRGDHKgqpAo5QEJdf9oK7rxagmgL1vFoiLjoIAGLGbVLJ7qjnLIY1
 WWbzt14169QDNjfuiqgA0rx+QuTx4SouVvlwVwoaw1acfVo+wH8hKZk
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



