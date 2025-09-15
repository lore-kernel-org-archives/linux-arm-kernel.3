Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C234ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtX3g9CtwKWiFLdiT8eeTnXCn8XYYJPSi76MJo6dStY=; b=3MCMu2HLOezYC4k5NwUM9vlFPT
	oXWWYC2ojRrRVndz+ErK380mSut/BrRx69rm5Gem42UPgxcz8n3GwLSd2oZl6xrna9cu1sYiKNqp8
	do5y1Eva5cgzYCEISD4wAVo4ZliKdf65YGC6Tq0V3Aw5eRicaUNl2q3kxQw0G75WkrZyfaO/JiA9p
	Po8R2FJCne/n16Yxiwts+Vut8ARKC5ckGTIVs8hT4Xi6m1ya8zTqY0Y8yzHUB/nWcFfadHtPzrto5
	lo8CyhEKgdHrTawI95ECH1XP/G2qW3YSLk+qCoTqXBqxXQ5j1ixi71cgdgbBq8J4NW6DjPH+FntxL
	ooxMogaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5gE-00000003UtU-3smY;
	Mon, 15 Sep 2025 09:39:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5gA-00000003UrC-3kUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:39:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D31D1BF7;
	Mon, 15 Sep 2025 02:39:14 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A01A3F694;
	Mon, 15 Sep 2025 02:39:21 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tnoc: add new AMBA ID to support Trace Noc V2
Date: Mon, 15 Sep 2025 10:39:05 +0100
Message-ID: <175792909826.1970499.10299309349498800279.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814-tnoc_v2-v1-1-3285e37280c9@oss.qualcomm.com>
References: <20250814-tnoc_v2-v1-1-3285e37280c9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_023922_982830_8027CCDE 
X-CRM114-Status: UNSURE (   5.92  )
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


On Thu, 14 Aug 2025 02:00:13 -0700, Yuanfang Zhang wrote:
> Add the new AMBA ID 0x001f0c00 to support Trace Noc V2 instances.
> 
> 

Applied, thanks!

[1/1] coresight: tnoc: add new AMBA ID to support Trace Noc V2
      https://git.kernel.org/coresight/c/5e6ddce7a8ff

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

