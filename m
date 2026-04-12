Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9DBF3ED6B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyVw+XGE0yeCHhMxhRFW03kWOPVlHMkgtgSB30XJhxY=; b=vuEsOyaKAoRpQs8+dqsnRIdnm9
	l24XCnFZh2jPDIeiI79KLsqWCXqq72AT+FChHPY18b2FWV+VEKinzVVhVpVBIK5vuH/XH3onTRFla
	T5ZRqydkmUkXXUnqZ5sGLoMBbQ/C/oTwEIMfhKlj6WaCWeYrbyWBJyQ7r59OPIv+jH1mtwbRzU4H8
	8g/zOxUlv2ux9JbyYd69UrqMxlxz5d9ghGV85G2F7TEGw7zrDeryCAxrt1sQFo5cOWt3cZj06AP35
	w7cSMp0Q8ZXLl1TEIm9bgLawLHmhAQeU/u9IhhwG0sS+2g13dU1yXNYeBZKHyxuiw5+YljwzEwqyV
	L4HWbKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBidQ-0000000Dusm-17eQ;
	Sun, 12 Apr 2026 00:25:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBidM-0000000DusP-3SCJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 00:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA9CF4192E;
	Sun, 12 Apr 2026 00:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8FEC116C6;
	Sun, 12 Apr 2026 00:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775953500;
	bh=wWhlmhjjl4CB0h9vyF/dH5qF8wuNI73erHpwPmrCbpM=;
	h=Date:From:To:Cc:Subject:From;
	b=F/qg9T/UcUU6fpSAXbNPCUs9go6DcyZRtnCuBWsyv7BC+MocautWpjWobw07b+45J
	 EjBrrdD/3h8XbkfK5SC6tCqmtfHt9TXXaCDokOH3RiZWU8zH3u83R+Fq58hDAAICCd
	 H+Yq3SeVS9p4BLEc/hATIziNvOqSUIfkzRRO9dhqICC/3vKEPKb/L+kBOkjQTjojfT
	 U3zpZiU5729e3/KWV5cz4we82GOhcd+BIj3oog1W4qQH8N7DRgEMlANHWzWr4UKJgO
	 kj5F5CmyAZX+ymYhFRw++D11kcTX1ZYW10ogOLy6ZqySDbkJzj7gc/HLhHgo4nGqKt
	 tuYQYElxYyQRg==
Date: Sat, 11 Apr 2026 17:23:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>
Subject: [GIT PULL] CRC updates for 7.1
Message-ID: <20260412002343.GB6632@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_172504_886293_D0D8815F 
X-CRM114-Status: UNSURE (   9.87  )
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

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/crc-for-linus

for you to fetch changes up to 8fdef85d601db670e9c178314eedffe7bbb07e52:

  lib/crc: arm64: Simplify intrinsics implementation (2026-04-02 16:14:53 -0700)

----------------------------------------------------------------

- Several improvements related to crc_kunit, to align with the
  standard KUnit conventions and make it easier for developers and CI
  systems to run this test suite

- Add an arm64-optimized implementation of CRC64-NVME

- Remove unused code for big endian arm64

----------------------------------------------------------------
Ard Biesheuvel (3):
      lib/crc: arm64: Drop unnecessary chunking logic from crc64
      lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
      lib/crc: arm64: Simplify intrinsics implementation

Demian Shulhan (1):
      lib/crc: arm64: add NEON accelerated CRC64-NVMe implementation

Eric Biggers (8):
      lib/crc: tests: Make crc_kunit test only the enabled CRC variants
      lib/crc: tests: Add CRC_ENABLE_ALL_FOR_KUNIT
      lib/crc: tests: Add a .kunitconfig file
      kunit: configs: Enable all CRC tests in all_tests.config
      crypto: crc32c - Remove more outdated usage information
      crypto: crc32c - Remove another outdated comment
      lib/crc: arm64: Drop check for CONFIG_KERNEL_MODE_NEON
      lib/crc: arm64: Assume a little-endian kernel

 crypto/crc32c.c                              | 19 +-------
 lib/crc/.kunitconfig                         |  3 ++
 lib/crc/Kconfig                              | 20 ++++++---
 lib/crc/Makefile                             |  7 ++-
 lib/crc/arm64/crc-t10dif-core.S              | 56 ++++++++++++------------
 lib/crc/arm64/crc32-core.S                   |  9 +---
 lib/crc/arm64/crc64-neon-inner.c             | 65 ++++++++++++++++++++++++++++
 lib/crc/arm64/crc64.h                        | 28 ++++++++++++
 lib/crc/tests/crc_kunit.c                    | 28 +++++++++---
 tools/testing/kunit/configs/all_tests.config |  2 +
 10 files changed, 172 insertions(+), 65 deletions(-)
 create mode 100644 lib/crc/.kunitconfig
 create mode 100644 lib/crc/arm64/crc64-neon-inner.c
 create mode 100644 lib/crc/arm64/crc64.h

