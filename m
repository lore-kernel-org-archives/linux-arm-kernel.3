Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF07CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I3TR2F2meIzdd8L5kFRhfRS4s9Ij5anoBgWO4nmTh5Y=; b=ZXwHuJXwyNriQgHi30HKVKVxii
	wPvkGPyRz5mmefOIi2F11LVv2mILwbFAwjCrsJl71P59aQf0YoLi2AXLcWuYA6pEdMUqsqIuFV8I4
	x0dI6sB1HYZnS+FAN448D048Q5HiL0FY/XiYOfmf3IDDZC1PPz2dabN56SdRzIBzgr0EJnQ/ZBvEV
	VGt2G9h5KUgpRZpt+pMlVVgvK6dVaGSLa1YOp8NVbfTIjkTc69pUgq95CBG2Hbf93yVifybJE+vpN
	pMD9ObX/16P3Fvbocf3C0jI/elMjoEbIFGQbpNtzcSKDfGvbomK7ssPg5hJHtcjgAzz26M/lBfBSu
	lHbV4Cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7L8-0000000EIX1-2MyP;
	Mon, 15 Jun 2026 13:26:58 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7L6-0000000EIVs-0rn0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:26:57 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 6BE341FB7F;
	Mon, 15 Jun 2026 15:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781530008;
	bh=I3TR2F2meIzdd8L5kFRhfRS4s9Ij5anoBgWO4nmTh5Y=; h=From:To:Subject;
	b=gmQPHngs0tY+Pzn62+rLt39hgiQVuAsVpHS2ky9ozD1kxPTwrUC/USB62mZ0W4dpu
	 GsNZAE9A8TPN62NBs/e5s+mp76UkzzKnmJ6+QPRWQCnABk8ySZoP68139KTMAo2Kcs
	 LfqkCHDPPPOtQOg7gTzCqvif9neakzmXu74b0yjEposQJd1/heK+3TAvbeqql5j6Hs
	 sIgAG3MLo2/AXU9+LkG3yRw90AY+CgHAz5qG04tAyc0FIgusi3etuC6iFOeiv1yhms
	 53Zk8y3YCFVREsWqo7uDRRBm8MyrLRB/GuO36OK6Odd+8ll1w4S86wuOmgOsgshFgM
	 LLeyEVkaLGd1A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Date: Mon, 15 Jun 2026 15:26:38 +0200
Message-ID: <20260615132640.161584-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_062656_404631_ED5DB866 
X-CRM114-Status: UNSURE (   6.83  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add git tree for TI K3 architecture.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8629ed2aa82f..cbc56dc242b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3756,6 +3756,7 @@ M:	Vignesh Raghavendra <vigneshr@ti.com>
 M:	Tero Kristo <kristo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
 F:	Documentation/devicetree/bindings/arm/ti/k3.yaml
 F:	Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
 F:	arch/arm64/boot/dts/ti/Makefile
-- 
2.47.3


