Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83370CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9nZYSwsMGPvkMj1b62UHiMQVnCSrOBHGMlnTb9xAkc=; b=WEBDN8+gKkv261iI8JzZYQmzV2
	Ogh3rq13fDLIgmbI/LUUadqbfOYh4o8cruXXdUNGXk2a2k2r7Z0renNbGBXfVcCAdIo8OcQ4YcU4H
	KVJIaqXm7vR3z0DHATSfA1d2S53g58MlaCgC2nv59Gm3W5dNLdRWxvVupkcgnHMFYOTSiUcU6eQ2A
	jsG8Alik8oarV/wbMrTwLlN7gPYN/vA2BJSsMncetre2BVKqm0Kmz+bSODWiq4AsamA3dyYmVL7tj
	foRmHhRQ65KkCRVl22ds/41kyQguyRVTse3AjrRR7i1U4TlOps5TvFJThk3KJSXE3tHhl7ywlAcoQ
	n3iGkuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Jzo-0000000682B-27yv;
	Sat, 27 Sep 2025 01:45:08 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Jzk-000000067s5-1VRy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:45:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cYVX05stfz13L4p;
	Sat, 27 Sep 2025 09:40:32 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B6AF18006C;
	Sat, 27 Sep 2025 09:44:55 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 27 Sep 2025 09:44:54 +0800
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Guenter Roeck <linux@roeck-us.net>
References: <20250919184025.15416-1-will@kernel.org>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <488c37c6-fea3-8726-3a16-b042ed45609d@huawei.com>
Date: Sat, 27 Sep 2025 09:44:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_184504_559551_F4B4FBF7 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Will,

On 2025/9/20 2:40, Will Deacon wrote:
> Big-endian arm64 configurations are vanishingly rare, yet we still claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers and
> contributors which, without any known active users, is hard to justify.
> For example, recent work to improve our futex routines and to implement
> nested virtualisation support is non-trivially complicated by having to
> support both big- and little-endianness.
> 
> Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> machines in their telecommunication products but I don't know whether
> that's still the case and certainly haven't seen any patch contributions
> to help support or maintain it.
> 
> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> towards its removal.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
> 
> Cc'ing Guenter as a heads-up in case he needs to turn down his testing
> to avoid this causing a false regression report.
> 
> Cc'ing Hanjun and Jonathan for clarity on the telecommunication
> situation.

Sorry for the late reply, the current products are still using the ARM64 
big-endian architecture on Linux, but the future evolution will not.

It will take quite a while (for years) for the end of the product life
cycle, please keep it as BROKEN.

Thanks
Hanjun

