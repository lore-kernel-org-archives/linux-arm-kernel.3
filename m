Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F430C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ah+dfF8nmrM1KE0GiEdzpn3bLNRowCcPmaEEpkFEgU=; b=sb7KwjvgHtXhKyHgYZn7PLk3fO
	PKKz+CPhyA5noewZQr/XtLXrcDXRUjofOX8PfAVSc6ZQ9HS8ujAXlXaPT/286aIZh+Mr58gjkCEl9
	eZ5qbOS/LRf86vgBzny/n5dO5YBC/CpM+A0kYpGbtKaG9XL/QR2h/ooS2puUEzIUHTtuOEgdiAcvD
	cbts5K0d9wjYVsSdj5wQe7sdgESOv6cLZ8hnjxjyBWatcImTyIihLi+YuuP0c/7KjEDlRYIq1p9AQ
	AhO4VSlHDJ8phGqszpqil4qeg7NR0DkdS7arKKFzdCjEC2L+oUFwxem1dfcOJFHGk1Ngfu5+YJvDb
	yr6Je2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzydM-00000006KU7-35Uk;
	Wed, 02 Apr 2025 14:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzybb-00000006KDN-0xdV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:58:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A7401007;
	Wed,  2 Apr 2025 06:58:13 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E55B13F63F;
	Wed,  2 Apr 2025 06:58:08 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:58:06 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	oliver.upton@linux.dev, maz@kernel.org, mark.rutland@arm.com,
	lpieralisi@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
Message-ID: <20250402-independent-hyrax-of-honor-4515fb@sudeepholla>
References: <20250402134401.146156-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402134401.146156-1-shameerali.kolothum.thodi@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_065811_329549_CC00C7BD 
X-CRM114-Status: UNSURE (   8.85  )
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

On Wed, Apr 02, 2025 at 02:44:01PM +0100, Shameer Kolothum wrote:
> Fixes cocci reported warning:Unneeded semicolon
> 

There was similar patch on the list [1] few days ago.

> Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")

^^^ Is this really necessary as they get backported as well ?

Since, KVM maintainers are in cc-ed, let me know if you guys want to pick
this ? Else I can send it as part of my firmware (ffa/scmi) fixes.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20250326040659.1190696-1-nichen@iscas.ac.cn

