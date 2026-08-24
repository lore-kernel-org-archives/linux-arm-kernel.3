Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C21FC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HorS7PXF9rR3WDHtB1bZ/VAyiOvxI/CLjQGCPN+2hgo=; b=CJr70CsyQOLUcOtov3EW0Kd+en
	NmU68qLjQpyXOj/1LDMVQKNgw5TPMEvDk3DOgpnr4yzNcllcTkKDg3VPbjV4uLPMAaJWFRvMaVUPC
	dpQn2VYd893gWN+msIz1VAP99pQC6gXapjp0nRSCMF5oEGbItjM7wLIqo41f6G2aE3efyk1e7opJc
	jtyA9PD1L5eNm44+USF+T+AicDqiWfDrJ6qIskm/1q3BqfznpJ8eV1txjrPelMTplYTIqHpIaw4m9
	p0c31MMGhAJmtWK2kLE+3aJwdbcWGBh8yynf4OUqwl0SVZWMpVVzPCh+KeuAGPlIscSs8msVuL1/m
	LuKEUG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQSX-0000000GEk1-1jWB;
	Mon, 24 Aug 2026 08:55:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQSV-0000000GEjq-0d1t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:55:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 707A443CFE;
	Mon, 24 Aug 2026 08:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F3E1F000E9;
	Mon, 24 Aug 2026 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787561710;
	bh=HorS7PXF9rR3WDHtB1bZ/VAyiOvxI/CLjQGCPN+2hgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W0YV0Zqw2A7XPcDGGghz6aNHwX/9QkdhKJ4J9rNucg5vwBFN/utGfUTkMhjFkecbq
	 U3GS0wjxzG5SlypxjX9mDCG5kdSrD5ykBVmxf6E3ouUmM54sTc4LW93I5d1qG2PrPS
	 VlzTwagBlbDYgYQ8GYERZC3RK6tQGhTTdHe8QYHvdWNJ01rtcFFVIWe9xqhLbcA7IO
	 yvMUz80HrXcAIaqv7bFJjqwwBcRFZs40i4E05w3BMiRw5lpL4axJZs/XwQsG0Xb4PM
	 2dz6wDAgIxQcAxuCKtmD7GHnNYIjEp9fRAhzA45kb7jipzBh1WTm/S7yptXpNpo7PY
	 WcUjIuB7P/27g==
Message-ID: <b43ceb22-20c5-4930-a070-2f8199e304f2@kernel.org>
Date: Mon, 24 Aug 2026 10:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] soc: apple: rtkit: harden syslog shared-buffer
 handling
To: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
 Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, Arnd Bergmann <arnd@arndb.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 8/24/26 10:26, Laxman Acharya Padhya wrote:
> Split the syslog hardening into focused changes as requested. The first
> patch fixes the SYSLOG_INIT reinitialization leak. The second prevents
> zero-sized messages and out-of-bounds shared-memory copies. The third
> corrects the entry-count boundary, and the fourth rate limits validation
> warnings controlled by the coprocessor.
>
> The index-boundary change has not been tested on Apple hardware running
> Linux. Asahi m1n1 describes the initialization field as COUNT, consistent
> with the kernel's syslog_n_entries name, but patch 3 is kept independent so
> it can be reverted without removing the shared-memory bounds protection.
>
> Testing:
>    - arm64 GCC build of drivers/soc/apple/rtkit.o with W=1 in Docker
>    - scripts/checkpatch.pl --strict on each patch

How was this found? If it was AI assisted please also add the 
appropriate Assisted-by: tags.
I'd also like a Tested-by from someone before I pick this up then to 
make sure you didn't break anything.



Sven

