Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TRchubrT;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EV5pIRmA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ia3DNRbB3tzN83nGHEc/6FKqQVPdb5ypWXD/ZK/mfh0=; b=TRchubrTPBDGGhvPLYrHZTcEAP
	zgJA3pqTOAqkdyUjoX1p1dUpLAsh8wkZzvK2yK/ABpDeGyWSd+REkCDiE/QMR+NnAOsT+7tjXQrO3
	cvI3qG0MCUK9G/AHcgQAwwklhicdT9ZgGM7voSskC+b/ZNdqJajL1YRzuOBYtnID2hlo1pM//C6gH
	J67bqaOUX56I2EAXCCAiZsNzBY4DlGHZDZW1KB69xWFw3D8YdK0QzNWAIauSblgKwhPVRl6E7D5yv
	I5kC+p1cXAB/w2yOlKiAZ3VgmT1mlWeM1QkUYPfKrVBQjDzgvBruOzKyQ+N98qdjxtrm260s/NCRN
	MELd5NOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOvr-0000000404R-1RWJ;
	Wed, 04 Nov 2026 00:32:51 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOvp-00000004041-0Y2J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 00:32:50 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso283620eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 16:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793752368; x=1794357168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ia3DNRbB3tzN83nGHEc/6FKqQVPdb5ypWXD/ZK/mfh0=;
        b=EV5pIRmAVYM9YcMTkXiQdRQssXkTX4LuBimlzyMDsLONJascKE0+P+5QXt1NAFjSqQ
         bB3gc/B80cO2Oy/inavwd95ykTudTYA29H8CIPR9/cm0ruFWpsxJ8LUHfNyspuHSdUAR
         UnXbfsCtBvA4V8E+K9BSKnJAM3nUhQYXUfBLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793752368; x=1794357168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia3DNRbB3tzN83nGHEc/6FKqQVPdb5ypWXD/ZK/mfh0=;
        b=rWPi6eK/LCx4G3xqhuX/1LdFPSyP9Tdytxb9osawiQ2I/dldn0vBAM+o6xuk6AGqIG
         /k/04nlx9NryNiRmvuFy7iY5efmZCGowwuNIhvlU+Rf+PYx8UDDcv8FhB2dvSKguq5en
         kscFb8AH/2p+ZdwCPlzSz8jdKqHdhH725wB34ACovmiUkuBcOOX2HZOFiv52WYeBkei+
         /KzeAf7lIRdYw+uM0OhUY1i1rVdC/myNtGdypFb45gR9n2tDGwvx9/xVId1P8wvA0fu/
         uojKWeofD68xQGlsLeUkEn/cvJTTtqOFNZ55chak77boUoDwewiQh3/47Nmjd9AqdfZ5
         UrVA==
X-Forwarded-Encrypted: i=1; AKwUvBzmgp+vN5b/RNrtj/nvxjIjyJ+yxMI18bHDekJArK3SkAcDT5LuuvvUu8AZ9BL6lheC/gMuWVfdQj1QevGitDNU@lists.infradead.org
X-Gm-Message-State: APuU4Z9+mbI+GzgXpI0gKOEx6N7RiR+1YDU9KNVMVMfgcfw9gawhNlvu
	CvT5VwPrhDItszM1K2H2iqoBEOt/+Tdspc7yEvHFsJCH8b6G/OxsP9/U10xrjK0vRwAiZWG309f
	b4Ao=
X-Gm-Gg: AYBFou188hrN3V3dj3nbzh9M8dknB4+WxevQvLZnb3n1JAVEOOdfOqVmwe1qYvj4Jgb
	3wTe+4/2+++Aq1DnMKFBUE6X0Apg/tZBS97SvgnAQhr8G0YDWEZ1rmLSADUhRddOMIwtjuKLBXe
	2D8LupnKnhHJ0tpNFd0P/B9p+cBwexYqymbnePLpQW4c8sqB+t5RzcTfl+Oh742NZojzhr7ZMiw
	AUoF9T3eOrnd5lpSXXL6CtGs3S/l5iUEiHBkmnlBrnrcuZefgMHl8/eqIr63lcqbmD1WcWON0Y7
	MjgQn1h8uiWuLn8+QhOOa+Yx/QEgHIjt6SjNsqiodmtLg2hxGTG06LxHTWvFTQiZB8ZWtkyOCCF
	iV9AvSX5QC26OCggbbgdVuQgWQfqZNx86WNF25NXGyzJxahJSb+YVGW3388lxOOMX+sAqvo1+zM
	E4TWhcdJ665Sj6uNyUjlaeWACdrI8ArqyGBG2Lm2lxS0pwsYMI6Rmuz++CFnZtLWP1oDs43ZBWs
	1kXWZmYgCS+FMp4UKGUFnzvzMy//12iFLNPR/mB2Uwhc1qTEjyB+y9DCIuPb5AgC65/uVjxKTY0
	Wu/GfFw/r0gvNDySGfs3/ocrZD1aMGZz8lgYpWMG7W+VRjEJKT4mvmp68zO/J8ay5cQ=
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr22173192eec.3.1793752367673;
        Tue, 03 Nov 2026 16:32:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca38a54ccsm2074587eec.4.2026.11.03.16.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:32:46 -0800 (PST)
Date: Tue, 3 Nov 2026 16:32:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <aup9LKewaLr2B5cR@google.com>
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <20261103231719.486a18de@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103231719.486a18de@jic23-hlaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_163249_239699_6B299507 
X-CRM114-Status: GOOD (  59.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan,

On Tue, Nov 03, 2026 at 11:17:19PM +0000, Jonathan Cameron wrote:
> On Tue,  3 Nov 2026 14:14:41 -0800
> Brian Norris <briannorris@chromium.org> wrote:
> 
> > When a child device suspends, it does not update the last_busy timestamp
> > for its parent. If that parent configured autosuspend and didn't
> > otherwise maintain its last_busy timestamp, it may now be immediately
> > eligible to suspend. This is probably not expected -- the parent should
> > wait for its autosuspend delay before suspending.
> 
> So reading this again - I wonder if this text is describing the
> expected behaviour.

Agreed, this might give the wrong impression, depending on the
assumptions the reader makes about autosuspend delay. (I think I had a
particular problem scenario in mind, but didn't translate that properly
here.)

> If the child is also using autosupend then, in extreme case, that time
> might be longer than the autosuspend time of the parent.
> If so it seems odd the parent still waits.

Right, that seems wrong, and indeed that's not what this patch does.

> So most expected to me
> would be if the parent were to suspend it's autosuspend time after
> the parent or child was last used for something that indicate a
> desire not to suspend (that shouldn't include actions the child
> did whilst suspending).

(Not sure I'm parsing this sentence quite right, but...)

The point is that last_busy should propagate (rather than, say, the
expiration time). So each device still gets its own-delay-based
autosuspend timer expiration. That may mean the parent waits longer than
the child, but it may not, if the child's delay was longer than the
parent's.

> Maybe there isn't a sensible way to deal with this and what you have here
> is the best we can do.  Note that this is just commenting on this
> statement in the commit description.  From what follows I think
> this is just a commit description thing rather than functional.

If I'm understanding what you're saying correctly: maybe it would be an
improvement here to say:

  If that parent configured an autosuspend delay longer than its child's
  and didn't otherwise maintain its last_busy timestamp, it may now be
  immediately eligible to suspend.

I think that would more accurately describe the target problem, even if
it doesn't cover all cases (such as when the parent delay is shorter).

> > The effect of this behavior is that a parent device may suspend sooner
> > than its autosuspend delay, simply because its usage was accounted by
> > its children, and not by direct references to the parent device.
> 
> Sooner is indeed bad.
> 
> > 
> > This was noticed in several cases, and some have implemented
> > workarounds, such as in commit c537d3457542 ("iio: adc: stm32-adc: fix
> > runtime autosuspend delay when slow polling"). At the same time, Ulf
> > suggested these problems "should be solved in the runtime PM core" [1].
> > 
> > Instead of working around the problem in drivers, we propagate last_busy
> > timestamps from a dependent device to its dependencies any time it may
> > allow a dependency to suspend -- i.e., when releasing a refcount for its
> > parent or suppliers. We take care to only propagate the timestamp if it
> > is larger than the existing busy timestamp.
> 
> So this sounds fine but I don't think aligns with that first paragraph.
> 
> > 
> > Note that this works best if the dependent device is using autosuspend
> > (and therefore updates its last_busy timestamps appropriately), but even
> > for a non-autosuspend child, this is still somewhat useful --
> > non-autosuspend devices still automatically update their last_busy every
> > time they resume.
> 
> Can we set the last busy on the suspend of child devices that aren't
> suspending as a result of autosuspend timeout but for other reasons?
> (may be some fiddly corners!)

Do you have concrete use cases in mind, or do you bring this up simply
because of my note?

For one, I feel like for devices with power.use_autosuspend==true, it's
reasonable to expect drivers to use the appropriate helpers to update
last_busy at the appropriate times, and so any "corner cases" are from
misuse.

But if you mean non-use_autosuspend devices: I suppose it'd be possible
but I haven't reasoned through the implementation very far yet. It
almost seems like we'd need to plumb pm_runtime_mark_last_busy() into
*all* the put() helpers, including the non-autosuspend ones
(pm_runtime_put(), pm_runtime_put_sync()). I'm not quite sure if that's
desirable. But I could try to look a bit more, if you think there are
important use cases that would need this.

Brian

> > Link: https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/ [1]
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> > Cc: Ulf Hansson <ulfh@kernel.org>
> > 
> > Changes in v2:
> >  * Update comments to explain when/why rpm_propagate_last_busy()
> >    performs the update
> > 
> >  drivers/base/power/runtime.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index 2a117d6a776f..dd306cbabcd3 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -318,6 +318,22 @@ static int rpm_get_suppliers(struct device *dev)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Propagate last_busy timestamp from one device to another, typically when a
> > + * device (@dev) releases a reference count on a dependency (@target) and might
> > + * allow it to (auto)suspend. This can, for example, prevent overactive suspend
> > + * when a dependency's usage is primarily driven by one of its dependents.
> > + */
> > +static void rpm_propagate_last_busy(struct device *dev, struct device *target)
> > +{
> > +	s64 busy = atomic64_read(&dev->power.last_busy);
> > +	s64 target_busy = atomic64_read(&target->power.last_busy);
> > +
> > +	while (target_busy < busy)
> > +		if (atomic64_try_cmpxchg(&target->power.last_busy, &target_busy, busy))
> > +			return;
> > +}
> > +
> >  /**
> >   * pm_runtime_release_supplier - Drop references to device link's supplier.
> >   * @link: Target device link.
> > @@ -348,6 +364,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
> >  		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
> >  			continue;
> >  
> > +		rpm_propagate_last_busy(dev, link->supplier);
> >  		pm_runtime_release_supplier(link);
> >  		if (try_to_suspend)
> >  			pm_request_idle(link->supplier);
> > @@ -710,6 +727,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> >  
> >  	if (dev->parent) {
> >  		parent = dev->parent;
> > +		if (!parent->power.ignore_children)
> > +			rpm_propagate_last_busy(dev, parent);
> >  		atomic_add_unless(&parent->power.child_count, -1, 0);
> >  	}
> >  	wake_up_all(&dev->power.wait_queue);
> > @@ -1368,8 +1387,10 @@ int __pm_runtime_set_status(struct device *dev, unsigned int status)
> >  		goto out_set;
> >  
> >  	if (status == RPM_SUSPENDED) {
> > -		atomic_add_unless(&parent->power.child_count, -1, 0);
> >  		notify_parent = !parent->power.ignore_children;
> > +		if (notify_parent)
> > +			rpm_propagate_last_busy(dev, parent);
> > +		atomic_add_unless(&parent->power.child_count, -1, 0);
> >  	} else {
> >  		spin_lock_nested(&parent->power.lock, SINGLE_DEPTH_NESTING);
> >  
> 

