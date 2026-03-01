Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81C8FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jAE8cX0QUybSPAuu9bHnriBHSenPZ9aEYJvuTvyTOPs=; b=gHeRDES3kgccsBwiHVUq7zl3Cz
	DFK0yb3T51f5BQOdgVAY6reoOjbSOhhDbMIfRERiEb8owZ8Pz91hXlYTobAtmR3Acx2UPJ32o7JaK
	BmtuBCb2BhT2p9Ft9VJW011BI++HAOcPcs7ROxbTDZI7+xpYtSwOJHeN+KjFZKLTw36XuW8NuMZ2O
	vOkFQEBoUn5FhfnId/D8N6H474I8cJLB7GOKD1s6hGnU4ssrsabBZIIu2WcCAX6D99bpqqH2pc2te
	80SywZC353P1azoStXS9y9fUDCoXndzpGNrQLig6ejI+kL4FR6aTGzfyvRcKHxMk6VNMRK5v1UZVf
	7hbq2vCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW6c-0000000AiLX-1t4O;
	Sun, 01 Mar 2026 02:00:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW6Y-0000000AiIh-1EJg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 02:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAF244070C;
	Sun,  1 Mar 2026 02:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4080AC19421;
	Sun,  1 Mar 2026 02:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330421;
	bh=HSOW3rXNw/c8HBhp3l6p47pd/s9Do6kbbd2/CBTMrKU=;
	h=From:To:Cc:Subject:Date:From;
	b=FXogM3CV6U+yQ+qkSSHJ1qbdbvdP6vfoDFQq6hyYEsL3ESoso2g1hr4l33QU/XNVf
	 QQ0RE+cm30whRs2f0SnFW7QZen/1enIZxW19/vTLmDU1/LWfhkOeKMKG3B6gsTj4wW
	 HUW7LWE3U7d1THI7FCnqDY+1QDWWc2rifLeXKj8IJCFkPmRQb+aBucVdjDeAQxmsK+
	 xau8CGEP9cPf0OoiDTTEKwyMsnU5bUHnUYIa6Nm1lv8t589QvqP6DwNhN213OO+IKF
	 dDbNymW3VZ4dGPQ8J0qzM5xb7O7WiscPhpwbmpgKproBb4Qk3FSfp7IpbVYr35TaIn
	 XOAnbljMAd+2g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "soc: ti: k3-socinfo: Fix regmap leak on probe failure" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:19 -0500
Message-ID: <20260301020020.1726380-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_180022_348551_FBEBDF91 
X-CRM114-Status: GOOD (  14.19  )
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From c933138d45176780fabbbe7da263e04d5b3e525d Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Thu, 27 Nov 2025 14:49:42 +0100
Subject: [PATCH] soc: ti: k3-socinfo: Fix regmap leak on probe failure

The mmio regmap allocated during probe is never freed.

Switch to using the device managed allocator so that the regmap is
released on probe failures (e.g. probe deferral) and on driver unbind.

Fixes: a5caf03188e4 ("soc: ti: k3-socinfo: Do not use syscon helper to build regmap")
Cc: stable@vger.kernel.org	# 6.15
Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Acked-by: Andrew Davis <afd@ti.com>
Link: https://patch.msgid.link/20251127134942.2121-1-johan@kernel.org
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 50c170a995f90..42275cb5ba1c8 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -141,7 +141,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	regmap = regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
+	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.51.0





