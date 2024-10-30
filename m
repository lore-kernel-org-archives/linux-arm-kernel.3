Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1624D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfeFo6DGlR1PiFhx4gpVKY1MuqsfRT1W10d4q7XP2Xc=; b=y+HVVOQhbIYDjMe8E8VWbitMsi
	L9ohZ5o71DmcY/fO2KM7+Ss3f0/w5CMj34EfjMkdiCtEHI9AJQGGcIP4QcjuGWbK+gRfU5pD46x1K
	4utn+E6VGaEKkeYInzecZBZGNkcrh2YuoQfGBsNSshXmIVINX5MZSSI9ZNQu6ST4HfpzqkHwD5SKE
	kb1+kMwAo2pb+0Qdum1ZjMBWm+B1324e9JLzzLfgRYQSo2O02QNXCY/hKDaj+9ka2Z6NrTdOzzgqz
	tiqqrPs+6ICdMUR7BMV60VjfUuiVAxHU0nTTlEi+bgrxmIj5OaUlc0qoFlAuWaUgiyvPYcD6nnI5S
	S95dXAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65C7-0000000HQ2E-46ma;
	Wed, 30 Oct 2024 09:40:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t655B-0000000HOvC-0SAS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:33:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CB80113E;
	Wed, 30 Oct 2024 02:34:10 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E47823F66E;
	Wed, 30 Oct 2024 02:33:39 -0700 (PDT)
Date: Wed, 30 Oct 2024 09:33:38 +0000
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Graham Woodward <graham.woodward@arm.com>, acme@kernel.org,
	mark.rutland@arm.com, jolsa@kernel.org, irogers@google.com,
	james.clark@linaro.org, mike.leach@linaro.org, leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nd@arm.com
Subject: Re: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Message-ID: <20241030093338.GC24446@e132581.arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
 <Zx--dTqaZPjeWA2I@google.com>
 <20241029170346.GB24446@e132581.arm.com>
 <ZyFrOo7K1qmjtaV5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyFrOo7K1qmjtaV5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_023341_293880_2A76669D 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

Hi Namhyung,

On Tue, Oct 29, 2024 at 04:09:46PM -0700, Namhyung Kim wrote:

[...]

> > Please kindly suggest what is right thing to do.
> 
> Sorry, my bad.  It works ok.  I'll add it to tmp.perf-tools-next branch
> and run some tests.

Thanks for confirmation!

Leo

