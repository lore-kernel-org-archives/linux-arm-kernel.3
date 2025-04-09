Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757F7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBSOjAInjv9JoeCEPPSqpHLt1noV8IEx/RRTbothHZA=; b=j/nDTa/UMYxVORBsGns+cFNCf8
	UNQuWIZd8mgj7f4xv4TGvV381OPesVmicZeV7ti/vvl9WAEopcDOtybGpe+dHhgvazvDTqsdBUg1w
	vO4JlVYXr3z85+r8Ptei7qtQefbrK1fA5ZexzKnteMGvcfyfQYHNh5rdoGBRhlyIz+qWclPUkhG2Y
	poDg7zONHfYotlJzRYo0TrwogA9KTRC+/bB28P2v0NwXHDKvdsnLbv9FgO5fm7yVq8yAQt/Xpby+z
	SqrHR9XiTSM8sk54hy21tvOeYmbkB5Rg1VmBcXQq4O31bjd9EJY0xCBbDddKaXvjaE1+GVp1GJ3ML
	vH7c8rvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tey-000000070ZF-43nZ;
	Wed, 09 Apr 2025 11:32:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TdC-000000070Ij-0Dpw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:30:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE3A21595;
	Wed,  9 Apr 2025 04:30:09 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D08E53F694;
	Wed,  9 Apr 2025 04:30:07 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:30:04 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: cristian.marussi@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
Message-ID: <20250409-manipulative-tall-alligator-5e6c4a@sudeepholla>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_043010_134970_D31E5A87 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

On Tue, Apr 08, 2025 at 11:03:52PM +0800, Henry Martin wrote:
> This series fixes potential NULL pointer dereferences in scmi_cpufreq_get_rate()
> and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.
> 

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

I think unlikely is needed even in this patch[1] and thats what Viresh
meant when he mention all similar changes under one series and consistent
change.

Also I just happened to notice similar patches posted while ago[2][3].
Not sure how to handle the situation though.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20250405061927.75485-1-bsdhenrymartin@gmail.com/
[2] https://lore.kernel.org/all/20241230093159.258813-1-hanchunchao@inspur.com
[3] https://lore.kernel.org/all/20241230090137.243825-1-hanchunchao@inspur.com

