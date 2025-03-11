Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0884C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuhhkVCaq200BidCZCd/5Op0PcF3LeJ/HV7WJX6zHWE=; b=5EkSdgBX+/PNDp1jbbF6gPe39s
	+ivmD5MewCeESvC75To3ts5PNJORhxCu+nwejyjoyOmvK+ZeOBkpq8k/zWDF6KhzrsktQZNPIPSa7
	tEFla/oLqs9e0+KC7zoR3RIiAMXVjCR/RjMIixjvE4QtJ38nJUiThoX+i09/OTQsebZmuXQ2gwNvW
	FpzfaZjzp5hSX3loA3D5iyoHZBKF85xfxhWi2xbq59q70zNaj96hbnhkazI2F2a43oXmMP+QKMBLW
	m4Tz5k6FnK4EU3r3emiIfnBjZVDTjKqvSMVk+kxSmm0J/7N6/PrCZ/eUPC+dqNflzptXUQc1EjG8Q
	99zDGyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts08E-00000005uEW-1clN;
	Tue, 11 Mar 2025 13:58:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts06a-00000005u7q-3EKA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:57:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E97F01515;
	Tue, 11 Mar 2025 06:57:19 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F20B3F694;
	Tue, 11 Mar 2025 06:57:08 -0700 (PDT)
Date: Tue, 11 Mar 2025 13:57:04 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, yeoreum.yun@arm.com,
	Mike Leach <mike.leach@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linux.dev>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
Message-ID: <20250311135704.GK9682@e132581.arm.com>
References: <20241210144933.295798-1-james.clark@linaro.org>
 <20250311102200.GJ9682@e132581.arm.com>
 <898f1265-522f-44aa-a7da-879870b18807@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <898f1265-522f-44aa-a7da-879870b18807@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_065712_855909_377049F1 
X-CRM114-Status: GOOD (  21.34  )
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

On Tue, Mar 11, 2025 at 10:51:39AM +0000, James Clark wrote:

[...]

> > > +Sink selection
> > > +~~~~~~~~~~~~~~
> > > +
> > > +An appropriate sink will be selected automatically for use with Perf, but since
> > > +there will typically be more than one sink, the name of the sink to use may be
> > > +specified as a special config option prefixed with '@'.
> > > +
> > > +The available sinks are listed in sysFS under
> > >   ($SYSFS)/bus/event_source/devices/cs_etm/sinks/::
> > > 
> > >          root@localhost:/sys/bus/event_source/devices/cs_etm/sinks# ls
> > >          tmc_etf0  tmc_etr0  tpiu0
> > 
> > Just a minor comment.  To reflect the latest hardware, it is good to
> > mention the TRBE case, users should not and cannot specify TRBE as the
> 
> Is that strictly true? From looking at the code I think you could pick one
> TRBE sink as long as you are only tracing from a single ETM. Although yeah
> it would be pointless.

My testing result shows perf reports error when specifying trbe as sink:

  # perf record -e cs_etm/@trbe0/ -- ls
  failed to mmap with 12 (Cannot allocate memory)

But I can make success for the command:

  # perf record -C 0 -e cs_etm/@trbe0/ -- ls
  [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.062 MB perf.data ]

This makes sense to me that if a perf session tries to enable trace for
multiple CPUs but only a CPU sink is supported, the driver should
report error to remind users the command does not work.

> > sink name.  The driver will give priority for TRBE by default unless
> > users specify other sink types.
> > 
> 
> IMO mentioning TRBE would be overly wordy and not really add anything.
> Removing the sink from all the base examples is exactly to make TRBE work
> without going into detail about why. And the advanced section doesn't
> mention TRBE because manually picking it is never right.

The section "Sink selection" applies _only_ to traditional sinks, not
to TRBE.  I am not sure if we should clarify a bit for this.  I don't
have strong opinion on it, as it is a trade-off between providing
necessary info and avoiding overstatement.

So this patch is fine for me:

Reviewed-by: Leo Yan <leo.yan@arm.com>

