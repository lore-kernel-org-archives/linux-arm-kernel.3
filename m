Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37302CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrF89vA/nNk/KCPhfmyS3xm2ZWuEBSX1jATYnVa9X68=; b=D8W0xAj66CRxtbEV4hiL+73aNQ
	FO1waioUAeOyBH471vR9WbSC4C/y8dha44gpYD7oOXRs+siO4rk68IL40PbqKKvcikK8Tw0kgIBDj
	aOSnt4xMC4R83Sp/Py98zktABHzJ/W2S0PmeDAnkZtGCE0fa3qU9kz76wOUVKkarWYJs3NFxmUpbU
	YJLUHKi0ZeSkYURnsbBmZYO9KI5F9Kob1qtjEVO72Oer7mh8FJMeI6gt/zWE8ootMcoKMnJVhHjJ/
	/6b5FLe3nyzauPnHWgWg53e4GbbwwHVXZiNi5Kc9+S777OPyzyzWtBCbsMJJmKmaTxHnW9geVKqtr
	rbOR4GOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVQC-00000003K5S-0lg6;
	Tue, 29 Sep 2026 10:50:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVQ9-00000003K47-1bdX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vrF89vA/nNk/KCPhfmyS3xm2ZWuEBSX1jATYnVa9X68=; b=SZX4TTHIo81a0jxURJihg8weXN
	oudeUR7g+RNj7zE5zAiyAFl2bU1iQA77raDewg5XywsfJ5DgEp0m2DgyxCjZ3tO5vv9ZPGiqyzJpK
	cLWePeigjSzNhYP1XvfLFxcEeIJpRl13sW/Z5Ipdv9RtuthHJ1C27k7N+Sj3XkxsX5t0F/4RI8du6
	rfZcuN3XUN1BEhfFZPCsxSZ+3KbO7fOSTTjEj4Mvx+q8P9DYLkPokyKUp+rUrZZR/r27lX07buLXD
	l7Hz01d2xBWI0DOgvamW9NRKMT5KUATqTIwb5dI6hx5GIaeXtXZAjzZzSYRl72qyYHcrGVuUyYp3s
	a98cHnFA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVQ6-00000002WQZ-0iXG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:50:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CA40143D;
	Tue, 29 Sep 2026 03:50:41 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597E93F86F;
	Tue, 29 Sep 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790679044; bh=x5DMhANbWDxXz6e9rKTqJx8Hdqk+thHnj9yygpRPhng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I5ZrEQ9bGn2rdwPFtyyjCXCgK1HyER2LL6tqrJSFRwFSiklCEegQIXEvBlESinUHx
	 wYQsdl8ukvfHurffs9W/WX3vmnMOzRI8JmdpoyUPY92+wjsLUqIklbr92nD/V5kIOs
	 R8FNSIB3TCWI36S0yj9nEaCqB9w4XHmSZmjIkPPg=
Date: Tue, 29 Sep 2026 11:50:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
Message-ID: <aruWz-QkcdD9ETbC@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_115046_645132_182F40DA 
X-CRM114-Status: UNSURE (   9.53  )
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

On Thu, Sep 24, 2026 at 02:51:54PM +0100, Suzuki K Poulose wrote:
>  arch/arm64/Kconfig                |    1 +
>  arch/arm64/kernel/cpufeature.c    |    1 +
>  drivers/firmware/Kconfig          |    1 +
>  drivers/firmware/Makefile         |    1 +
>  drivers/firmware/arm_rmm/Kconfig  |   25 +
>  drivers/firmware/arm_rmm/Makefile |    2 +
>  drivers/firmware/arm_rmm/rmi.c    | 1072 +++++++++++++++++++++++++++++
>  include/linux/arm-rmi-cmds.h      |  558 +++++++++++++++
>  include/linux/arm-smccc-rmi.h     |  505 ++++++++++++++

One more nit: patches 1 and 2 I think add new header files without a
MAINTAINERS entry. You can add them to arm64.

-- 
Catalin

