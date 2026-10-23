Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191ED606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rg9M3Mro;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PcVf5iHp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PWqyUavBnfNEo1DMfRHoVS39e8foN13m8UB6fhUtUw8=; b=rg9M3Mro4uHNNuYyel0tqXdRIo
	H0OkBsgxHBXqZJNIZsdZA30HiHEJSCEm2kI0IySIoXU5vXSuuhm5XnJjdc+Mid4zsPDVUwTXZPef5
	saupUbFUeXoLnmJbnRgQyMsDv1K8EbRS7vL8i4Z/Sa9+fwQ53Ca53VeeSyVu7g0dEMtXQ8AO8uqWx
	f++dsLlszb2hT031BV5iu7TwTr/ooz4dCEjgEKHdSFB6hKRdtMcThpszF8lG9sDnvy7B9q43BxakL
	a7r4SZdIT9YeDbfnXJtZb3vcqkZjhpkhSwDvGQdzNEL3wTL7UZ3RHQLU9uCJKAgCl/GAnLik3LsvT
	LxJy5XoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOjA-0000000HAdG-1lER;
	Fri, 23 Oct 2026 23:31:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOj7-0000000HAcU-2bX2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:31:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so24475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792798269; x=1793403069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWqyUavBnfNEo1DMfRHoVS39e8foN13m8UB6fhUtUw8=;
        b=PcVf5iHp3Qd3x1Q8BoRMy7WqObCfEyvBDIhij2XrnWhMY0IRbEBx71zIgMi540pGeX
         xwuJYTD9PEKpI7HBqMCVGXnINp0PbI7D53v6677IeUUYhgS14sjETr7XgZcr3dEl7g8u
         gNAhatbNDIpGSLO/JJV1qBv56YMj/NAdzDtc4LWnsfePCa7xN9Nak/PUcNbEkogLCFDv
         /z6og83BQ7DLcWV98/aVb3sSIi0n94UaEKeHtppL2kOzYon3wKjTN7iP9kTBNv5AoJZL
         KUuzpFJ4tPLY9dTk1bCL68jX67Ja1q5+Ujz0tE/s8sABENZXPbdYVjd6iMjY5MVjnHW0
         6X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798269; x=1793403069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWqyUavBnfNEo1DMfRHoVS39e8foN13m8UB6fhUtUw8=;
        b=qxL2qEnj7Yu71DoyeeOTtAF14tChsqNT59Ph31FMUszTf70FWhYRtCLbcUFcomn5h1
         Qq55kcBa02o/3JItqzJEbdW3znWYbteyE3R5kJG+JzcYJZTZiJOboHjRztvM7xEwO80F
         ZHQJTIyAbGBhMzxuOdTNvVEkeFg0ahifr9YK6Jq7MKCfsp/qkN6jOCJ7zIjBodLHJywZ
         ezYGFGwWq/t40Zj9Fa/UIslVGR65EdvMJbsW5uLkN6TGhyI1GdN+Up3XBiryfhMJ1r0f
         VGbxd+sPdKfZj5P+ll2kOHoct68MOQII8X9L3FCcoknO5jqFP2Fsqh57mwdPjij9aFYD
         GIYw==
X-Forwarded-Encrypted: i=1; AKwUvBwDIrSGxl5CRMNBZwsndF9oOh0yZQnvVzeytAoo1NlxyM2pEdGi/o6iTeTYY3N5yXAmJ5m2F/prS2qn0dwvqOUB@lists.infradead.org
X-Gm-Message-State: AFq9FYIvynG2ZipkcrK/j0gaCmhohvwjm/3PhenzDN0w23JNvixEE5h+
	hQHhwTGCro0hbjomOpCuhtlvJtK3UOq+tQM0IujwSRbQMzC3LGDKUO2Zcxx3GLhH6Q==
X-Gm-Gg: AYBFou2h12R//XCFIwuiHj96ToGL4F72eaYznghtFTuR6+ToLuR0N9TV0qGhk/XOrvX
	zzw4b1m0UHoBx5eOpDVEfbDWviO4JeguZPSfcSu3W4Kmf095pjnm2fRD2ErikW8YsSRrkz97wJO
	r6nSyWHUwZiI2Xv3SUJkUC4L59ofoqESOP8cjIy+127+rn6ymOS7TcydqK0qWVpP9uvtBUPi7DE
	faBKxDo3hhZIxwDbhWJ4oXJYZ3P0qMyd1oklnOPl2Ti3SnwonsmuJyaP2a3103TQB9g9KZlKqrb
	HC5QnK/uDYMJiru4kSaOhO6wOUu6A6fpwJZ7g4FxYyJum+Of3ToapoFV+FcBnXSxzA+h/WvgVck
	AxeOHDJSf4V1FCSBMGg4CHD+ApEUoQchzozvemHhuiQhseuP5fM4YkTYUlInAvXFBdYgypgUEtB
	bNemdBn6D0LRFrMjvDVCt5Ne3Wla95nsxbLqiur9rC99PHeTKrQ8sy0iELzsyah8WiTIHlSLw2t
	Cr4i4rPqJJsqi+KE38E/1NMweOU3mbA/8HOUgS02bAfISQxNIxYFXGD1qrIKR7dKs7dr2XEBlz3
	Nw4khQDRlDhCwm+ApkLDApBYRk54FWYzoHJ0NcJY6wuI2jyK
X-Received: by 2002:a17:903:1cc:b0:2e6:1917:fa with SMTP id d9443c01a7336-2ea9d12a727mr853705ad.7.1792798268197;
        Fri, 23 Oct 2026 16:31:08 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb27a1bsm707176a91.15.2026.10.23.16.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:31:05 -0700 (PDT)
Date: Fri, 23 Oct 2026 23:31:03 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <atvppceAqBVx8G9S@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163109_668938_2C236722 
X-CRM114-Status: GOOD (  19.44  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
>On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
>>S1 domains are programmed by CD entries in the CD table. During a new
>>domain attach these are updated using write_cd_entry. Since ASID and
>>TTB0 are in different 64-bit words, the write_cd_entry considers it a
>>non-hitless update and sets V=0. This means such an update is disruptive
>>and would generate translation faults if there are ongoing DMAs.
>>
>>Replace the CD entries by using an unused temporary ASID in following
>>sequence to allow hitless replacement of CD entry,
>>
>>- Update the CD entry with temporary ASID.
>>- Update the CD entry with the target TTB0.
>>- Update the CD entry with the target ASID.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 ++++++++++++++++++++-
>>  1 file changed, 64 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>index 5732f3ba0122..59f4b8cf89f6 100644
>>--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>>@@ -1641,6 +1641,68 @@ void arm_smmu_write_cd_entry(struct arm_smmu_master *master, int ssid,
>>  	arm_smmu_write_entry(&cd_writer.writer, cdptr->data, target->data);
>>  }
>>+/* Invalidate every stage-1 TLB entry tagged with @asid. */
>>+static void arm_smmu_tlb_inv_asid(struct arm_smmu_device *smmu, u16 asid)
>>+{
>>+	enum arm_smmu_cmdq_opcode op = (smmu->features & ARM_SMMU_FEAT_E2H) ?
>>+					       CMDQ_OP_TLBI_EL2_ASID :
>>+					       CMDQ_OP_TLBI_NH_ASID;
>>+
>>+	arm_smmu_cmdq_issue_cmd_with_sync(smmu,
>>+					  arm_smmu_make_cmd_tlbi(op, asid, 0));
>>+}
>
>Feels like this should probably use the existing invalidation machinery...

I see, I can use the arm_smmu_inv_flush_iotlb_tag() to issue
invalidation for the ASID.
>
>>+
>>+static void arm_smmu_cd_set_asid(struct arm_smmu_cd *cd, u16 asid)
>>+{
>>+	cd->data[0] &= ~cpu_to_le64(CTXDESC_CD_0_ASID);
>>+	cd->data[0] |= cpu_to_le64(FIELD_PREP(CTXDESC_CD_0_ASID, asid));
>>+}
>>+
>>+static void arm_smmu_replace_cd_entry(struct arm_smmu_master *master, int ssid,
>>+				      struct arm_smmu_cd *cdptr,
>>+				      const struct arm_smmu_cd *target)
>>+{
>>+	struct arm_smmu_device *smmu = master->smmu;
>>+	struct arm_smmu_cd stage;
>>+	u32 tmp_asid;
>>+
>>+	lockdep_assert_held(&arm_smmu_asid_lock);
>>+
>>+	/*
>>+	 * Nothing is translating through an invalid CD, and an update that
>>+	 * invalidates one cannot be made hitless anyway.
>>+	 */
>>+	if (!(cdptr->data[0] & cpu_to_le64(CTXDESC_CD_0_V)) ||
>>+	    !(target->data[0] & cpu_to_le64(CTXDESC_CD_0_V)))
>>+		goto write_directly;
>>+
>>+	if (xa_alloc(&arm_smmu_asid_xa, &tmp_asid, XA_ZERO_ENTRY,
>>+		     XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL))
>>+		goto write_directly;
>>+
>>+	/* Copy the existing cd entry and update only the ASID. */
>>+	stage = *cdptr;
>>+	arm_smmu_cd_set_asid(&stage, tmp_asid);
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
>>+
>>+	/* Copy the target cd entry and update ASID to the temporary ASID. */
>>+	stage = *target;
>>+	arm_smmu_cd_set_asid(&stage, tmp_asid);
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, &stage);
>>+
>>+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
>>+
>>+	/* Update to the target cd entry as it should be hitless now. */
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
>>+
>>+	arm_smmu_tlb_inv_asid(smmu, tmp_asid);
>>+	xa_erase(&arm_smmu_asid_xa, tmp_asid);
>>+	return;
>>+
>>+write_directly:
>>+	arm_smmu_write_cd_entry(master, ssid, cdptr, target);
>>+}
>>+
>>  void arm_smmu_make_s1_cd(struct arm_smmu_cd *target,
>>  			 struct arm_smmu_master *master,
>>  			 struct arm_smmu_domain *smmu_domain)
>>@@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>>  		struct arm_smmu_cd target_cd;
>>  		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
>>-		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>-					&target_cd);
>>+		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>+					  &target_cd);
>
>No, we cannot blindly do this for arbitrary ->attach_dev calls - the 
>majority of S1->S1 transitions are going to be moving back and forth 
>between the default domain and user domains, where there is zero 
>expectation, let alone guarantee, that the translations would be 
>equivalent and thus not liable to lead to TLB conflict aborts or 
>amalgamation hell.
>
>This needs to be in a dedicated "I know what I'm doing and I fully 
>accept the consequences if I get it wrong" call path.

Agreed.

I will update this to only be triggered with explicit request from the
Core to satisfy my live update use case where a preserved iommu domain
is being replaced by a new domain setup by the user.

Thanks,
Sami
>
>Thanks,
>Robin.
>
>>  		arm_smmu_make_cdtable_ste(&target, master, state.ats_enabled,
>>  					  STRTAB_STE_1_S1DSS_SSID0);
>>  		arm_smmu_install_ste_for_dev(master, &target);
>

