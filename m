Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8ABC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHa1/VRhha15m7XdZpS6K1UKgHP83cC0lfq9K/NbYkI=; b=iAwkuv0iRr0uXO/V0nP4Lp8QeE
	DyBf++dkBsTvvsz5Yq2njtdmk0MAambb0DH6qLcOZcABghbF2yLllQyfINzN19nvoqciRSMTsK3yL
	bfSNVyJKxAjQ/pjWOPgc/HXP8k3NDdqLwAVme1I55opwuZmwUWdK1nUqAzHzcy+0lYGOGwQCcO97M
	yWxdySwcGiew7Myk3ozp3chaJKBDNJRyPHu96zezfGHstsBN0eMdEHbGqwjKTYPRChjSfL4Fc7UVO
	bv8dK95fViHyIkN2uTvfIKFDKd1MaBFOBYzsu3AAHjGr4aq2XeRHThiUZR8Eo6BskTy7jyqGiYn05
	kibsf1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFs0-0000000FAcW-1ws2;
	Fri, 11 Jul 2025 15:41:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF7t-0000000F4a6-1cCN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:53:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59C8D2247;
	Fri, 11 Jul 2025 07:53:11 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC8AF3F6A8;
	Fri, 11 Jul 2025 07:53:19 -0700 (PDT)
Date: Fri, 11 Jul 2025 15:53:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	William Mcvicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <aHElXbj4-T--QqKk@bogus>
References: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075325_468095_291D6324 
X-CRM114-Status: GOOD (  25.36  )
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

On Fri, Jul 11, 2025 at 02:50:26PM +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> C2 hint. This hint is required to actually enter the C2 idle state in
> addition to the PSCI calls due to limitations in the firmare.
> 
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callbacks and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks are not.
> 
> Additionally due to CPU PM notifiers using raw_spinlock the locking is
> updated to use raw_spinlock variants, this includes updating the pmu_regs
> regmap to use .use_raw_spinlock = true and additionally creating and
> registering a custom  pmu-intr-gen regmap instead of using the regmap
> provided by syscon.
> 
> Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> property to the CPU nodes. This informs the time framework to switch to a
> broadcast timer as the local timer will be shutdown. Without that DT
> property specified the system hangs in early boot with this patch applied.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Hi folks,
> 
> This patch adds support for CPU Idle on gs101. In particular it achieves
> this by registerring a cpu pm notifier and programming a ACPM hint. This is
> required in addition to the PSCI calls to enter the c2 idle state due to
> limitations in the el3mon/ACPM firmware.
> 

I would rather keep the above note as part of the commit message or the
code comment as this will get lost when the patch is applied which is not
something we want. I clearly want to loudly shout or shame the broken
firmware for not getting this right.

-- 
Regards,
Sudeep

