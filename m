Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5AC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E8U0Fzzl;
	dkim=pass (1024-bit key, unprotected) header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=DtHcf7sI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5tMMGpxtoQZxq0cbe4boMn3nqRQBhfDysNVoo7AMAY8=; b=E8U0FzzlcE54v0cP6zie0ttzAf
	E0goWvzJCwfKDU10PreEp3sH/Q5lRfT93McoDE6AZm32yAEWTD7BKJ7hzxfOK+C0DsLPUZ9PaNnKf
	+2GwU5TFfyvUXFXsVn3phM1IcV2FTydM4aMm1sGsBNhpqsGGO4TKFbKFJxAk9s5VSi/sI8yqJM9gM
	rolJTz0s7NjTfDmHsbAGD15oPI3BXzOTPcyqZhJiM+dmKc3PK/7Lf8j0TmNGsq27wBh2r4TLFf28J
	IE0Jn9j02WDGQZxbA6PszrrKIchCpTkoOdb3/6TnZHtfi7B7czLy8Y4ISsNf7BGCcSX5ydig3m7G/
	7MWUle7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKsw-00000002cRI-1OF6;
	Mon, 26 Oct 2026 13:37:10 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKsm-00000002cOh-1SrS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:37:03 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-170135e43c7so3001114c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1793021817; x=1793626617; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5tMMGpxtoQZxq0cbe4boMn3nqRQBhfDysNVoo7AMAY8=;
        b=DtHcf7sIaJGm4q44aQsqBx6b0Z1uOFfe/8LT6dZyqOthupLTaXReTzVI5klN2p4Ebq
         Dvsdh0tUtPy5E/SQoe1sXwmRmOl1b9DmlQ8X8XLEDKD5+l3glP++Umx2mxill19Y20fP
         NgxNI4/Y2r0JWEXoClGrcyUzoVdcpABykfdBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021817; x=1793626617;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5tMMGpxtoQZxq0cbe4boMn3nqRQBhfDysNVoo7AMAY8=;
        b=iQ4+ctVovqWbOY9VOuFPH2DRa7Z7N48Gr1MzVcLs1y30DXYDLydeMmwTDrjHXPkIsT
         68ctVrHJVm/d9ZvgLCzJh4ssI+BXxdTLIjMEfWUIRB1YxRSV3EunfH3LuTj2j3/iwVtK
         Ac9nypjSfDteaJtB37CWuz8gTDJLyH0P/6g6f0IKZlz+hblt8/P0WqVcc2zcfZ5sRW1P
         cMafK1cIQo9wzmgpSnV8c4XMFi0y7ukjONz2fDw5UVlhlfM7FCKZYtRqdNY+MKlVssg9
         N3h+D2MHMGbWI260i1r50iKNVqopGDou4mZQXwkYm4tVNeSvfkPxI+P4LTNjlRzG1IkG
         P+9Q==
X-Gm-Message-State: AFq9FYLxORPOsqznpdg4fGT6rkzYRnwRXR/ZHhhkqWCIrezend8qCkeQ
	bpxQXr80ApGhgHS9MT9lPH/B+xrqDxH1uii3TglVCELr+d2jouEiW7R7o0O7P03eAmc=
X-Gm-Gg: AYBFou3r/n3V6SxNGhwyRxZYoIGoN/cjdrGKRIKA8He+TYb42LReOY3EFgHjTPDe/Op
	9ItGm6jPyepGOA8bzp93JJDafTBSyTZOdy7USUTc1IMwxG7h89sbnzfBYg+kbGZ/Lhcc0OwLdzG
	jaBPwZ2WZWnVKMaQGRXcwoCVPig9nT1hUTWTY7cSlromV0PcAGroiIqnRBXcrMmZF1c8A3Tcdyn
	SqXNCL+3s9aEEAHD+sbSbiKd/Yk7+AjW19TmqbTk477M6Q4LPaWMe2PSOBU9044YgyEkgEo32EL
	fnQAJW/IgTF2HLBNo3ITHPXi5gXDgmIbyzL+ye2zJ5GA3zQpuXQToJNrbQjLpAQA3Cx28fGx/9Z
	ME8zlP3bNHa4wMvYhrpQhT1UPY/JgoMQT5X3Jqps9PMAbbIHomzhnm0hFLLfwsCy4td73YHMmwh
	vKcpNDJ0ECEDvhCHBSCIn01UoTXBOWFICTwIQkvtdxEpeQFbtDsKa72PR3D4bCrtpmSjiutfXiJ
	F4qEvSrbT2gt5ymCPKyPgZpCKKdPPEXGTEVSufoXNexbUSQ5Q==
X-Received: by 2002:a05:7022:48:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-199375eb24amr13097855c88.19.1793021816370;
        Mon, 26 Oct 2026 06:36:56 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm22432520c88.8.2026.10.26.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:36:55 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Subject: [PATCH 0/2] iommu/io-pgtable-arm: fix missed dirty pages in
 read_and_clear_dirty()
Date: Mon, 26 Oct 2026 13:36:42 +0000
Message-Id: <20261026-iommu-arm-fix-missing-dirty-pages-v1-0-115b6b1cc0f5@snu.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpX32oC/x2NQQ6CQBAEv0Lm7CQsCqhfMR4WGdY+7EJm0GgIf
 3fioQ6VVLo3MlGI0bXaSOUNw1xcwqGixzOWJIzRnZq66YLDmHN+cdTMEz6cYYaSeISuX15iEuN
 j355iP4TzEC7kO4uKp/+P233ff+UKJCBzAAAA
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Seongjun Hong <hsj0512@snu.ac.kr>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_063700_749946_3D21BF82 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix missed dirty pages report in read_and_clear_dirty(), which is
caused by 1) unaligned iova walk address, and 2) missing iotlb invalidation.

First, align down the iova walk address with page size, noticing that
small dirty pages following large page block (e.g., 2M) because requested
iova start address can be in the middle of the page block.

Second, use io_pgtable_tlb_add_page() on visiting dirty ptes instead of
iommu_iotlb_gather_add_range(), which is called in iommu_dirty_bitmap_record()
and does not update gather->pgsize, so that arm_smmu_iotlb_sync() does not
invalidate the cleared pte from the iotlb.

Thanks,
Seongjun

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
Seongjun Hong (2):
      iommu/io-pgtable-arm: align next walk address to large page size
      iommu/io-pgtable-arm: invalidate iotlb on dirty pte read_and_clear

 drivers/iommu/io-pgtable-arm.c | 15 ++++++++++++---
 include/linux/iommu.h          | 17 -----------------
 2 files changed, 12 insertions(+), 20 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261026-iommu-arm-fix-missing-dirty-pages-3754a7b18b19

Best regards,
-- 
Seongjun Hong


