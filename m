Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD00606BF8F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eUTJ9ARE;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sIkU7h+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=457d66qNmdVAInAs2FNohzR01zs1dKtl5+My1G7Y60o=; b=eUTJ9AREUYgB2B
	h9pOu8n5wuXLskOe+rCbBziGQ+0UlLD0UlYxodHTMrxwNzjQNSrRt7vPMO0rwGTorepe+CwAMm5Ek
	LO7L9ZtvwV/BSQRsvSqJJTXzIt+dLELY8miKwW5rrswHal3uZOj6cCkvELIVX6HwunqP9LgXOv2N+
	JdT5h9PvXiyNkD2s/WkfLmu7wj99V3cG+xTvhfCoUj3TIrQWJEBu1QNAUmBQHiNKCkxhDFo95xZZz
	sN+Qo4llIHUiZnsMAvgP/wpvg1V7Ln824qJNUqTF3F+TbabEaLdzmtY28cMemV1HXPTo8K/htr4Ow
	U/M73vGAjQpay09wBGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM90h-00000007pbO-0r4s;
	Wed, 28 Oct 2026 19:08:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM90H-00000007pWS-1SCI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:08:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9789B41816;
	Wed, 28 Oct 2026 19:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013161F01828;
	Wed, 28 Oct 2026 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793214484;
	bh=457d66qNmdVAInAs2FNohzR01zs1dKtl5+My1G7Y60o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sIkU7h+zWgPFrMmSuFo+MH0OcTd/AB470WsKFomHF+ykrlK4nf+a8QNA8axF2N+uy
	 vown03cPuAS3wnEXfm5p7hSVRiRnRpz6uLEXQWzMzgrll/iIQqRhd1xN1aDYZNOf62
	 zg1BIsmFViAEFJUhS184Q9gfbLXsWtAhxfBKg9Kw=
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
Subject: [PATCH 6.1 0875/1887] mailbox: zynqmp-ipi: fix an Excess struct member kernel-doc warning
Date: Wed, 28 Oct 2026 17:49:31 +0100
Message-ID: <20261028170519.330161861@linuxfoundation.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028170459.200466217@linuxfoundation.org>
References: <20261028170459.200466217@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

6.1-stable review patch.  If anyone has any objections, please let me know.

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




