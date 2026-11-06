Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288A4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GRabq21N;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XHSHPTX7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jt3R7TfSpqJL3e7vuDC+4AFhmIAvQsLxqDdvUmBKTj8=; b=GRabq21NVXOCy0
	9bhMyw7MI7zmXdFuk2YTIG91julALh4mDB7+QfTCfdD6uK8kcMPYNLQ8l01NjhvGOPCLhwyiFDXQh
	SNzimqE6rFHBiRG+2vox8n+EA0nXc4MsNy135POJ7RZGcryqfwlJZGbdlvEeM1h4Ptq+uvFk8LAKa
	VRpeWtAHHbXH0+gdGDO1+WEKuSMA2w0TvFaVzeJKWmZo4D/r3brNNeWMbRU+njk8gb0L8VSL21F0F
	786rhTkhcorAYYErK/ONVVxK4iQdo2N9hPSEzn64b6ZGnJM60cgYgJfZZGqlhU9R8Eddr9tNLR2dN
	wQhHKa6BhWoMPwQwpBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKbM-0000000CbM7-30hV;
	Fri, 06 Nov 2026 14:07:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKbL-0000000CbLj-0Xu1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:07:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 218A41650;
	Fri,  6 Nov 2026 06:07:25 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C993F673;
	Fri,  6 Nov 2026 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793974048; bh=pDq5ovOLxHsArdV+hqkD9SQP/WM9M4pppSopccuY8XI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XHSHPTX7hWahtZWI8HuVIICBuSj4RPvsEqHYTT7SL1xBKPqj34XSmzd05/bm6uA5K
	 HIixE1B1p+cs8gwd9WJlodLBqlrGxJQGy0B40pMDwopMhz7nMHObJlzRH0cTTJIwWd
	 pwgVIXOE/ZfFcYf4WB7Bi8jSoirA6Z78Tm8bvDeM=
Message-ID: <e63d70d7-5b1c-4fe2-8fb0-6e85e3c79648@arm.com>
Date: Fri, 6 Nov 2026 14:07:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm: Group interface drivers under arm/
To: Sudeep Holla <sudeep.holla@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
References: <20261106115046.62344-1-sudeep.holla@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106115046.62344-1-sudeep.holla@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_060731_218969_5C274935 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 11:50, Sudeep Holla wrote:
> Arm firmware interface drivers currently live directly under
> drivers/firmware/. Some use an arm_ prefix while others use generic
> names. More Arm firmware interface drivers, such as:
> 
> 1. Live Firmware Activation (LFA) [1]
> 2. Firmware Interfaces for Realm Management Extension (FIRME) [2]
> 
> expected soon, which would further crowd the top-level directory.
> 
> There are couple of other possible arm specific firmware interfaces
> that may need to reside there.
> 
> Create drivers/firmware/arm/ as the common home for Arm firmware
> interface drivers. Move FF-A, PSCI, RMM, SCMI, SCPI, SDEI, and SMCCC
> under it, drop the redundant arm_ prefix from the some directory/file
> names. Update the Kconfig, Kbuild, maintainer and documentation paths.
> 
> The resulting hierarchy provides room for upcoming interfaces without
> continuing to add Arm-specific directories at the firmware root.
> 
> [1] https://lore.kernel.org/all/20261102165421.3651202-1-andre.przywara@arm.com/
> [2] https://lore.kernel.org/all/20261019-firme_interface-v1-0-27895c9cebaa@arm.com/
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Thanks! This is a nice cleanup.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


