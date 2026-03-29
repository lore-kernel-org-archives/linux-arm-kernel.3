Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0693F3D611
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xm70l0P0DE6Kg2CGCNYho7eG4W1zTiMVvta8sfoJdCs=; b=ITpS0mouvlEbU2SmL3hxN8UI6T
	fB1TbkCzW5H+746fDhZlTOwajWmDJwHv22Gz1OOvneW3GkP7d0yLlM/63GqoGx5zgDg4li9E7AeeP
	6Av3Ru/r7Mg3PvN9Az88W8WqAS3MwXG5Ca9rTUlSsiVWQMyEuOa/sJyOsa4so8+nlJ3JMJhtccSiO
	qWDkSbe7wjCrvykUY1VIbncS/UnJnspObw+28Nejg40Tx+mJSrxAqCgk/bSHVFUVMjGjMMoFQM46e
	gRWeMk3ZZg27yKkY0M7YEZDRiun4DskCjudxo4z3AInDg9k9Ia/L6j3ach5Oi9qXOG1qVqJ7aCCa9
	KjASup3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t6h-0000000A8Zn-2hif;
	Sun, 29 Mar 2026 16:35:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t6R-0000000A8Ld-1CpD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A4D3627;
	Sun, 29 Mar 2026 09:35:00 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 207B13F915;
	Sun, 29 Mar 2026 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802106; bh=+zh0urziGAefKgfVOunX1/WaS1S+gkrpWvVvM0jwfa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzDWjKGPu+UkDw3K5vHtYqZVvhw40xWOsjnWmyLTA23ziPV4FU22g7i4SvihjMa9j
	 n7zaYAwgO19yq6gqT/ZC7R2yIuqP4wHqZiXsEYTRP9l+9Vu3KDe+B2Ibr0I7f5Tnth
	 0g/Ee4yJLb4Xrzfep9I4Anp56zzxkXVpsy7X5ef0=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 16/24] fs/stlmfs: Document ARM SCMI Telemetry filesystem
Date: Sun, 29 Mar 2026 17:33:27 +0100
Message-ID: <20260329163337.637393-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093507_441489_7E011F47 
X-CRM114-Status: GOOD (  19.95  )
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

Introduce initial ARM SCMI Telemetry filesystem documentation.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - changed tstamp_exp to tstamp_rate
---
 Documentation/filesystems/stlmfs.rst | 199 +++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100644 Documentation/filesystems/stlmfs.rst

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
new file mode 100644
index 000000000000..2b49beb5b960
--- /dev/null
+++ b/Documentation/filesystems/stlmfs.rst
@@ -0,0 +1,199 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+STLMFS - Arm SCMI Telemetry Pseudo Filesystem
+=============================================
+
+.. contents::
+
+Overview
+========
+
+ARM SCMI is a System and Configuration Management protocol, based on a
+client-server model, that defines a number of messages that allows a
+client/agent like Linux to discover, configure and make use of services
+provided by the server/platform firmware.
+
+SCMI v4.0 introduced support for System Telemetry, through which an agent
+can dynamically enumerate configure and collect Telemetry Data Events (DE)
+exposed by the platform.
+
+This filesystem, in turn, exposes to userspace the set of discovered DEs
+allowing for their configuration and retrieval.
+
+Rationale
+=========
+
+**Why not using SysFS/KernFS or DebugFS ?**
+
+The provided userspace interface aims to satisfy 2 main concurrent
+requirements:
+
+ - expose an FS-based human-readable interface that can be used to
+   discover, configure and access Telemetry data directly from the
+   shell
+
+ - allow also alternative machine-friendly, more-performant, binary
+   interfaces that can be used by custom tools without the overhead of
+   multiple accesses through the VFS layers and the hassle of navigating
+   vast filesystem tree structures
+
+All of the above is meant to be available on production systems, not
+simply as a tool for development or testing, so debugFS is NOT an option
+here.
+
+An initial design based on SysFS and chardev/ioctl based interfaces was
+dropped in favour of this full-fledged filesystem implementation since:
+
+- SysFS is a standard way to expose device related properties using a few
+  common helpers built on kernfs; this means, though, that unfortunately in
+  our scenario we would have to generate a dummy simple device for each
+  discovered DE.
+  This by itself seems an abuse of the SysFS framework, but even ignoring
+  this, the sheer number of potentially discoverable DEs (in the order of
+  tens of thousands easily) would have led to the creation of a sensibly
+  vast number of dummy DE devices.
+
+- SysFS usage itself has its well-known constraints and best practices,
+  like the one-file/one-value rule, that hardly cope with SCMI Telemetry
+  needs.
+
+- The need to implement more complex file operations (ioctls/mmap) in
+  order to support the alternative binary interfaces does not fit with
+  SysFS/kernFS facilities.
+
+- Given the nature of the Telemetry protocol, the hybrid approach with
+  chardev/ioctl was itself problematic: on one side being upper-limited
+  in the number of chardev potentially created by the minor numbers
+  availability, on the other side the hassle of having to maintain a
+  completely different interface on the side of a FS based one.
+
+Design
+======
+
+STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
+discovered dynamically at run-time via SCMI.
+
+Inodes are all dynamically created at mount-time from a dedicated
+kmem_cache based on the gathered available SCMI Telemetry information.
+
+Since inodes represent the discovered Telemetry entities, which in turn are
+statically defined at the platform level and immutable throughout the same
+session (boot), allocated inodes are freed only at unmount-time and the
+user is not allowed to delete or create any kind of file within the STLMFS
+filesystem after mount has completed.
+
+A single instance of STLMFS is created at the filesystem level, using
+get_tree_single(), given that the same SCMI backend entities will be
+involved no matter how many times you mount it.
+
+Mountpoints
+===========
+
+A pre-defined mountpoint is available at::
+
+	/sys/fs/arm_telemetry/
+
+Usage
+=====
+
+.. Note::
+	See Documentation/ABI/testing/stlmfs for a detailed description of
+	this ABI.
+
+The filesystem can be typically mounted with::
+
+	mount -t stlmfs none /sys/fs/arm_telemetry
+
+It will proceed to create a top subdirectory for each of the discovered
+SCMI Telemetry instances named as 'tlm_<N>' under which it will create
+the following directory structure::
+
+	/sys/fs/arm_telemetry/tlm_0/
+	|-- all_des_enable
+	|-- all_des_tstamp_enable
+	|-- available_update_intervals_ms
+	|-- current_update_interval_ms
+	|-- de_implementation_version
+	|-- des/
+	|   |-- ...
+	|   |-- ...
+	|   `-- ...
+	|-- des_bulk_read
+	|-- des_single_sample_read
+	|-- groups
+	|   |-- ...
+	|   |-- ...
+	|   `-- ...
+	|-- intervals_discrete
+	|-- reset
+	|-- tlm_enable
+	`-- version
+
+Each subdirectory is defined as follows.
+
+des/
+----
+A subtree containing in turn one subdirectory for each discovered DE and
+named by Data Event ID in hexadecimal form as in::
+
+	|-- des
+	|   |-- 0x00000000
+	|   |-- 0x00000016
+	|   |-- 0x00001010
+	|   |-- 0x0000A000
+	|   |-- 0x0000A001
+	|   |-- 0x0000A002
+	|   |-- 0x0000A005
+	|   |-- ..........
+	|   |-- ..........
+	|   |-- 0x0000A007
+	|   |-- 0x0000A008
+	|   |-- 0x0000A00A
+	|   |-- 0x0000A00B
+	|   |-- 0x0000A00C
+	|   `-- 0x0000A010
+
+where each dedicated DE subdirectory in turn will contain files used to
+describe some DE characteristics, configure it, or read its current data
+value as in::
+
+	tlm_0/des/0xA001/
+	|-- compo_instance_id
+	|-- compo_type
+	|-- enable
+	|-- instance_id
+	|-- name
+	|-- persistent
+	|-- tstamp_enable
+	|-- tstamp_rate
+	|-- type
+	|-- unit
+	|-- unit_exp
+	`-- value
+
+groups/
+-------
+
+An optional subtree containing in turn one subdirectory for each discovered
+Group and named by Group ID as in::
+
+	|-- groups
+	|   |-- 0
+	|   |-- ..
+	|   `-- 1
+
+where each dedicated GROUP subdirectory in turn will contain files used to
+describe some Group characteristics, configure it, or read its current data
+values, as in::
+
+	scmi_tlm_0/groups/0/
+	|-- available_update_intervals_ms
+	|-- composing_des
+	|-- current_update_interval_ms
+	|-- des_bulk_read
+	|-- des_single_sample_read
+	|-- enable
+	|-- intervals_discrete
+	`-- tstamp_enable
+
-- 
2.53.0


