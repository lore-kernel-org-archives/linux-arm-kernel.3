Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD923C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLWuVusCGV3pgHBSm8DCR4mm3LfWtjn5xx4VNK3JMbc=; b=o3fnNkRNeeUBT/clkg0s1Mldqd
	0CBQfCxXQo8YMA0KqPrevAvTAyhwVB6rxL3OH04W1Af1Hii802nCDEZJZciR9+Nw4v5ZAK0nYZ97U
	wM96cVkbRekxXrBlz2SEsYMtdsKi60zva0zfWIj7epe5MKt7QB75oSBZ9PtcTxp467oe4IDn6XFUO
	uSDiq+QlCyvp3a+oiVramnQphxyX/jlwoMDdUxSk35IgbijMjVjRVbWYg0HMCofhFY59cgPiwcZk/
	V+YokFbHpbpOEa5VhGD7kwoUtqY5diidYAfYYeNS4RbJHeGGQBuV2GGO7LmY9x4UvdqxcxfC/EBdi
	NQMGCUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aMP-000000072ze-01yI;
	Mon, 07 Sep 2026 14:30:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aMN-000000072yq-2gFO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0415860D89;
	Mon,  7 Sep 2026 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6399C2BCFC;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788791410;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WSm7Me1NtHhl48KfD9LH5BUCyTjofrzaYR58uzycHn/N3aEJzQQWD2RFohtUmt3Df
	 sropaOrZ1jmvAHF1ch9UIxxb7+LwhuWccbkUFVAuq6lMhhBKFEXLRS77QQ4PAYjhDa
	 4jYnrHFp+tLsZ8fAMSTPjyP+dfjjQi9/qBjhmrrGh9D8J57Y2A3dwLHMSs+E8s1LjH
	 6BxeLEII3nPCD3af7YN19BppQxjdqBHmF7lrRKcR94T+0Coh8/06JuaUJJ+KY4EeTI
	 KOeLUyZfRkdYfqG1aY0h7M3ObNPJBPjmVjxGV5JQQqCMngJ1w2z2g98wSc2qUG1LO8
	 UF/PBFimcYzhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86840C79FA1;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 16:27:37 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Free Mobile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v1-1-f43fd0028b78@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788791274; l=855;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=GS6HXtqxwlBUlcOkCxh64ErhDBGMmoQtgCG1FanLSW4=;
 b=2trqk2rAQPoi9HCXqt7YKa0pEJoBuZuXkzppU3drU7yXkhE/UvqnsbWLFdLLam3g/XMdYNNmV
 wUVFCNCQyoiALIToU7bzM8JaEmgCo0+KgMurg5rxWRXR1TPh+JYSeyU
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



