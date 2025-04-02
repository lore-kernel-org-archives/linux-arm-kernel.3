Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE44C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtBzVLJt9ba2eMUdxHYg6o+c/dI61rPu9DUygzGT5Kc=; b=avd2cWbiVg0pomJHLnjOD6WY/J
	6OtsfExuoyJzpOM8C36gPDCLBYG9FD6BrOKs1LKywjxaY/mz66Q9ZSrIU7Yyr6MKs3Nej5rjAcZtk
	ObLROXS+NM3HUuc/xhdoqJ0hrbwRaq1CbqOmd8mTQ+9c7RzeOsRwu6VF6WcAqTXbGR83uoG3quZJ5
	CVYMowlg15dMuiQCg7Is3akTx7pZ5A6AI3sdDWKdMFEwkRyc63FfDrBiH2B9/qBOUL6Fyfa5ou7ux
	pRcssLwrOmpSYJT2unE8xQYCEfSjQv2fO4PBfk+ef4RvPYXwB6kvBykDkD5TBd8dRN2wM+Dmafl4v
	ngI6uCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyLO-00000006HUr-025A;
	Wed, 02 Apr 2025 13:41:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyCu-00000006Fcq-1gY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:32:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A05DFEC;
	Wed,  2 Apr 2025 06:32:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9793F694;
	Wed,  2 Apr 2025 06:32:37 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:32:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250402133232.GJ115840@e132581.arm.com>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_063240_533666_A34D487D 
X-CRM114-Status: GOOD (  24.61  )
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

On Tue, Apr 01, 2025 at 06:22:46PM -0700, Yabin Cui wrote:
> On Tue, Apr 1, 2025 at 6:19 PM Yabin Cui <yabinc@google.com> wrote:
> >
> > When enabling a SINK or LINK type coresight device fails, the
> > associated helpers should be disabled.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index fb43ef6a3b1f..e3270d9b46c9 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                 /* Enable all helpers adjacent to the path first */
> >                 ret = coresight_enable_helpers(csdev, mode, path);
> >                 if (ret)
> > -                       goto err;
> > +                       goto err_helper;
> >                 /*
> >                  * ETF devices are tricky... They can be a link or a sink,
> >                  * depending on how they are configured.  If an ETF has been
> > @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                 switch (type) {
> >                 case CORESIGHT_DEV_TYPE_SINK:
> >                         ret = coresight_enable_sink(csdev, mode, sink_data);
> > -                       /*
> > -                        * Sink is the first component turned on. If we
> > -                        * failed to enable the sink, there are no components
> > -                        * that need disabling. Disabling the path here
> > -                        * would mean we could disrupt an existing session.
> > -                        */
> >                         if (ret)
> > -                               goto out;
> > +                               goto err;
> >                         break;
> >                 case CORESIGHT_DEV_TYPE_SOURCE:
> >                         /* sources are enabled from either sysFS or Perf */
> > @@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >  out:
> >         return ret;
> >  err:
> > +       coresight_disable_helpers(csdev);

Given it is unconditionally to enable helpers, I would suggest we
disable helper unconditionally.  Thus, we don't need to add a new
'err_helper' tag, simply reuse the 'err' tag would be fine.

I would like to know if mainatiners have different opinions.

Thanks,
Leo

> > +err_helper:
> >         coresight_disable_path_from(path, nd);
> >         goto out;
> >  }
> > --
> > 2.49.0.472.ge94155a9ec-goog
> >

