Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC1F43848
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYVTlpzdXHTYRU1ezd+uTlX/wBYsfvS9InSrL+RAu8I=; b=IwcmDC/bg1s5oE0klZglGnJBvU
	M06+il4zc+2HZcU95ntsbnYSvZ0IfDZ/f0S4E/ph389Q/UZDTa4RZnxACxVheHVTLOehJ14CuTVWR
	G+IHJCg5hfk8yQwKLe+dLPIQz+p3qiMK5NT3sv5A8mnMddRLZyWTd3EdF+kZRw89xiidj1V/fIr7F
	2TFy0+xXRhW+Uc+QbG1v+XKQ1waWHIcdrqo//8zv9y8aBmMWTvpS84n+tJkxeTKCZ5A9rAg1oHjmA
	EhT6MP5uQ62Pfwhq4yCpf3jvZF/zexhSR4iZabaYXnueMg3kcXIQWC8vvA0+YyOQ4hyXv3LUOVEUM
	SQtzKBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3NJ-00000001OFe-2srN;
	Wed, 15 Apr 2026 16:46:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3NH-00000001OFF-3p5v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:46:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6372E96;
	Wed, 15 Apr 2026 09:45:51 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00A2C3F7D8;
	Wed, 15 Apr 2026 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776271557; bh=P2Y1aQlN8N5FKgPmHRSucxuhwu8KBmAOHdudPeqvjvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJ3HaeJpZewibJb1Y+BqHv1gev2T1IbOOjqw//FztemqaCqDu0/a/vlcl+zUsd5Na
	 6cgjgyXo0LlO50dXvBIuiOvYMBsgLC58RUChcLN/pfZlAI10NDpXc3xQRerAyF/kdb
	 FG027RbHTvYUTTv0u5fplYxdoTeqRslszn6mfQ1E=
Date: Wed, 15 Apr 2026 17:45:53 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v4 7/9] coresight: etm3x: introduce struct etm_caps
Message-ID: <ad/AwdrDRZ7AQIFP@e129823.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-8-yeoreum.yun@arm.com>
 <585280ea-8395-482a-8a3e-7527fce20539@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <585280ea-8395-482a-8a3e-7527fce20539@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_094559_994882_0263DBF9 
X-CRM114-Status: GOOD (  10.19  )
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

[...]
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm.h   | 42 ++++++++++++-------
> >   .../coresight/coresight-etm3x-core.c          | 39 ++++++++++-------
> >   .../coresight/coresight-etm3x-sysfs.c         | 29 ++++++++-----
> >   3 files changed, 67 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> > index 40f20daded4f..8d1a1079b008 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm.h
> > @@ -140,6 +140,30 @@
> >   				 ETM_ADD_COMP_0		|	\
> >   				 ETM_EVENT_NOT_A)
> > +/**
> > + * struct etmv_caps - specifics ETM capabilities
>
> s/etmv_caps/etm_caps

Sorry. I'll fix it. Thanks!

[...]

--
Sincerely,
Yeoreum Yun

