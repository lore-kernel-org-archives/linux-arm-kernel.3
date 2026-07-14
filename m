Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850DDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QScrsAz8sWe3EMFQjRHgboQtjCxsFrOrjMwAkQQbjuM=; b=0tal7UabsLTY7/EauwnLrw1FbI
	UUF4SDrDG3UEstsIeEYi9nPtxj+nlCfNQNp2if8Wzp4dXbL29FAf6Pi0UHpGVSKU83/zMWpsxrRF6
	HaEDonJVGaZjQftcaYqgOHpaIEgwVs8WiDDHHB4NLUUC+ONtLmDnesAZbTJL8if/cl5O3U+32wv2/
	oFTMbOqUrXHoxXQ85HleGARehUgTRvFzOEmrBuz1LMEC3P93uVtIlm116PkPCmTcmNH8m0cCTL6x7
	FstGA8KNMtps2oSkZi5tqewKzDE21g9vLaJ7tsc1FeRA2YwoY6MDPIPDdEhDQtt5GJEhU/j4coxP+
	K6d5XirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT9M-0000000Am7t-3nFI;
	Tue, 14 Jul 2026 02:45:36 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT9J-0000000Am6E-3wKH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 02:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QS
	crsAz8sWe3EMFQjRHgboQtjCxsFrOrjMwAkQQbjuM=; b=bxlJM0AiW476bldOlk
	W0XmnKmcNFx21IWPP8+Ayd1+Yev3YczAtxsnDPaBmjHCuRYiJH7if/YTLKGAojXo
	SYw9JfF/26uuYyD2hkfSR/CIt6/D++jpYTmRz3OXRsilCzznmQZ9qGncPYnZ5vZY
	7vwNsf/hKDeHGnTkEa8Ce3QRM=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3cwa0olVqnreUJQ--.6535S2;
	Tue, 14 Jul 2026 10:45:08 +0800 (CST)
From: weimin xiong <15927021679@163.com>
To: iommu@lists.linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	xiongweimin <xiongweimin@kylinos.cn>
Subject: [PATCH] iommu/arm-smmu-v3: fix grammar in comment
Date: Tue, 14 Jul 2026 10:45:08 +0800
Message-ID: <20260714024508.188540-1-15927021679@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3cwa0olVqnreUJQ--.6535S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1kZF4fAFy5Cr45tr13Arb_yoWkWFgEgw
	1rA3s3Jw1FkFy2v3Wj9a4fZ34vvrW7Zr1kurn5W3sxJw18Jr40gFWkJ395Wa1xGrWjkFy3
	Jan0gry8JrW3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8vPfPUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: jprvmjixqsilmxzbiqqrwthudrp/xtbC8xTFTmpVorTAyQAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_194534_381637_7CD029A4 
X-CRM114-Status: GOOD (  11.04  )
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

From: xiongweimin <xiongweimin@kylinos.cn>

Correct "possibly failure" to "possibly fail".

Signed-off-by: xiongweimin <xiongweimin@kylinos.cn>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb48..023cb138a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3252,7 +3252,7 @@ static void arm_smmu_remove_master_domain(struct arm_smmu_master *master,
  *  5. old domain updates its invs array, unreferencing master->build_invs
  *
  * For 1 and 5, prepare the two updated arrays in advance, handling any changes
- * that can possibly failure. So the actual update of either 1 or 5 won't fail.
+ * that can possibly fail. So the actual update of either 1 or 5 won't fail.
  * arm_smmu_asid_lock ensures that the old invs in the domains are intact while
  * we are sequencing to update them.
  */
-- 
2.43.0


No virus found
		Checked by Hillstone Network AntiVirus


