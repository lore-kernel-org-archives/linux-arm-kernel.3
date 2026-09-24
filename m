Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99405C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hETdWP+28Kjop3TWViNya7dV2FwGxiafVK/A/I1RaCA=; b=0+0EbQOGwzHYaowEvd1guDTcnF
	u6PN5xCH2WiYmeA758HeYsZ9FnE3fgK9xbulAjjxiGH3AhhDEFX5eTqT25I/pHsnw+ujxeHE0QkL1
	VoolP0nnRx4agZFsNJtiu+uymv7OzZg0aCZqR+PhVD8fkoblvlDC6+M/6zC86k0J8mHi5lPGOHQrU
	i7vuCgzvMEuAgVWEHVnb7BRurd/Jyo667YVKF+eRRHtjs4XvjDFKUnr+bj+rVxUUq/Bn0aTvHpKO1
	PCFvkrJfKlw+v++FNm473aPePDfGTl8MmZMPQEnNA/baqAGV6bQ/OMbVIn6A8j5oyIswH6rdFMdg5
	r/qzObrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fG0-0000000AVvi-3rnD;
	Thu, 24 Sep 2026 08:56:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFs-0000000AVsY-0yKI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 08:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hETdWP+28Kjop3TWViNya7dV2FwGxiafVK/A/I1RaCA=; b=hew97wiKUJawPa+aiz4eFM2f6N
	TZcSxncesDkat5lhMpnVlWJ/hUsL2BtXutSFIU7lj5wgh2UHyrrxx9bfaNfvflWkktP9RJKLm5Q4V
	Ckq8KW5YUTKkoqQgq9FZIaD1ylm6jOLwibKi9Tam6p00SKHIZJBGtriWXhDhgQ9NpMWXePUbh4iFP
	0vGT1/pJGTFwVX9ps3V20eatxvS4wX8bg9eZjYP1N8BLF5rWAgJPmY9234G/LS5ZdRKqDx3Yzl3HP
	odondtJr8GogaG31kuDxfGo2mN1wrMkyeRAhLAYd1gFrjCKMh7nTTgM/0PUyUhX3ZmCmkVD93VvqC
	2mG7xNfA==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fFp-0000000Fl3X-0q6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:56:34 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so26208745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240191; x=1790844991; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hETdWP+28Kjop3TWViNya7dV2FwGxiafVK/A/I1RaCA=;
        b=Vk/gYivtE35uk/ik9J/gPVoEEbhDPwhltRjVuk8HNCTzh9dY+GbHXid4GN1va289HX
         JEhxV+KdKq0GAEtIKzRLFv2bSDDB1+dnXrBPUzkyzsjNrbmeCjT7bTeX98uSfef6joiJ
         XEcHchzY+mtPCcGsJmoXclvebd2kDyI251ieh3T5m636mW7jriTu9rUpRJlCdpAHgJiA
         iqkRZTzRc0OY6l3v6QFCOg68JeUz/ZIuRbZPlLlzTK0MlR1KaUeDE5dBOwiT1Lj5mwU3
         3BALD5zLyE+HCuZ3f1tBrXpmaU8PrvyqWncksK61/Xeas1YUgVVs1ElHUc7EjHHcjY36
         GEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240191; x=1790844991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hETdWP+28Kjop3TWViNya7dV2FwGxiafVK/A/I1RaCA=;
        b=UrhtLSAYkuujZ0D4mEMtFXAv0lI6d5INECA1qMEVHrdnnlDxh9dRaVH46KVfAihV5C
         UqtI/VgNSMEGDgVfsvf/2XDX1dZE6GAvncbpLxlCT2yIMnFGvbEcyMbzI1ohGntOkuUS
         6tV3gfxPuja4LK4gyQXPcGGpTyxXFV6f4MGZd/AbKfS5XBKzrgToZNBIBjYZMGFDrsF6
         FNm1Cwr0Ao7Ho1Cl5I7WpHxBBhRWEGQjR8seJ1yIe7ujrFAhEPqGxKuWq1A/dVsmZ1HG
         jM8DMVGWcBQX8KxFFrDz0/4W1eyQfv2GBjuGQEAWM/AxqBovnLnZKNUId6sEkhBQbKXj
         evgg==
X-Forwarded-Encrypted: i=1; AKwUvBxRyJEJ8xXXquA/I2iVugfDbk0iygV+8zQ2G1BBhOkXtGaBgbKqyGJ/1PpLl8yS4FG79WG0g9o3csM0MPEkvKn6@lists.infradead.org
X-Gm-Message-State: AFuF++kOYFxTe1EYQReBH37s7L6P0hOH/leHavIqgqeg7glrWP7bW4NT
	Yw+NIJTUG3tv/c0I4dwJU4+U1+6P0poIimak0YrbAfqvhjbtL91J87iNWWINq1ojft7iWOsuQ9V
	322n2WHsOSq8zcw==
X-Received: from wmjv7.prod.google.com ([2002:a7b:cb47:0:b0:49f:e95d:f21a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d99:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49fe7b739f4mr19669965e9.15.1790240190846;
 Thu, 24 Sep 2026 01:56:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:16 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-6-smostafa@google.com>
Subject: [PATCH v2 5/5] iommu/arm-smmu-v3-test: Fix UBSAN error
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095633_337871_6914EADC 
X-CRM114-Status: GOOD (  12.47  )
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

struct arm_smmu_invs marks its flexible array member inv[] with the
__counted_by(max_invs).

arm_smmu_v3_invs_test() uses invs1 to invs5 which has num_invs = 3
but omit max_invs.

This causes the following UBSAN error:
[    2.333240] UBSAN: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1116:21
[    2.333604]     # arm_smmu_v3_invs_test: lib/ubsan.c:228: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
[    2.334129] index 1 is out of range for type 'struct arm_smmu_inv[] __counted_by(max_invs)' (aka 'struct arm_smmu_inv[]')
[    2.335375] CPU: 6 UID: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N  7.2.0-g8dcb331fbb72 #2 PREEMPT
[    2.335759] Tainted: [N]=TEST
[    2.335791] Hardware name: linux,dummy-virt (DT)
[    2.336254] Call trace:
[    2.336932]  show_stack+0x18/0x24 (C)
[    2.338443]  __dump_stack+0x28/0x38
[    2.338494]  dump_stack_lvl+0x54/0x6c
[    2.338518]  dump_stack+0x18/0x24
[    2.338541]  ubsan_epilogue+0x10/0x44
[    2.338565]  __ubsan_handle_out_of_bounds+0xb8/0xbc
[    2.338834]  arm_smmu_invs_merge+0x688/0x8ac
[    2.338862]  arm_smmu_v3_invs_test+0xd4/0x598
[    2.338890]  kunit_try_run_case+0x64/0x160
[    2.338914]  kunit_generic_run_threadfn_adapter+0x28/0x4c
[    2.338955]  kthread+0x10c/0x12c
[    2.338984]  ret_from_fork+0x10/0x20
[    2.339433] ---[ end trace ]---

Explicitly set max_invs = 3 on the test arrays to match the number of
elements.

Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 244cf34e5a0b..e52a7d95c919 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -654,6 +654,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
 }
 
 static struct arm_smmu_invs invs1 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, },
 		 { .type = INV_TYPE_S2_VMID_S1_CLEAR, .id = 1, },
@@ -661,6 +662,7 @@ static struct arm_smmu_invs invs1 = {
 };
 
 static struct arm_smmu_invs invs2 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
 		 { .type = INV_TYPE_ATS, .id = 4, },
@@ -668,6 +670,7 @@ static struct arm_smmu_invs invs2 = {
 };
 
 static struct arm_smmu_invs invs3 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_S2_VMID, .id = 1, }, /* duplicated */
 		 { .type = INV_TYPE_ATS, .id = 5, }, /* recover a trash */
@@ -675,6 +678,7 @@ static struct arm_smmu_invs invs3 = {
 };
 
 static struct arm_smmu_invs invs4 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 1 },
 		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 },
@@ -682,6 +686,7 @@ static struct arm_smmu_invs invs4 = {
 };
 
 static struct arm_smmu_invs invs5 = {
+	.max_invs = 3,
 	.num_invs = 3,
 	.inv = { { .type = INV_TYPE_ATS, .id = 10, .ssid = 2 },
 		 { .type = INV_TYPE_ATS, .id = 10, .ssid = 3 }, /* duplicate */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


