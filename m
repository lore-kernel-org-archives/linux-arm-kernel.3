Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7E7CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uwhwzcl1gv9HM6v6zttgr5Vp1mztlUNF21XHZpHccE0=; b=VqnBL3qT+Ox3ZR2wkPoMSpGg8n
	gXLJ1oG0ZkyEt0RrcIlbo4xcJP2YUWEc+2JDakZz/Sh8Pkz3Pn3UpSLfpEfgwACr9hdmA+2Hqc7NP
	zp3gsDcVa5Q8Sx3dDroGkpCbKqOds5J62/uMAsgVPFFzYYX5ayKWAMvTjjRC/5S1xzvqlu8BInycQ
	jb2II3v+cDUesw8fIxT0Rr7pYXvwZoLTzYM4fiaIHPNt9W6qDuM/bM9ZNJO+5IdsqOrn+xtvbU565
	LJeAYFQjY36U5qsiezfRBVs27S5MC6loWkzaPifjsjdPc7OrWU6pEO6CGHsRwaKPFmRRU9mLJ1MPk
	25H/ISXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsi3-00000008Sa6-12Db;
	Fri, 15 May 2026 13:36:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsi0-00000008SYh-2bQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:36:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2999E27D3;
	Fri, 15 May 2026 06:35:59 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A12813F85F;
	Fri, 15 May 2026 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778852164; bh=VAr2I76Y4CubSxuDXZhrTgZY47uaYkt1AThe6DWpw/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IvU0nJjvsfLetCj5DR4TbgEs+1sBcQJXIDt0av4N6w4q/WckQ4+N9Q/jKXY/HY8ll
	 39Ly+fCy4K3L073lF3TNvdR/+VzKOfoCWvO0brHTCeE/XUB2pEfY7OIS2CzGlTKDKi
	 otOWttvT7j2YMcLMSLhAnSrKsG3KTbeWd0eUdAeo=
Date: Fri, 15 May 2026 14:35:59 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <agchPw+sz2OWe/1C@e129823.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-10-yeoreum.yun@arm.com>
 <20260515093923.GJ34802@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515093923.GJ34802@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_063608_727006_66719C2E 
X-CRM114-Status: GOOD (  17.08  )
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

Hi Leo,

> On Wed, Apr 22, 2026 at 02:21:59PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > @@ -895,6 +895,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >  			 * Missing BB support could cause silent decode errors
> >  			 * so fail to open if it's not supported.
> >  			 */
> > +			if (cfg_hash)
> > +				cscfg_csdev_disable_active_config(csdev);
> 
> I prefer do a bit refactoring for this.
> 
> we just save cfg_hash and cfg_preset into drvdata in
> etm4_parse_event_config():
> 
>   drvdata->cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
>   if (drvdata->cfg_hash)
>         drvdata->preset = ATTR_CFG_GET_FLD(attr, preset);
> 
> Then create two helpers:
> 
>   etm4_cscfg_enable(csdev) {
>     struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> 
>     return cscfg_csdev_enable_active_config(csdev, drvdata->cfg_hash,
>                                             drvdata->preset);
>   }
> 
>   etm4_cscfg_disable(csdev) {
>     cscfg_csdev_disable_active_config(csdev);
>   }
> 
> These helpers will be used by etm4_{enable|disable}_perf()
> and etm4_{enable|disable}_sysfs(). This might benefit the future cscfg
> refactoring.

I think this seems some over-engineering since the
etm4_cscfg_enable/disable() just an wrapper for
cscfg_csdev_enable/disable_active_config() but just increase size of drvdata.

It's not late to delay when we do refactoring the cscfg
and at that time, we can consider some place to save cfg_hash and
preset. If we do right now, personally, there seems no benefit for this.

Am I missing something?

Thanks.

[...]

-- 
Sincerely,
Yeoreum Yun

