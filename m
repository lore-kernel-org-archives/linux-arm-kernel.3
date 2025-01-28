Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87014C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+meNH1juZBBtvrp/xo2cF0Sh2lEGZRx9Dv3JEMGVfwQ=; b=qoSly7PNhhidsv0BwDR31uPjCY
	ZHA7HmqT0X3CLyNxbwa8TYFUuSZVaa/6drKrW6GZZ6U9Zeq9Eis7Mp6W530wG3svZZKrbAZkIjBJl
	GPrqukYUxBa+yeQvOot9m1vodxRo5rtrH0E918KwrS83gLOAyHZL1qLtR1wHlDCzYu/vKzHNNVCHH
	0ZNSD9IvHwoqCV35MGBuPDxG5gwkdwrXUf90tH1AojMGs21w8Njgd7YfCsa6Absi3mhXrg4IG3UHC
	zyXnAi+5M/smmzXMXSIKs9vVWziom4Qb+jZEjiLtyA1+dPSxE24Cz9pnBOPmRWHffPtBag3D2f17g
	+pxJvYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcuIn-00000005zM5-3kdx;
	Tue, 28 Jan 2025 22:43:25 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcuHT-00000005zBa-1zh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 22:42:04 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 06ECA403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738104121; bh=+meNH1juZBBtvrp/xo2cF0Sh2lEGZRx9Dv3JEMGVfwQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NUNSUUGtYAw8IZ7v+u9urKWTHqRqgIaFDi/LwOklT1yZ+dVdXczOD9aTVo9dL8GaQ
	 OAf5s35W/sLcrCXBP9L1rzztGXQrZf82Io4oQsEPVhxr2Gmfam9dfHpeHYHM4gAzS8
	 Z5wJvtiQGdryhtYMX/RqM8UUTkxsZ7qqsI/DxEU04UzFD7wrLVaAgpDF9YgOAVZODR
	 ghFfoDDu31L5plmrTy4y8+t+6MkL5TJscft0G5BNRz45gjvAU7I+oGLILjgoaHhU9M
	 9iNee1I8iwhHjJ3JhYnCMWXNAtQ6QziZH5AMs5lTvSyDYyN1vQVIIWC4TLGwjRIBKs
	 EZQClEOOCB0lQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 06ECA403FA;
	Tue, 28 Jan 2025 22:42:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [RFC v2 00/38] Improve ABI documentation generation
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Date: Tue, 28 Jan 2025 15:42:00 -0700
Message-ID: <87h65i7e87.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_144203_517732_46EF82E6 
X-CRM114-Status: GOOD (  22.88  )
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon/Greg,
>
> That's the second version of my RFC patches meant to modenize the ABI
> parser that I wrote in Perl.

I have a couple of minor comments on the individual patches, but overall
I do like this direction.

It would be nice, though, if the code were a bit more extensively
commented.  Parts of it get into the "twistly maze of regexes" mode that
can be awfully hard to follow.

> On this series we have:
>
> patches 1 to 11: several bug fixes addressing issues at ABI symbols;

1-3 aren't needed - it seems you already upstreamed #2?

For the rest, is there any reason to not apply them right away?  They
just seem like worthwhile fixes.

> patch 12: a fix for scripts/documentation-file-ref-check
> patches 13-15: create new script with rest and search logic and 
>   minimally integrate with kernel_abi Sphinx extension(phase 1);
> patches 16-19: implement phase 2: class integration (phase 2);
> patch 20: fix a bug at kernel_abi: the way it splits lines is buggy;
> patches  21-24: rewrite kernel_abi logic to make it simpler and more
>   robust;
> patches 25-27: add cross-reference support at automarkup;
> patches 28-36: several ABI cleanups to cope with the improvements;
> patch 37: implement undefined command;
> patch 38: get rid of the old Perl script.
>
> To make it easier to review/apply, I may end breaking the next version
> on a couple of different patchsets. Still it would be nice to have more
> people testing it and providing some feedback.

I've looked over everything, though with limited depth.  My testing
hasn't turned up any problems.  I've only tested with current Sphinx,
have you tried this with the more ancient versions we support?

[It's probably time to raise our minimum version again, especially now
that current Sphinx has better performance.]

I don't see a whole lot of reasons not to apply this set shortly after
the merge window; anybody disagree?

Thanks,

jon

