Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3510FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9XXEX3smppW2TBh0BppyjpS4seK2gYW5VurxkC9Y5g=; b=fVhI9nYXYzXjYIRq8ZO8XozoeS
	c93joSyAliCq4H3NPrXcUQnrbksH8W9bDxWFk8rZmuWC2HZGKdA7KyVvvdwVMtnElkMV5riBVA8R/
	fv+sgyb+IgiFXwHWts/CzNbXP0hrXoQBCvbwa9js7FS1263CB88DhT8ZOVRBWCFA+i6NkOQhMjOpq
	NAAY1LgbZyj2RfC0ZfvJOfsOB0lCccQIjgoZPAdv1ppEjFZyddQiHaTjV50ZSTBQTcgUOvWuI1V9L
	I3PTShVa74p+Pvr/kFg31Y9RT05dyQvEq3z9LGy8/v+erXF9unzSRGM/aUVGY3F0P6KDqShK4WPKN
	v+vmmfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSKh-0000000DUjN-2o9C;
	Tue, 02 Jun 2026 16:51:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSKg-0000000DUjH-2HS8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:51:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 048B26001A;
	Tue,  2 Jun 2026 16:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15E01F00893;
	Tue,  2 Jun 2026 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419073;
	bh=z9XXEX3smppW2TBh0BppyjpS4seK2gYW5VurxkC9Y5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HCfEPfYgWXSl6oQEaBH+XCNIKSVaCxeGIgus+1lMDWb2ZbTpFVnUcHPXNY2qQCQYg
	 4w3ZAPOajH7KUjV+/+IrHRsTYGBXiGmh65N9JKEdMopoKEDYY2dsHd/diC4EXybn7t
	 amhS4/84hq7RutKCbcP60f490c4VwlsCLo/xOTCLyKtoY8ngacSCkMuG95fVPakHSl
	 9LQ2KhQ5L65/VcI68X1KL6/2FsK/ZfQdEvzKsIpXJkLqayrLlB7Gi+qW8hlVtqX0PJ
	 YacoHaHlmtJcdhJyHoDywIVwHdsUM58Zb6Q58SAzrm1VNgYTFD0b43SJsXrhFjA5tB
	 8KOsvK40Xj5aQ==
Date: Tue, 2 Jun 2026 17:51:10 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Seth Forshee <sforshee@nvidia.com>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firmware: arm_ffa: Fix RXTX_MAP buffer size
 regressions
Message-ID: <20260602-fuzzy-adamant-catfish-3afaeb@sudeepholla>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
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

On Mon, Jun 01, 2026 at 03:45:10PM -0500, Seth Forshee wrote:
> Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size
> during RXTX_MAP") caused a regression for some FF-A implementations. It
> has the effect of passing the size of the page-aligned buffers to
> FFA_RXTX_MAP, which may be larger than the maximum size supported by the
> SPMC. When this happens FFA_RXTX_MAP will fail with INVALID_PARAMETERS.
> 
> The following patches deal with two distinct scenarios which lead to
> this issue. With FF-A v1.2+, FFA_FEATURES can specify a maximum supported
> RX/TX buffer size, so patch 1 decodes this field and honors the maximum if
> specified. For FF-A v1.1 and earlier the maximum is unknown, so patch 2
> deals with this by first attempting FFA_RXTX_MAP with the page-aligned
> buffer size (preserving the behavior introduced by commit 83210251fd70).
> If this fails due to invalid parameters it retries with the minimum buffer
> size from FFA_FEATURES.
> 
> Testing was done with FF-A v1.1 and v1.2 implementations, both of which
> reject buffer sizes larger than 4K. Both implementations were tested with
> 4K, 16K, and 64K pages. Without these patches, probe fails for page sizes
> larger than 4K with the message "failed to register FFA RxTx buffers."
> With the patches probe succeeds for all page sizes.
> 
> The patches are based on for-next/ffa/fixes.

for-next/ffa/updates has patches queued for v7.2.

> 
> Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> ---
> Seth Forshee (2):
>       firmware: arm_ffa: Honor maximum RX/TX buffer size
>       firmware: arm_ffa: Fall back to minimum buffer size if RXTX_MAP fails
> 
>  drivers/firmware/arm_ffa/driver.c | 51 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 6 deletions(-)

Wondering if these 2 fixes can be merged into one and simplified something
like(untested) patch below(rebased on linux-next or for-next/ffa/updates)

Regards,
Sudeep

-->8
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 0f468362c288..5ffe21c568b7 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -32,6 +32,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
@@ -59,7 +60,9 @@
        (FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))

 #define RXTX_MAP_MIN_BUFSZ_MASK        GENMASK(1, 0)
-#define RXTX_MAP_MIN_BUFSZ(x)  ((x) & RXTX_MAP_MIN_BUFSZ_MASK)
+#define RXTX_MAP_MAX_BUFSZ_MASK        GENMASK(31, 16)
+#define RXTX_MAP_MIN_BUFSZ(x)  (FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
+#define RXTX_MAP_MAX_BUFSZ(x)  (FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))

 #define FFA_MAX_NOTIFICATIONS          64

@@ -2101,7 +2104,7 @@ static int ffa_probe(struct platform_device *pdev)
 {
        int ret;
        u32 buf_sz;
-       size_t rxtx_bufsz = SZ_4K;
+       size_t rxtx_min_bufsz = SZ_4K, rxtx_bufsz, rxtx_max_bufsz = 0;

        if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT) &&
            is_protected_kvm_enabled() && !is_pkvm_initialized())
@@ -2132,15 +2135,18 @@ static int ffa_probe(struct platform_device *pdev)
        ret = ffa_features(FFA_FN_NATIVE(RXTX_MAP), 0, &buf_sz, NULL);
        if (!ret) {
                if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 1)
-                       rxtx_bufsz = SZ_64K;
+                       rxtx_min_bufsz = SZ_64K;
                else if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 2)
-                       rxtx_bufsz = SZ_16K;
+                       rxtx_min_bufsz = SZ_16K;
                else
-                       rxtx_bufsz = SZ_4K;
+                       rxtx_min_bufsz = SZ_4K;
+
+               rxtx_max_bufsz = RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
+               if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_min_bufsz)
+                       rxtx_max_bufsz = rxtx_min_bufsz;
        }

-       rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
-       drv_info->rxtx_bufsz = rxtx_bufsz;
+       rxtx_bufsz = min_not_zero(PAGE_ALIGN(rxtx_min_bufsz), rxtx_max_bufsz);
        drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
        if (!drv_info->rx_buffer) {
                ret = -ENOMEM;
@@ -2156,10 +2162,17 @@ static int ffa_probe(struct platform_device *pdev)
        ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
                           virt_to_phys(drv_info->rx_buffer),
                           rxtx_bufsz / FFA_PAGE_SIZE);
+       if (ret == -EINVAL && !rxtx_max_bufsz && rxtx_min_bufsz < rxtx_bufsz) {
+               rxtx_bufsz = rxtx_min_bufsz;
+               ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
+                                  virt_to_phys(drv_info->rx_buffer),
+                                  rxtx_bufsz / FFA_PAGE_SIZE);
+       }
        if (ret) {
                pr_err("failed to register FFA RxTx buffers\n");
                goto free_pages;
        }
+       drv_info->rxtx_bufsz = rxtx_bufsz;

        mutex_init(&drv_info->rx_lock);
        mutex_init(&drv_info->tx_lock);



