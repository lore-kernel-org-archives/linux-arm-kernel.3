Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB17C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qC7Cg9UwN7TEG6Z0BWJjfH3PxHAqcnQGnPAQvchyZ8=; b=LyYCECciG7kwxeKnKGNbakD3kQ
	tDyB79ryQixnpe+qigBUWWi1QK4BLNPs2mQQ8cXXw/aqKaN+TClpnyGD+jXFvaJdGNhtFqCPQhoB5
	njz0gBMO7buHPoyHQGkR7YdEAVPnFvm7HIKkNqMHhaXtid7FyZMmGTKFZFMXqblC8cqZOsRgj8tjQ
	S9KAYr6JoL+J9jW06y6b2qnnmx9Vq5VpX8HaF2FFiYWcGrGJX/C2+idi640uhdxB8JoBpOFs2Wo1N
	3UKqVurUjgkIa/32sYEXMKKQYQCtyKhLvhSssOX+mTypww1WPoia5Kdr/0UzgWRC+J3KJyv4++vGW
	5bxdF0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiPQ-0000000Dglx-0OQQ;
	Tue, 11 Aug 2026 09:04:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiPL-0000000Dgl6-1vbZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:04:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D26621516;
	Tue, 11 Aug 2026 02:04:22 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 710313F632;
	Tue, 11 Aug 2026 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786439066; bh=L433lSGeAgbk6jdO25yBmQ4JQ7OtU3fLPNjeQrpjwIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLkjqkwjoqf/V6guQDEXsYBcoS49lUw7etQMbB98Grd15uTJaUWo6h5tGDIUu+Yq0
	 lVzvyI2m3d0olRN+IGxlIfaAXVoKG9MwXG74TEJblE6fkqYuegpKZictHst0DQv6IM
	 lXlRlVI6EEvDqcpBOnrIp4J1eSw6jwp14zol4PIk=
Date: Tue, 11 Aug 2026 10:04:24 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: trbe: Hide enable_sink sysfs file
Message-ID: <20260811090424.GD15499@e132581.arm.com>
References: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_020427_540477_5693B1F6 
X-CRM114-Status: GOOD (  13.97  )
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

On Fri, Aug 07, 2026 at 11:13:22AM +0100, James Clark wrote:
> TRBE doesn't support sysfs mode, but the enable_sink file can still be
> successfully written to enable the device, and only attempting to enable
> the source would later fail.
> 
> Avoid misleading users by adding a flag that devices can use to hide
> either the enable_sink or enable_source files, and set it for TRBE.
> 
> Don't set it for ETE as it's possible that ETE could appear on the
> legacy bus and work with sysfs, and writing to enable_source already
> reports EINVAL if the device doesn't support sysfs mode.

It is a pity that we cannot determine from the ETE registers whether ETE
is connected to the legacy bus or TRBE.

> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

