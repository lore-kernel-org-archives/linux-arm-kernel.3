Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EADDC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 20:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGZN3wdC/2oD0k4J7Z3X9WKcV7fVBlJKWd3JQg2TBBM=; b=ZoB8EG/oeJYBe63ZlYgH6WkJPr
	c5EJFujoXq5s6Y8qJHdkR+YVC/wVqmsaB7xfxgk2VZq8dwqDzN6A1OeJUtzMW1tQq2bdOE8GSV2sp
	Yck/jYKWMDSHaitXPPTLdS1tmxMEEiGrsB+IoVD/Zwg9hZh2+TMScrQ+jxqExC63RlkwVAMz/m0tS
	LZPbbyIpj3L8NcYNe3cHN5ysMzGYX55gvrzNgol1ZY0oXXabKO6mr7U5qzlOZ0bO76znc47vhu3Cg
	V0DIPC65VMJgpazpKyJsCGY/xO/3cfHO5NvWH0A/FPhNlbYy0E+ha7CkmC0IO5s4L/RHhUmXOpV93
	lYofm1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSQc-00000000VL2-3Hgn;
	Thu, 16 Jul 2026 20:11:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSQZ-00000000VKQ-3VNi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 20:11:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1DA1476;
	Thu, 16 Jul 2026 13:11:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E0C3F7D8;
	Thu, 16 Jul 2026 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784232686; bh=Zbe+DLmNGGowdg+a4rkRli1ozSpKoRwDjJpp/j8LP9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7JOyMR/ZUz8n8sQkUznNOsd0jBtWTUuPIKo3tXm+21j3SnynJpsVD7SrMD5ZI8zv
	 bBV9KSnIuAPGBF1sc6KoOFDJsCepW8v+ON7TWeVv4kPHnuZYEJO8R1zcCPndBDPS7B
	 ZVTVtQXcLNZxfuyU53Hd+vRCXDvLz/YHh1YCINUM=
Date: Thu, 16 Jul 2026 21:11:22 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 00/13] fix several inconsistencies with sysfs
 configuration in etmX
Message-ID: <alk66r66GsiDX7wM@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <6ec5e456-fdf9-4953-9a0f-6231b48df07a@arm.com>
 <alkv8JHDgylPBeSE@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alkv8JHDgylPBeSE@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_131127_914527_57EB725F 
X-CRM114-Status: GOOD (  21.87  )
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

> On Thu, Jul 16, 2026 at 01:48:15PM +0100, Suzuki K Poulose wrote:
> > On 29/06/2026 09:59, Yeoreum Yun wrote:
> > > The current ETMx configuration via sysfs can lead to the following
> > > inconsistencies:
> > > 
> > >    - If a configuration is modified via sysfs while a perf session is
> > >      active, the running configuration may differ between before
> > >      a sched-out and after a subsequent sched-in.
> > > 
> > >    - If a perf session and sysfs session tries to enable concurrently,
> > >      configuration from configfs could be corrupted (etm4).
> > > 
> > >    - There is chance to corrupt drvdata->config if perf session tries
> > >      to enabled among handling cscfg_csdev_disable_active_config()
> > >      in etm4_disable_sysfs() (etm4).
> > > 
> > > To resolve these inconsistencies, the configuration should be separated into:
> > > 
> > >    - active_config, which is applied configuration for the current session
> > >    - config, which stores the settings configured via sysfs.
> > > 
> > > and apply configuration from configfs after taking a mode.
> > > 
> > > Also, This patch set includes some small fixes:
> > >    - missing trace id release in etm4x.
> > >    - underflow issue for nrseqstate.
> > >    - wrong check in etm4x_sspcicrn_present().
> > >    - missing call of cscfg_csdev_disable_active_config()
> > > 
> > > This patch based on coresight tree's next
> > 
> > 
> > Please could you move all the "Fixes" to the top of the series, that way
> > it is cleaner to backport for the stable kernels
> 
> Okay. but the fix which based on the cleanup wouldn't be top of it.
> I'll deploy below patches first:
> 
>   coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
>   coresight: etm4x: fix leaked trace id
>   coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
>   coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()

Sorry. Ignore this please, I've moved all fix in the top properly.

Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun

