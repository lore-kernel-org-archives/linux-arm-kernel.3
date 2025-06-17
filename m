Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442B9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlgzY9KP7sb5X6ajRg/ewRR3cFUCUpJ/f+SKqBuA9rs=; b=FRfNuXWXzZs5CO/mIQkM4+Pj4O
	A1QcK5/gwZyQfVCfI0IA2rAaHuJP2fHMRnhp6TwRicxRvzMoOFAF3ldBHfJup6tZjI5Z8hLmGQKmm
	1wHMLxWseOZhDRp3V50ytlOl0Li33DH2I54SILTAYpG27gD30V4JyMqdF33RuCOn17kgdf9MWDvll
	uORbDGBSerIymjR9ONCEjTHTZBlkSzNgDWxDGBU3aFv9PmL6Zb9tc4zN5cPWziSRpfL4lJAlCiQI7
	csfm5LHe1E73mDTAkm/5wvGlpsIbXECTd9mW3jI/f5ATrQt9GVGQGzcvhUEKXFQZb+KLJ0UajhR7V
	2hraMrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWvX-00000007TGD-3Eb2;
	Tue, 17 Jun 2025 14:04:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWZS-00000007OQM-2VHu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:41:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 185CE150C;
	Tue, 17 Jun 2025 06:41:27 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CACFB3F673;
	Tue, 17 Jun 2025 06:41:46 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:41:44 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/3] firmware: arm_scmi: perf/cpufreq: Enable
 notification only if supported by platform
Message-ID: <aFFwmBTPKr_evCnY@pluto>
References: <20250611-scmi-perf-v1-0-df2b548ba77c@nxp.com>
 <20250611-cherubic-solemn-toucanet-aac5af@sudeepholla>
 <aEmFnJVG8lXTDNmO@pluto>
 <20250612034351.GA7552@nxa18884-linux>
 <aEqsZWSlq9wKv10a@pluto>
 <20250613095059.GA10033@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613095059.GA10033@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064150_793630_F8290E2C 
X-CRM114-Status: GOOD (  54.83  )
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

On Fri, Jun 13, 2025 at 05:50:59PM +0800, Peng Fan wrote:
> Hi Cristian,
> 
> On Thu, Jun 12, 2025 at 11:31:01AM +0100, Cristian Marussi wrote:
> >On Thu, Jun 12, 2025 at 11:43:52AM +0800, Peng Fan wrote:
> >> On Wed, Jun 11, 2025 at 02:33:37PM +0100, Cristian Marussi wrote:
> >> >On Wed, Jun 11, 2025 at 01:17:11PM +0100, Sudeep Holla wrote:
> >> >> On Wed, Jun 11, 2025 at 03:52:42PM +0800, Peng Fan (OSS) wrote:
> >> >> > PERFORMANCE_NOTIFY_LIMITS and PERFORMANCE_NOTIFY_LEVEL are optional
> >> >> > commands. If use these commands on platforms that not support the two,
> >> >> > there is error log:
> >> >> >   SCMI Notifications - Failed to ENABLE events for key:13000008 !
> >> >> >   scmi-cpufreq scmi_dev.4: failed to register for limits change notifier for domain 8
> >> >> > 
> >> >> 
> >> >
> >> >Hi,
> >> >

Hi,

> >> >I had a quick look/refresh to this stuff from years ago...
> >> >
> >> >...wont be so short to explain :P
> >> >
> >> >In general when you register a notifier_block for some SCMI events,
> >> >the assumption was that a driver using proto_X_ops could want to register
> >> >NOT only for proto_X events BUT also for other protos...in such a case you
> >> >are NOT guaranteed that such other proto_Y was initialized when your
> >> >driver probes and tries to register the notifier...indeed it could be
> >> >that such proto_Y could be a module that has still to be loaded !
> >> >
> >> >...in this scenario you can end-up quickly in a hell of probe-dependency
> >> >if you write a driver asking for SCMI events that can or cannot be still
> >> >readily available when the driver probes...
> >> >
> >> >....so the decision was to simply place such notifier registration requests
> >> >on hold on a pending list...whenever the needed missing protocol is
> >> >loaded/inialized the notifier registration is completed...if the proto_Y
> >> >never arrives nothing happens...and your driver caller can probe
> >> >successfully anyway...
> >> >
> >> >This means in such a corner-case the notifier registration is sort of
> >> >asynchonous and eventual errors detected later, when the protocol is
> >> >finally initialized and notifiers finalized, cannot be easily reported
> >> >(BUT I think we could improve on this ... thinking about this...)
> >> >
> >> >...BUT....
> >> >
> >> >....this is NOT our case NOR the most common case...the usual scenario,
> >> >like cpufreq, is that a driver using proto_X_ops tries to register for
> >> >that same proto_X events and in such a case we can detect that such
> >> >domain is unsupported and fail while avoiding to send any message indeed....
> >> >
> >> >....so....:P...while I was going through this rabbit-hole....this issues
> >> >started to feel familiar...O_o....
> >> >
> >> >... indeed I realized that the function that you (Peng) now invoke to
> >> >set the per-domain perf_limit_notify flag was introduced just for these
> >> >reasons to check and avoid such situation for all protocols in the core:
> >> >
> >> >
> >> >commit 8733e86a80f5a7abb7b4b6ca3f417b32c3eb68e3
> >> >Author: Cristian Marussi <cristian.marussi@arm.com>
> >> >Date:   Mon Feb 12 12:32:23 2024 +0000
> >> >
> >> >    firmware: arm_scmi: Check for notification support
> >> >    
> >> >    When registering protocol events, use the optional .is_notify_supported
> >> >    callback provided by the protocol to check if that specific notification
> >> >    type is available for that particular resource on the running system,
> >> >    marking it as unsupported otherwise.
> >> >    
> >> >    Then, when a notification enable request is received, return an error if
> >> >    it was previously marked as unsuppported, so avoiding to send a needless
> >> >    notification enable command and check the returned value for failure.
> >> >    
> >> >    Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >> >    Link: https://lore.kernel.org/r/20240212123233.1230090-2-cristian.marussi@arm.com
> >> >    Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> >> >
> >> >
> >> >...so my suspect is that we are ALREADY avoiding to send unneeded
> >> >messages when a domain does NOT support notifications for ALL
> >> >protocols...it is just that we are a bit too noisy...
> >> >
> >> >@Peng do you observe the message being sent instead ? (so maybe the
> >> >above has a bug...) or it is just the message ?
> >> 
> >> Just the message.
> >> 
> >> arm-scmi arm-scmi.0.auto: SCMI Notifications - Notification NOT supported - proto_id:19  evt_id:0  src_id:8
> >> SCMI Notifications - Failed to ENABLE events for key:13000008 !
> >> scmi-cpufreq scmi_dev.4: failed to register for limits change notifier for domain 8
> >> 
> >> It just make user has a feeling that there must be something wrong, especially
> >> those not know the internals.
> >
> >Yes indeed it is too much noisy...
> >
> >> 
> >> And from the error message, "Failed to ENABLE events for key..", we not
> >> know which protocol, and whether notification supported.
> >> 
> >> I was thinking to propogate the error value, but __scmi_enable_evt
> >> always use -EINVAL if not success.
> >> 
> >
> >I suppose, if you want also to save cycles that you could mark internally a
> >protocol, at init time, as NOT suporting notifs (if you can detect that no domain
> >is supported OR the related notfs commands are NOT available) and then
> >bailing out early with -ENOTOPSUPP when trying to register a new
> >notifier (amd muting all the errs to dbgs....) so that the caller can
> >warn if wanted or not...
> 
> Since you have more expertise in this area, do you have plan to improve here?
> 
> If no, I will give a look and see what I could do, but surely needs your
> suggestion.

... (would be) Happy to help but I dont have so much bandwidth as of now...I will
send you in reply to this an half-baked/UNTESTED patch to express what I
meant....

> 
> >
> >> >
> >> >> I wonder if it makes sense to quiesce the warnings from the core if the
> >> >> platform doesn't support notifications.
> >> 
> >> If not quiesce, we might need to make it clear from the error message,
> >> saying whether X events are supported for Y protocols or not, not just
> >> a "Failed to ENABLE events for key.."
> >> 
> >
> >Yes that was a very early and primitve errors message of mine...my bad :D
> 
> How about this?
> -------------------------------
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index e160ecb22948..1e5a34dc36ab 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -1184,6 +1184,11 @@ static inline int __scmi_enable_evt(struct scmi_registered_event *r_evt,
>  							 src_id);
>  				if (!ret)
>  					refcount_set(sid, 1);
> +				else
> +					dev_err(r_evt->proto->ph->dev,
> +						"Enable Notification failed - proto_id:%d  evt_id:%d  src_id:%d, %pe",
> +						r_evt->proto->id, r_evt->evt->id,
> +						src_id, ret);
>  			} else {
>  				refcount_inc(sid);
>  			}
> @@ -1313,12 +1318,7 @@ static void scmi_put_active_handler(struct scmi_notify_instance *ni,
>   */
>  static int scmi_event_handler_enable_events(struct scmi_event_handler *hndl)
>  {
> -	if (scmi_enable_events(hndl)) {
> -		pr_err("Failed to ENABLE events for key:%X !\n", hndl->key);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> +	return scmi_enable_events(hndl)
>  }

I was thinking more about something to cut way before the notifier
registration process...

I'll send you something I played with last week..

Thanks,
Cristian

