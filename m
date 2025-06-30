Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D6BC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQGT174PX3/LjslGR9uakewdT3W7VpHe5+lxPz565X8=; b=ZFXxV16s/r4OswydPHtyFMwgZR
	Gsub3sSkb/cMC8cx2rq43i5maER+s7No8vozMTsV9QpYzcT7dw4VLam5v+QkfxHmAcW43lj8+p8Oo
	XwNZbFMLOUvS5D9x657Bz1X/VfkGzJTsw1FurnIXzXmhTt/rkIM14pawky4rZKSb1Awlc0YWlD00O
	8PsA/GHyjKGx9jJUSL9f9AkDJWDxplZwJLxq2WIuDzUfVcGeEBbWGdC/a30i8xyuNCjaOVdMa+a/t
	XfPbZRnbpX6P/44tymlmxSnagNYDsZK8O4lp6wNYLOIkWJlEC71J5mznFOauYcfOCnJm5uaBvAmin
	thOn5ibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBZY-00000001rMb-1NRy;
	Mon, 30 Jun 2025 10:17:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBO9-00000001pV4-1R0z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:05:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA581D34;
	Mon, 30 Jun 2025 03:05:06 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14EF53F58B;
	Mon, 30 Jun 2025 03:05:19 -0700 (PDT)
Message-ID: <77dd46da-85ea-442a-a05e-d54c56b51786@arm.com>
Date: Mon, 30 Jun 2025 11:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64/hwcap: Add hwcap for FEAT_LSFE
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org>
 <20250627-arm64-lsfe-v1-1-68351c4bf741@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250627-arm64-lsfe-v1-1-68351c4bf741@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_030525_429922_A8B0D89C 
X-CRM114-Status: UNSURE (   7.22  )
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



On 6/27/25 18:20, Mark Brown wrote:
> FEAT_LSFE (Large System Float Extension), providing atomic floating point
> memory operations, is optional from v9.5. This feature adds no new
> architectural stare and we have no immediate use for it in the kernel so
> simply provide a hwcap for it to support discovery by userspace.

nit: s/stare/state/

Thanks,

Ben


