Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDiiux93GqjAGQbymI9cNN6MYxHkj0O5ZyrN8IApz7Q=; b=YWvjz0lgymPC+tceRVNeMA7keK
	BSMwoqeBta9mmW3S6KxBcJIdiLIRs/V++AIqnPVCtjxSi1KyZJaEs52SmMkfoSr75tSzb70lH2lgy
	sVTSjYVN1bXTitZ4dx5qQQclbCT/tp5IrqSDoTYh+MFwmsQfgW/xDcwIkLrE9r1wyb7qr6ADymRAM
	RqoyFl3mRZeXS8N33lQ/VvACm3UGDlxrnR+k5fi9U2PA4J9sMM/GHKJ414XLvpMiY5idjLaEeH7Kv
	F09Q0iZzDOUoobRkK2oNXi4U4tnCZcGcxKUEoyvg8Qw6ib0JTInjDusjER8TW5UDJVTts//xdwdRl
	5x4Gicpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD27h-00000000tm7-2HJx;
	Thu, 08 May 2025 14:21:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1MQ-00000000l8l-3gD8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:32:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29B321E2F;
	Thu,  8 May 2025 06:32:14 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86CA53F58B;
	Thu,  8 May 2025 06:32:23 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct fwnode_handle forward declaration
Date: Thu,  8 May 2025 14:32:10 +0100
Message-ID: <174671111334.402161.8417024228915220581.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_063226_953267_CC4D9346 
X-CRM114-Status: GOOD (  10.32  )
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


On Mon, 31 Mar 2025 10:14:53 +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Since the code wants to use the pointer to the struct fwnode_handle
> the forward declaration is provided.
> 
> [...]

Applied, thanks!

[1/1] coresight: cti: Replace inclusion by struct fwnode_handle forward declaration
      https://git.kernel.org/coresight/c/aad548a9

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

