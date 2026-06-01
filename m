Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA1CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyBD7qMw7VjTmJIE91aXLdMK1dsXEgSx9AIVT38E86I=; b=PCVcF+2f7YFsGpfTES3UusgVXR
	VgWP/NbdIMhcKy4S7b+3yXFU81r+nj4RJlNffw9ugT42vxNFdDwDzetwidfZOFPnZeySc3zuxNFp7
	bEq9jE4DsNKTQsgukD0mjpc/0DdyAzhQfdGru0sz3wsvym8Y3feII94TK+Eq7wvKOsIkQRwJqzO67
	/sBmgD3QCEeJ+AM1IYRAbQryyO7n3R0aolMEdrCnddZsH923BMA7HDUyOo3xr07s2xp6WCp54Crk8
	xPnV0sQxfLs2Q+R7TqjldgCLJBRQCsTuguV742QXzxa1EhjAbXZSX2JeP7Py8imOwip/SR1307YMH
	OsMDYOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0bL-0000000AiDn-025h;
	Mon, 01 Jun 2026 11:14:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0bI-0000000AiDK-0SDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:14:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5921C1E7D;
	Mon,  1 Jun 2026 04:14:25 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9ADD3F632;
	Mon,  1 Jun 2026 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780312470; bh=MJEmhjOmdUj3v3YoxPjxOovy5nrKF3eormxGdl+E/Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZYygagVVpaHZP1QTAw4ZTR76Kg+S8BF/9T8dYGv5ddpFsKYXV84i0eiG1ifAQIxy
	 vR1N6llyGApuNLVLKNxwl7ocwv6NjRGYdUSVaxKErK7e3ISEhLnYSSvZtZYIF9TR/4
	 E12p4XVIHf5qmWOyjV8TbJJcxC0p37ytkZK3Py68=
Date: Mon, 1 Jun 2026 12:14:26 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 03/13] coresight: etm4x: introduce
 ETM_MAX_SEQ_TRANSITIONS
Message-ID: <ah1pkoQG1oa2Ow2X@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-4-yeoreum.yun@arm.com>
 <3144c7fb-b41d-4bca-a6a0-eeb9dfddc8b8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3144c7fb-b41d-4bca-a6a0-eeb9dfddc8b8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_041432_184056_D0942F1E 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, Jun 01, 2026 at 10:53:38AM +0100, Suzuki K Poulose wrote:
> On 19/05/2026 16:48, Yeoreum Yun wrote:
> > According to IHI006H Embedded Trace Macrocell Architecture
> > Specification [0], n could be 0-2 for TCRSEQEVR<n> when
> > TCRIDR5.NUMSEQSTATE is 0b100.
> > 
> > Therefore, introduce ETM_MAX_SEQ_TRANSITIONS macro and apply this
> > in TCRSEQEVR<n> relevant fields.
> > 
> > Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> > Suggestedby: Leo Yan <leo.yan@arm.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-cfg.c | 2 +-
> >   drivers/hwtracing/coresight/coresight-etm4x.h     | 5 +++--
> >   2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index c302072b293a..e1a59b434505 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -76,7 +76,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> >   	} else if ((offset & GENMASK(11, 4)) == TRCSEQEVRn(0)) {
> >   		/* sequencer state control registers */
> >   		idx = (offset & GENMASK(3, 0)) / 4;
> > -		if (idx < ETM_MAX_SEQ_STATES) {
> > +		if (idx < ETM_MAX_SEQ_TRANSITIONS) {
> >   			reg_csdev->driver_regval = &drvcfg->seq_ctrl[idx];
> >   			err = 0;
> >   		}
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> > index 89d81ce4e04e..60e08ab085c5 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -614,6 +614,7 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
> >   #define ETM_MAX_NR_PE			8
> >   #define ETMv4_MAX_CNTR			4
> >   #define ETM_MAX_SEQ_STATES		4
> > +#define ETM_MAX_SEQ_TRANSITIONS		(ETM_MAX_SEQ_STATES - 1)
> 
> Similar to the other comment on the patch, please don't tie this to
> SEQ_STATES. Simpl define.
> 
> #define ETM_MAX_SEQ_CTRLS		3

Okay. I'll untie them. Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun

