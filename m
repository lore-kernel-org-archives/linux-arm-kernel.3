Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6035C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qwX3m8lIZWA1wW1loDvH0kTUY1FBDJtAso9rRIWXR8=; b=ELzyueFV+56kh9DFkQpie1m8DK
	whL0JiX3qQHrw6QmX0O5XqQEq89Iwn/So6GQJD0JpEK6kt6mbGcfy86to/nEvERfs8g6+1JP91Mad
	0mSTKkUAeVF8AQ9P554UWFERStBs3yhiSo+KjzH1xiniiDT7kScwI2DkhfxHfETZqeod1xcxt8F6l
	PdNd0shFWaOrKrsxamX2jKXmElRkM0jmvxhxKoJcsrL5j34VP+YAU9KkGTRusIx5bit6V4cG+Q+QO
	oRPkuWu5Vk8B6XMC+BG5oM1+av3kE2AFxo5je+vawz2KzMZohOytz2FQZCoi/PsEOLbaeFbYCcCa5
	5WP263pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZco6-00000009xL4-3Cv2;
	Wed, 09 Jul 2025 21:58:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXNN-00000009HSF-45jp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 16:10:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBE47152B;
	Wed,  9 Jul 2025 09:10:16 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B6C3F694;
	Wed,  9 Jul 2025 09:10:26 -0700 (PDT)
Date: Wed, 9 Jul 2025 17:10:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	William Mcvicker <willmcvicker@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v5] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-ID: <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
References: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_091030_055781_9365685C 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Jul 09, 2025 at 02:26:27PM +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> C2 hint. This hint is required to actually enter the C2 idle state.
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

Assuming this is arm64 platform and using PSCI for all the power management,
can you please briefly explain why all these dance is absolutely necessary
when PSCI calls can be the clue for the EL3 firmware. I am basing my question
on this information in the file:

/*
 * CPU_INFORM register hint values which are used by
 * EL3 firmware (el3mon).
 */

This clearly sounds like workaround for the firmware limitations. That
needs to be clearly documented IMO.

-- 
Regards,
Sudeep

