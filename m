Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50807C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p02jWear9ojHlPOPiERrKgnPe8UT/Y0nFaclwcK7tJQ=; b=sWYFqYUFZNbQSOXBXNRfmA15sG
	3q5FFj1kc6mlwKwvD/c39yQ5mHGi9889DGzj+DgulLtc+VL6UzXFCe5Ud+EBYZanb9krb4Bg+ObHF
	lXo/IOaxAnW+2WBY4vvujoiB/L1+oaNupr1syv370L02jsSTN2kLCkL+xopQHtWDeRCK1CvcbzkYa
	9zgxziCTZfs2Aua44nrfXvXI5CUy0RSOJh62L4f/cqehZaeevZ9VH5eSqVVL8VUYt/OIqrwI0LhEE
	0M98i/ErFsPA01uOZWSFbuZcOCSiU3ReBE+RKoh3YRVeuqp22THiZ7sYz4s1ETS+nGZ7pgWJxFXjW
	1LEqmX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLG5-0000000HGc2-0Cb1;
	Thu, 16 Jul 2026 12:32:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLG2-0000000HGbU-1qkD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:32:07 +0000
Date: Thu, 16 Jul 2026 14:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784205122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p02jWear9ojHlPOPiERrKgnPe8UT/Y0nFaclwcK7tJQ=;
	b=yJ+Rd6z3kDm9tqtkHB3J8VIwnZeM6p3zMqTumPqpPRCwzm8SAZ+TUc3mH91NZbhYOQhu6G
	cXgh738FDNQ9CVW7Ta9hHzBVVT5yJmPQ7pc4Rh8SmNqzioYQrAfJNbKFq0o4d7K++oEasa
	ykyHPIapw7jHnDor8mDwZewUuxsZ9gt+NTNvUwk9SOdNWmIltoNjGt6n/V5z1763IBTz/p
	LQbiTZkuq/MB5eBhotGeAI9B0+JNLdwaeWUiQZ10jlwfZUKNR87t++ci5bNzojWF9+7bPJ
	X40Tsile7avmFJMjS2i+mZaX4fcBUS+dJwUr1DKzsTgmVen86SC4gXFhCp13BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784205122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p02jWear9ojHlPOPiERrKgnPe8UT/Y0nFaclwcK7tJQ=;
	b=5YEyOcbgI0hkRCxiZAny+3KB16Z7IAlYfKIhWZ+N2TV/uAQBHBFJmOFzqX7GCJf0aZGgi5
	vKDWQfbZaAM8fDBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: MOHAMED AYMAN <mohamedaymanworkspace@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>,
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v2] coresight: Fix scheduling while atomic in
 coresight_put_percpu_source_ref()
Message-ID: <20260716123200.XCGRLZCH@linutronix.de>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260713230028.8046-1-mohamedaymanworkspace@gmail.com>
 <20260714104252.NuPnAQyJ@linutronix.de>
 <CABWZVho1=oJHU6U16Kc-Nh1bQbn07oz7PPkM9Diy=JS0beGjFQ@mail.gmail.com>
 <20260715065832.qI7c2Px5@linutronix.de>
 <CABWZVhq5yN6uP-YJC07EVt6+AqmGoUcXx8RTdrYssQ9coQ1Q5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABWZVhq5yN6uP-YJC07EVt6+AqmGoUcXx8RTdrYssQ9coQ1Q5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_053206_623511_463A1E4A 
X-CRM114-Status: GOOD (  12.45  )
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

On 2026-07-16 06:07:35 [+0300], MOHAMED AYMAN wrote:
> Hi Sebastian,
Hi,

> The fix would simply be rewriting `coresight_cpu_get_active_path()` like this:
> 
> static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mode)
> {
> struct coresight_device *source;
> struct coresight_path *path = NULL;
> 
> guard(raw_spinlock_irqsave)(&coresight_dev_lock);
> 
> source = per_cpu(csdev_source, smp_processor_id());
> if (source && (coresight_get_mode(source) & mode))
> path = source->path;
> 
> return path;
> }
> 
> This means we don't need `coresight_put_percpu_source_ref()` inside
> the PM path at all.
> 
> Does this align with your suggestion !??
> If so, I will prepare a v3 patch that drops the workqueue architecture
> entirely and just applies this much simpler fix..

It looks doable. I don't know what the lifetime expectation is of the
`path' but this returns `path' object on the same rules without the
get/put dance. So yes, why not.

> Best regards,
> Mohamed Ayman

Sebastian

