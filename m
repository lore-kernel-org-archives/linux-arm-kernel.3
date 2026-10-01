Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF3CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zhucGZpQ6JTAiY45VkMV/DYeKL5z8iiXcNtRXd+C4g=; b=ClFwIgIA7WfVmtcK1ett5pIOrb
	fu3zZYrr+RIcNiofm1grrnQf62/Mizrs3LwwcD/f6hzRNCei3VBUME2s2ITUK9lCJ2niigzRvzOfJ
	b/weJ0wPJz4NszhGBAB1PCwtZR3jvDEPVhkLv1fVrlFE6+3cifJFy1kpdAJHXc0nkcZtfdW1ZRt73
	bVDfobswdTViUb9UPOHmAkSPA5fbMFRVc1OkArJKLdO7K5ptDWbJffX/xWYx98r69LSAvLAzpjgTc
	Gq1KbcT8CYhY99BrmSSfH5VVgE3BU868iFq5Qf+nWFBU3Puyx/R8GsnM/F/bBZ1dG/oUX3bWxEXZm
	ceTwo1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHUL-00000009L1Z-30la;
	Thu, 01 Oct 2026 14:10:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHUI-00000009L16-0Qvc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:10:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7358C497;
	Thu,  1 Oct 2026 07:10:12 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 835EF3F85F;
	Thu,  1 Oct 2026 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790863815; bh=BjHrcF+BNbl0dvUjEbSruYf04pwfXNyP2d4YCURGXOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=neVrwLLrP88olN8suMLn7/Vu/uAwWaGfBSmw+FDvDL5nQkeHIK6xWV2W4MFBtGysM
	 0Byrdi2AC5nbH25n3nagVjEnl6HeSzxkQNEAprc8g9esXQvDgQFCe6UxaokhyxW1RK
	 DW1m0GdoENVytOgEUxtEcMHRFC73qiLZYYFYLhtk=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: trbe: Hide enable_sink sysfs file
Date: Thu,  1 Oct 2026 15:10:07 +0100
Message-ID: <179086379622.1520831.1082807013676739382.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
References: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_071018_189857_73C9E538 
X-CRM114-Status: UNSURE (   8.84  )
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


On Fri, 07 Aug 2026 11:13:22 +0100, James Clark wrote:
> TRBE doesn't support sysfs mode, but the enable_sink file can still be
> successfully written to enable the device, and only attempting to enable
> the source would later fail.
> 
> Avoid misleading users by adding a flag that devices can use to hide
> either the enable_sink or enable_source files, and set it for TRBE.
> 
> [...]

Applied, thanks!

[1/1] coresight: trbe: Hide enable_sink sysfs file
      https://git.kernel.org/coresight/c/a32819346126

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

