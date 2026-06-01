Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4482BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dam0fKw7Cflfk7zsoNpQq5yL0C/y5MPlaHDnXW2hyG0=; b=hCXJIQAFYBJJTFy95KXtD9hdgW
	Wtg7VnVGQnUpDiB8aYLOnqDPd5BqY7KuVY0M+HrFUVqmcQ5cOMpr+jnwvi3NAILfI2Y4ZlQkwbWXN
	UL4htzuZQ7TWpibm9c3dPpceNEOTLzGvbkGUT1+Q1YWNCY+eR6bn2TgkLEKFJubeuKuLxjSasC2xA
	qvxGLZxvbp8VSDtWrV+0IR649cXPtQUAfnk20dYp0L5tW8iFb4sB0bxblEBBhjflFFNd3xH+M82sq
	jcpu0u9zGRQTGY5wJEWQAfPrx81a3zdGnoe51ZIDlKDiuyoflhCpW91i/2795HMlsYa03ZH08q9nV
	vPoKve6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5iB-0000000BVNp-0qqd;
	Mon, 01 Jun 2026 16:41:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5i7-0000000BVNP-3pet
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:41:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18F071BCA;
	Mon,  1 Jun 2026 09:41:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A47D53F632;
	Mon,  1 Jun 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780332114; bh=T0NKGmw9QFRRXfIkfjpjprTtOQdF6COdXsYUeU0nUuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdT2FuxvvhiGm7Bqb1ZVtkHgG96z3UmGRwmdw5uvSJ94tas+HPsMhudMx1mmEe50v
	 3VSYFYKEEBu1DFb+0FFbi6FFN2tDPoXZqtEJcWu7TVG5/NuIdx2++elJ/kaAeh0SQ0
	 5F7rQ9f3FHsrDMk30/yjViG7rp2tj2jVlwNaL8XI=
Date: Mon, 1 Jun 2026 17:41:50 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <ah22TjH0yWKd4T3Q@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-10-yeoreum.yun@arm.com>
 <20260528143358.GF101133@e132581.arm.com>
 <ahhUnJSIvGabGbQe@e129823.arm.com>
 <20260528152633.GH101133@e132581.arm.com>
 <ahhm0uIwQw56WhYO@e129823.arm.com>
 <0fe7c30c-85e4-4205-930c-0c496d6263b8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe7c30c-85e4-4205-930c-0c496d6263b8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094156_045771_0174DD2C 
X-CRM114-Status: GOOD (  28.80  )
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

> On 28/05/2026 17:01, Yeoreum Yun wrote:
> > > On Thu, May 28, 2026 at 03:43:40PM +0100, Yeoreum Yun wrote:
> > > 
> > > [...]
> > > 
> > > > > @@ -931,6 +919,18 @@ static int etm4_enable_perf(struct coresight_device *csdev,
> > > > >   	if (ret)
> > > > >   		goto err;
> > > > > +	/*
> > > > > +	 * Set any selected configuration and preset. A zero configid means no
> > > > > +	 * configuration active, preset = 0 means no preset selected.
> > > > > +	 */
> > > > > +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> > > > > +	if (cfg_hash) {
> > > > > +		preset = ATTR_CFG_GET_FLD(attr, preset);
> > > > > +		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > > > > +		if (ret)
> > > > > +			goto err;
> > > > > +	}
> > > > > +
> > > 
> > > > No. since preset overrides the "perf configuratoin" formerly but
> > > > this code makes it vice versa.
> > > 
> > > The above proposed change applies cfgfs after calling
> > > etm4_parse_event_config(). This is just use preset to override the
> > > config. Do I miss anything?
> > 
> > Ah sorry. I've misread the code location that was my bad.
> > 
> > > 
> > > > Also, cfg_hash and prest is also part of
> > > > etm4_parse_event_config(), and it doesn't seem to good to separate
> > > > cfgfs handling from that function.
> > > > 
> > > > IMHO, It would be better to keep this as it is.
> > > 
> > > I have another version to give a try. I'd leave to you and maintainers
> > > to choose which is better.
> > 
> > Funcionally, Code works. However, To be honest, the pairing between
> > etm4_parse_event_config() and etm4_clean_event_config() feels a bit artificial to me.
> > 
> > So here I have simply followed the principle that,
> > if etm4_parse_event_config() fails, the configuration it touched should be
> > cleaned up within that function; and if a failure happens after
> > etm4_parse_event_config() has succeeded, the caller should perform the cleanup.
> > 
> > Renaming etm4_parse_event_config() and splitting out the
> > CSCFG-related handling as suggested would be possible,
> > although I still feel it may not be strictly necessary.
> > 
> > My preference would be to keep this as-is, but Suzuki, what do you think?
> 
> I prefer the end result with Leo's patch applied. That kind of indicates
> clearly that we need to cleanup something from the event config parsing
> and keeps the disabling only once, rather than spreading it.
> 

Okay. Then I'll apply with a little bit of modification.
Thanks


-- 
Sincerely,
Yeoreum Yun

