Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A42C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF56BvSvyH9a7rXawiBb7YuCKxMBm30sq99tuGN2Ej8=; b=TVTjWPNV+kpkBvHgMkiJZpiS2y
	3Ddtb015IbrfRJRj0PLPl6mhwqCTK1wi7rP3P+9ucoBPzYkIj8vIMULZOP+rG/nCcSZPmm8YP8Vhx
	khfLOtI4Un2wg7Q6WBqdM9JLhuQao6bkbO4kmDzgDFLIB4uEkOCjZY0ttlfqi/P0SIBniH/j8gJQq
	fY50dhxGhA2/7N4PQwsAEclmkVZ3VdQ4dnK43iuFofF3T8eQI2mNx4C+pK7bh9L8WpOl4WVBP7wXc
	xJnCw2iENwp22fjqFXQ1WP3+37B5Jpt3q1zITQobpcz+bqUHvqJ6zsTLvTdn+OheO0frjoDxSJctS
	BlHiBQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKiw-00000008KfR-127S;
	Wed, 12 Mar 2025 11:58:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK8j-00000008Epp-2nZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFE741516;
	Wed, 12 Mar 2025 04:20:55 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D2A23F694;
	Wed, 12 Mar 2025 04:20:44 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:20:41 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: <linux-arm-kernel@lists.infradead.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Minor cleanups in the scmi bus
 layer
Message-ID: <Z9FuCUAzjd4y6oEL@bogus>
References: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-b4-scmi_minor_cleanup-v1-0-51a514282794@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042045_747235_75EC6194 
X-CRM114-Status: UNSURE (   8.13  )
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

On Wed, Mar 12, 2025 at 11:14:31AM +0000, Sudeep Holla wrote:
> These cleanup centralizes error logging for SCMI device creation into a
> single helper function, _scmi_device_create(), consolidates the device
> matching logic into a single function, and ensures that devices must
> have a name for registration, removing support for unnamed devices while
> matching the devices and drivers for probing.
> 

Please ignore this as I messed by and somehow managed to not include
arm-scmi list with wrong usage of b4 send, will resend soon.

-- 
Regards,
Sudeep

