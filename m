Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9757FC282E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/el4ImijIaTbU+TMZFvGIQJfm5fdyGvKd0OWMsUr8s=; b=mxQXXXzbvcAv9T5bwJBWd0e2cX
	Zzwuc/wMOyOrtMZOq/VkpqWvrkXjV/CUHt+YDnhsy0cIWb09V1WTcHhbz+daQCZ4tUdzmcHbkGxFl
	5YB5GX5BvYYXp0ZZJE72Swza9LABqfu0ISVSnVA/2pb9AjHILszPYH+LrX/eAynPtZyn0ska3swEZ
	uht+VUFv2F0hEPaF5wolbs82+TIi+xYFR0Si84s/ljSvG4rOGOlvhw1QGwcgUTH35dK/GLt1bbj/P
	D8DCAGq2Y0B7LErPImxnPTl2M3CDOA7RxHPx1ESftI7NvgHmkEThU94Vmr0OMH/0grJw/n7vYJBxY
	HpdfX+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4z-00000004Ws0-3ucp;
	Tue, 04 Mar 2025 12:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPza-00000004J0X-3EDe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:59:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC58FEC;
	Tue,  4 Mar 2025 02:59:32 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AFD83F5A1;
	Tue,  4 Mar 2025 02:59:17 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.15
Date: Tue,  4 Mar 2025 10:59:15 +0000
Message-Id: <20250304105915.432967-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025918_847839_7EB160F9 
X-CRM114-Status: UNSURE (   7.54  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.15

for you to fetch changes up to d069c33f5ce2fe8f13489ba396080fcf28c10f60:

  firmware: arm_scmi: Emit modalias for SCMI devices (2025-02-03 10:50:11 +0000)

----------------------------------------------------------------
Arm SCMI updates for v6.15

Couple of updates around the flexibility in SCMI device names and
addition of name, protocol id attributes and modalias for SCMI
devices in the sysfs.

Currently, in the scmi_protocol_device_request() function, SCMI device
names ust be unique across all protocols. However, this constraint is
being relaxed, allowing devices in different protocols to share the
same name. The change aims to provide more flexibility in naming devices
across various protocols.

Two attributes: name and protocol ID is being added to the SCMI device
in the sysfs along with the support for the modalias. These attributes
aim to enhance device identification and management.

----------------------------------------------------------------
Sudeep Holla (3):
      firmware: arm_scmi: Relax duplicate name constraint across protocol ids
      firmware: arm_scmi: Add name and protocol id attributes
      firmware: arm_scmi: Emit modalias for SCMI devices

 drivers/firmware/arm_scmi/bus.c | 69 +++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 13 deletions(-)

