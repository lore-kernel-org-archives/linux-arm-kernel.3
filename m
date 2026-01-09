Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1341D167E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7kpf+jjkye1l4z1WQakfg2A4uK8CkvQNkLD7BSn/8Qs=; b=ly4XFCEjN9ncfepBxPvdXLkN7e
	nvARvwWvM1815JN6B8pMcPeE47fTD8ZoIu/DnzU3q5MXJcfF99wPDMpNrIul9HqSJtKY0nJKt1yaB
	fZTcAvL7LgbbLCHshAybZUsUA01HQWy/8t64TN996Mepud/z6DTN9zTOaNQykmQ5c9jDr6AQW0ZH/
	csQsGvHZ+V/ZFEGdFvL+6GDwQOQHA7Jm9YKXakeCLdHNjJR4J/YQFJjAbi/i84hC3keO7P1Q1umqR
	nYcdrSiNETIBvHm+G8vAc0qk5tJDIkQOKNgHlsYEcDZS4nrYI7J+nAiv5bXxjpog8aT71KQSSoqDy
	9ATOvYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8oI-0000000216Z-3iBW;
	Fri, 09 Jan 2026 09:29:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8oG-00000002166-0rDT;
	Fri, 09 Jan 2026 09:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 700EC43CF3;
	Fri,  9 Jan 2026 09:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C661CC4CEF1;
	Fri,  9 Jan 2026 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767950971;
	bh=F8KU75i1fjmpG4l5aTfjbV+GEVEuy07tlxmJFSjhreU=;
	h=From:Date:Subject:To:Cc:From;
	b=czX2GjCAeKk37ahXBnQsU480j02YUGaX/yrFmxCnr8yj8jKljqUXAJTYQQ2moaEiP
	 EG0bUvNe75IGzsZhYZcYogfPCZdMuImCSQxPm3KMgpJChp8ZnjZea80DfmsGWoP+ZG
	 Kv0lVd49uHyi3wJgNqj+XC7IHrqAQY7VTJnAraN4HySSh5Es8681rLiZmlXP/EHEgd
	 O1Hcj6dSaYRSRTWKhZLQGVpUu237PHSOl3WJtZDfzS3pll05AT8hMOBVSYXNyTDSMN
	 iiUYEmL9bIg1Omx8tGKLkGvbKg8SoMzxRRbCKD69uOfu2rClZKriAmZNYVAD9lfSG0
	 Z3Q5Mv20TOjSQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 09 Jan 2026 10:29:06 +0100
Subject: [PATCH net] net: airoha: Fix typo in airoha_ppe_setup_tc_block_cb
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-airoha_ppe_dev_setup_tc_block_cb-typo-v1-1-282e8834a9f9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCMBBA0auUWRtIgrTqVUSGZDraQWmGJC2W0
 rsbXL7N/zsUzsIFbt0OmVcpkuYGd+qApjC/2MjYDN763jp7NUFymgKqMo68YuG6KFbC+En0Roq
 mbpoM03COIbiLHxhaSzM/5fv/3B/H8QMG8jevdwAAAA==
X-Change-ID: 20260109-airoha_ppe_dev_setup_tc_block_cb-typo-ec74baa1827e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012932_287331_0AE31A8E 
X-CRM114-Status: UNSURE (   9.79  )
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

Fix Typo in airoha_ppe_dev_setup_tc_block_cb routine definition when
CONFIG_NET_AIROHA is not enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601090517.Fj6v501r-lkp@intel.com/
Fixes: f45fc18b6de04 ("net: airoha: Add airoha_ppe_dev struct definition")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 include/linux/soc/airoha/airoha_offload.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index ab64ecdf39a06dd1ceb461fafc5e1437edb6141c..d01ef4a6b3d7cef2e8dd0cbaf183fd6cc040c45b 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -52,8 +52,8 @@ static inline void airoha_ppe_put_dev(struct airoha_ppe_dev *dev)
 {
 }
 
-static inline int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev,
-					       void *type_data)
+static inline int airoha_ppe_dev_setup_tc_block_cb(struct airoha_ppe_dev *dev,
+						   void *type_data)
 {
 	return -EOPNOTSUPP;
 }

---
base-commit: fc65403d55c3be44d19e6290e641433201345a5e
change-id: 20260109-airoha_ppe_dev_setup_tc_block_cb-typo-ec74baa1827e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


