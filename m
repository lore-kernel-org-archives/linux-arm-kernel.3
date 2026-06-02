Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5068DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dloNw3khkYFpZ8HUOkLSEFcKW6J/1PykK/kcWicIG90=; b=rlh/gpfhUE84JVAcVewb8pt9YI
	/g4Ob/vBiP12q//a8uUiagDPfe0GRChtylRonh70aHmNH6ScLlGBokhcMdTVq15G1mv/gSDTMQ8aU
	OrfKXpfEBKwb5xuFid3oCEjlbfxraIf9falQFKCxnIHuex3qHvu0cVYQxc146nmZkWOFPVetXxA19
	5bAFoKLPRhvpF3IBddETrKWRB9gIRE9hdAVUpKYYh2nolHc4wqnMYN1MfonfH7nJEMA60JoWSuUs1
	4wTN/Mi3t/h6NxO+Z6jvYcNEaVXutdIjIeI2tuolYEyU28EEBxzBPmqlbnm3VkVp8R4TQZ3nfERs2
	MVEBpqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMed-0000000Cojc-3j1I;
	Tue, 02 Jun 2026 10:47:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMea-0000000Coa2-26wm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 02 Jun 2026 10:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dloNw3khkYFpZ8HUOkLSEFcKW6J/1PykK/kcWicIG90=; b=j/j21NspChEkORWOGnxbj4onI6
	T0cgWHbuk4zWjG/7KZ13WRv8TZmMNbbyWBUuyiJLhofU4tcYbge9I30wyl9EiMCxdKkHQ5ao5JOdR
	2kRePdVgPxaVoVD4gQfRLRVur/XJl0B5lLHxqiACPDboPxY9gUwrwWGLjWkmw2C9vaTKNe+GUV+ED
	db0SVsLI4wVSti/aT8BdWddR5fO5lZSldByjKZ3EzAxJ4SA736pW0OAbxdcOBlNlfH97fcGLKWa9u
	25lTuOXQKGCc+Nwu4pOIpRrWsAx7ju2VlGZJ0Cngfz4/AxEnyt4M755Bkn0MjeBwIAY4nwfGv+VZJ
	PA1eXx3g==;
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUMeW-000000099CR-22TO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397235; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dloNw3khkYFpZ8HUOkLSEFcKW6J/1PykK/kcWicIG90=;
	b=liFEEm3DLA5RcSaKTLq0axu7O5SCFWtUIo9GonM5PoFvjpxdjN5aDXUcYFGVGRcY3qMM4nH6KcEy59UIOqAEEgWW9PH41ff87i4uZeuEHciUxr/hMeLWHKe5H33Xa336NKIf2KYBa/wGlildD04wzX6F/TT9N5sT64B1YfaSCVg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E98l_1780397232;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E98l_1780397232 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:13 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
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
Cc: alikernel-developer@linux.alibaba.com
Subject: [PATCH v2 25/30] drm/panthor: switch to iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:32 +0800
Message-ID: <20260602104637.1219810-26-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_114721_094700_8C70715A 
X-CRM114-Status: UNSURE (   9.41  )
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

Migrate panthor_mmu to use ops->iova_to_phys_length(ops, iova, NULL)
instead of the deprecated ops->iova_to_phys.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 75d98dad7b1d..3b635fc1f651 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -903,7 +903,7 @@ static void panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
 			 * are out-of-sync. This is not supposed to happen, hence the
 			 * above WARN_ON().
 			 */
-			while (!ops->iova_to_phys(ops, iova + unmapped_sz) &&
+			while (ops->iova_to_phys_length(ops, iova + unmapped_sz, NULL) == PHYS_ADDR_MAX &&
 			       unmapped_sz < pgsize * pgcount)
 				unmapped_sz += SZ_4K;
 
-- 
2.43.7


