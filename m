Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C6D1F9B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHAU3C/3Zd3gbOdr7jKTK74vhnb5I94WtpqgIHjL3N8=; b=U2+qxxn9bHXfKsY/cgUac5JOWk
	0pTbWbfZV+QOD0d2T4UBtu+atgA6bbRULym1L/Ofb4xr09XCsieNH51PFeBNDa9V/XD8GVT+1rHGo
	/FrBM1fZNCzhg5QAQ2FtM5b6+wEeoUEljpBPBhet873gkg5FsILGkd9Y0f03J1hI+5xjLD6v/hOP6
	AoR0dyMYm0BMyL60i5tGF5RXSQvQKOyanUA4zKB8Y4LYcC1/M114JjHlNoJJy0RLQbfyv9yNLjRE0
	ieF29Gwuhm+qGBZ6WxH+UZvji6gYegYd7uEc17EGQ1tAqIEJjTJsJ+laDq36MkAb4LD+g/T2Co1s3
	hhGbpm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6ro-00000007ra4-2WLb;
	Thu, 04 Dec 2025 10:47:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6rm-00000007rZW-25BX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:47:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16071339;
	Thu,  4 Dec 2025 02:47:08 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0715E3F73B;
	Thu,  4 Dec 2025 02:47:14 -0800 (PST)
Date: Thu, 4 Dec 2025 10:47:13 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204104713.GL724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhcSxTTaxMR4SS+GbHoPHXm0honykjXy92fbv0HG=1o4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_024718_571964_2149C214 
X-CRM114-Status: GOOD (  19.75  )
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

On Thu, Dec 04, 2025 at 09:15:07AM +0000, Mike Leach wrote:

[...]

> > > +             /*
> > > +              * QCOM CTI does not implement Claimtag functionality as
> > > +              * per CoreSight specification, but its CLAIMSET register
> > > +              * is incorrectly initialized to 0xF. This can mislead
> > > +              * tools or drivers into thinking the component is claimed.
> > > +              *
> > > +              * Reset CLAIMSET to 0 to reflect that no claims are active.
> > > +              */
> > > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> >
> > I am confused for this.  If QCOM CTI does not implement claim tag,
> > then what is the designed register at the offset CORESIGHT_CLAIMSET?
> >
> > Should you bypass all claim tag related operations for QCOM CTI case?
> > (I don't see you touch anything for claim and declaim tags).
> >
> 
> The patch I have created to handle systems without correct claim tag
> operation is a dependency for this patch set. Thus no need for
> override here as the core code will handle this correctly.
> 
> The only issue is ensuring the non-CTI spec implementation will result
> in the correct detection of no claim tags present.

Your patch works only when a module has implemented claim registers.

This leads to two issues: we end up clearing an unknown register in the
CTI driver, and then the coresight core layer assumes it is reading a
claim register even though it is not.

For QCOM CTI, combined with your patch, I would suggest directly
setting csdev->access.claim_tag_impl to false (perhaps using a helper).
This would be much clearer than the "hacking" way.

Thanks,
Leo

