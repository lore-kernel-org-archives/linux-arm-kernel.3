Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D965CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E70SnJAManO1sUwN8DIROhAuulLlMuRgGTHj2PBQWaU=; b=pbirDuyNk7Z4WUP6IHdnkjvskn
	kYUxQ6ybu60uxUgEX+xrTnzgcfQmCZoyn2sdTfQ8xuHfjjRHhiRCHsWarPpSDgXxaDp1dJmjfMu4v
	DWezJzahUBnjdJFmp8bwWLFOHbCIKSTDsCzD9D41dfx+50rlS7ggyKkAuNZza5KnSxJ4s+r1U74KL
	C0XC1il4AEvvXyBB8OqYEmWU104EKO/bNejsTHufhKL9yKLuUAQyF63ADBjq5iccLMy2NFPnpZPLv
	JtfPbn8zJ8YMLOx2KZuGE5wV32DZehdkeohl7OmrEqsvoDd1MHLc1dEkYdMfBwbMTzr/bbws+F7u8
	bxIYZEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ5h-0000000Azcm-2T9v;
	Mon, 12 Oct 2026 16:41:33 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ5g-0000000Azc7-0ze4;
	Mon, 12 Oct 2026 16:41:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5] coresight: coresight.h: add '*' to kernel-doc lines
Date: Mon, 12 Oct 2026 09:41:30 -0700
Message-ID: <20261012164130.671708-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
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

kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
a beginning '*' in them, so fix these lines.

Also convert struct coresight_trace_id_map to kernel-doc format to
remove another warning.

Warning: include/linux/coresight.h:173 bad line:
  connected to @src_port. NULL until the device is created
Warning: include/linux/coresight.h:177 bad line:
  needs to be filtered.
Warning: include/linux/coresight.h:236 This comment starts with '/**',
  but isn't a kernel-doc comment.

Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
v2: rebase & resend
v3: rebase & resend
v4: rebase & resend; add Andrew to Cc: list
v5: rebase & resend

Cc: James Clark <james.clark@arm.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Mike Leach <mike.leach@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/coresight.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linext-2026-1007.orig/include/linux/coresight.h
+++ linext-2026-1007/include/linux/coresight.h
@@ -179,11 +179,11 @@ struct coresight_desc {
  * @dest_port:	destination's input port number @src_port is connected to.
  * @dest_fwnode: destination component's fwnode handle.
  * @dest_dev:	a @coresight_device representation of the component
-		connected to @src_port. NULL until the device is created
+ *		connected to @src_port. NULL until the device is created
  * @link: Representation of the connection as a sysfs link.
  * @filter_src_fwnode: filter source component's fwnode handle.
  * @filter_src_dev: a @coresight_device representation of the component that
-		needs to be filtered.
+ *		needs to be filtered.
  *
  * The full connection structure looks like this, where in_conns store
  * references to same connection as the source device's out_conns.
@@ -236,7 +236,7 @@ struct coresight_sysfs_link {
 #define CORESIGHT_TRACE_IDS_MAX 128
 
 /**
- * Trace ID map.
+ * struct coresight_trace_id_map - Trace ID map.
  *
  * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
  *		Initialised so that the reserved IDs are permanently marked as

