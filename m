Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE935CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdzlRKK0YYlKL6FZpkN26fSLgIGwOiSuk6wPK7rRaPk=; b=CFCT8hvG2zauUFsuxXXBPseeGV
	vVTP2WHwabyq8FP6dta0xsfVXTHmV0w3ZSih9QuPxZ5ioJvkttLdeqEhlhWz6vMn1M6caPFmFQUu1
	ravkpGB9k7o1sQqEEh2aeeNXN42CAFtOQ947xWyt4AV4W09jwU2zI8rsVUSkbUMXLj2GHSwlzup25
	oyJbNmm5+3/obRuriydcuGLtbRkgIdNU9cVU4rdH3Quf9thcfdCeHmZkM3vXDIU9YKtk97Jcefabp
	/HvsHIrxJESQquJHsbeGcGpZvWOZhUw+pMfXbx1ZUQMWGvFCRbOmGsKUrNx/kIOcI4j/iIdq2bVkz
	YRlmNnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1dN-00000008mkX-3dMw;
	Fri, 12 Sep 2025 11:08:05 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1dL-00000008mjJ-486u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1757675281;
	bh=XdzlRKK0YYlKL6FZpkN26fSLgIGwOiSuk6wPK7rRaPk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=J4sSSjc3gHxbN6pUJYV/ujaYiL2Dj+xeYc5HMo09pIvME3yeUcpbSWpV9HcFTguDI
	 2TO1kd+Id86BgOhij0H9Pu8ZGa5kpz/zRmv3Xt40wE69uh0czzST26yCVz/F8K83MO
	 FRG321OuYAdYcQEk4Fo0bUBwSP8blPnkS8Tm1rM8=
Date: Fri, 12 Sep 2025 13:07:58 +0200 (GMT+02:00)
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Message-ID: <b9b8b8cf-4920-4f9d-bcea-bea913058601@weissschuh.net>
In-Reply-To: <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com> <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de> <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk> <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <b9b8b8cf-4920-4f9d-bcea-bea913058601@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_040804_199786_7BD83BFA 
X-CRM114-Status: GOOD (  12.85  )
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

Sep 12, 2025 12:57:15 Thomas Wei=C3=9Fschuh <linux@weissschuh.net>:

> Sep 12, 2025 12:49:58 Mark Brown <broonie@kernel.org>:
>
>> On Fri, Sep 12, 2025 at 08:30:08AM +0200, Thomas Wei=C3=9Fschuh wrote:
>>> On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:
>>
>>> index c99a6b39ac14..816b497634d6 100644
>>> --- a/tools/testing/selftests/arm64/gcs/gcs-util.h
>>> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
>>> @@ -26,6 +26,10 @@ struct user_gcs {
>>> };
>>> #endif
>>>
>>> +#ifndef HWCAP_GCS
>>> +#define HWCAP_GCS (1UL << 32)
>>> +#endif
>>> +
>>
>> We're doing that for glibc using tests because there's some unfortunate
>> interaction between including the relevant kernel header and glibc's
>> headers (I forget the details) which means that including the kernel
>> header directly conflicts with something glibc is doing.=C2=A0 For nolib=
c I
>> would expect us to using the kernel's hwcap definitions?
>
> nolibc doesn't even have its own asm/hwcap.h (or any asm/ header for that=
 matter).
> So a kernel header has to be used,
> maybe an old one is pulled from somewhere?


The Makefile does *not* use -nostdinc, so the nolibc program probably finds=
 the toolchain's glibc asm/hwcap.h.
There also doesn't seem to be a static arm64 hwcap header in tools/include =
in the first place.
I am still wondering how this works for the other tests.


Thomas

