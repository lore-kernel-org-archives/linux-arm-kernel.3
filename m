Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2672CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diaMMomGVSeMyl9b0SDQ+0jS5CqmoXFRYMyDr82RfPg=; b=AiR1DrmPJ2mvhq9t+uDbedkhZf
	7pszuoGbtAd4dSTuHQr3srVnjzR6SETi/gKwg/mxxcsd2waNIPXnKqB72z+GvSCZ3DPxkxaUeglOi
	tNu1+GCtK7jECOi4jcTEe/OdNt87wSGCgesWnipU6IYysFJBuXAi3+APtM3M2gJXEyzCsb4hC5bS2
	6MKpdpGeaW5gFTomhM4wxAyqndbT9S9eSRVkS5RRhBmGwOhDD5IJgTT6TfEev0GvRvu0nDxU4hxqs
	7TgCgp+Ak+CHrMstepV9vyCy71FtA2siNV585LgsrbX1xLdTj/pI7xXy8bS/MxxjFg/jADke5AsO3
	Xmo3sfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHUF-00000005aPL-0zlq;
	Mon, 16 Jun 2025 21:35:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHRi-00000005a2g-0ZHf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:32:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2357c61cda7so18545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750109569; x=1750714369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=diaMMomGVSeMyl9b0SDQ+0jS5CqmoXFRYMyDr82RfPg=;
        b=cIes3AmkQTdAVjNGVFbdCSsvBx9mlDxCaF+DWRTis70NBuL9XrNXkSOqvivHkoX699
         AFAjMIZ2reYUdYMxA7S98kFs05O278QfI01w9MQCIM10kVl51CAwe/9zEc1RxqQeNrGX
         klds13NumJ2QqMLprKkAwkdHH6RNuimilLHEPI4fe0CzT0yUcvoT4QhkHjs2J8qL1TzF
         XQCP7YZcVyPb/TyYsd8kWhprB1KbGzk92JChfe2plPKQ47wehtH+5kHQMk09D3KQ/aBE
         JlNXotftFPS4bnPoGHJvERtlHXQjb1V21YqGYl9vbBuDIAZM0+t/e9Qvw/GkBcGocvo+
         8ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109569; x=1750714369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diaMMomGVSeMyl9b0SDQ+0jS5CqmoXFRYMyDr82RfPg=;
        b=A9mK6UyRQwMRM8J+5JbKrXmlLnHJfRPeZqtgVYKA5HwEu9Y6xQG4TcQSvO4wx+C7O4
         N2eTmdHKXV/hjTiWNCoS0sLth7JPQ3ZqPW+cRs0JuoWq4m2YJMvM9YUI279+f1Sl39Jr
         r440q8N/nozO4dHIPldxKDHhYQGRHu4xHpRwF+Zyxo58h7bQUCrdz9jZORrVlKTOfslM
         RqRO3n75e01KaBQkH3ZlcKNnwATS8p/IAbIJpaPA4BXgXBbDZMNpggZV5N3JYXndy9v1
         KgDpzS20pDphv2AMM7tAbsy6z6N3gl99FaJtfQRnS5klnM4yel8W6Zb8O7YZZS4ejUsW
         AOpA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/WE2VMSoNSNGL2eWBsWj5PxmCeyo3Wnq0BasxJmEUsIvKevu18H+MN6QOLEn6ZfH/QxJPzHdGvFDo5vQbOWT@lists.infradead.org
X-Gm-Message-State: AOJu0YxFSdXE1Jhkx6z2fxsM2k3eI51UnrJN755KjcnHUa9xmlOQ67Dp
	kla9HScW+SktoVwSF5XKr8zQn95LiZk8CkBG1sXv97uM8LIv1XSo8p/A5Ic8h1nnnQ==
X-Gm-Gg: ASbGncsEusmuN4VSGxnLqS9mW5U5SIIIRuc/bAGrKCN5kMLvKJDTs6hHVilehu6R7yb
	FwxyIeFvbE9OYr7+SDLh/yLEViuKeelx/rBshocbFjwy78FWGNwXROexEwccdqDQVjZ//PL4Q6v
	mC0RuricO4PshD7rxEMQ8sbowT0skwe8BSx4niTQ8o8Sm2rFh/B7cj/px6VDsptAZA5u3BaN/zV
	9360gzBuluspTlSrv0bzsnLkORpPtBfAF+6sZG7AbUTO+m44qA7FI6htpWkBMfWxXQT4scYVYOn
	a00aBWDrEl3i9X0WtFQ+HfcBpqgZ5YlGsYXk5eALjYVqFBWFG1cR46eekw8HxOxm6YkK0cFWHY1
	o12m55GoISS3tR2/aH1ns
X-Google-Smtp-Source: AGHT+IFWcQvoP+9fcVVp+c/nzrucrkTOoV642VxsR9D43oNtEPpmRjh6B8M7BM1aG3k8myNk+wmbkw==
X-Received: by 2002:a17:902:e74f:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-2366c4f491bmr6716645ad.0.1750109569076;
        Mon, 16 Jun 2025 14:32:49 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31886377a6sm5271665a12.71.2025.06.16.14.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:32:48 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:32:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 5/8] iommu/arm-smmu-v3: Add IRQ handle for smmu impl
Message-ID: <aFCNeOP7oRv7NRjQ@google.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-6-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-6-xueqi.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_143250_193878_7905074F 
X-CRM114-Status: GOOD (  20.66  )
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

On Mon, Jun 16, 2025 at 10:56:11AM +0800, Xueqi Zhang wrote:
> Add IRQ handle for smmu impl
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 9 ++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 8 ++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d36124a6bb54..154417b380fa 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1954,7 +1954,8 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  			arm_smmu_decode_event(smmu, evt, &event);
>  			if (arm_smmu_handle_event(smmu, evt, &event))
>  				arm_smmu_dump_event(smmu, evt, &event, &rs);
> -
> +			if (smmu->impl && smmu->impl->smmu_evt_handler)
> +				smmu->impl->smmu_evt_handler(irq, smmu, evt, &rs);
>  			put_device(event.dev);
>  			cond_resched();
>  		}
> @@ -2091,7 +2092,13 @@ static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> +	struct arm_smmu_device *smmu = dev;
> +
>  	arm_smmu_gerror_handler(irq, dev);
> +
> +	if (smmu->impl && smmu->impl->combined_irq_handle)
> +		smmu->impl->combined_irq_handle(irq, smmu);
> +
>  	return IRQ_WAKE_THREAD;
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 99eeb6143c49..f45c4bf84bc1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -792,6 +792,7 @@ struct arm_smmu_device {
>  
>  	struct rb_root			streams;
>  	struct mutex			streams_mutex;
> +	const struct arm_smmu_v3_impl	*impl;
>  };
>  
>  struct arm_smmu_stream {
> @@ -998,6 +999,13 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
>  				bool sync);
>  
> +/* Implementation details */
> +struct arm_smmu_v3_impl {
> +	int (*combined_irq_handle)(int irq, struct arm_smmu_device *smmu_dev);
> +	int (*smmu_evt_handler)(int irq, struct arm_smmu_device *smmu_dev,
> +				u64 *evt, struct ratelimit_state *rs);
> +};

Let's add these to the exisiting struct arm_smmu_impl_ops and invoke
them like:

	if (smmu->impl && smmu->impl_ops->combined_irq_handle)
		smmu->impl_ops->combined_irq_handle(irq, smmu);

Or maybe we could merge the existing impl_dev and impl_ops into a single
structure.

> +
>  struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
>  #if IS_ENABLED(CONFIG_ARM_SMMU_V3_MEDIATEK)
>  struct arm_smmu_device *arm_smmu_v3_impl_mtk_init(struct arm_smmu_device *smmu);
> -- 
> 2.46.0
> 
> 

