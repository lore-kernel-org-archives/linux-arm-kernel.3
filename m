Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D031C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sn3xyr3rP3XpZ3kO5j3MbW8/DsZMZbhQpmixE8NXzjY=; b=HYPUrfQb9jRoLIFpj27jPduA2Z
	7syNSwePbryWIiaZ6lVLNEwewFFlK2l48vz3DxATkHzrKmrjVIlQ+UOXHxUvZg2Y68ORRmWo0Xjas
	q4te3ReBKesN1wgKvW42PlF7WAUJCXSmLi7N+xYrF2qDmqbxmUjyj5cwdf+QUesrYqcbCY3n3lt9b
	qB250+4xCsMjdwAeIhU4aDS6FkkkdB8XBzkTc9cQkt3EZlbc8ho/ssqb9Fl1sbTjh+bWDSR4u0RzT
	pcmRlGHL0o2sPrT3x5xos3ufJA7ADxxz1NdHT8krsuZpdpjKYkecmOrp/m8j4jLKhPKSNiuyIon4I
	P4OruhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BLC-0000000DKK5-2cZ5;
	Fri, 11 Apr 2025 10:10:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Akz-0000000DDez-0O8L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:33:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9346D106F;
	Fri, 11 Apr 2025 02:33:04 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A60E3F6A8;
	Fri, 11 Apr 2025 02:33:03 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: morello: Fix for v6.15
Date: Fri, 11 Apr 2025 10:33:01 +0100
Message-Id: <20250411093301.1060540-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_023305_170424_B6C5105E 
X-CRM114-Status: UNSURE (   7.18  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-fix-6.15

for you to fetch changes up to 0c562281199f225a849dbb5b9a40b079ee31dc0e:

  arm64: dts: morello: Fix-up cache nodes (2025-04-10 14:04:03 +0100)

----------------------------------------------------------------
Armv8 Morello fix for v6.15

Just a single fix addressing the cache node inconsistencies. It removed
unnecessary CPU number from L2 cache node names since they are local to
CPU nodes and should simply be named "l2-cache" and relocates the shared
L3 cache node from under cpu@0/l2-cache to the /cpus node, which is the
standard location for shared caches.

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: morello: Fix-up cache nodes

 arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

