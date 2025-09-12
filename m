Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F213FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Dz/3Kwytx2XXXc+z1cQm2LNm1YkpHyOqhgu+MqyP3g=; b=iS7epERkvhHyeAzr/kkvhDIJjJ
	m7JmGAewNSdvzo4zdR35jTg7dLeNPmWH3Bn8WYXDi0ytIhGfm53FCIaOLIT/Ta3eacv8vy62CONYi
	Z+ei6JG1K2PPiHEgFNb55RgNm85+W0GZHU4NKJ4RrFiIsk8sCK4ueGgszeLspKymebXUnP9bxV7xU
	+2IT+T0RBxFh1wLrzrBUHtafoINBfJRW8x4t4RcqaPoUVaJIfRMrfOufQpsFmuNBPkVqRu72wbrQp
	mJmrbe9o4ff7v+Zgt6dknHRmOTQejzkHGlj7LH05ElnGVowRGZxy59m3udElRBW2T/3FsPuVBEtHS
	+AUDzRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxIV-00000007P6S-23Gz;
	Fri, 12 Sep 2025 06:30:15 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxIT-00000007P5I-1GIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 06:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1757658608;
	bh=KnbWWZ1vZ7cS+SnFrToVLk6/eP2S5BM8goClXA6cIBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWW8IpDmvTnK2lh7vg8icSbnes7lYwmiq1z2K9xdMjog0SFC7Nulxdk4NhgoLFL+N
	 5is3M5aEjcbpPkEYimcIjAdz6+MDL5d6IhrxJs+Ca2tjClKJw/ZgSGfipmF5RfkbcW
	 cl4yQSPmGAYVo1yFYkUMOEDmhttWGbRhKtoqMjG0=
Date: Fri, 12 Sep 2025 08:30:08 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
Message-ID: <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_233013_514659_0418CBFF 
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

Hi Naresh,

On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:
> The following build warnings / errors noticed on arm64 defconfig
> with clang-20 and gcc-13 toolchains on the Linux next-20250909
> till next-20250911 tag while building selftests/arm64.
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? yes
> 
> First seen on  next-20250909
>  Good: next-20250908
>  Bad: next-20250909 till next-20250911
> 
> Test regression: next-20250909:
> selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> identifier 'HWCAP_GCS'
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build log
> selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
> identifier 'HWCAP_GCS'
>   390 |         if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
>       |                                     ^
> 1 error generated.
> 
> The suspected commit pointing to,
>   kselftest/arm64/gcs: Use nolibc's getauxval()
>   a985fe638344492727528e52416211dda1c391d5

That suspicion looks correct. I am wondering a bit how this works for
the other selftests which use this symbol.

Can you give this one a try:

diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac14..816b497634d6 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -26,6 +26,10 @@ struct user_gcs {
 };
 #endif

+#ifndef HWCAP_GCS
+#define HWCAP_GCS (1UL << 32)
+#endif
+
 /* Shadow Stack/Guarded Control Stack interface */
 #define PR_GET_SHADOW_STACK_STATUS     74
 #define PR_SET_SHADOW_STACK_STATUS      75

