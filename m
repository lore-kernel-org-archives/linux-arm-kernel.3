Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B271AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4d+8ZjXH9zZ77lKYUp6/tF7Z8I85twtKvurv24F7nU=; b=m9HudtpRXKf4tdQt6Z4l3VwVmj
	r6+ngrQL6tiDcChIXKFcmip4uwEfrDLMS+4wKPdhqK9/36QktgaMgsupUNGF9y0nwRFOax4apZhBR
	Yvpm+eCiih19HI221Aifh37Qrk2JLeFCe+CjbanwpdPPO8t3hD8NOVLbO45ZMMaUtGoHOhtj8qJFh
	5dnAKPi6GA8hIU7hmzu4H/Q7l9CRrTbZou+ywI+GJN/3mgcDT9r2kGrdGdQNeWvB0wX3jyTqtfw0d
	iV+O0X64GYPEb9iajxMTgTGe2LlB0wrsMO7r4mKVXDpwlTMNLDCuGW9UKASBa+jIvZO27WJOPuTwy
	FHUoVugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIeB-00000005kTi-0Dto;
	Mon, 16 Jun 2025 22:49:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIan-00000005jgK-2exo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:46:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235ca5eba8cso64895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750113977; x=1750718777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4d+8ZjXH9zZ77lKYUp6/tF7Z8I85twtKvurv24F7nU=;
        b=E49lpNws3tKO5fW0dst5g4HP+9X7WJD4dxaDC7O1p3v2jmUf53K8kHKJZ7M5dZPGC4
         SI0ID/VRykJDd0/bxjJqd5Yx5PYMumkr+mEZ2ilthkM2JOIgaSt+UC/HYnBR/6ZVzr4e
         GojwPA2JAuLb8CSytySv67EMpybKf6GMbPefRBC67L1SQb9tNHu4Qgvt7CQj6YPibrTm
         l9bslkjj1+shgIkcJRbj5YPEYas/O6qbpIViQTAa5bwsagUQ9DZZwHz5BI7IoIegC1u9
         gbNBlAerO1/3vNO3Y24JLh5DqCIMTGSwkx/A2BaBTOQO7BuQoHGmBNXbgWfWOvieA8wd
         FqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113977; x=1750718777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4d+8ZjXH9zZ77lKYUp6/tF7Z8I85twtKvurv24F7nU=;
        b=K2fv1CN19GwWJw7kmOHZOGYK7/g7mwMCbQejekWEgopWdGtTX9hYWyuIb8SlrefxO4
         KtcjkWFnt2qU2NmSYlYi+vcWvuMvmjTmDVdymFjCAYCeSorP2kGEWwNObQEbiJD//26a
         K2cZmdR8bI6RUyaFxePDi7SltnvnyLScBKlEnzLhVD8dYCccG/RDQasxs3qCI01aA4op
         8ffmfvy5ZMFvaSOzZU41nFOh3xyVVNTPlzj2QzXz8r/G1HlNqfbHaCMCis59uUHADQO0
         0kv0YxQekycdksIsyLunxU77W9yg7V+XM/mGjT/mCA7mmvYW1CFFeIr648VboZmettrt
         376Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/PbdqWT/bTjCdaDNktRT4/LEEJYyNSa7I9xeuaIfTaw/dQG9jCi+dmCMuS2noQ951qh2l7aohzzBR1ZcrnsqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwJjH70pEyflvdlfMkVFRvc9ThCi+u9SnmtfGNnJ2xAzMxZ0MZZ
	n1LyXRm+8SffJXLkwX6WJEMNhPPsjQ7S4ngsBwOtXbxcVZPc3I3tB3isaXGh31WlcQ==
X-Gm-Gg: ASbGncsJdsYPZfvVRLuqF2qJHSgr6aEIsQQLv5H9Gs+hJj2+K9BDCeZa98M7AaGSu0K
	APhlHpY93TJ5MT1oxFYFNiC3pDoRHw5msHQnOUsGqJm9Qp9R9x4BT7zKs7HtQf7SCHe0ubSO/Pr
	yGB73sHzauRnlWIBRHoQ3IegBB5MUI9aPBwsYtjfkY57ijeSr/1b8xPH0oulbVAki+uJBuyetUH
	SUkzg+OVkG5BNUhmZN5KKnktOlGo6qSRpXWMQk2HBC0pSqlBw3bknLa4ExTAtX5CWn9HBgc8KHY
	+qIhFzFMykA8HeRigjSU7s/9JyyVl6DBKu5KDuUS3ujYzVDaxjjaK446xWFxhZc7mvE9Jle/DBz
	UPjxPb7PopyLLb8u/WUCE
X-Google-Smtp-Source: AGHT+IHbp2l3BN8cw3PKIKwKBRH+mwq9oeWC2v6BaROwnYe7V6Peft6fYvtgkHe+hYIr4hoxzIvQpg==
X-Received: by 2002:a17:903:b45:b0:234:b2bf:e67f with SMTP id d9443c01a7336-2366eef0269mr5944675ad.9.1750113976583;
        Mon, 16 Jun 2025 15:46:16 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082a7esm7656250b3a.100.2025.06.16.15.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:46:16 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:46:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 11/14] iommu: Deprecate viommu_alloc op
Message-ID: <aFCerw6zMXkyYKax@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <5b32d4499d7ed02a63e57a293c11b642d226ef8d.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b32d4499d7ed02a63e57a293c11b642d226ef8d.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_154617_680713_53626754 
X-CRM114-Status: GOOD (  12.68  )
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

On Fri, Jun 13, 2025 at 11:35:23PM -0700, Nicolin Chen wrote:
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced. Now, those existing vIOMMU supported drivers implemented
> these two ops, replacing the viommu_alloc one. So, there is no use of it.
> 
> Remove it from the headers and the viommu core.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h          | 11 -----------
>  include/linux/iommufd.h        | 18 ------------------
>  drivers/iommu/iommufd/viommu.c | 20 +++++---------------
>  3 files changed, 5 insertions(+), 44 deletions(-)
> 

Much cleaner now IMO.
Reviewed-by: Pranjal Shrivastava <praan@google.com>

