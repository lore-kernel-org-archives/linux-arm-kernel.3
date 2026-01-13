Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CB6D2D0E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY2qs5HiXVSQ4G08EORvC4Wxxk7b0Nzq2mn3YREMPCk=; b=lIYAlrIRT8lsd/ZxQdca7z+AEJ
	5MOpjuWsleSOJP9Mu3QLLAaxmhUHfQValsqTT0UjwiZxL88QWm8UiVRF+fr7rqyWeujqbxxAXTC8D
	PWvUSdk2RyMz+VFTriNXur/9vIn78ih/WHuHvU6V8Me/obAUjSziZE8b8N0/SZI6KPJPngb+6XEKN
	qM7dryUd4Y6FgRqgNDcTF5X+WIdHKxVYNHe9ENuCeYspFC+R3jI63FhrtTVYnY6quU7+cTdtj3rMN
	E4JnTGvOkfHDTBrVxqZ4i91tialcAvcuQvjX4Lj8IqyDaK/8vms2TnIFSXwsPl3vQw9qp3KAy6qQe
	MJ6/FXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdWR-000000074cP-1eCU;
	Tue, 13 Jan 2026 12:29:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdWK-000000074Z1-45o6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:29:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84F8497;
	Tue, 13 Jan 2026 04:29:03 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38F33F59E;
	Tue, 13 Jan 2026 04:29:09 -0800 (PST)
Date: Tue, 13 Jan 2026 12:29:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWY6kx8Bwa_2azIl@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_042913_050953_AC69369C 
X-CRM114-Status: GOOD (  10.91  )
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

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 

Instead of relying on a vendor-specific SoC driver, we should consider
disabling it and using the OS-agnostic SoC information interface provided by
the firmware. The presence of this interface strongly suggests that the
firmware is designed to support multiple operating systems or software stacks
that already depend on it. Aligning the Linux kernel with this
firmware-defined, OS-agnostic mechanism would reduce vendor-specific
dependencies and improve portability. Any gaps can be addressed by enhancing
userspace to correctly parse and consume this information. Given these
advantages, why would this approach not be the better long-term solution?

-- 
Regards,
Sudeep

