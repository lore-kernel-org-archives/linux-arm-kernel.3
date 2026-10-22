Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE694606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ad4gKOKK;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OqLfJfmb;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=OqLfJfmb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BIsES8uU/Ieyil6nBD7YIf94eD4lVAgV2gQFwTcF/10=; b=Ad4gKOKKATh+NY5uaS5EKKADNu
	53Y+Fd8VxCZ7Ha3BNRQFatG7OvHSwlSfO42oUz7K2QoVz3rxDqC/wuLe1veEYdVJCSr2kSKh19fd9
	HL61N4D6c8E6QHAkYGYonqM9DvyfYCg29cA1JhAv5HR9htQto7Gg6InLiQkOmJeTXfgvEHzx/8wUY
	j2rZ9NC9w1//nvTz55zR3TsJKgqtCdT4MMVAVVbUoxZCogqjcxlEgCxa/pKFOluzkC39UOC/jRwUq
	PGxJjG8fKIbUTpN+zOqqAzqc4R7+Ylv5GKKQw4Go7W0WBJXCsv2YIPo/FlbCRREc6mFUZgcLXHSLG
	av0u2l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoky-0000000DnQZ-2wHM;
	Thu, 22 Oct 2026 09:06:40 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoku-0000000DnPU-3Emh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:06:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BIsES8uU/Ieyil6nBD7YIf94eD4lVAgV2gQFwTcF/10=;
	b=OqLfJfmbhdtpNaCfmSwYlNi3PDI6oQtswU6A5/mlNmSrtM9iBpfpcppKWxExJ/sn14Bn/FxgO
	1jhY3D5gOkugFebMkXXRzFCbL8QpcsDLLEkaMHYujp/MQMNlA3/quqE29nW32FWetFaS9c6jHvF
	NYQQIa8qGqOIJWOvAFgEC0I=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
	by szxga04-in.huawei.com (SkyGuard) with ESMTPS id 4j9KYj3ZXMz126M2R
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 16:48:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BIsES8uU/Ieyil6nBD7YIf94eD4lVAgV2gQFwTcF/10=;
	b=OqLfJfmbhdtpNaCfmSwYlNi3PDI6oQtswU6A5/mlNmSrtM9iBpfpcppKWxExJ/sn14Bn/FxgO
	1jhY3D5gOkugFebMkXXRzFCbL8QpcsDLLEkaMHYujp/MQMNlA3/quqE29nW32FWetFaS9c6jHvF
	NYQQIa8qGqOIJWOvAFgEC0I=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ43zcMz1K9D1;
	Thu, 22 Oct 2026 16:48:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A4D040596;
	Thu, 22 Oct 2026 16:48:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 0/7] arm_mpam: Add L2 cache monitors
Date: Thu, 22 Oct 2026 16:48:14 +0800
Message-ID: <20261022084821.4014873-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_020637_121066_0BA3C541 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MPAM resource monitors hang off a partitionable resource in an MSC, not
off a particular cache level. resctrl only knows about the L3 scope, so
the L2 cache monitors that MPAM platforms implement are discovered by
the driver but never show up in resctrl.

An L2 MSC has the same CSU and MBWU counters as an L3 MSC; the cache
level comes from the ACPI MPAM table's cache locator. So this is mostly
a resctrl scope problem, not a hardware one.

Extend resctrl's monitor scope to L2: register the L2 occupancy and
bandwidth events against the L2 resource, pick the L2 classes for them,
and borrow a CSU/MBWU monitor for the duration of a read. With CDP the
two PARTIDs need separate accumulating monitors, so the borrowed-monitor
context becomes one monitor per PARTID.

Patches:

  1-2  Generalise the per-domain read path, add l2c_occupancy and
       mbm_core_bytes, update the documentation.

  3    Split the borrowed-monitor context into data and code entries.

  4    Do the CDP num_rmid halving for every mon_capable resource.

  5-7  Pick the L2 classes, describe the events with the L2 resource,
       add the read paths.

Tested on QEMU with an L2/L3/memory-controller MSC topology. The L2_MON
files show up and are readable; l2c_occupancy reports the modelled
occupancy, and mbm_core_bytes reports the modelled bandwidth.

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

Jinjie Ruan (7):
  fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
  fs/resctrl: Add the L2 monitor events
  arm_mpam: resctrl: Split monitor context for code/data
  arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on
    CDP
  arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
  arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
  arm_mpam: resctrl: Add the L2 monitor read paths

 Documentation/arch/arm64/mpam.rst |  23 +--
 drivers/resctrl/mpam_resctrl.c    | 236 +++++++++++++++++++++++-------
 fs/resctrl/monitor.c              |  15 +-
 include/linux/resctrl_types.h     |  13 +-
 4 files changed, 222 insertions(+), 65 deletions(-)

-- 
2.43.0


