Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E8FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXqkopj6Oh5WtyGQaum1YKVEZGGYYtaMkCtOohru3Bs=; b=zm1qyYq/dkmQ4qMPeQH4RdF9qq
	FGWC4xa7uvxgsTSyy+J8ucmHzAwFYb3dKS7pPXZQol5LnhWdGLxBLDJOhNGwWMoKmqAi0J4gRKJwK
	NNb8uC3/+vhYcTsdAwD0frFHIiVC9rNj9CxeSqJMWqS+v+bvXcoj+VwL0wsaMvsub3VxsBRxK6OKx
	ntcClU1itkcakZKvf7qIW+IhkzDf6aD395xB+9hPGtp2YMXES6J8BmCrd50K0qm92qxW4s3xLQxEx
	tRyrHFA41o5/280QThcdc+90wRfooYlLDZ8CWOwefqC6kyGMXnQWHvrWfQDbkv0Pn5YQB6wY0tjGj
	A98LUTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfM-0000000BtJL-1iss;
	Mon, 01 Jun 2026 21:59:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAfK-0000000BtGJ-19zR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:59:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36d99333358so1689805a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 14:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780351160; x=1780955960; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXqkopj6Oh5WtyGQaum1YKVEZGGYYtaMkCtOohru3Bs=;
        b=aCS4rDs64IfFst+9gXygvJp6i1kHfF6ugo7gXhRIb1M5AZ87aggXibxIQK2Ist3MHd
         YvPOWTNKFlR/UC/RLgzcdzsUbIYYNBuzy6P/Wlxus+XilrGf7bJcROeMsmt8CSbJI5g6
         +ozhnkeU9nazLj5ej0SJytl+ElM58hSSsfitWfM32FbTCHBD15jiPkVO8uqwLaXjIFBL
         pj7zDntQHWQFbpebRE9OHPcuBICLjUkOwLse6ceh6EVIX+d3Vgd9zcj9Kwj++N/uekWB
         9hoZhwWeck8Vrlz3RzIZx6KxGXLVHiqKNQpfaGNa9JfBGzEkcD5THnnQNMhKwXdDEMhX
         TOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351160; x=1780955960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXqkopj6Oh5WtyGQaum1YKVEZGGYYtaMkCtOohru3Bs=;
        b=L3GnrH7daLTkWV+ImOfYqlezWLL01/ksOiYEhiKeYabR5XubK/l7MVtaJMiaBFcD79
         xijG1Et6zvR+s8H/bDO/RspFrEn+OFeE5F8qU5HSUJI5MR4yPL0xHR4px0eLP4giR9HM
         UCgPfy6zBhLpRJG6+LRRSPbGGS80ONME8D1NSz5J7rkypY3MuHfbyOwqZ9gTIakzwTBa
         3Af1SNm5Y4w8jn3JnokKiUVsoGUCGm4freXVQ5dWh3e9JO+cA3ZEopUtBWk3oqPtyzgS
         ccFrNuOguMDL/88bsN4sdR6EHv/yCrYhIUnGBkheQkFENSVTyjx+uwfNSgPpw5d9nvN5
         oA4g==
X-Forwarded-Encrypted: i=1; AFNElJ/RkCF77yAgwjPhbRlfbRkX9arn5HP6Rtlql6jqZ2Zi3mIyZBznxTtzf2uaNu1iStyUTW8HXqdxGe6El+FBMFRd@lists.infradead.org
X-Gm-Message-State: AOJu0YwLKHnyE9QDidElDUThjhc1O81w2Oe0q7Alnla5yznHokL8j8lI
	YvFD17UNBgh5l2TvVE82ivTVRiPOaNI27naVz26c/GwTnzf6IJiimJUSm5BJSQOlglLxIzUSjhc
	0EA==
X-Received: from pgbct3.prod.google.com ([2002:a05:6a02:2103:b0:c73:fc44:8baf])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264e:b0:369:7433:2fe
 with SMTP id 98e67ed59e1d1-36c4ff25853mr12026633a91.6.1780351160239; Mon, 01
 Jun 2026 14:59:20 -0700 (PDT)
Date: Mon,  1 Jun 2026 21:59:01 +0000
In-Reply-To: <20260601215909.3958732-1-praan@google.com>
Mime-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260601215909.3958732-5-praan@google.com>
Subject: [PATCH v8 04/12] iommu/tegra241-cmdqv: Restore PROD and CONS after resume
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_145922_339852_0E523660 
X-CRM114-Status: GOOD (  10.52  )
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

From: Ashish Mhetre <amhetre@nvidia.com>

PROD and CONS indices for vcmdqs are getting set to 0 after resume.
Because of this the vcmdq is not consuming commands after resume.
Fix this by restoring PROD and CONS indices after resume from
saved pointers.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index cb1e75e4ee91..866cae7b73e5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -511,6 +511,8 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
+	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
 
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
 	if (ret) {
-- 
2.54.0.1013.g208068f2d8-goog


