Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAAFFD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 02:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Bi98EdnTTnVTXGELexBxMTfbc1GAZeQ0+31PKpGBpM=; b=n9kO/d4Eal33xqB5jYsvywIqIP
	T+V9a2yzE9VwWIO8Z6csg30Hz/hcr1V4xvQqVUG9sD9qbS1164Tq4d8k2uVqbRNKvBlYO0tX0vJCF
	ashhxko/g4sMTUhDTlkL3HSaLSAyTPO03wAfp3kUSq0blWv6w/TbZKjCGr89WQIcIlPCv1oUiVXO6
	87mzchBwVh1HWSavBVArgrGzRC4ZTn2QxWfIHkr2H83TOoAT5gVKhAIAAoAvtlYpPbNTAvHQGJDm3
	AfgVykiYuktHhpen7qvfc4GZsOIVtkZ9alVUxi4fDOhYipPoD3GJW92575o0qnRvLoP4mWEkQ7Vl2
	GenPRlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW8z-0000000AipE-0LHt;
	Sun, 01 Mar 2026 02:02:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW8x-0000000Aip7-2h1r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 02:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0411D6012B;
	Sun,  1 Mar 2026 02:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DCBC19421;
	Sun,  1 Mar 2026 02:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330570;
	bh=syPIQXWwhj6eiG9ZKlOOFdyQ/tRTgqffREQT43QIoJs=;
	h=From:To:Cc:Subject:Date:From;
	b=PSK+5ArnCNIHrBrrg39YznHx9/OVeJhBhqH+fh4flCxYn0l9w4dpOnxhu+vSNd3Z7
	 J5NuPen0XAZVhORdNx3+OGpF3mtBDBFDycs4UUe45e0HyY/2lZssK/+LFACrf0VNjL
	 UvFaEHBBDyB13no7EAg6FUg0vokqIILMipD4qMkuQXpgetE7BgWSNGb+nH2in/JsG5
	 4SOdbgWWAq0QPph+XLAjNSyoY530iRfg9oWCyhuAYioDr6SlaN3p8hABurUvM6y00y
	 uCIG0J0zyi3NMzEcDP7Mv28VaqL9LtUwubeZuegtKmfhCkhbDaNFj25BmUSgdZfkoc
	 VYKz/3U2MRvbw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	aha310510@gmail.com
Cc: Inki Dae <inki.dae@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: FAILED: Patch "drm/exynos: vidi: fix to avoid directly dereferencing user pointer" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:02:48 -0500
Message-ID: <20260301020248.1730726-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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





