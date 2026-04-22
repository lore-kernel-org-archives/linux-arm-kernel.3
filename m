Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B211F94CD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lK25W7+Mcjv1QQUKw5l94ZN7yEGQLyRTS4aEO3CXdU=; b=xlcviwFO2q9WFexcqi7rG4wTy0
	86uUfYYX41LYxH9fG4kt/eMGNP2pl47HpRPtIyELBxrunvzCrl+sY2iC9ifnt1r5WyG4sqaICGNZz
	GjJHlSlRMzFEVMYwqUtbwYRDqaBtlz4Bh7SAqiznJl4xrI/P2pcRVWjWKuo8apbUKY6aNSU4hOtPA
	VnRcySG89mmivUehF+VDKJfu9XmwFjzRtS0h8x5sI5KVcpL8uDeTmDA5sBh1usJt5mg/lzX2r72MM
	moH05eDGIII6+BUKtvg4ncNrRQ232RUIJ+4I7c2mcuXNIt27sA+My4+kAkJUtMSdJEKfyukof3jPk
	zYQXyxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRyL-00000009j6u-2JRq;
	Wed, 22 Apr 2026 07:26:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRyI-00000009j6b-1LvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87AF460018;
	Wed, 22 Apr 2026 07:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7F7C19425;
	Wed, 22 Apr 2026 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776842765;
	bh=IvSjzT4GEYNAHFGcrljPx1kOL3wXhKmoqPv4Tv8CkaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EzBqLzuONJJv0ldtemEnj0bXdUh9Q6jzanPurHh8Miflfd8barSPM45kdHimemhIt
	 1eMFfC5fT848W+2iwSmKEnYavFqS3uq5Azd6rGxw0rP59V+eJy3bOVzvbsFXDS33WC
	 mjJh2LRhXVMpQr97ZfguumkupzTHXoJ2J2RPpSWRVsxNZLt+L2c6OoxcMztVwNnh7X
	 uiPZT0XNuZhd6gP48BoVOaHIojh6QR7HcqrMDL5pzMXXLYiJZsj4WVVj/qRUHgmtjn
	 tNkCp+X4hCKUScXVf1gd3/4RrgzyMhcQvtV8NoXRLtRATX5ltBsI67PYcF1YVNifaV
	 RymlAA9f3ksEQ==
Message-ID: <5d16def3-3bad-49b1-866d-94a522e8d394@kernel.org>
Date: Wed, 22 Apr 2026 09:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning in linus/master
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
References: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
 <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 22/04/2026 à 07:56, Thomas Weißschuh a écrit :
> Hi Ricardo,
> 
> On Wed, Apr 22, 2026 at 11:51:45AM +0800, Ricardo Ribalda wrote:
>> Media-CI has found a couple of new warnings in the latest kernel
>> version for aarch64 and powerpc. They get fixed with this patch and
>> before moving I wanted to know if this was under your radar.
> 
> Thanks for the report. I was not aware of these so far.
> 
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index 7dec05dd33b7..65914842fae0 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
>>   CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
>>
>>   ifneq ($(c-gettimeofday-y),)
>> -  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
>> +  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
>> -Wno-maybe-uninitialized
>>   endif
> 
> (...)
> 
> I'd like to know exactly what is going on before suppressing the warning.
> It is a non-standard warning, only enabled by *some* of the vDSO builds
> for some reason.
> 
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Flinux-media%2Fusers%2Fribalda%2F-%2Fpipelines%2F1649144%2Ftest_report%3Fjob_name%3Dcross-gcc&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5c0f15ee20a44072f47108dea0340304%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639124342424606113%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9Tvp2aYfB02ijxVGLzCOYcMwZlPvqVDufxEporLl1mc%3D&reserved=0
> 
> While I was able to download a configuration from this job and also use the
> same container image, I can not reproduce the issue. Is the configuration the
> full one or only the template?
> 
> Could you provide full reproduction steps?
> 
>> CONFIG_CC_VERSION_TEXT="aarch64-linux-gnu-gcc (Debian 15.2.0-16) 15.2.0"
> 
> The linked test log shows GCC 14.2, not 15.2.
> Not that I could reproduce it with either one...
> 
>>    SYNC    include/config/auto.conf
>>    CC      arch/arm64/kernel/vdso/vgettimeofday.o
>> In file included from <command-line>:
>> In function ‘vdso_set_timespec’,
>>      inlined from ‘do_aux’ at /workdir/lib/vdso/gettimeofday.c:266:2,
>>      inlined from ‘__cvdso_clock_gettime_common’ at
>> /workdir/lib/vdso/gettimeofday.c:293:10,
>>      inlined from ‘__cvdso_clock_gettime_data.constprop’ at
>> /workdir/lib/vdso/gettimeofday.c:306:7:
>> /workdir/lib/vdso/gettimeofday.c:104:26: warning: ‘sec’ may be used
>> uninitialized [-Wmaybe-uninitialized]
>>    104 |         ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
>>        |                      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> /workdir/lib/vdso/gettimeofday.c: In function
>> ‘__cvdso_clock_gettime_data.constprop’:
>> /workdir/lib/vdso/gettimeofday.c:242:13: note: ‘sec’ was declared here
>>    242 |         u64 sec, ns;
>>        |             ^~~
> 
> The same pattern is used in some other do_ handlers, which do not generate this
> warning. I also can't immediately see what is wrong.

You are likely in a special case where vdso_get_timestamp() returns 
false without setting &sec, and some versions of GCC and/or CLANG fail 
to see that vdso_set_timespec() is not called when vdso_get_timestamp() 
returns false.

Christophe

