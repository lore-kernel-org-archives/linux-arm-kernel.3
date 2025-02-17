Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82207C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70MVYEgDjY1crziy4hTvIM0nPOVV3LCX+mvXS86Re2Q=; b=Cqqz4k40BeuEJHsa+jO0UWeOSM
	jEEuS6xaoi9rE1HSeeuugabxY5mmsxnSTiXi03sEfmXR5jxjYU74euhZzZ2GpT6v2ye1niWH6opdT
	LB3uHWUzjVFbwKWE6XmcO0e9pXVSmh3aT43JEXClmpP7vidzfL1I9wi3/Jr3VX35T5D5OMkqcg7Gv
	LxcGHQGRE/tsf/rnHuAogslD3IN1jbl7M9lAxOpKG8sJleMYNWtducLxU0BY2QvnuWGkuGq0UXxpM
	87koXY+jjZ/q532hthnwmSke9kS1qdL7CE3k6nyDpkVhrvyiH6SijbTuIF1+qszYuGetOEGRbOzMo
	1bcEtu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4ln-00000005QXO-02hx;
	Mon, 17 Feb 2025 17:18:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Yj-00000005BZK-0B3h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:01:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5133C152B;
	Mon, 17 Feb 2025 08:01:43 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 677C03F5A1;
	Mon, 17 Feb 2025 08:01:22 -0800 (PST)
Date: Mon, 17 Feb 2025 16:01:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<catalin.marinas@arm.com>, <vincent.guittot@linaro.org>,
	<beata.michalska@arm.com>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <dietmar.eggemann@arm.com>,
	<pierre.gondois@arm.com>
Subject: Re: [PATCH] arch_topology: init capacity_freq_ref to 0
Message-ID: <Z7NdT2OBJPRveDHQ@bogus>
References: <20240827154818.1195849-1-ionela.voinescu@arm.com>
 <Z7NPEic3jxLAQBTd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7NPEic3jxLAQBTd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_080125_121074_1AE0576F 
X-CRM114-Status: GOOD (  12.72  )
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

On Mon, Feb 17, 2025 at 03:01:23PM +0000, Ionela Voinescu wrote:
> Hi folks,
> 
> I just wanted to mention that this patch still applies cleanly on
> next-20250217 as well, and it still builds/boots/works as expected.
> 
> I've rechecked it given that the patches at [1] seem ready to be picked
> up, and those patches depend on this one.
>

Is there a dependency on [1] ?

Either way, if Catalin is happy to pick it up along with [1], that would
be best and easiest.

If not and there are not dependencies, then we can ask Greg to pick up.
Which means you need to repost with him cc-ed ? Lets wait and see if
Catalin is happy to pick up before reposting though.

--
Regards,
Sudeep

