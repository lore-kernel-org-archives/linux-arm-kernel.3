Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B7DCEFCF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6ZqofRoqmgTnNauKm6sFOfSm31A4/KwcDgHVfKLaRY=; b=tapJHcg09Z04Dw9KeJtt+sM5GZ
	dbD4W/boLplD0ezzVGh92fMD5uRnjnt8v9+tblOoNXFKrX3jA6K8HY0RuH+7jihUQwnn7ZbMMtRl5
	8Ac22e48cLTrco2gvqRJ9cZ3XrzAIXKNONjh2q76CdSneqZX6bWinCPCkSAaqviJRsT1P9N5YZQ5N
	innSqJbLnYoTj8jCGBNeybuh6z6c8pPu6fB6zDHn52g6OdJ9LTVD9v0uWQs9JiY/vABL3kpJkeSD/
	JCpcFACrRbMiAeHx9AtfJyn1Zo6Lh32Vyc2zafO+TPgD0VcW3Rhd8FX/3iTxHQCeRRzRRF7Ox+q+I
	Hmk11M/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCEX-0000000Dj4S-2q68;
	Tue, 06 Jan 2026 18:56:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCEV-0000000Dj48-09Ff
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:56:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BEBA400F6;
	Tue,  6 Jan 2026 18:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7797C116C6;
	Tue,  6 Jan 2026 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767725802;
	bh=LduUB26pqvfRWwO/AQnMn2xvKfD83Q491hi3Si0/eTE=;
	h=From:To:Cc:Subject:Date:From;
	b=O7UYc8/er3SZhgPFplrgYknT7fHXZYlsfSu+zbpw09l6h64m0lsumOAnus9UW3NLY
	 IxiV5KetvlvsVbEjQQWwDw6hDv++aBdmoKYCE4/zbhaEt+4jRjsmVQmsyXapLP8BKV
	 f6LTXtPMubMZoHY0CPtEGTEsbu+rwtF1Wzo3mYy4ujPoJj2i+SRpx9DJANxV7q8T5s
	 WVE4nOuo3HyGW+cq7jaUkvb3QcGCHus+Jxa771y3Ohl2NpBzJkn2AduqKN2xaOl8p4
	 dm4cYLnuh4VowqN76IeJq9YJjW4lguDxTRnbVpkEqXupAhTIt26uyfnzM/njRkljRl
	 k8yl9CawPYnig==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type declaration
Date: Tue,  6 Jan 2026 19:54:21 +0100
Message-ID: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=chleroy@kernel.org; h=from:subject:message-id; bh=LduUB26pqvfRWwO/AQnMn2xvKfD83Q491hi3Si0/eTE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTGRsVV5IVdLIxf8G/+Vp0t85MnT7gt2GpVJfDPWMv8W pfnUp6jHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAiBc8Y/vtxfrWXz3zMOElf t2azSIuuhL3Bs289O1MZIuLyL+1X+sPwP5T3lvC62wkxxwRLrY1v594V71hgI/dTVWV/05zAh+o VzAA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_105643_091964_99DFB9A7 
X-CRM114-Status: UNSURE (   9.09  )
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

Fix following sparse warning:

  CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?

As it is exported it can't be static. So declare it in mc.h like
all other similar objects.

Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 include/linux/fsl/mc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 897d6211c1635..28441a456bb48 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
 extern const struct device_type fsl_mc_bus_dpaiop_type;
 extern const struct device_type fsl_mc_bus_dpci_type;
 extern const struct device_type fsl_mc_bus_dpdmai_type;
+extern const struct device_type fsl_mc_bus_dpdbg_type;
 
 static inline bool is_fsl_mc_bus_dprc(const struct fsl_mc_device *mc_dev)
 {
-- 
2.49.0


