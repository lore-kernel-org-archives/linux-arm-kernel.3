Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4203CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDl9WiRVkFnZ4KGhUiamMsE2H6ZfjTwqBgTNaY1yr7U=; b=Hj+6DUXOSobqJgaI0KhyHcaDyJ
	2p8BfeEg/MOVLds7U/WH8/kgDvwK099qlYcbngfTV5xNkwRLIZ7SzkuIFxMZcexXkW9oigrms2ZYW
	y+xSthTP3jpSjEsTxzW7DnUD6ZmaVsnlYKub9sk6YQ+qfTSP6J59UuVwUHyX6hCc+pXZEmb4Kc+4Q
	9ELh1KPhmD21CWbTSzMAYugc/mzTkkSl1MoYHj9KMTitpvZQ1J9+k7GfyHoGiJLWqh7Lg2B9uG5tl
	ySOW6tVlpWlPu76+NzzvCcgFM9qSoX7cwj2zNEt7sbLjXCAMGnKwfq9kkG8bt5FFc/ZYDgVKZQEEO
	3wvRlYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfwS-00000006Er2-2ca5;
	Thu, 28 May 2026 18:58:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfwQ-00000006Eqe-3Kqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:58:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B584D43861;
	Thu, 28 May 2026 18:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617171F00A3A;
	Thu, 28 May 2026 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779994729;
	bh=dDl9WiRVkFnZ4KGhUiamMsE2H6ZfjTwqBgTNaY1yr7U=;
	h=From:To:Cc:Subject:Date;
	b=V+XmSXXCwcFoSJLN0hohvGp86TLcp1ewIHOc90trTleZoLNe7H8Cp6uqk7ujSjlR3
	 Z0Z9XHOml16LfD0G+ulUMz3It+B8WYEQzfSjj1Uc9vcJimt9fApdzT+TxipEFf2eO7
	 b9PZWyG/EcOelMGiC3Cht0WiLpEyiuU00Vw3TIVJh0kq3JOKWVdOhRS5QB1O/E0d33
	 Q3JlnkqQO2OqZ+Loe5BkegBKfbI6J4a24vKM7PQf2xpOD8vIZyabUln6xENT7GSTsF
	 FLurdNIPMLutZAOom3dAQEtdN/iHHze7+2gxPdZxR1mx3xmwWBpqzlFw2rnsLfjFx9
	 aJqm1JwqhlD2w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.2
Date: Thu, 28 May 2026 19:58:26 +0100
Message-ID: <20260528185827.776851-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_115850_879736_D9F9EBAA 
X-CRM114-Status: UNSURE (   9.19  )
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8
The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.2

for you to fetch changes up to 524abd2fa6907ebe2762342be339afcc5b227dc4:

  firmware: arm_scmi: optee: Rework transport probe sequence (2026-05-21 17:31:51 +0100)

----------------------------------------------------------------
Arm SCMI updates for v7.2

1. Improve SCMI clock handling with a protocol-level determine_rate operation,
   simplified per-clock rate properties, dynamic rate allocation, bounded
   iterator support, lazy full-rate discovery, and hardened parent/rate
   enumeration.

2. Fix several SCMI bounds and payload validation issues, including clock rate
   discovery OOB handling, power domain name lookup, Powercap domain state
   access, BASE_ERROR_EVENT and SENSOR_UPDATE payload sizing, and sensor config
   width handling.

3. Rework SCMI transport probing for virtio and OP-TEE using per-instance
   transport handles and a generic transport supplier, removing the need to
   register SCMI core drivers from transport probe paths.

4. Add i.MX SCMI MISC reset reason support and print i.MX95 boot/shutdown
   reasons via the System Manager interface.

5. Clean up SCMI core internals, including base-info naming, quirk parsing and
   table iteration, and list iteration.

6. Fix SCPI clock provider removal so child clock providers are unregistered
   using the same DT nodes used at registration time.

----------------------------------------------------------------
Cristian Marussi (16):
      clk: scmi: Fix clock rate rounding
      firmware: arm_scmi: Add clock determine_rate operation
      clk: scmi: Use new determine_rate clock operation
      firmware: arm_scmi: Simplify clock rates exposed interface
      clk: scmi: Use new simplified per-clock rate properties
      firmware: arm_scmi: Drop unused clock rate interfaces
      firmware: arm_scmi: Make clock rates allocation dynamic
      firmware: arm_scmi: Harden clock parents discovery
      firmware: arm_scmi: Refactor iterators internal allocation
      firmware: arm_scmi: Add bound iterators support
      firmware: arm_scmi: Use bound iterators to minimize discovered rates
      firmware: arm_scmi: Introduce all_rates_get clock operation
      firmware: arm_scmi: Add transport instance handles
      firmware: arm_scmi: Add a generic transport supplier
      firmware: arm_scmi: virtio: Rework transport probe sequence
      firmware: arm_scmi: optee: Rework transport probe sequence

Geert Uytterhoeven (7):
      firmware: arm_scmi: quirk: Improve quirk range parsing
      firmware: arm_scmi: quirk: Simplify quirk table iteration
      firmware: arm_scmi: Convert to list_for_each_entry()
      firmware: arm_scmi: Fix bound iterators returning too many items
      firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
      firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
      firmware: arm_scmi: Fix OOB in scmi_power_name_get()

Marek Vasut (1):
      firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info

Peng Fan (2):
      firmware: arm_scmi: imx: Support getting reset reason of MISC protocol
      firmware: imx: sm-misc: Print boot/shutdown reasons

Stepan Ionichev (1):
      clk: scpi: Unregister child clock providers on remove

Sudeep Holla (4):
      firmware: arm_scmi: Read sensor config as 32-bit value
      firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      firmware: arm_scmi: Validate Powercap domains before state access

 drivers/clk/clk-scmi.c                             |  48 +---
 drivers/clk/clk-scpi.c                             |   2 +-
 drivers/firmware/arm_scmi/base.c                   |  25 +-
 drivers/firmware/arm_scmi/clock.c                  | 301 ++++++++++++++++-----
 drivers/firmware/arm_scmi/common.h                 | 165 ++++++++++-
 drivers/firmware/arm_scmi/driver.c                 |  98 ++++---
 drivers/firmware/arm_scmi/power.c                  |   6 +-
 drivers/firmware/arm_scmi/powercap.c               |  18 +-
 drivers/firmware/arm_scmi/protocols.h              |  13 +-
 drivers/firmware/arm_scmi/quirks.c                 |  17 +-
 drivers/firmware/arm_scmi/sensors.c                |  12 +-
 drivers/firmware/arm_scmi/transports/optee.c       |  46 +++-
 drivers/firmware/arm_scmi/transports/virtio.c      |  52 +++-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  86 ++++++
 drivers/firmware/imx/sm-misc.c                     |  73 +++++
 include/linux/scmi_imx_protocol.h                  |  14 +
 include/linux/scmi_protocol.h                      |  36 +--
 17 files changed, 802 insertions(+), 210 deletions(-)

