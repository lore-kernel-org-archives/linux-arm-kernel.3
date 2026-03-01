Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411F0FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=appcRnem8PFZ62HfTmVaVC4Cx/T1ZachTRdHFrSTw54=; b=bp+vcJYMMErBcjRfei7DdEgLKW
	8HgMHDD4Tou7OLmI5cFsiQgIpHO2VLZsA6tpDRksx5Tqr9RGYVDGzbikHqRm+wApcO8MybN4Xo9Wm
	ITF5DnvGl/9vc2g856Mv5oamFhj4QnOJ5/OW+qlGjhm9W/FprnMeOic9PUXL6NUPl1V8YGf4yT+ru
	v/d+CsKit17CFAkN7db1ehLJGu55BSLYVo3MMHK18ItmPl9ySGEHVcOU4wsnAsU2DPEK+wnUdGwrW
	Mf+AChM2HiBuMKh8Up1spyIFX31ZAQEqpYUBP0SUUcBKobROuNEFKaNhQMQserWuBmWkNJ4cIrL29
	RYkYj91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVrY-0000000AdQF-0nhv;
	Sun, 01 Mar 2026 01:44:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVrV-0000000AdPF-0BZq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DD716013A;
	Sun,  1 Mar 2026 01:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769F0C19421;
	Sun,  1 Mar 2026 01:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329488;
	bh=6Qr32JUggNVDbkyRobRS6It2MxBWU98aEjzFhAbP4wE=;
	h=From:To:Cc:Subject:Date:From;
	b=V2CgJoCxldeY/DUAiV61i6AsD9JUgj7eeH2YgDElt8Ttocw6Vskv7UBWEggcdbclY
	 1Idp8U3VjzgFXWQS0cxoTdzuD1qtrfDwyxRjlROUk1cHYf1sf6LbCPjNaGfbjB8nLy
	 qD0COy9KgU5MY4jDrBpBAXQHcKTg3M5B7XQ1ckWM1VfR71dRFYva9u1Q/yflCXGJGt
	 Cd87lT9QfVrUmFEftvje3TQRY1M1ZVT4p7xOt7hZkA6RkhOAx8pQb8+ig9dSauH7Cs
	 Bv6cr2PbG7vxc2rdf+AiLjHYcFKwdWzihkUjfk01rGY8jOaBruQ4ST5NiwaUM0h1i+
	 1/wLZeBGQrpuQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	aha310510@gmail.com
Cc: Inki Dae <inki.dae@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: FAILED: Patch "drm/exynos: vidi: fix to avoid directly dereferencing user pointer" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:44:46 -0500
Message-ID: <20260301014446.1707199-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From d4c98c077c7fb2dfdece7d605e694b5ea2665085 Mon Sep 17 00:00:00 2001
From: Jeongjun Park <aha310510@gmail.com>
Date: Mon, 19 Jan 2026 17:25:52 +0900
Subject: [PATCH] drm/exynos: vidi: fix to avoid directly dereferencing user
 pointer

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 480c99a8f9f75..9709c07e5d8f4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,13 +252,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
-- 
2.51.0





