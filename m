Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F22CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auvhK7ffgL1FPg7XbmVEOxEa9GBZxXbchYY4I/Bc66I=; b=ekt3LVpd6nuymZEsPEywIVSMJk
	Kca9gMDnU4zRUw110XfnGwLABFIDtFUNvh8foxLtV/heHLH28P9CdgejMgjiWLpkLiJVZLvGLOuCf
	nOLC48odQg1FpO0+vGecD1HKIbJlfpYPH8lpHppZar59TgG491JOj0Cen2gA4fqVSk+PsyEftb6Yg
	K3hyOBtbKdxkAaEhfNKe6Fl6SKYQ51fNN+K2QsNWyK+CIqm0nY5Y3q9hq4hOBF7jWB0d3c3o/uLOY
	FiT3Fq0HuzIf8lrRkqwqbuIuFQrnK2ACt7rw6TwiSTX59cSgr8cmdyV4D2S/3TtvC66J3PH5gV1Ax
	y+ZQXFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Co-00000005wxJ-1Sgu;
	Fri, 09 Oct 2026 09:47:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Cm-00000005wwe-3HYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:47:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2656D43342;
	Fri,  9 Oct 2026 09:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15E01F000FF;
	Fri,  9 Oct 2026 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791539276;
	bh=auvhK7ffgL1FPg7XbmVEOxEa9GBZxXbchYY4I/Bc66I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Du+JcPxrxrnPSwjhxaYZqnTKozLxdVHm1be6v9bBCcNXbChZGFJEVkWx5zm6p6rEn
	 5MWi2LdX/djUS0cnUJCBmcS3vTzPSjOG4LK8+lIQNGQBBqTo7CpCtRfLwjSy5H54iR
	 te7+X6ktybTfm6FryiRVcioJNHy7NQZeyehJd1fEWegiLuXbHKMWvQFeubXDN2HtZc
	 N/IK6kGZgCIUKbzLs2ByJ+/cQNxi5krL6O18xzrS7r9rHlDhUSwq4Bd9cCWdw+v4Qq
	 GD5u6nzynFeOQvPnwMxrPFlqm0AYVZTvWcWpsd8Rk2vj7W3iGglGLIDkV7OfBGYe6O
	 me7GFbfqMmDMA==
Date: Fri, 9 Oct 2026 10:47:50 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: rafael@kernel.org, zhenglifeng1@huawei.com,
	zhongqiu.han@oss.qualcomm.com, viresh.kumar@linaro.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>,
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Shubhang Kaushik <sh@gentwo.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>, jonathanh@nvidia.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH 2/2] MAINTAINERS: ACPI: Add a separate CPPC entry
Message-ID: <20261009-almond-mandrill-of-glee-e23f9b@sudeepholla>
References: <20261008212832.354382-1-christian.loehle@arm.com>
 <20261008212832.354382-3-christian.loehle@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008212832.354382-3-christian.loehle@arm.com>
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

On Thu, Oct 08, 2026 at 10:28:32PM +0100, Christian Loehle wrote:
> CPPC is a distinct part of ACPI, with its own CPU performance control
> semantics and register access mechanisms. Add a dedicated MAINTAINERS
> entry to help direct changes to maintainers familiar with those details
> and the various platforms implementing CPPC.
> 
> List Rafael and myself as maintainers for the implementation, public
> header and sysfs documentation.
> 

Thanks Christian for this.

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

