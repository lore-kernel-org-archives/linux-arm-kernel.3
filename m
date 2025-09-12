Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7787ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMxrwtZy/ej5tje20LY39IhUva5QLPmlbeCy5NB1eG0=; b=xemJTuJ5jJrGtLz0+0jjEjWIch
	+0qSb2DzplAZCVvjy6sQk7EJMkxr8FgE0mg+pqEMrD2wiT9DwTFxN6HMWB63iiimh4os1uKKhU/Mq
	EheyFd666Cd42NfKMN9xoFC1fc2AQIurkk01AxETjI0ndMKzrWOtB6SZVkAj9k+2kktMEc/cOtor2
	UGtjFsTUcKWR8xBOfrdq4DGAt22w9S7gjhWpT+t73QmB5oV++qokS3cUS08gLIQeXaFnKAL28i9t2
	Wg0fm/CpdRE5LCIpfyrSAfJomATGp37ao7MZ+dcStgX7rgMXLTB8kk5v+1xv2zTmfb7RQKcek0xnO
	OxVnmnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Sz-00000008j5b-0ZoV;
	Fri, 12 Sep 2025 10:57:21 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1Sw-00000008j5E-2hf7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1757674635;
	bh=CMxrwtZy/ej5tje20LY39IhUva5QLPmlbeCy5NB1eG0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tVRFgT3wPYBUhvz+I5yGaaOIRcr0LyGbSRTT2P1N9PeCVOaLBduiBTQGUXLiGCvIA
	 zjABJUVEI1WNKBNoAf92rvRgtrqlqM5MDvIT5QMBjKl1KtTmeph63lke6b+5ZITH0l
	 GojC3Twv02/3b4xlee55++ebmE0Jb051+Wm5gbbU=
Date: Fri, 12 Sep 2025 12:57:12 +0200 (GMT+02:00)
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
Message-ID: <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net>
In-Reply-To: <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com> <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de> <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_035718_831404_71448C39 
X-CRM114-Status: GOOD (  10.88  )
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

Sep 12, 2025 12:49:58 Mark Brown <broonie@kernel.org>:

> On Fri, Sep 12, 2025 at 08:30:08AM +0200, Thomas Wei=C3=9Fschuh wrote:
>> On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:
>
>> index c99a6b39ac14..816b497634d6 100644
>> --- a/tools/testing/selftests/arm64/gcs/gcs-util.h
>> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
>> @@ -26,6 +26,10 @@ struct user_gcs {
>> };
>> #endif
>>
>> +#ifndef HWCAP_GCS
>> +#define HWCAP_GCS (1UL << 32)
>> +#endif
>> +
>
> We're doing that for glibc using tests because there's some unfortunate
> interaction between including the relevant kernel header and glibc's
> headers (I forget the details) which means that including the kernel
> header directly conflicts with something glibc is doing.=C2=A0 For nolibc=
 I
> would expect us to using the kernel's hwcap definitions?

nolibc doesn't even have its own asm/hwcap.h (or any asm/ header for that m=
atter).
So a kernel header has to be used,
maybe an old one is pulled from somewhere?

(I won't have access to a development machine today anymore)

Thomas

