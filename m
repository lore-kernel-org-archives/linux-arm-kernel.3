Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7CDC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 00:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBaqld3TmYtpvcCuMNwP5V/ALj/CVjmTGKnWI1UmjDo=; b=Jh5NTR/mgBZuwrk7llEFiTt/ca
	sbwf/BWelV3Pl8s5aVfTj9ieVSkNXqhccGXTnf3MJwIqKMMFMdyhpycyxF9DAPDhjhZ/aSYiW/oza
	5yIPK8qJkCjwjS6E4cd+VhQ88zJOwkR4LVGC++EO8lXjKWGzRsjWQADo9+XP6z3p9+RE+dXM5AXq/
	dpr5uhlaeMwrsbLnDpOIF33AVNd6Y7pOC9FVYnh5IMPY2DbdbyW/oI8A2LLR+vqsWgE+B5NTKTkjj
	3q0IjoUF1h4zz+IPpnLvD8fOFnCl+jRwnqzxG3Z2jJaikDV39Zk8GbiU5SEHnA3m3p2zWK1Nz9E9i
	M8eCzi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woW0c-000000049X3-3RQf;
	Tue, 28 Jul 2026 00:49:26 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woW0a-000000049Wf-3dcl;
	Tue, 28 Jul 2026 00:49:24 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Guanhua Gao <guanhua.gao@nxp.com>,
	Roy Pledge <Roy.Pledge@nxp.com>
Subject: [PATCH v3] soc: fsl: fix kernel-doc warnings and typos
Date: Mon, 27 Jul 2026 17:49:24 -0700
Message-ID: <20260728004924.904210-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
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

Correct spelling of "list".

Fix a kernel-doc warning by describing the nested structure completely:

include/soc/fsl/dpaa2-fd.h:52: warning: Function parameter or member 'simple' not described in 'dpaa2_fd'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Guanhua Gao <guanhua.gao@nxp.com>
Cc: Roy Pledge <Roy.Pledge@nxp.com>
---
v2:  update Cc: list, rebase
v3:  rebase & resend

 include/soc/fsl/dpaa2-fd.h |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

--- linux-next-20260727.orig/include/soc/fsl/dpaa2-fd.h
+++ linux-next-20260727/include/soc/fsl/dpaa2-fd.h
@@ -25,14 +25,15 @@
 
 /**
  * struct dpaa2_fd - Struct describing FDs
- * @words:         for easier/faster copying the whole FD structure
- * @addr:          address in the FD
- * @len:           length in the FD
- * @bpid:          buffer pool ID
- * @format_offset: format, offset, and short-length fields
- * @frc:           frame context
- * @ctrl:          control bits...including dd, sc, va, err, etc
- * @flc:           flow context address
+ * @words:                for easier/faster copying the whole FD structure
+ * @simple:               struct for the FD fields
+ * @simple.addr:          address in the FD
+ * @simple.len:           length in the FD
+ * @simple.bpid:          buffer pool ID
+ * @simple.format_offset: format, offset, and short-length fields
+ * @simple.frc:           frame context
+ * @simple.ctrl:          control bits...including dd, sc, va, err, etc
+ * @simple.flc:           flow context address
  *
  * This structure represents the basic Frame Descriptor used in the system.
  */
@@ -497,7 +498,7 @@ static inline void dpaa2_fl_set_addr(str
  * dpaa2_fl_get_frc() - Get the frame context in the FLE
  * @fle: the given frame list entry
  *
- * Return the frame context field in the frame lsit entry.
+ * Return the frame context field in the frame list entry.
  */
 static inline u32 dpaa2_fl_get_frc(const struct dpaa2_fl_entry *fle)
 {

