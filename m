Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E21DC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oYtNeZbURazsEWoAsLhV7PiZJZgDZvCKmLqKzc6Ijg=; b=4oCmOMbj8mT14RJTuuF38C/Zbw
	L1aWFDbWkTNgTdXDsZGby1fx370cs4SERY0iYbgjtT7QMB5U/Qyo7i8VPIjuOiRj2wqqVq9ruLXKc
	FHg9ikpCkk/FjD+3ZypV6PczUnLqy66HLGz8McrnBpR30sXpafwPklrvUk6NxXsx2OOtxK/PiUfun
	O0uWfssuXulQ88dN1hD49Kextm+fw9+qerXufqbNGU4TySVFaROmo83p/i1vPDHcdnzeO+fU6CfdI
	zmL76f4AYhXRiFnb7zXCuYbbwO0qN0TUNabBovM6VmC5bOqtLPWwL7Ltdag13v6jLZq9fv1BbQsC2
	kmte0iRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ec6-0000000AP25-1bFu;
	Thu, 24 Sep 2026 08:15:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ec2-0000000AP1R-1ZJt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA0D1516;
	Thu, 24 Sep 2026 01:15:21 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4C883F86C;
	Thu, 24 Sep 2026 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790237725; bh=bbPKodBsTD8o9fnFiQlXwV//WWH8PGX15cI1FLSig+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4yuxPqwR5ArBfTPDWeyWPGcYczjQhB9+FWbSfpiL4/azgDNoHq5ymkM/oDYLYvCj
	 dLvCEqw8EZXqOJcgv1E8fHR9cYvmkWU8HeJVt+G2dUKgKVfsITCOVo4ZaSwKW+wdR/
	 b12uUdFMR5ub2JxqQ96qmzzODBuM29VFewD6MGRs=
Date: Thu, 24 Sep 2026 09:15:22 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: Check runtime PM resume result
Message-ID: <20260924081522.GK200420@e132581.arm.com>
References: <20260924001906.715322-1-oss.patchbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924001906.715322-1-oss.patchbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_011527_300684_A1FB95B4 
X-CRM114-Status: GOOD (  12.59  )
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

On Wed, Sep 23, 2026 at 08:18:56PM -0400, Yuho Choi wrote:

> @@ -843,7 +843,11 @@ static bool coresight_get_ref(struct coresight_device *csdev)
>  		goto err_module;
>  
>  	/* Make sure the device is powered on */
> -	pm_runtime_get_sync(parent);
> +	if (pm_runtime_resume_and_get(parent) < 0) {
> +		module_put(drv->owner);
> +		goto err_module;
> +	}
> +

There is already a patch that does something similar and fixes the same
errors across the CoreSight folder. See:

https://lore.kernel.org/linux-arm-kernel/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com/

