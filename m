Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BF5FD376A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF810MbBOXWurvKEDoVBlIzVVMsOiboRq+22IVkxsxs=; b=bkXDOLgUjpwVTY9EN5AV8eXP92
	G1Q5FB3sH4+1m0cE/FWadVNbdyNiYgXpCWY8/aVc3ILlm9zpjUi1LLbxk00Jb3dvoU5pIqHUcfVzc
	TFEsPboLDWkMVSmcEi2FCir/v6ALDhu9ve1mQg26yCzvsySsT1IbkW7n4B1gHCQCKGtEBriOxlPK1
	CU2kpT83t1S3Wb2TJMB5QCwgKTeWZZGKf1qk8Nq0rvkbGT5RELwzhQOSYkAAGHuFKDyKMsJkQWfxd
	8mosJ1hhPAfkZeidNF5YMQskXTIrwavuKj7lz/Ag4tcfYZ+UkbPEj3hRw7KGOVmmpTxWuZSt4XM7j
	ZevdpTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHLR-00000004Riv-29yP;
	Wed, 25 Feb 2026 16:02:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHLO-00000004RiQ-3j9Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:02:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20658165C;
	Wed, 25 Feb 2026 08:02:27 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 116AA3F62B;
	Wed, 25 Feb 2026 08:02:32 -0800 (PST)
Date: Wed, 25 Feb 2026 16:02:31 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <Mike.Leach@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tingwei Zhang <quic_tingwei@quicinc.com>,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	nd <nd@arm.com>
Subject: Re: [PATCH 7/8] coresight: cti: Remove hw_enabled flag
Message-ID: <20260225160231.GE4184494@e132581.arm.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-7-db71ab4d200b@arm.com>
 <PAVPR08MB9674FF028BD91B6DDF5B035A8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAVPR08MB9674FF028BD91B6DDF5B035A8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_080234_990715_7BB9C74C 
X-CRM114-Status: GOOD (  12.38  )
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

Hi Mike,

On Fri, Feb 20, 2026 at 02:31:11PM +0000, Mike Leach wrote:

[...]

> > The enable_req_count field already tracks whether the CTI device is
> > enabled.  A non-zero value indicates that the device is active, the
> > hw_enabled flag is redundant if so.
> > 
> 
> Minor nit - removal of this flag actually started in the previous patch.
> If respinning might be worth combining this and the previous one.

In the new version, I will keep separate patches for removing the
hw_enabled and hw_powered flags, as they are two different things.
This would be easier to review and friendly for bisection.

I will take your suggestion in patch 08.

Thanks,
Leo

