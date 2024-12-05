Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6FEE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mXxkS1vS/kL4yv3RzBcUaxy4y/wsAKRKnz+x4WsCaDk=; b=xLphCaDFJCnPbNUUGIh5/09QzQ
	F8dqKJEkhsSXsb/0sAGPZARlgxNkD09m7U71h99qy9tkcnTlkdXJZWpxv6Agi/VprOM62+V2U3WaT
	6y6OOqtYKayGCEdGYeczA4PtSQ6ZhNTIlApa8fYTxsSqTaQcJgcN+YM86kbArlBNdzOhuV59lp029
	T9/2jrkjIbqVmn1F9Akj33ErAWVNi8OevRl9BXgqcM3rxsfHPDpLzbT7ANe10s9ru83Sy9Cq6jmxb
	WrhTiGsiT3/aIZkk3LGnXXrk7Ruv8mwBudBA6nQOWVNCbzil8u0XG6V8TRD06tl3u5kQMvQIc4hcD
	hDIttvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAJK-0000000FmQp-21PK;
	Thu, 05 Dec 2024 11:46:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAGJ-0000000FlN0-2oIE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:43:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB9A4FEC;
	Thu,  5 Dec 2024 03:43:42 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54C673F71E;
	Thu,  5 Dec 2024 03:43:13 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] arm64: dts: juno: Fixes for v6.13
Date: Thu,  5 Dec 2024 11:43:02 +0000
Message-Id: <20241205114302.708433-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034315_747349_ECBE52C4 
X-CRM114-Status: UNSURE (   6.99  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-6.13

for you to fetch changes up to 4f776d81bf927a4f25d5e32a4d0df08ee509dd6c:

  arm64: dts: fvp: Update PCIe bus-range property (2024-12-05 10:28:26 +0000)

----------------------------------------------------------------
Armv8 Juno fix for v6.13

Just a single fix updating the PCIe bus address range to accommodate
the full ECAM window of 256MB available on most of the recent versions
of RevC FVP models.

----------------------------------------------------------------
Aneesh Kumar K.V (Arm) (1):
      arm64: dts: fvp: Update PCIe bus-range property

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

