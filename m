Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 01:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TeXH0Xwm;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dwh3SgbJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K5yLonYWgOmg+PAeVcPBoGQLdK4Hwc1Y9SMwne6Zl2c=; b=TeXH0Xwm3tf9Jv
	Lsd1pzE53I0nTVJnBRYvKCnlk3SeYpznF04AembKKuxkgUba6qmH+7zIZER5JPOw+fS3NzOl1Pq9e
	0Y1lFeH1MbSmTXbnwpmLrwO9dctZ3ckemdpZBGiDcoT2iK91W6t2dQL4wUcOJQxlJmgvXrDlbF3Hd
	A4+rsgGQoRklLqX04x+YdXN2tcrQcCJjsC9nW5iJt/vi5gDUQQSo6oPSzN6RRCeUibhT5OIfrqksk
	LqTqjMyl3MbEzPNUPHHu2lg3v1PsJqLml98ezkrMgqJQwZ0rZfhxB7eLZPZFKOVnbF1BPfRTw6esA
	kk9HQLD3IOVod2H7bOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK40d-0000000FGK9-0paR;
	Fri, 23 Oct 2026 01:23:51 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK40Y-0000000FGJG-4Bmd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 01:23:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K5yLonYWgOmg+PAeVcPBoGQLdK4Hwc1Y9SMwne6Zl2c=;
	b=dwh3SgbJaone+LjT5mlfaGi7Hp3dPFflo8BQwUpDoglDz1qKtQrN6R+w78Mx/d+y1Q1Y8lB3s
	sfeHGhfpbt5uzMAWWC0nCIg5WZKeeIBvqgAVzTsTkQCEs9DifavLARx2uJ4TzGA58g12CWHej9r
	TNE34V734uL5Opc+Wj9bI5c=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j9ldy6hKPznTwB;
	Fri, 23 Oct 2026 09:23:34 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CD9040578;
	Fri, 23 Oct 2026 09:23:32 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 09:23:31 +0800
Message-ID: <87ecba5b-e396-45db-bab0-4eff0f30cb25@huawei.com>
Date: Fri, 23 Oct 2026 09:23:30 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Fenghua Yu <fenghuay@nvidia.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, Chen Yu
	<yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, Richard Cheng
	<icheng@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_182347_657574_8CBE54A9 
X-CRM114-Status: GOOD (  31.49  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/9/1 1:22, Fenghua Yu 写道:
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and

Hi everyone,

We also have the requirement for the MPAM node-scoped MB_NODE control.
Are there any follow-up plans for this feature?

Is there anything I can help with?

> control to memory-level MSCs or CPU-less NUMA nodes, and adds
> documentation and tests.
> 
> Background
> 
> On x86, MBA bandwidth control is typically associated with the L3 cache:
> schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
> On some ARM MPAM systems the MBA control is backed by a memory-level MSC
> rather than the L3 cache MSC.  A memory-level MSC is represented as a
> NUMA node, and that node commonly has no CPUs of its own (a memory-only
> node that still participates in bandwidth control).  For such a resource
> the control scope is NODE, schemata identifiers are NUMA node ids,
> monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
> may be the only control with usable bandwidth hardware.
> 
> Because the memory-level MSC lives on a CPU-less NUMA node, the driver
> must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
> affinity from the component's NUMA node id, so a memory-only node would
> otherwise end up with an empty CPU mask and never be registered.  When
> the derived mask is empty, the driver falls back to cpu_possible_mask
> (masked by MSC accessibility) so the node still gets a resctrl domain.
> The borrowed affinity is kept out of class->affinity: those CPUs already
> contribute through CPU-ful nodes in the class, and subtracting the
> borrowed mask on teardown would remove CPUs that other live nodes still
> depend on.  Domain setup iterates all MSC components per CPU (keyed by
> component), so each component — including these CPU-less memory nodes —
> gets its own control and monitor domain.
> 
> Examples of NODE and emulation interfaces on MPAM.
> 
> ** On platform with CPU-less nodes, by default, control_mode is legacy.
> 1. By default, MB is emulated by MB_NODE in schemata.
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # [legacy] native
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # emulated by "MB_NODE"
> 
> schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
> id
> MB:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
> L3:1=ffff;2=ffff
> 
> 2. root can switch to native by writing "native" to "control_mode":
> info/
> ├── MB
> │   ├── bandwidth_gran
> │   ├── control_mode        # legacy [native]
> │   └── schemata
> │       └── MB
> │           ├── MB_NODE     # no emulation, native mode
> 
> schemata: Only show MB_NODE. No "MB:" is emulated.
> MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
>      L3:1=ffff;2=ffff
> 
> 3. llc_occupancy in mon_L3_x where x is cache id
>    mbm_total_bytes in mon_NODE_y where y is numa id
> mon_data/
> mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
> mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35
> 
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_NODE_01/mbm_total_bytes
> 
> ** On legacy machine which only has L3 MSCs. No NODE scope in schemata
>    or mon_data
> schemata: MB's domain id is cache id, not numa node id
> MB:1=100;2=100
> L3:1=ffff;2=ffff
> 
> mon_data/
> mon_L3_01 mon_L3_02
> 
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_L3_01/mbm_total_bytes
> mon_data/mon_L3_02/llc_occupancy
> mon_data/mon_L3_02/mbm_total_bytes
> 
> The patches can be compiled but not tested on x86 yet.
> 
> The 19 patches are grouped as follows:
> 
> 1. Memory bandwidth monitoring and control on memory-level MSCs
>    (patches 1–10, 12)
> 
>    Generalise the monitor infrastructure beyond hard-wired L3 paths:
>    de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
>    name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
>    total event, and make MBM handling resource-aware.
> 
>    On the ARM MPAM side, add memory-level MSC and ABMC support, refine
>    L3 topology and class selection, refactor domain setup to iterate all
>    MSC components per CPU (keyed by component), and handle CPU-less NUMA
>    memory nodes that have no local CPUs but still participate in MPAM
>    bandwidth control. Memory hotplug locking and notifier are added.
> 
> 4. MB_NODE emulates MB (patch 11) [1]
> 
>    Wire MB_NODE as the native backend that emulates a MB control
>    in the ARM MPAM driver.
> 
>    If emulation is unnecessary, this patch can be removed.
> 
> 5. Documentation (patches 14–17)
> 
>    Document memory-level MB control and NUMA nodes in the arm64 MPAM
>    guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
>    in the resctrl documentation (patch 20), and an MB_NODE emulation
>    example on ARM MPAM (patch 21).
> 
> 6. Tests (patches 18–19)
> 
>    Add a KUnit test for CPU-less NUMA node affinity handling and a
>    kselftest that exercises MB emulation mode switching,
>    resource_schemata hierarchy, and schemata mirroring on ARM MPAM.
> 
> Apply the patches on top of [2].
> 
> Testing
> 
>   # KUnit (CPU-less affinity)
>   sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results
> 
> 
>   # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
>   cd tools/testing/selftests/resctrl
>   sudo ./resctrl_tests -t mb_emulation
> 
> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
> which is on top of [2].
> 
> Change Log:
> RFC v2:
> - Remove fix patches 1-2 which are implemented in [2]
> - Remove the emulation patches 3-8 which are implemented in [2]
> - Update emulated_by to *emulated_by in patch 11. Ben seems
>   doesn't like to emulate MB by MB_NODE. If that's case, I can
>   remove this patch. But for now, I keep this patch for further
>   discussion.
> - Add patch 13 to implemente legacy and native modes to emulate
>   "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
> - Add patch 9 for memory hotplug locking (Ben)
> - Add patch 12 for memory hotplug notifier (Ben)
> 
> RFC v1:
> https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/
> 
> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Concept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
> 
> Fenghua Yu (17):
>   resctrl: De-hardcode L3 monitor infrastructure
>   resctrl: Expose MBA MBM counter assignment sysfs
>   resctrl: name node-scoped monitor domains mon_NODE_<id>
>   resctrl: Add node-scope MBM total event
>   resctrl: Make MBM paths resource-aware
>   arm_mpam: Support memory-level MSCs and ABMC per class
>   arm_mpam: Refine L3 topology and class selection
>   arm_mpam: Include all MSC components during domain setup
>   arm_mpam: Handle CPU-less numa nodes
>   arm_mpam: Emulate MB control with node-scoped MB_NODE control
>   resctrl: Add mbm_assign_scope_mode for native assignment file names
>   Documentation: resctrl: document mbm_assign_scope_mode
>   Documentation: arm64: mpam: document memory-level MB control and NUMA
>     nodes
>   Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE
>     monitoring
>   Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
>   arm_mpam: Add KUnit test for CPU-less NUMA node affinity
>   selftests/resctrl: Add MB emulation test for ARM MPAM
> 
> James Morse (2):
>   fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
>   arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
> 
>  Documentation/arch/arm64/mpam.rst             | 105 ++-
>  Documentation/filesystems/resctrl.rst         | 135 ++-
>  drivers/resctrl/mpam_devices.c                |  59 +-
>  drivers/resctrl/mpam_internal.h               |   8 +
>  drivers/resctrl/mpam_resctrl.c                | 879 +++++++++++++++---
>  drivers/resctrl/test_mpam_devices.c           |  67 ++
>  fs/resctrl/ctrlmondata.c                      |   6 +-
>  fs/resctrl/internal.h                         |  18 +-
>  fs/resctrl/monitor.c                          | 355 +++++--
>  fs/resctrl/pseudo_lock.c                      |   3 +
>  fs/resctrl/rdtgroup.c                         | 157 +++-
>  include/linux/memory.h                        |   1 +
>  include/linux/resctrl.h                       |  36 +-
>  include/linux/resctrl_types.h                 |  15 +-
>  .../selftests/resctrl/mb_emulation_test.c     | 314 +++++++
>  tools/testing/selftests/resctrl/resctrl.h     |   1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  17 files changed, 1827 insertions(+), 333 deletions(-)
>  create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c
> 

-- 
Best regards,
Jinjie


