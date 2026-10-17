Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BDDCCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaBeQnCwHY8G7B8rrXpPRwFMVOEwoG8B4YibXghGcdg=; b=mWwWAYUBnNrva/Ok1iySqTq+Dh
	yff7H6si9uHywNAv25SL8vc6nRjOQBNS0q+DXn9yVaLUBbw7YdTxhmvSUHwIBP53rGNBlJKz9LDER
	2FnXrrBfnIzczcFFlZPXOZ/cvZw9HjIaGgP/VzIpym4HKwFgRFEMxIhzUTbMhly+C10bcS4u+oNWY
	U+2uJuboQ6iCvOgkTyx0QE3jtCsijgsCaMi3tTZXS6S0sp7RFVBVZPJgeGqZqJLxtnQaPjrBozp8D
	rlbVaeQw8KOfOad6NzXpgl5roHUE8ZQw+86USeMy3O+OYOQEXQnIDGI5OQK0xSF3lrhBH2SNNw0j+
	PGfloD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8GK-0000000506B-1fpl;
	Sat, 17 Oct 2026 17:32:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8GI-00000005060-2ZlZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:32:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF3C74002F;
	Sat, 17 Oct 2026 17:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594AE1F000C4;
	Sat, 17 Oct 2026 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792258321;
	bh=RaBeQnCwHY8G7B8rrXpPRwFMVOEwoG8B4YibXghGcdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UyxUEEFQGTALfL5LlZIbq5nU6b++d3laUfqCA8MAZX5Fm2lo07ihpIboqFQkvPk8Q
	 89dw4aaQe8SMwUDXMytY0u4RH3dWER9n/Z1FLjywJCjUhCjeD3aZZ99exlp2tn+jYh
	 AhejHTLPGIUNDhV4PxOZLXmTDvmimfgwQbdIYOEI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 0805/1674] mailbox: zynqmp-ipi: fix an Excess struct member kernel-doc warning
Date: Sat, 17 Oct 2026 17:51:17 +0200
Message-ID: <20261017160451.777260502@linuxfoundation.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017160431.119607952@linuxfoundation.org>
References: <20261017160431.119607952@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit b3734a8291ad7fd61e5a51cc540e414bcfbdc0cf ]

kernel test robot reports 2 Excess struct member warnings:

zynqmp-ipi-mailbox.c:92: warning: Excess struct member 'irq' description in 'zynqmp_ipi_mbox'
zynqmp-ipi-mailbox.c:112: warning: Excess struct member 'ipi_mboxes' description in 'zynqmp_ipi_pdata'

The second one is a false positive that is caused by the
__counted_by() attribute. Kees has posted a patch for that, so just
fix the first one.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312150705.glrQ4ypv-lkp@intel.com/
Cc: linux-arm-kernel@lists.infradead.org
Reviewed-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Stable-dep-of: 0aead8197fc1 ("mailbox: zynqmp-ipi: Fix out-of-bounds access in mailbox cleanup loop")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 90f248ef2a1fc..c3953abe74b8e 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -81,7 +81,6 @@ struct zynqmp_ipi_mchan {
  * @remote_id:            remote IPI agent ID
  * @mbox:                 mailbox Controller
  * @mchans:               array for channels, tx channel and rx channel.
- * @irq:                  IPI agent interrupt ID
  */
 struct zynqmp_ipi_mbox {
 	struct zynqmp_ipi_pdata *pdata;
-- 
2.53.0




