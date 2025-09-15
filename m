Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCE3CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr7rEBCmFrQx5wpGGNmncNNXlSFxjm3AfJnWaVt0LK8=; b=jgkLSRJzACivLsHKR2jXkCOF0h
	90Spdysj2Y2nfQW7FGLN2q9ufVxuHnWDX0dJpeoYUFp7wfMa1+VVng3dJ53kbHFwxebxAWvNTBPQA
	x77sD3kmGyqlnRiAUI7TxCze1qtXNI/bAsGgoIRq+oT2Y2satDNeal+zqYNdPnRV3ovMK99KgvyNP
	lsi+DDDbSZ6isZzUTuvUg7hUGozesn7WhrcEXj0DXWa1DgYDOsp8X/ABrftP6mtjCcQ7TBpL0l6Ny
	qFBMOQcei4Gbbaryt6PEGwZJcm4mVBb9yfbr3P66oX2bbCpSVOLshTqfJGIOf7mSe4Kg43AptJTqf
	FddWJh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5RG-00000003SK4-3TMU;
	Mon, 15 Sep 2025 09:23:58 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5RD-00000003SIM-1TyB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1757928233;
	bh=ibrtgmyavezo7/rV24wGdikXdfg56Q20YZWEB+mLWa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mT+NeYvznIc4tPG4UG5JHS3hYDS7hbLnIscEPoWCJjLxsLpq8eXISCLHN3iQr6nXq
	 Pmbzaou7G37f3CE3OrHyKvQjDsKQkNSE41iYJidnNRSU8IVII+WXzGW/NydWpEJX6p
	 5II/Cn2fq61/rRvig2tbY5I36tEKVS4FXokWyQHI=
Date: Mon, 15 Sep 2025 11:23:53 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
Message-ID: <5fe12804-2538-42c5-b5c7-66d36ff947d9@t-8ch.de>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
 <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
 <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net>
 <b9b8b8cf-4920-4f9d-bcea-bea913058601@weissschuh.net>
 <a1dc9839-ab45-4dd6-9eeb-4bbc35bf8d90@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1dc9839-ab45-4dd6-9eeb-4bbc35bf8d90@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022355_633019_56B55F12 
X-CRM114-Status: GOOD (  13.19  )
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

On 2025-09-12 12:14:00+0100, Mark Brown wrote:
> On Fri, Sep 12, 2025 at 01:07:58PM +0200, Thomas Weißschuh wrote:
> 
> > The Makefile does *not* use -nostdinc, so the nolibc program probably finds the toolchain's glibc asm/hwcap.h.
> > There also doesn't seem to be a static arm64 hwcap header in tools/include in the first place.
> > I am still wondering how this works for the other tests.
> 
> make headers_install puts a copy in usr/include, probably we just need
> to include that in the include path.

Naresh, could you test the patch below?
The other custom $(CC) rules in the gcs directory are also not
respecting $(CFLAGS), but I'll leave these for now.

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index d2f3497a9..1fbbf0ca1 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -14,11 +14,11 @@ LDLIBS+=-lpthread
 include ../../lib.mk

 $(OUTPUT)/basic-gcs: basic-gcs.c
-       $(CC) -g -fno-asynchronous-unwind-tables -fno-ident -s -Os -nostdlib \
-               -static -include ../../../../include/nolibc/nolibc.h \
+       $(CC) $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident -s -nostdlib -nostdinc \
+               -static -I../../../../include/nolibc -include ../../../../include/nolibc/nolibc.h \
                -I../../../../../usr/include \
                -std=gnu99 -I../.. -g \
-               -ffreestanding -Wall $^ -o $@ -lgcc
+               -ffreestanding $^ -o $@ -lgcc

 $(OUTPUT)/gcs-stress-thread: gcs-stress-thread.S
        $(CC) -nostdlib $^ -o $@


