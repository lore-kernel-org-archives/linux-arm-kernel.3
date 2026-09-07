Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DB3C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpQaMoBy+ANddHal2PnUV9pNK1krtVdl6eHRQ/UORPQ=; b=T4RKH1SJgqwKeLooth2Wq4Xd/6
	ScqGkOUOkBS/x313N2Z5GwEkGXZ/zEL86Fq6jUl7LuaRIYHKmq23x02AMRL3FM0S3jT6eGa404y0k
	wg+5d3zBFwNn0HfYe2B3jbtKPHj3gFlPScGDxFa/6+QDQ5iILfr7435+WZyu1gKx3PQqPNEAUEgWZ
	cskTw5GhOm4ydADIYO/zuUlAzyVKv+rQ2naO4gt9/j5NHzRrNj6ey56BkOWKN4jp8TYzfuyvS/l2U
	Ze6jqHrn1Iwx36Yc49pdExq9cQeGom1eTCrF/f/2miZ/UtJCzRJpetIWoGzhyE33MeGV36AV57JpG
	Y3Wo7lAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b5u-000000077zo-3Dc1;
	Mon, 07 Sep 2026 15:17:14 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b5r-000000077z7-43lo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:17:13 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so13645a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788794230; x=1789399030; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rpQaMoBy+ANddHal2PnUV9pNK1krtVdl6eHRQ/UORPQ=;
        b=dxT5ITC5DNn4nnt1NfwBrXw9Q+J2gzTr2hAjVJLRB3Am16AiBuqIw0QAUiFM6c5SNP
         uh2huW2yOXhx2ygo5AflDAO1o/ZntOBv76sPd4zTZqtDvYWHf26ukHtYk9rUPVw5zHNv
         GyhPpkxb45dV58V9TaWYu9kxtPqu7qeMEs4PJv7nAMQiuk/cG3lp8ZNSHRnEYX97vHh8
         vLgZJ93kzwrnGmOf95nJTCB5zUVjbsuhSqbLVnyzQ74uUeDdioGd+SC9XUC2k8y5hNBT
         d73/R1ILimsF6Edn31JnEhz15ByGutGgg4Llw28cy/7bnQizuEqKfGBlbD4UDXHLw8ee
         Ij+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794230; x=1789399030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpQaMoBy+ANddHal2PnUV9pNK1krtVdl6eHRQ/UORPQ=;
        b=FmB4MmaN6lfO1HkjNDJZ5LPpVg2MUo+BK6cPj0eO6Nw8qqHjmxTF23XdkJjmDekoz7
         aabojy3qMcqKMsVr6zoekta5qq7Vke9wYDv7/zpVu0+jx1XfKiXT9mk8BnwVFj9PaKkI
         S7HsBrjceV0Zc9zOrn2jFbVx3Cg3khAtCpnqZh0i6q/1v9nvMyDzMbU2GKgmVTNM0FaW
         g+jvCdhJwf+iRXI/IBDTI8/IaKxto1o/Wpljp9R3dLZjS2esJLwZXwtGEY25sAt8Rg3n
         TGe/99SUxIeEprtHDDhVdp1JSglWOTqHcE9Nv7lHU6Eq7ixKULlIS2G0jpn/gwGl5m72
         eQmg==
X-Forwarded-Encrypted: i=1; AKwUvByR8xxCJI+irmwgc+ciXXIjPkG+yPKI0n6FBxssQFMYn142iG/eDMygpdo/l4m0EBydNr6J+8I+y7TOxejHTeeZ@lists.infradead.org
X-Gm-Message-State: AFuF++kjmf69PjnqCoMXn6/hudaSs0GyOgburmDx7gG1y+0xe/zMR729
	+105fOCtDUfrqLyLEnqlcNPX7N+AbIbXrGtt7HUgo983lXQ0YdIhDw8ru15YhT2Q0g==
X-Gm-Gg: AYBFou1NarJcJkV7QHpSu5nAjsAnUDFsqq7vL425xRyRE0tdLF209EAeAtYbhD7Ct57
	FQlJW3nhtqJ5KmcZVRVGsAP16WqbOJOtkXx2mBD0UmbKx0jA2dDexYc6IYMYMnyuvgureFFdlEs
	LBBliYSmnqlx+Aw77h9bFy9/ESnlz9Po/x0mT4nCezLDKLSnDRvYvQu4t/x3ymHMSatdZudmq9z
	xC1tLJT4E9k42VG5l9SStFu8sRclS5avgh0A03mTDV+g89PQdQbmlKucvf3y+IWHSgrZWr7fkmY
	+IC7FbvTV3mJWyuCqnioEVNt0GD+yyi4eX1mKIkdZ/BpVr/EHAW7AiCirJ5U/cnwKe37Dr/lr+3
	YkPcoGuvHWhL6+LU5zFhKxvY8ifDimZEanphYuh1CHKMxWvSCzOEgpdDrRBmF+HUPv+tcEpxew0
	h2O/LDhkvB5AdGj5YwxRrl3a7PQPxUp2KQdWc//ImO9V1yoD56td8KOv1lqSFdHf0Dth4yXDP9U
	zOvkMv6YE/13RbbVD2IhlwHrOwVWw==
X-Received: by 2002:a05:6402:a288:20b0:6a0:a317:9c47 with SMTP id 4fb4d7f45d1cf-6a7f6887515mr62121a12.3.1788794229526;
        Mon, 07 Sep 2026 08:17:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b29f3sm482498766b.52.2026.09.07.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:17:08 -0700 (PDT)
Date: Mon, 7 Sep 2026 15:17:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT
 under invalidation with SVA
Message-ID: <ap7VcBXG0NyX6acW@google.com>
References: <0-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <1-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <ap7IeAfVPZL3Hqt_@google.com>
 <20260907151145.GY4157646@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907151145.GY4157646@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081712_051884_CDDD9807 
X-CRM114-Status: GOOD (  16.92  )
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

On Mon, Sep 07, 2026 at 12:11:45PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 07, 2026 at 02:21:44PM +0000, Mostafa Saleh wrote:
> > > +static bool arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
> > > +					struct arm_smmu_cmdq_batch *cmds,
> > > +					struct arm_smmu_cmd *cmd,
> > > +					unsigned long iova, size_t size,
> > > +					u8 tgsz_lg2)
> > > +{
> > > +	u64 cur_tg = iova >> tgsz_lg2;
> > 
> > Nit: tg suffix is a bit confusing, I guess pfn is more accurate, but
> > no strong opinion.
> 
> I don't want to use pfn in any of this code because convention has PFN
> as PAGE_SIZE, while this is a "translation granule", ie the base
> granule size of the iommu domain. Which are not always the same thing..

But this is an address not a granule size, not sure what that could
be called then :)

Thanks,
Mostafa


> 
> Jason

