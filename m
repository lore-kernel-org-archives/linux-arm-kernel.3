Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F14FD44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5q0oykchQxcjvhNmbML+h5LhyzXlsv/TTETJqpkYu78=; b=hCgJt/hxFZ7LDma4H4yZyv4IjC
	mOWlainNrwzQUhIChLwj8wN2SIaoNumL2MeM3jH7A6m0RxjaX/kEKlrt2MMlcDZf5IT1XtOOCiE5D
	3yhmcZySbmf+lS5T8nYxb2BlutL5rfDxu/f0SrChS5eP/IvvANm+mJDUFCascMLAklu6DZYy5+PH2
	AamujdsHhNajIyxWMFkJfE9cSx5oRF4KFHTeaSuyCJRD9LcG9vl+hW2WIgg2zHP+eukJSejfY4XuU
	peYFS7t75dz3AzKFkw4lxuO7qQJDmaGtckp6IZz9hs8UmGNXyh3G1vgyLo+E7HxGQ8S60VaerC+9u
	yLrRSzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eds-000000032dx-1SHR;
	Wed, 06 Nov 2024 11:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dsr-00000002sHt-2QaO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:07:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB52A1063;
	Wed,  6 Nov 2024 03:08:01 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B282B3F6A8;
	Wed,  6 Nov 2024 03:07:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.13
Date: Wed,  6 Nov 2024 11:07:27 +0000
Message-Id: <20241106110727.4007489-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_030733_726919_6A4C62A0 
X-CRM114-Status: GOOD (  15.11  )
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

Hi ARM SoC Team,

Please pull ! Sorry for the late PR but most of the changes are in -next
for a while now.

Regards,
Sudeep

-->8

The following changes since commit 54962707f8b8b53812d3d7fca279a68c6e18faae:

  firmware: arm_scmi: Use vendor string in max-rx-timeout-ms (2024-10-28 14:49:27 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.13

for you to fetch changes up to 109aa654f85c5141e813b2cd1bd36d90be678407:

  firmware: arm_scpi: Check the DVFS OPP count returned by the firmware (2024-11-06 10:48:13 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.13

Just couple of main additions:
1. Support for variable I/O width within ARM SCMI shared memory area.

   Some shared memory areas might only support a certain access width,
   such as 32-bit, which memcpy_{from,to}_io() does not adhere to at least
   on ARM64 by making both 8-bit and 64-bit accesses to such memory.

    This support updates the shmem layer to support reading from and
    writing to such shared memory area using the specified I/O width
    in the Device Tree. The various transport layers making use of the
    shmem.c code are updated accordingly to pass the I/O accessors that
    they store. The device tree bindings are also updated for the same.

2. Extension of SCMI transport bindings to add more properties

   SCMI transports are characterized by a number of properties. The
   values assumed by some of them tightly depend on the choices taken at
   design time and on the overall archiecture of the specific platform:
   things like timeouts, maximum message size and number of in-flight
   messages are closely tied to the architecture of the platform like
   number of SCMI agents on the system, physical memory available to the
   SCMI platform and so on. Such details are not discoverable as they are
   outside the scope of the SCMI protocol specification.

   Currently such properties are simple default values defined at build
   time, but the increasing number and variety of platforms using SCMI
   with a wide range of designs has increased the need to have a way to
   describe such properties across all these platforms.

Apart from the above two, there is one NULL pointer dereference fix for
very age old SCPI protocol driver which seems to be still in use on few
platforms.

----------------------------------------------------------------
Cristian Marussi (5):
      firmware: arm_scmi: Account for SHMEM memory overhead
      firmware: arm_scmi: Calculate virtio PDU max size dynamically
      dt-bindings: firmware: arm,scmi: Introduce more transport properties
      firmware: arm_scmi: Use max_msg and max_msg_size devicetree properties
      firmware: arm_scmi: Relocate atomic_threshold to scmi_desc

Florian Fainelli (2):
      dt-bindings: sram: Document reg-io-width property
      firmware: arm_scmi: Support 'reg-io-width' property for shared memory

Luo Qiu (1):
      firmware: arm_scpi: Check the DVFS OPP count returned by the firmware

 .../devicetree/bindings/firmware/arm,scmi.yaml     | 15 ++++
 Documentation/devicetree/bindings/sram/sram.yaml   |  6 ++
 drivers/firmware/arm_scmi/common.h                 | 45 ++++++++++--
 drivers/firmware/arm_scmi/driver.c                 | 42 ++++++-----
 drivers/firmware/arm_scmi/shmem.c                  | 85 ++++++++++++++++++++--
 drivers/firmware/arm_scmi/transports/mailbox.c     | 15 ++--
 drivers/firmware/arm_scmi/transports/optee.c       | 19 +++--
 drivers/firmware/arm_scmi/transports/smc.c         | 13 +++-
 drivers/firmware/arm_scmi/transports/virtio.c      | 15 ++--
 drivers/firmware/arm_scpi.c                        |  3 +
 10 files changed, 204 insertions(+), 54 deletions(-)

