Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B00C9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AOJSpCX+R0bDlynP+6N68DdkRxUEJ1g/UFBR1AkoKk=; b=gA8rsLCVM7SMfqvfzbJ0+cpvU1
	ae+ahsDY3X7FSkDiVqoaVhJIv9npbb+X3dgAZFsnmfcSrMCIJwk+zAWKU5IrvvFQmqLG/q0InIau/
	ynE2V1lPV1NCx1EDF58fCKlKbaRtyAIZlsZMMqTmf8XPp7iv15yujfqBmm6LUg2uDAo/J04IGQoGz
	LHJx9VByCwy7ndIO7DdwWjN/tGCt+SaP4Gf2JiwmZEC3x9IdVr824oz/oZlfrOz/mNTkQ9q/QVwXm
	bQLC5Eu9xxCGPW7MxOGa0B78ROz3AfTwpqR0Jf4mZpL/Qe03XPbFKG3xvohyI9Um6eIIfrJQ/tx5F
	i9p3lfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRV-00000005HM4-1GPW;
	Mon, 12 Jan 2026 11:50:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRS-00000005HKi-48Oh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:50:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B33A497;
	Mon, 12 Jan 2026 03:50:31 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4047B3F694;
	Mon, 12 Jan 2026 03:50:37 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: juno/vexpress: Updates for v6.20/v7.0
Date: Mon, 12 Jan 2026 11:50:17 +0000
Message-ID: <20260112115021.2551442-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112115021.2551442-1-sudeep.holla@arm.com>
References: <20260112115021.2551442-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035039_077311_65C11C7F 
X-CRM114-Status: UNSURE (   7.94  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.0

for you to fetch changes up to f0d0f087227c4b63538e4ed8292f1fa26f8d6633:

  arm64: dts: arm: Use hyphen in node names (2026-01-01 17:31:07 +0000)

----------------------------------------------------------------
Armv8 Juno/Vexpress updates for v7.0

This contains a small set of DT updates:

1. Align DTS node naming with established coding style by replacing underscores
   with hyphens in node names. This is a safe change and does not affect ABI.

2. Add support for the CMN PMU on the Arm Morello platform, exposing the
   CMN-Skeena (CMN-600 r3p1–compatible) PMU via the standard CMN-600 binding.
   This enables PMU access on real Morello SDP hardware, where the registers
   are functional.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: arm: Use hyphen in node names

Robin Murphy (1):
      arm64: dts: morello: Add CMN PMU

 arch/arm64/boot/dts/arm/morello-fvp.dts | 8 ++++----
 arch/arm64/boot/dts/arm/morello-sdp.dts | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

