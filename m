Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFCDD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLzKuVB9SRbRu6KABlxK9U/BOBG3oxrbOo+OTMvlotw=; b=BA0oigUNLRjgG1AAY4xcgB85YN
	/YYKXmWUd8MIBockQwsUWNUuQ9lmQ27bJnwQ0sh7N7Mp3sdsO0AJ+toT0tRPKMwhvCFsLitWxIpg/
	bRTl00U2m1jgQJlqRY7FTuL4aVtxMOQMWtGXN5JJ6sL2z7AYfSxD5/mLZl9xwxlN1Q7emxb7vvF1l
	D/hIKbe2Z2paAEMT4wJQqDIrVm6Mv4+Ys3bGFsuxPR6/anPdQM0DfSHWTyUUd7tDqkSCpcc6YzdDj
	m0EU97GDzu/RFKcVSJOFSiPpVUrD7NFItSeEb4cGjyPTOX6JK9HxrL2LzEFRpHDZtAWwEIVCwmDNd
	1E2qI6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSg9V-0000000DR8L-1Uke;
	Mon, 08 Dec 2025 18:40:05 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSg9Q-0000000DR7O-2RyS;
	Mon, 08 Dec 2025 18:40:01 +0000
Message-ID: <873236c8-4dab-4f1e-a2bf-d233ec74bd49@infradead.org>
Date: Mon, 8 Dec 2025 10:39:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 chrome-platform@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 12/8/25 10:13 AM, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>
>> The bugzilla entry includes a Perl script and a shell script.
>> This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
>> DRM_KMS_DMA_HELPER ---
>> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
>> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
> missed by the batch rename or were introduced a bit later.
> 
> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.
> 
> Are you expecting to craft a patch for fixing this or should I do it myself?

Hi Paul,
Please take care of it yourself.

Thanks.
-- 
~Randy


