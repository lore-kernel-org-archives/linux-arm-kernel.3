Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB185C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 01:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yd4ItzRGNHbICJzatUJZS8IxfCEz4mUGAMBgyagfjUE=; b=3JmCT/xxpTQTTaJANi5nd++xGY
	CK7RP+jehgD2TMDdY13xhWo0zZUBz5ZI5+X5Dk/6UQi6dKsjtH5T6UWXI2nErzKMQw0dkWpKOnwxL
	el1RfTlLTJQsQ6c6PxVUW1Dg73BXZ3KO3ecF0dU/INkAFK10lqKYXuDxBhYpXHjCRYXd/IZ6Pz9oP
	KG6IlROJL6gnPDlGuTFFF5uPZV11JUFk+Y+8oMAAkhTMyUUQWomPVVN30lYBvJqHBQQxizkjPB4Yz
	CUr367RPdEjsfpsfzNhm3rPb0KnkoG18kF6nqs4H7Uya3mtQPaYtTcl8NCox58wCM5vjytbjs3E1p
	jSZOnJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxAG-00000006Bb9-1SzN;
	Wed, 29 Jan 2025 01:46:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcx8v-00000006BQV-2ueF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 01:45:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A42DA41306;
	Wed, 29 Jan 2025 01:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3927EC4CED3;
	Wed, 29 Jan 2025 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738115124;
	bh=CWzXW0bIMSURgr0c3IY4/tvstyV6bj1ozJj9dzgjU1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tJt4ZVW0p8weQsSPDZjLgTUab4flB9ZDeO3oV5MFy7mrenPn2R71XljjJYKAkhnrm
	 UCkaqQqT+OZAhF0CZcDf6w+z1Qt+gQsQ5OCNAxgM1rmArls+WMymb4Mq830RmFCoKO
	 +qFwvjNxZ5/w+Tx4QkGkdy0DNTUbSSpw6PslUzb5XdvZf0l8UzSKbhwOCZjyb+SnY9
	 q6L5Zj8WJL2S1/bLsi4d6YQV8UUltZT+eHdIQb3MT8SpdgDLFwbf9U5bSybrLtzkIN
	 sufR1bq3uvCWQSqMly5wDlwj2bsOCg3IPtP8q6yZFB3HIxEpMDKVAt03sxW/8L9VE6
	 rHgpPPhwR2yMg==
Date: Wed, 29 Jan 2025 02:45:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [RFC v2 00/38] Improve ABI documentation generation
Message-ID: <20250129024518.69c0be81@foz.lan>
In-Reply-To: <87h65i7e87.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<87h65i7e87.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_174525_884163_9F3B7B9C 
X-CRM114-Status: GOOD (  44.83  )
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

Em Tue, 28 Jan 2025 15:42:00 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon/Greg,
> >
> > That's the second version of my RFC patches meant to modenize the ABI
> > parser that I wrote in Perl.  
> 
> I have a couple of minor comments on the individual patches, but overall
> I do like this direction.
> 
> It would be nice, though, if the code were a bit more extensively
> commented.  Parts of it get into the "twistly maze of regexes" mode that
> can be awfully hard to follow.

The regex code is indeed complex, but documenting it is not an easy task.
Btw, they are (about) the same that the Perl script does. imported also
the documentation for there. I did some extra cleanups/optimizations there,
though, after checking the results of some expressions.

The big issue is that we don't have an uniform way of defining What: 
expressions. So, each subsystem (and/or author) document it in different
ways.

There are even some ABI symbols with:

	$(readlink)/sys/...

(I intend to send a patch for those later on)

and:

	What: /sys/something/...

	What: .../something_else

(I guess ".../" means "/sys/something/...", but I can't be sure, as this
is on one driver for a hardware I don't have - so, if I send a patch,
I may end breaking it)

If you want to understand how the whole set of regexes work, you can
run:

	$ ./scripts/get_abi.py -d 16 undefined --dry-run >/dev/null
...
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/\w+/current_value <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/current_value
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/\w+/target_metric <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/target_metric
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/\w+/target_value <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/target_value
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/goals/nr_goals     <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/nr_goals
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/ms                 <== /sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/ms
	[DEBUG] /sys/kernel/mm/damon/admin/kdamonds/\w+/contexts/\w+/schemes/\w+/quotas/reset_interval_ms  <== /sys/kernel/mm/
...

This will place at stderr all regular expressions that are currently
parsed (they're currently used only for /sys symbols).

Yet, instead of spending too much time documenting them, IMO we shold
do the do the reverse: use the AbiRegex class to convert "What:" into
a new tag (like "Regex:") and use it as much as possible (we'll still
need "What:" for some things that aren't devnodes), as, with regular
expressions, symbols can be clearly documented. As on python match groups
can be named with:

	(?P<name>...)

this could be used to better describe some arguments, e.g. (picking an
easy case):

	What: /sys/module/<MODULENAME>/srcversion

could be described, instead, as:

	Regex: /sys/module/(?P<MODULENAME>[\w\-]+)/srcversion

The Kernel_abi extension (actually AbiParser class) can either display it
as-is (my personal preference), or even replace:
	(?P<MODULENAME>[\w\-]+)
with:
	MODULENAME

and still output this at html/pdf output as before, e. g.:

	What: /sys/module/<MODULENAME>/srcversion

Yet, doing it on a consistent way.

This is easier said than done, as if we do some automatic conversion,
subsystem reviewers/maintainers will need to double-check if the
converted expressions make sense.


> > On this series we have:
> >
> > patches 1 to 11: several bug fixes addressing issues at ABI symbols;  
> 
> 1-3 aren't needed - it seems you already upstreamed #2?
> 
> For the rest, is there any reason to not apply them right away?  They
> just seem like worthwhile fixes.
> 
> > patch 12: a fix for scripts/documentation-file-ref-check
> > patches 13-15: create new script with rest and search logic and 
> >   minimally integrate with kernel_abi Sphinx extension(phase 1);
> > patches 16-19: implement phase 2: class integration (phase 2);
> > patch 20: fix a bug at kernel_abi: the way it splits lines is buggy;
> > patches  21-24: rewrite kernel_abi logic to make it simpler and more
> >   robust;
> > patches 25-27: add cross-reference support at automarkup;
> > patches 28-36: several ABI cleanups to cope with the improvements;
> > patch 37: implement undefined command;
> > patch 38: get rid of the old Perl script.
> >
> > To make it easier to review/apply, I may end breaking the next version
> > on a couple of different patchsets. Still it would be nice to have more
> > people testing it and providing some feedback.  
> 
> I've looked over everything, though with limited depth. 

> My testing hasn't turned up any problems.  

Great!

> I've only tested with current Sphinx,
> have you tried this with the more ancient versions we support?

Not yet, but I double-checked at Sphinx documentation to be sure that
I won't be using any newer methods: I just kept using the same Sphinx
API as used by other extensions at the Kernel.

For instance this loop:

    def do_parse(self, content, node):
        with switch_source_input(self.state, content):
            self.state.nested_parse(content, 0, node, match_titles=1)

was changed on Sphinx 7.4[1], and even nested_parse(match_titles=1) is
not the recommended code for versions < 7.4, as there is this 
replacement function:

	nested_parse_with_titles()

Yet, as they're working fine at least up to version 8.1.3, we can
keep using the old way.

In any case, I'll do a test before sending the final version to see if
it works fine with our minimal version.

[1] See: https://www.sphinx-doc.org/en/master/extdev/markupapi.html

- 

On a separate discussion, I noticed one potential compatibility issue
we may have with future Python versions, due to some ascii texts
formatted as unicode. I'll send later a patch fixing them.

Additionally, automarkup has backward-compatible code with Python 2.7.
 Can I send patches dropping 2.7 support from Sphinx extensions?

> [It's probably time to raise our minimum version again, especially now
> that current Sphinx has better performance.]

Agreed. 

IMO, we should also increase Python's minimal version.

> I don't see a whole lot of reasons not to apply this set shortly after
> the merge window; anybody disagree?

Thanks,
Mauro

