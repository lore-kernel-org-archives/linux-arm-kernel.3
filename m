Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE03C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjvmYgFj26Tl1M9VV8mPvQ7wgYX8kNV0gdkARYL9DLE=; b=juw2tUQTopYPLIX80adLYuM+3j
	JGrzIhk2olSq8b4aTWNxy/+i77li+ly4HeOo2FdA/g5ODa6fOXQBreV7lL6KiwcfZrfOcj3iX4voO
	FHw6z/XW5mivOS8ejAWhLeSkxe8wVMTrSeCJoNVSuowAH8w+zmSd9OVYQyKZjlXhHmif6wrOPNSHA
	zbcc7+VptDWXR3Io01KTyo9OZ88pUscVMZO6UIm4HSCn5sGXfx16mIx5V/Efjz2BYBlbap7DYehU/
	+EnpxzphexkwDuSbBeXGDxgdyX8Q7BhCbjPqCKkdgNt+tePnBK+bNvcmt0ZYLzwGVTHbY91xqVypv
	Q2RIbYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3bj-0000000BmHB-1Yoy;
	Fri, 28 Feb 2025 16:53:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3Zi-0000000BlkJ-2XMH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:51:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BA44150C;
	Fri, 28 Feb 2025 08:51:10 -0800 (PST)
Received: from [10.57.79.187] (unknown [10.57.79.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 349603F6A8;
	Fri, 28 Feb 2025 08:50:53 -0800 (PST)
Message-ID: <4b83669e-db37-4a38-ac43-5d210d7ce544@arm.com>
Date: Fri, 28 Feb 2025 16:50:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
To: Anand Moon <linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
 <20250216195850.5352-3-linux.amoon@gmail.com>
Content-Language: en-US
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 open list <linux-kernel@vger.kernel.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20250216195850.5352-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_085058_688065_EC06BAEA 
X-CRM114-Status: UNSURE (   7.10  )
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



On 2/16/25 19:58, Anand Moon wrote:
> Remove unnecessary IS_ERR() checks for the clk_sec clock,
> the clk_enable() and clk_disable() functions can handle NULL clock
> pointers, so the additional checks are redundant and have been removed
> to simplify the code.

This patch looks sane, just rework the 'goto' stuff in the
exynos_tmu_probe() maybe in the patch 1/4 so won't be needed here.

