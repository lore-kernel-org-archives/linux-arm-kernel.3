Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A28AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yboTqBTEw4PTYk2V34YoGud7Bf+74tlEH/ZnUiQtFM=; b=Zxgz0f+Ze+0yBIjHb5cx79R5wW
	tK81rdwahwEdHGpy4TZWZX+XwuUsx0/fust/jQDz9msXOe8dtHGLV9UBa8aqwpjFAS1dAjSBBT94d
	R53d3r6IsiTXHKOvE6i19LKp+zGXNgNOyGnEsU/1+yeTLf4oKiaBjHiqSTn+70/pybDdmzgZhcF27
	89ipD1/Rm6ymtI+b3VIOacWf7okmSVvyABJmWIIsMfrT27xfzyb8bqf6jCirP32FosRupnnOSykAm
	dnVFoO6iq4RRnXa+2V3qJ+1lmwp1tnHeWSpYDOXOfwRrQqO0iIYYSZ2m03n0ZF7wvnmJn78nfKCo/
	drrlcrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqZC-0000000Egji-4Bts;
	Tue, 11 Aug 2026 17:47:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqZ9-0000000Egir-2cHl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:47:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78E341682;
	Tue, 11 Aug 2026 10:47:01 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191733F632;
	Tue, 11 Aug 2026 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786470425; bh=wihEomTEe3RT0befzU8t+WIMF9QfFXeERIOn9Sq6LKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgwMZgsk23GeYnZ0ies2PnlAYgpICmsVx7Mcec5MGeql68KV0lha3k+1zMnSeW4QU
	 tFOwOF0fNSBF7FS9NaljYL4VeEBFSJhF2Rm3xUBAF2njt5NmUFlBzqcTC6C0UnjoOm
	 /Vo1e1XI+xtdMoLjAmdk/jPPkO68ZTIZ36fAH+ls=
Date: Tue, 11 Aug 2026 18:47:01 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 11/13] coresight: etm4x: remove s_ex_level from config
Message-ID: <antgFf6xYZxLHDuo@e129823.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-12-yeoreum.yun@arm.com>
 <20260811172517.GI15499@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811172517.GI15499@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_104707_849434_0E184F65 
X-CRM114-Status: GOOD (  13.39  )
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

On Tue, Aug 11, 2026 at 06:25:17PM +0100, Leo Yan wrote:
> On Sat, Jul 25, 2026 at 12:36:43PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > -static u64 etm4_get_access_type(struct etmv4_config *config)
> > +static u64 etm4_get_access_type(struct etmv4_config *config,
> > +				const struct etmv4_caps *caps)
> >  {
> 
> Is it possible to retrieve drvdata from config? Something like:
> 
>   drvdata = etm4_get_drvdata_from_config(config);
> 
> If this is feasible, we wouldn't need to modify so many functions to
> add the *caps argument.

It's feasible, however, I feel it doesn’t seem semantically appropriate.
Since, the etmv4_config is a configuration and TBH, it could be not
embedded in to etmv4_drvdata.

Though the usages where the chnaged fucntion, the config're all embeded.
However, If we introduce the etm4_get_drvdata_from_config(),
We need to check the drvdata pointer is valid since it passes the config
not embeded and this would be more strange.

So, I think it seems better to the caps arguments.

-- 
Sincerely,
Yeoreum Yun

