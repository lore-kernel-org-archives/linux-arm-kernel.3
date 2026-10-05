Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE769CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWvjrH2OoD5/C+DUCVNhJk1znVlYhkyyNM+I18Y3BXk=; b=iZMkAWVCrfrXjabVVaYjdlJ8xt
	5gPA3xuWtM4GufxjivP+0bhhmOvK2mC1oWj3SqNZnSbl+FIftPUmCFfaWcSLuq3G/vN8ROJ4FdZrT
	B3VpYXyFvYcOgnrfbYlaH1WVX4XiYsNTDvLRyxqwIHrPk5ZlVKXskS45Vv29eHZmjFzdT7PsXADUK
	c1hpzgubq8h3Mvq7BA3sI32k+FGBlc82sg/P7519YTvJf7sQ6FZxPzTQbv7sSW07gn3uf1n5UaPph
	1vLi7x9HV/Vh1s7zJCrzrBki8NFgPTr8ZgCKqYsplx0xKI7GE+MlamHN+NMqBwcPN3kpZ3K2T87PO
	ihKTEJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDn4C-0000000GyVq-0R5f;
	Mon, 05 Oct 2026 18:05:36 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDn48-0000000GyV7-2DEw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 18:05:34 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-3511f5f79e0so669448eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791223531; x=1791828331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWvjrH2OoD5/C+DUCVNhJk1znVlYhkyyNM+I18Y3BXk=;
        b=iuhka+YZKeB0mNkaFgQQpuPdL0r2Fq3OjyepoOaFSbn4CrVm3xzxqtj1C+/mp4TwmF
         +DUTWVCxOviAPfxQ65tFHrf+m0oUHac85H2/TPqyM32mVHOLPdGpL6iOSHTMRTGJQHb/
         XOahaHgNl+PnEhk/n99DG4NLeQMzF1CtCsvG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223531; x=1791828331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWvjrH2OoD5/C+DUCVNhJk1znVlYhkyyNM+I18Y3BXk=;
        b=YtmDmoEHlGZdSjXXmnJ6+PGn4L/jSB5wGe6rkgDt75zav1IKxyfhQnY073DVEhfF04
         VwqfUVwL81K9ttZ9fVd+bFKouGXeMOMd4aWv+XtEX2lh2kA81OvoUrXQangRpv0poqRH
         3V0BiG6VYb9F9lwrsYx5b2N/9nBCmShYrVedQ4jALpAbRy/L8fgVNw6wG89cbdxmJO0Q
         o4L4VuUKaGvQlrpyeFw8ZbbkmKJf2WrWkeonVLQlIahXBWIvvAQ5FxNIApeCalscZYGo
         5tdcxyMxPVoQzpb4uFMMaXPaFLLqPTfPWa8C2YLPK4GEsIa8dNy5p6EJ2dOh9gjvnzfn
         FbQg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ4VMKPvuar9v7UJRo4T+RxSDCJIRKdhNDImJjlDuhTPReQfvFGgK8IRDA9k6BtuqYk9oboiENvJTmxRrGIoFt@lists.infradead.org
X-Gm-Message-State: AFuF++ntV3SRaqyLr/Xbcskdi7pLx/j0+ZJq84OnOh+M4M0tLo8jB0xN
	zXutA/5JjPRPwW+JK4R4IMlrlSQEWMZbnCR1gVzYFomYf06o1xjSqSrHzUvWwhtk3g==
X-Gm-Gg: AYBFou1rfRaO2p6zDD/XlZHDBzQCZSByFWWao1iSERqfMA+OIl0tjVaDM8voK+OIIGX
	11Pt+9+CzzRFHFwBNK+MYvVYjtfOCXDyT6qx+NUPXkQK8v7XdcXg0uZBVz7QaL5Crg4RabZ8VUi
	OoxP5l0d9Up6xGkpM8cBBWfphQPgJDQfpbMkhNV1GMYfuWUJzzBl+M3Lq9mb5fmkh6SJXLHrP/Q
	f1jOCbmGV0PYR0uiVgoYX12poMbR/HrouxH8S6lPaPlHF2K5kSem6qev7xptbGD8qcmta2wYvM1
	97xTu+1+5hC6g/6TBZCQt2fKiACB8OVdT/FW/wxbpnjKq2aQGAk+LMajnzupRHJK7VRPkGo14Fl
	QmkkbPbM1oksuFyPHPGAi22pfLlqCM9+h0rBSROwAvtHAzGmJs2DO6Oo7btc21Bt6UIEXpApRpb
	vcr7UGC0nrwI3QFg3JCddmV4Xu58ea7mwK8eE83tg8KoJzdNOzrdz1sFA+xLPJ/QgbNLTVvzm/E
	o0aJq9z8d/L3hoSBKo9E2qqKDNgLDxYDrvU
X-Received: by 2002:a05:7022:294:20b0:155:4a09:a228 with SMTP id a92af1059eb24-15d25e09c5dmr375308c88.8.1791223530973;
        Mon, 05 Oct 2026 11:05:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:3452:be62:94e:a46d])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-15d819cb585sm54028c88.5.2026.10.05.11.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 11:05:30 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:05:28 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] PM: runtime: Propagate last_busy from dependent to
 dependency
Message-ID: <asPm6HYpEIAYJ4a3@google.com>
References: <20261002230714.507921-1-briannorris@chromium.org>
 <20261002160309.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <asEdiIT7l49vhn7i@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asEdiIT7l49vhn7i@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_110532_600947_B39135D1 
X-CRM114-Status: GOOD (  42.70  )
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

Hi Andy,

On Sat, Oct 03, 2026 at 06:21:44PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 02, 2026 at 04:03:07PM -0700, Brian Norris wrote:
> > When a child device suspends, it does not update the last_busy timestamp
> > for its parent. If that parent configured autosuspend and didn't
> > otherwise maintain its last_busy timestamp, it may now be immediately
> > eligible to suspend. This is probably not expected -- the parent should
> > wait for its autosuspend delay before suspending.
> > 
> > The effect of this behavior is that a parent device may suspend sooner
> > than its autosuspend delay, simply because its usage was accounted by
> > its children, and not by direct references to the parent device.
> > 
> > This was noticed in several cases, and some have implemented
> > workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fix
> > runtime autosuspend delay when slow polling"). At the same time, Ulf
> > suggested these problems "should be solved in the runtime PM core".
> > 
> > Instead of working around the problem in drivers, we propagate last_busy
> > timestamps from a dependent device to its dependencies any time it may
> > allow a dependency to suspend -- i.e., when releasing a refcount for its
> > parent or suppliers. We take care to only propagate the timestamp if it
> > is larger than the existing busy timestamp.
> > 
> > Note that this works best if the dependent device is using autosuspend
> > (and therefore updates its last_busy timestamps appropriately), but even
> > for a non-autosuspend child, this is still somewhat useful --
> > non-autosuspend devices still automatically update their last_busy every
> > time they resume.
> 
> > Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/
> 
> Because Linus might complain on odd Link tags, please make sure you have a
> reference to it in the text and place it in a form like
> 
> Link: $URL [1]
> 
> and respectively in the text use [1] as a reference.

OK, I'll update if/when v2 comes around.

> > Cc: Ulf Hansson <ulfh@kernel.org>
> 
> Can go under the '---' cutter, so it won't pollute the commit message in the
> Git history.

This is a well-documented convention.

Documentation/process/submitting-patches.rst

  If a person has had the opportunity to comment on a patch, but has not
  provided such comments, you may optionally add a ``Cc:`` tag to the patch.
  This tag documents that potentially interested parties have been included in
  the discussion.

I'm directly referencing Ulf's suggestions (Link tag), so I'm also
making it explicit that I'm CC'ing him.

> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> 
>  Cc: ...
> 
> ...
> 
> > +/*
> > + * Propagate last_busy timestamp from one device to another. This can, for
> > + * example, prevent overactive suspend when a dependency's usage is primarily
> > + * driven by one of its dependents.
> > + */
> > +static void rpm_propagate_last_busy(struct device *dev, struct device *target)
> > +{
> > +	s64 busy = atomic64_read(&dev->power.last_busy);
> > +	s64 target_busy = atomic64_read(&target->power.last_busy);
> > +
> > +	while (target_busy < busy)
> 
> But here you already have an outdated ones, no? Why is this not a problem?

The "target" device (a supplier or parent) can't suspend before this
point, because the dependent device still holds a reference -- so an
"outdated" last_busy is not relevant yet. The target last_busy *might*
become relevant after this point, so this is the point at which it needs
updated (propagated).

That's what I mean in the commit message by:

  propagate last_busy timestamps from a dependent device to its
  dependencies any time it may allow a dependency to suspend -- i.e.,
  when releasing a refcount for its parent or suppliers.

Please let me know if I should add some clarification somewhere --
perhaps also in the comments here on rpm_propagate_last_busy()? Or if
you see some other problem in the reasoning.

Regards,
Brian

> > +		if (atomic64_try_cmpxchg(&target->power.last_busy, &target_busy, busy))
> > +			return;
> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

