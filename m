Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6815AD10F57
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4ZACvZN4e7m5Wj94oC6CLiZ9C/OHUbffosQqEyMD68=; b=Ofu5gDgum3hIjyFL+YU/2HKm+P
	bkeK7u+NCmw73JT3OM/eQ8L2xUIhKA0CE5NYqZ+lQHRLdYvyR5czNkh4MBl7SNhjrtIhDWXaasTpj
	isKzEpJiBXCIS+PzSycLhOIng78ed6zoFyFVuXBuEIjop7Qu37sZZbUqr+paBYhQjUL+XOzy21kzC
	vFMo8u9VrBk8aZXi3fB42ERZuOrnhDWvgzcA3YsSL5AV0vREmGsr1ElQYVur9+MFiYrL3sCGEtAhJ
	MBvonueui5qiAom1lmSS4E7zQJ6JfzodRzntvaog6ghevq0PdA+WCyhtKfulGXrs6tMtKRWDflstX
	+/ODRRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGlB-0000000F7wR-1ef8;
	Wed, 26 Nov 2025 14:44:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGl7-0000000F7vs-316E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:44:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 882F9168F;
	Wed, 26 Nov 2025 06:44:32 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FFB53F73B;
	Wed, 26 Nov 2025 06:44:39 -0800 (PST)
Date: Wed, 26 Nov 2025 14:44:37 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251126144437.GL724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_064441_927142_D126287A 
X-CRM114-Status: GOOD (  24.46  )
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

On Wed, Nov 26, 2025 at 02:20:14PM +0000, Mike Leach wrote:

[...]

> > >     * - timestamp
> > > -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> > > -       <coresight-timestamp>`
> > > +     - Controls generation and interval of timestamps.
> > > +
> > > +       0 = off, 1 = minimum interval .. 15 = maximum interval.
> > > +
> > > +       Values 1 - 14 use a counter that decrements every cycle to generate a
> > > +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
> > > +       - 1). If the value is 1 then the reload value is 1, if the value is 11
> > > +       then the reload value is 1024 etc.
> > > +
> > > +       Setting the maximum interval (15) will disable the counter generated
> > > +       timestamps, freeing the counter resource, leaving only ones emitted when
> > > +       a SYNC packet is generated. The sync interval is controlled with
> > > +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
> > > +
> 
> What is the default value?

From driver's pespective, the default value is 0 (disabled).  We do
set default values in perf:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm/util/cs-etm.c#n444

IIUC, the default value would be the same with or without this series.

> As far as I recall when this command line parameter was a bool then:
> perf -e cs_etm/timestamp/ <program>
> is sufficient to turn on timestamping.

Hmm... with the latest perf, we must assign value to `timestamp`,
otherwise perf will report error:

  # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
  event syntax error: 'cs_etm/timestamp/'
                       \___ Bad event or PMU
  
  Unable to find PMU or event on a PMU of 'cs_etm'
  
  event syntax error: 'cs_etm/timestamp/'
                       \___ no value assigned for term
  
  event syntax error: 'cs_etm/timestamp/'
                       \___ no value assigned for term
  Run 'perf list' for a list of valid events
  

> This is worth mentioning so users can correctly assess what happens
> for any existing scripts they might have.
> 
> Based on this then the same command must set the timestamp to 1 -
> which will have the same effect as before as we do not want to break
> existing behaviour.
> 
> Mike
> 
> 
> > >     * - cc_threshold
> > >       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
> > >         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> > >
> > > --
> > > 2.34.1
> > >
> 
> 
> 
> -- 
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

