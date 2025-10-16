Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B0BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UwtIO52M01Iu1Hf0z6X8ZKBzADbe0m7g55gwMnLUzdY=; b=3W5pfXbqP8bp3b18BRJXtWOPy0
	YOoPlAKHMyGkLw7rJIDDQ0U38bNcY3jBv9LAVpX/BW31fChfnGM5fcLr8Ry01hLnlZBX1nNX9lQBs
	SQ/yNGW9XHZFr40l8XVRqd51y1Z4IMme2BuTr+HNiT6ydIctl6vpeg00l/lixQTKXw09w29fR/M5Q
	0tW/smKu83X6Mm+4BmHsOzWUdxxM0xt7F+cRWDtTb4lnqTUzLzbJnbfeAVLlA8UdKWHpR1GGWKoS1
	TZ2HScrzW8BvoBXpqlUoRUYbZ4B8hGqHA1hmOwp5bRnmWH5eeAfVYegO/QCQtZ9/VnrseVUwFjQaF
	xYMGJBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KMq-00000004DrB-2SMe;
	Thu, 16 Oct 2025 09:33:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KMo-00000004DqI-1u61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:33:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055D91688;
	Thu, 16 Oct 2025 02:33:42 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0B893F6A8;
	Thu, 16 Oct 2025 02:33:48 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fix for v6.18
Date: Thu, 16 Oct 2025 10:33:46 +0100
Message-Id: <20251016093346.945036-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_023350_546224_E4B789AE 
X-CRM114-Status: UNSURE (   7.13  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.18

for you to fetch changes up to 11fb1a82aefa6f7fea6ac82334edb5639b9927df:

  firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor (2025-10-13 10:34:46 +0100)

----------------------------------------------------------------
Arm FF-A fix for v6.18

The FF-A driver was updated to support specification version 1.2 but omitted
support for the 16-byte implementation-defined (IMPDEF) field introduced in
FF-A v1.2 within the Endpoint Memory Access Descriptor (EMAD). This omission
breaks all memory interfaces.

This change updates the EMAD sizing and offset logic to correctly handle the
FF-A v1.2 layout while preserving backward compatibility with older versions.

----------------------------------------------------------------
Sudeep Holla (1):
      firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor

 drivers/firmware/arm_ffa/driver.c | 37 +++++++++++++++++++++++++++----------
 include/linux/arm_ffa.h           | 21 +++++++++++++++++++--
 2 files changed, 46 insertions(+), 12 deletions(-)

