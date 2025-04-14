Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E38C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RgVTsGhkqqCOLsaO3opI6epy4UiR4d3cYsOhqiB/xo=; b=nmORER5YoVaqRCsfDH5A2TjTQh
	1E19nNKzJW4Ns8BtDX3VCuJTFhyhn8qAIyLOQuGAsx1iVhep1mDog5gnjYo2uCdcAskPE1ARnz1Az
	Ri4k4w+RsQTM5CftQrVJX4X3KseORYqRZUybVEkzTBztkHTxcOXhwmDHlppXH+AhswoMgroaNsr7O
	le02MUwI4wQ0vsGpHmYzdqgmcIKJOr2p/ALaKM1WVfT6B76njI7l8BJLwmPAq4BLSt50izYYSEpzr
	fl3SMV9pCuS7pEJsikp/7eTs/Q7iveGhKeOM4LvRjgSc1JX9kA6ZG9eI84E7nAatWXcOQ0nRPdXZo
	jAikA/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HjW-00000001h8O-2O3T;
	Mon, 14 Apr 2025 11:12:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HYc-00000001doj-2Ct4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F4391007;
	Mon, 14 Apr 2025 04:00:50 -0700 (PDT)
Received: from [10.57.43.213] (unknown [10.57.43.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67CFC3F66E;
	Mon, 14 Apr 2025 04:00:50 -0700 (PDT)
Message-ID: <34488e3a-9d59-4774-94e3-6369ab3c235d@arm.com>
Date: Mon, 14 Apr 2025 12:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
Content-Language: en-GB
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
 <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
 <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_040054_615800_632621FD 
X-CRM114-Status: UNSURE (   6.47  )
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

On 14/04/2025 11:06, Andy Shevchenko wrote:
> On Mon, Mar 31, 2025 at 02:40:51PM +0100, James Clark wrote:
>> On 31/03/2025 8:14 am, Andy Shevchenko wrote:
> 
>> Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Thank you! Can it be applied now?
> 

I will queue this via coresight tree, for v6.16

Cheers
Suzuki


