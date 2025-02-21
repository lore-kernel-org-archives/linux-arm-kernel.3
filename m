Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A79C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8dC0dVgItnCyXLej8L81NU4ZiAJ6jyVZhWooB1uS8M=; b=rTl1dyiXgM1Tr3BFyEYSOSiFr/
	DjPrd7+0UI/nde1180dN2O21qlVidem/7m06ht2kHj/bKLlH87U7K0OQupTrZUd/8Cx0ovuzF2MSM
	d6WvAS3/Clo2MMdKqwZ7SfmTXewjEz3xrTWXkRQ4hfH9DId4pukCvpWDq2EEzuLhTkK8ufjPUHxWS
	iGwjLbON1sh5aEwQY0y55fuvW5L5fgYPlDU/zB2VcdRQXRPYW1V3hMFx7MPTahMN2qa/4+m28TiKv
	Pqz+C1/WEviNFbpn7deI6Fy07j3BNgeH89I3pMD0WMrz5z0P2YJz60DuELxdfPw5YLotgWcGN83OR
	3pSz7R7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRU4-00000005NWC-39if;
	Fri, 21 Feb 2025 11:46:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRPc-00000005MIs-3GSr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:41:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDED11516;
	Fri, 21 Feb 2025 03:42:01 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5096C3F59E;
	Fri, 21 Feb 2025 03:41:43 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 00/19] firmware: arm_ffa: Framework notification support + other updates and fixes
Date: Fri, 21 Feb 2025 11:41:40 +0000
Message-Id: <174013805847.529189.4816218083284057863.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_034144_920304_DFD32447 
X-CRM114-Status: GOOD (  10.10  )
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

On Mon, 17 Feb 2025 15:38:41 +0000, Sudeep Holla wrote:
> This bundle of changes mainly have FF-A framework notification support
> along with other minor updates and fixes.
> 
> It adds support to allow multiple UUIDs per partition to register
> individual SRI callback, to handle Rx buffer full framework notification
> in particular and general framework/interface to extend in the future.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[01/19] firmware: arm_ffa: Replace SCMI by FF-A in the macro
        https://git.kernel.org/sudeep.holla/c/1ed14652dc32
[02/19] firmware: arm_ffa: Replace UUID buffer to standard UUID format
        https://git.kernel.org/sudeep.holla/c/b7c9f32614f1
[03/19] firmware: arm_ffa: Align sync_send_receive{,2} function prototypes
        https://git.kernel.org/sudeep.holla/c/8768972cbbea
[04/19] firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_get()
        https://git.kernel.org/sudeep.holla/c/f94ebb724067
[05/19] firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()
        https://git.kernel.org/sudeep.holla/c/7bc0f589c81d
[06/19] firmware: arm_ffa: Refactor addition of partition information into XArray
        https://git.kernel.org/sudeep.holla/c/3c3d6767466e
[07/19] firmware: arm_ffa: Handle the presence of host partition in the partition info
        https://git.kernel.org/sudeep.holla/c/2f622a8b0722
[08/19] firmware: arm_ffa: Unregister the FF-A devices when cleaning up the partitions
        https://git.kernel.org/sudeep.holla/c/46dcd68aacca
[09/19] firmware: arm_ffa: Helper to check if a partition can receive REQUEST2 messages
        https://git.kernel.org/sudeep.holla/c/84968e32d301
[10/19] firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2
        https://git.kernel.org/sudeep.holla/c/910cc1acc9b4
[11/19] firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver
        https://git.kernel.org/sudeep.holla/c/9fac08d9d985
[12/19] firmware: arm_ffa: Reject higher major version as incompatible
        https://git.kernel.org/sudeep.holla/c/efff6a7f16b3
[13/19] firmware: arm_ffa: Remove unnecessary declaration of ffa_partitions_cleanup()
        https://git.kernel.org/sudeep.holla/c/9982cabf403f
[14/19] firmware: arm_ffa: Refactoring to prepare for framework notification support
        https://git.kernel.org/sudeep.holla/c/07b760e71325
[15/19] firmware: arm_ffa: Stash ffa_device instead of notify_type in notifier_cb_info
        https://git.kernel.org/sudeep.holla/c/a3d73fe8ae5d
[16/19] firmware: arm_ffa: Add support for {un,}registration of framework notifications
        https://git.kernel.org/sudeep.holla/c/c10debfe7f02
[17/19] firmware: arm_ffa: Add support for handling framework notifications
        https://git.kernel.org/sudeep.holla/c/285a5ea0f542
[18/19] firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback
        https://git.kernel.org/sudeep.holla/c/be61da938576
[19/19] firmware: arm_ffa: Handle ffa_notification_get correctly at virtual FF-A instance
        https://git.kernel.org/sudeep.holla/c/9472fe20d396
--
Regards,
Sudeep


