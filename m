Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E42CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 05:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwOZTkRoALza710BPglWSnjfyn/AZ1mAUg08077jjNI=; b=MZ8KEWfaekJspH3vUo6PGfXjDj
	4b5POapuUoRuz3G/fBd5HX5hQeq/PxeY0pOsrjp/MSccSAJW7eNewh7rGMQQqCIGqUh+u/9umbpNN
	GXkEiyrLk6GvKaoq9fDf2wRYJmSPpb06kXyb0VWljtBtkOprA3tG854OnSI5ELzOpB6AEsMI08/R7
	yUMVmTwADOzIFlQGGTtJjWgfQl1rJd+BPtsfwJn3e/akGPmJ6iOQjEolHFLQKFpPDw+FmbKZGHSR/
	wm53QomZJXzpMx9xE4JhtyiMmOVrrhqakfPbW8zg36IPuLKZIU+pWOyqm62FbzjtdZVesY664u/zP
	Smwywssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYH1r-0000000ByVg-2M4t;
	Sat, 13 Jun 2026 05:35:35 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYH1o-0000000ByVT-41Wq;
	Sat, 13 Jun 2026 05:35:32 +0000
Message-ID: <09e893be-6a87-4fd5-805f-6fcae67485a5@infradead.org>
Date: Fri, 12 Jun 2026 22:35:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/31] Introduce SCMI Telemetry FS support
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org,
 elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
 brauner@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
 kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
 kernel-team@meta.com
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/12/26 3:37 PM, Cristian Marussi wrote:
> Hi all,
> 
> --------------------------------------------------------------------------------
> [TLDR Summary]
> This series introduces a new SCMI driver which uses a new Telemetry FS to expose
> and configure SCMI Telemetry Data Events retrieved from the platform SCMI FW
> at runtime. The patches carrying the new STLMFS Filesystem support are tagged
> with 'stlmfs'.
> --------------------------------------------------------------------------------

> ---
>  - moved from SysFS/chardev to a full fledged FS
>  - added support for SCMI Telemetry BLK timestamps
> 

'make htmldocs' with all documentation patches applied says:

WARNING: linext-2026-0610/Documentation/ABI/testing/stlmfs:5: tag 'contact' is invalid
		Rationale:	This filesystem provides access to SCMI telemetry data and

WARNING: linext-2026-0610/Documentation/ABI/testing/stlmfs:21: tag 'contact' is invalid
		Concurrency:	The telemetry configuration exposed through this filesystem is

Documentation/ABI/testing/stlmfs:55: ERROR: Unexpected indentation. [docutils]
Documentation/ABI/testing/stlmfs:69: ERROR: Unexpected indentation. [docutils]
Documentation/ABI/testing/stlmfs:282: ERROR: Unexpected indentation. [docutils]

WARNING: linext-2026-0610/Documentation/ABI/testing/stlmfs:39: abi_sys_fs_arm_telemetry_tlm_n doesn't have a description
linext-2026-0610/Documentation/filesystems/stlmfs.rst:255: WARNING: Title underline too short.

by-components/
----------- [docutils]

linext-2026-0610/Documentation/filesystems/stlmfs.rst: WARNING: document isn't included in any toctree [toc.not_included]


Please correct these and run 'make htmldocs' to verify that they are fixed.

> 
> Thanks,
> Cristian
> 
> [0]: https://developer.arm.com/documentation/den0056/f/?lang=en
> [1]: https://lore.kernel.org/arm-scmi/20250620192813.2463367-1-cristian.marussi@arm.com/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?h=scmi_telemetry_unified_fs_V4
> 
> Cristian Marussi (31):
>   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
>   firmware: arm_scmi: Reduce the scope of protocols mutex
>   firmware: arm_scmi: Allow registration of unknown-size events/reports
>   firmware: arm_scmi: Allow protocols to register for notifications
>   uapi: Add ARM SCMI definitions
>   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
>   include: trace: Add Telemetry trace events
>   firmware: arm_scmi: Add basic Telemetry support
>   firmware: arm_scmi: Add support to parse SHMTIs areas
>   firmware: arm_scmi: Add Telemetry configuration operations
>   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
>   firmware: arm_scmi: Add support for Telemetry reset
>   firmware: arm_scmi: Add Telemetry notification support
>   firmware: arm_scmi: Add support for boot-on Telemetry
>   firmware: arm_scmi: Add Telemetry generation counter
>   firmware: arm_scmi: Add common per-protocol debugfs support
>   firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
>   firmware: arm_scmi: Add Telemetry debugfs ABI documentation
>   firmware: arm_scmi: stlmfs: Add System Telemetry filesystem driver
>   fs/stlmfs: Document ARM SCMI Telemetry filesystem
>   firmware: arm_scmi: stlmfs: Add basic mount options
>   fs/stlmfs: Document ARM SCMI Telemetry FS mount options
>   firmware: arm_scmi: stlmfs: Add ioctls support
>   fs/stlmfs: Document alternative ioctl based binary interface
>   firmware: arm_scmi: stlmfs: Add by-components view
>   fs/stlmfs: Document alternative topological view
>   firmware: arm_scmi: stlmfs: Add generation file
>   [RFC] docs: stlmfs: Document ARM SCMI Telemetry FS ABI
>   firmware: arm_scmi: stlmfs: Add lazy population support
>   fs/stlmfs: Document lazy mode and related mount option
>   [RFC] tools/scmi: Add SCMI Telemetry testing tool
> 
>  Documentation/ABI/testing/debugfs-scmi        |   22 +
>  Documentation/ABI/testing/stlmfs              |  348 ++
>  .../bindings/firmware/arm,scmi.yaml           |    8 +
>  Documentation/filesystems/stlmfs.rst          |  342 ++
>  MAINTAINERS                                   |    1 +
>  drivers/firmware/arm_scmi/Kconfig             |   24 +
>  drivers/firmware/arm_scmi/Makefile            |    3 +-
>  drivers/firmware/arm_scmi/common.h            |   10 +
>  drivers/firmware/arm_scmi/driver.c            |   93 +-
>  drivers/firmware/arm_scmi/notify.c            |   30 +-
>  drivers/firmware/arm_scmi/notify.h            |    8 +-
>  drivers/firmware/arm_scmi/protocols.h         |   13 +
>  .../firmware/arm_scmi/scmi_system_telemetry.c | 3146 ++++++++++++++++
>  drivers/firmware/arm_scmi/telemetry.c         | 3300 +++++++++++++++++
>  include/linux/scmi_protocol.h                 |  203 +-
>  include/trace/events/scmi.h                   |   48 +-
>  include/uapi/linux/scmi.h                     |  289 ++
>  tools/testing/scmi/Makefile                   |   25 +
>  tools/testing/scmi/stlm.c                     |  434 +++
>  19 files changed, 8307 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/ABI/testing/stlmfs
>  create mode 100644 Documentation/filesystems/stlmfs.rst
>  create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
>  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
>  create mode 100644 include/uapi/linux/scmi.h
>  create mode 100644 tools/testing/scmi/Makefile
>  create mode 100644 tools/testing/scmi/stlm.c
> 

-- 
~Randy


