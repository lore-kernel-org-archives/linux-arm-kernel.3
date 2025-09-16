Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09947CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNmCIEwcZ4e13p0I/AT02il2AZu+ZHcccjAcZWxU8pk=; b=lATn+uHbGT1BaOjInJ6pzA3PvP
	GZK+IBK/Ka1kHb6ctfeuNEncmlSAEWkL9qnb3yC7zRx+JZr+HEG7o6DY/yAzM4LfYdhVgOm/DU542
	k+UBMSkwTT8lFrKavqH5NvrbtrU2TBQAuDDBla0l69VqmfB03AuyubQcv3PVEvX4yc8YCNgtLAnY4
	MKhgAgFZkdffCEDcYuo+yacH04WyPtg/65T+vj1sv+Vl4dyXppqiXwJPKON8JEsF0JD2SKZYMyx/o
	wZJAzx0uHKk1PZ+yq/P+pLu/FbuTOsQ9Hu3vQdu8oxeVbtkuqlXxAonCdguNnB5Rj3B4j3ELo/e9b
	7kXLms3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYUK-00000008SWG-49JR;
	Tue, 16 Sep 2025 16:25:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYUJ-00000008SW9-2Dqv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 16:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SNmCIEwcZ4e13p0I/AT02il2AZu+ZHcccjAcZWxU8pk=; b=L/930puOfa+6Q73tCBG6r0FXmc
	DYvogRu8Mid5TblRJs/jmMRXkqhngGYsOPPN8jHmwY6I/ZTGmiXV0WVi7+pRQFylzgywvVQquqBJH
	g9J4wC+JXL1x0yZZGRwNY/dePdcQnvfpiWibhdxUQZ15ztTQ1LT9lX6WwAJ9byTEtdz2S4Y4TBvY/
	tboVBZ61ZByYj8Cywf2DJnNInLZMMQtwB8WVmp3DO0134XJq+LfU0BjxsFp9MAIdvt9YC0HBy5oBG
	ViS/lSlihnKOyX39kmpVGV8x1SNSXDtc/tQaAMU4aRayVd67yF8dbEJnygtbu+qYScfJBgcNYr4qr
	g/GM+rWg==;
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYUG-00000007Eec-1pnX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:25:02 +0000
Message-ID: <a35e2d54-f1f5-4ae4-9daa-ae1f3a8a302b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758039287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SNmCIEwcZ4e13p0I/AT02il2AZu+ZHcccjAcZWxU8pk=;
	b=Ky7UgO1Gvl4Aq2strv+i4L2ECO6vSXbzIyDyCJ8yXojQbhh41opmKt7rOH6QaAKjIK9L8H
	jOjmiJmuiWEm2+4s74XBg6qa72akUUnw72uw936hfshyKUzYI+08Lr3CvaCiWgBhHJOlN4
	+9irM9Fk2CnWpLsOdGc0+GAtjfH58kk=
Date: Tue, 16 Sep 2025 12:14:40 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Linu Cherian <lcherian@marvell.com>,
 linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
 <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
 <20250916160027.GK12516@e132581.arm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250916160027.GK12516@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_172500_613957_4AB9A98D 
X-CRM114-Status: GOOD (  25.11  )
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

On 9/16/25 12:00, Leo Yan wrote:
> On Mon, Sep 15, 2025 at 10:31:24AM -0400, Sean Anderson wrote:
>> On 9/15/25 05:58, Leo Yan wrote:
>> > On Fri, Sep 12, 2025 at 11:13:14AM -0400, Sean Anderson wrote:
>> >> coresight_panic_cb is called with interrupts disabled during panics.
>> >> However, bus_for_each_dev calls bus_to_subsys which takes
>> >> bus_kset->list_lock without disabling IRQs. This may cause a deadlock.
>> > 
>> > I would rephrase it to make it clearer for anyone reading it later:
>> > 
>> >   coresight_panic_cb() is called during panics, which can preempt a flow
>> >   that triggers exceptions (such as data or instruction aborts).
>> 
>> I don't see what exceptions have to do with it. You can also panic
>> during a regular interrupt.
> 
> The commit mentioned "without disabling IRQs" gives the impression that
> the deadlock is caused by IRQ-unsafe locking, which might mislead into
> thinking why the issue cannot be fixed with IRQ-safe locking.
> 
> Regardless of whether IRQs are disabled, and regardless of the context
> (interrupt, bottom-half, or normal thread), the conditions for the
> deadlock are only about:
> 
>   (a) The bus lock has been acquired;
>   (b) A panic is triggered to try to acquire the same lock.
> 
> [...]
> 
>> > When I review this patch, I recognize we can consolidate panic notifier
>> > in coresight-tmc-core.c, so we don't need to distribute the changes
>> > into ETF and ETR drivers (sorry if I misled you in my previous reply).
>> 
>> And this kind of thing is why I went with the straightforward fix
>> initially. I do not want to bikeshed the extent that this gets removed.
>> IMO the whole "panic ops" stuff should be done directly with the panic
>> notifier, hence this patch. If you do not agree with that, then ack v2
>> and send a follow up of your own to fix it how you see fit.
> 
> I would fix it in one go.
> 
> I agree with you that "the whole panic ops stuff should be done directly
> with the panic". The only difference between us is that I would keep the
> `panic_ops` callback. To me, this encapsulates panic callbacks into
> different modules, to make the code more general.
> 
> Could you check if the drafted patch below looks good to you? If so, I

As stated above I disagree with a half-hearted removal. If you want to do that,
then I will resend v2 done with an rcu list and you can make your own follow-up.

--Sean


