Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B064C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3VoGHU+aZOv6VXL7a9Oy3oa0s55DgEU9jDiAaVbfmg=; b=QKIqlacZdEv5nN8mp2dfUHXAUl
	K1Y+634os/2x0f+0ai514MnUPY9ES+84KzwbCls/TQXSi2cyHRKCl7fqaFne2km/4Sn1CmZF/60md
	UFx3KkbCIWQiINnOYqwsek8DfhE81qkDV503wgM3Tql8qH5iNFipLGuugUZsHV4xDqJSnSklfNbll
	VGdME4l+cmcjc1Xzp9f3sAgqAT7SIMfxB3h0+4bZ6XpNuzS/wgn8p6+slA9SuiXMVP8nB6GyYmJK3
	2qOb9RwITjPmmAWBHZ0nNnIodam5sChW3zAKt4k4r0GQRrg9K+6SaDjUGPO195iFPznTBPpuXtU1I
	T2hfbpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhUx-00000003Ylw-476z;
	Mon, 10 Mar 2025 18:05:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhTL-00000003Yd7-0QDW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:03:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68C191516;
	Mon, 10 Mar 2025 11:03:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98BA53F673;
	Mon, 10 Mar 2025 11:03:22 -0700 (PDT)
Date: Mon, 10 Mar 2025 18:03:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] coresight: etm: Add an attribute for updating
 buffer
Message-ID: <20250310180318.GH9682@e132581.arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
 <20250310104919.58816-6-leo.yan@arm.com>
 <d8b1cf1f-1996-4d9c-9f1a-fad556f91577@arm.com>
 <20250310155015.GG9682@e132581.arm.com>
 <3f4354e7-e74b-4ce9-b0c7-4be103cbc94d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f4354e7-e74b-4ce9-b0c7-4be103cbc94d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_110327_188781_5061F3D5 
X-CRM114-Status: GOOD (  18.91  )
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

On Mon, Mar 10, 2025 at 04:37:44PM +0000, Suzuki Kuruppassery Poulose wrote:

[...]

> > How about we dynamically set the default flag in the Perf tool?
> > 
> > - If users set explictly the 'update_buf_on_pause' flag, then the
> >    setting will be respected.
> > - If users don't set the flag, perf tool detects it is TRBE sinks,
> >    then it can set 'update_buf_on_pause' flag as false.
> 
> Not really possible. There could be systems with mixed sinks. e.g.  TRBE
> for some CPU and ETR for others (say due to a non-functioning TRBE).
> 
> > - If users don't set the flag, perf tool detects it is ETF/ETB/ETR
> >    sinks, it sets the flag as true.
> 
> And in the cases above, perf event cannot run on all the CPUs, because
> some sinks don't support it.
> 
> Why do we need a flag, when the effect is not user (read, perf decoder)
>  visible and at the same time improves some scenarios (read non-TRBE cases)
> ?

Indeed in this case the flag is redundant.

> I would say, let the driver always update on pause, depending on the
> sink.

It is fine for me.  I will move towards this direction.

Thanks,
Leo

