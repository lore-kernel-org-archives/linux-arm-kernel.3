Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEECCD6E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtoAZ4ObIrgN8RB/Z4MrgWEyJCArPPBpz4yofnEwwtU=; b=q1OsnaNEGBcO5jJsNIWF5XiY9H
	+sPGCNDbV/G3PVTX/DFapNH4gFamyYuZL2Qol/2ipD0S9g4vEVZ3kSYhxMdo1jb9TwK7vXwtFU2RT
	WzrtMMR0TMCZVtwP1f3E9PfXQVYXLtf9LGbdSTpRcEyEl5cTOvLe1uyWtf2756laPQmckqGKR+fCf
	dmysFP5Xo5efz8lRAHD2oK/M0mVBGQT0IoYKOAVhFH8BGJt2hovF9qSDXzjaB6qRfXurbjUVd14zD
	BgBfOHpG9zncWxJ9BvJNo9PzVDSLFP03Vd29ZZWVkVqq2lr8UTz9QSRIVMaf0FvR2zcX+rO5tOAY6
	q8yXGpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNS-0000000FNQ9-2mVc;
	Wed, 03 Jun 2026 15:19:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNF-0000000FN3S-3mq0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FtoAZ4ObIrgN8RB/Z4MrgWEyJCArPPBpz4yofnEwwtU=; b=PIcNsjZ2XhVcgwxYcPxAkvWnpx
	sSAEm3xbKL0K8Odg/OXZihXzh794NaOQcZL7JaT1Pcbyhmv6AMIlCv8xUshr5uPsKGCdY5/gt1eKH
	yqdY8qjsb4Dw7rqFsecVgGcpoTYqyKiH5UC1wZuHn7ZVG2UMawoXCCj6ewj0owgpXFhbgmx57Qkhq
	aJCSSYK9+rZ5hwn8RDnG9wA8AIRI6DxeT0mCivh5pi188GVvnjrotuJHXwUaRZ+aw97SGSKG2CxPp
	wP+Gdjeca+wAqeHi+1e/Q+0XOTSOHdw27vmNWVV4ikgtyWH4YcvnZt7MBa4XEf8eeF4Q4+2Z3vrbt
	nz81zNow==;
Received: from out199-18.us.a.mail.aliyun.com ([47.90.199.18])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnNC-0000000CXqP-2okn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499948; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=FtoAZ4ObIrgN8RB/Z4MrgWEyJCArPPBpz4yofnEwwtU=;
	b=dmooYd3IjVvfRFdzF9y7M6tE2IJIvIn5qZ8dqr2paB1d9/qTBBEsVk5hFyqZVHeo2yTmyMt+DJCHatfouNy/Y3p67MXNITNs6WMWeINy2onH7B+M0HMfFlzEb2LglYhqzkYS99Z1Kn/nK2CbRnUiJfaZgYCqEMsMg+As53AaiIY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR7M_1780499944;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR7M_1780499944 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:04 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: jgg@ziepe.ca
Cc: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	alikernel-developer@linux.alibaba.com,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Subject: [PATCH v3 26/32] drm/panfrost: switch to iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:58 +0800
Message-ID: <20260603151804.1963871-27-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161915_084371_CC90BE69 
X-CRM114-Status: UNSURE (   9.04  )
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

Migrate panfrost_mmu to use ops->iova_to_phys_length(ops, iova, NULL)
instead of the deprecated ops->iova_to_phys.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 4a3162c3b659..aa0bc82deaf6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -514,7 +514,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
 
 		if (bo->is_heap)
 			pgcount = 1;
-		if (!bo->is_heap || ops->iova_to_phys(ops, iova)) {
+		if (!bo->is_heap || ops->iova_to_phys_length(ops, iova, NULL) != PHYS_ADDR_MAX) {
 			unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
 			WARN_ON(unmapped_page != pgsize * pgcount);
 		}
-- 
2.43.7


