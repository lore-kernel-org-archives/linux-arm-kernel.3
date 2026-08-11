Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C40CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8vdoAfi9mU1oVKKGVCUjlV22guVNgIOu5glKyeocUI=; b=tDW1H5R95aat4EAEOBhDH7X+Y+
	dEJLYOvp/6mRbvaWb7h0DZjXs3MAVAaDqJFUkYRMIbonQAG/BjRWJVMUrt9CNGH1N14GeQwC5WAHY
	Pem8uqPfezLSde2T+G11IU9uV6kYVHVwwo2AwSlYqr7XpQYZN4sMPkgpwhhBh61lWgeYWK5jNkTAw
	et1mIEUdiLm+7kGcylb7azmDystDsp2C80ivgsjt/dj3CvHp6W4maNSGiFD/v7qtS6kCUYKsY7J4U
	aobvUxWz+trolDw27erZIf9Z2eEL8kEgoI3DVSRROu65ixIsbLrRvOsRfWSavxPqseAa+h+u77qsV
	TfrA0fRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpsH-0000000EaDu-0YLR;
	Tue, 11 Aug 2026 17:02:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpsE-0000000EaDT-3qyD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:02:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 287F31516;
	Tue, 11 Aug 2026 10:02:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB6B43F86F;
	Tue, 11 Aug 2026 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786467765; bh=ighsZYu56ze1VtoME88ZTPKrQBrVvRxtVSSr3jDVTkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUM84eTkp76JyCxHDet1JgI+LDkGzPflyyARAXD54Ar8//eKpS2Q97iNgRBnXT9Wa
	 gFCO88wgfmHx/dGTchjzXeDzoTVsUnh/jhTv4DCsKEqotYpfwLDzLelvVHeDgnYYKr
	 LDFLxVdJwYGgPCdAe1zbEoIseDkAwe6PepbMY2JM=
Date: Tue, 11 Aug 2026 18:02:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 10/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <20260811170242.GH15499@e132581.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-11-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725113645.57519-11-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_100246_999777_C9B735B3 
X-CRM114-Status: GOOD (  11.65  )
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

On Sat, Jul 25, 2026 at 12:36:42PM +0100, Yeoreum Yun wrote:
> The purpose of TRCSSCSRn register is to show status of
> the corresponding Single-shot Comparator Control and input supports.

I vaguely remember that we discussed the issue with always clearing
drvdata::ss_status in hw_enable(), which might result in single-shot
does not work properly in a perf session.

This issue is not introduced by this patch, and I think we agreed to
address it later. Could you document it in the commit log so that we
can understand and track the issue later.

> That means writable field's purpose for reset or restore from idle status
> not for configuration.
> 
> Therefore, exclude ss_status from drvdata->config and move it to drvdata.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

With above amending:

Reviewed-by: Leo Yan <leo.yan@arm.com>

