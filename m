Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9782C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlbv0FSFlLbSmcwi0qSd9c4OoNOyoJGUgwl16y4Fj8k=; b=49/RbGHbdyehztXXCrDl4vPPYO
	ssBZ0B+ZxfgNXxmzlOXsqAc9IOdi5irYSNc1G9/Ws/wUjKmw3y8N+RvJ/C++w5mod8RkUg69+rYLB
	EeAcH0G7YVWwXQKmUAz4scAZzy76yhkTeuW06hCkLSLKJedLtxlr3e3EBCpXx++FmfzD0/6QnomwN
	3ttcFEH+ll2zq+oxmR0S5BUMVbkLaYHGDzoHdNEfKqoGniWodl3qNfog5QwVq/NLv8EqepUbKN0T8
	xZ/gVIRAYNuC2KyxhM58yNsn8kuOa9hD8rPw+lqFPOsSZ9EoXNPnKObonYOJzVDz6HHtm6fdLxxuI
	8JT7wPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeG-00000001AcJ-0G30;
	Mon, 10 Feb 2025 19:40:52 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYYR-00000000vhW-3SEq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:30:49 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0D1D5411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739212247; bh=vlbv0FSFlLbSmcwi0qSd9c4OoNOyoJGUgwl16y4Fj8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PxFnHkEKSZrBYbzFpew/UljRdQUkTOX+qKIpKomAZlWSWpxide9l4c2bxkwdMwNWF
	 sWHrza4QeD17HbEJ1GVDgKEHsQ4J5fGszAooe0rUMV8SpHN2AnJh5s+msApTtSueTq
	 kldvsJD8z29V82iGnnNsIvc0IpF/n5AUf1V7EwE15mOEBZuS5tkWNvoYAelEzc0LtF
	 9A/zQoFU1JnwlyetVPR6L3frzztdtk0XDVlSCAuejySkEp8NEq0ylr0UsJ5g1a1OZE
	 Vo03pIkLZ7JlMiGrr1nPdfsokPnHNxFSVgl0KcZB06VxFdKHkJg6ydIZAOvztgFrBm
	 SzjyXR5yVqF2g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0D1D5411A1;
	Mon, 10 Feb 2025 18:30:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Chao Yu <mchehab+huawei@kernel.org>,
 Jaegeuk Kim <mchehab+huawei@kernel.org>, James Clark
 <james.clark@linaro.org>, Johannes Berg <johannes@sipsolutions.net>, Mike
 Leach <mike.leach@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Tony Luck <tony.luck@intel.com>, bpf@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 00/27] Improve ABI documentation generation
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Date: Mon, 10 Feb 2025 11:30:46 -0700
Message-ID: <87h651zm7d.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_103047_870382_96AD7B99 
X-CRM114-Status: GOOD (  22.62  )
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
> This series replace get_abi.pl with a Python version.
>
> I originally started it due to some issues I noticed when searching for
> ABI symbols. While I could just go ahead and fix the already existing
> script, I noticed that the script maintainance didn't have much care over
> all those years, probably because it is easier to find Python programmers
> those days.
>
> Also, the code is complex and was not using modules or classes and
> were using lots of global variables.
>
> So, I decided to rewrite it in Python. I started with a manual conversion
> for each function. Yet, to avoid future maintainership issues, I opted to
> divide the main code on three classes, each on a sepaparate file.
>
> Just like the original RFC, I opted to keep the Sphinx kernel-abi module
> on three different phases:
>
> - call get_abi.py as an exec file;
> - import AbiParser on a minimal integration scenario;
> - cleanup the code to avoid needing to parse line numbers from the text.
>
> This way, if something goes wrong, it would be easier to just revert any
> offending patches, It also provides a better rationale about what each
> logical change is doing.
>
> The initial patches on this series do some preparation work and
> cleans some ABI symbol bugs that lack ":" delimiter.
>
> I opted to place on this series the Sphinx and Python version updates.
>
> I still have ~10 patches here with additional cleanups, from the original
> series I sent as RFC but let's get the main changes merged first.

OK, I have applied this set - it seems to work for me, though it does
lead to some changes in the organization of
Documentation/admin-guide/abi.html in the output.

It would be nice if, eventually, we could put the README link up at the
top rather than under "ABI file", or even just include its contents
there directly.

Anyway, let's see how this goes :)

Thanks,

jon

