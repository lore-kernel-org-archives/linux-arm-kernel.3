Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D19CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nohWA6Z3QOs8Euk83tp6VSWyE7ASO/iSFcpEAB1p3Gs=; b=Q4VbEA5t6H9vTsnOHNrWKlB+Hq
	rhQ8QctTZMDkUPdQQUU+xAbjWwT6JrBuaoYxO//nPAwYXeCShv2CJzg7ofPB5V88yO1+e+DRXKROB
	pNvNyGID4j8LcpuVELqBHsc7JEWqFl6g37J9rXnnS78C9TOSvuCZIqzQHBnPODrB0q2dPsDArWiCC
	seY7gTKr8TRKHhHUEnD7NIt+dluuJupIt1950jtebhtNdDCddeLjFy1QG61ZnHHfSRc0rU1vsX6Ij
	A2mN2yxGig5oKbOEXxuwXEF3krBASehGXzcDYAHK/UoLcoMNT5yI6qEpPC08bDeTrIYyUsDk83KWC
	tZ9XPUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnys-00000009YR4-3BTZ;
	Thu, 25 Jun 2026 17:35:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyr-00000009YP8-1jfT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Jun 2026 17:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nohWA6Z3QOs8Euk83tp6VSWyE7ASO/iSFcpEAB1p3Gs=; b=KZK0xvGUJr9cDRz67OXoiq6YbA
	0YP4uAoNgLGLwwJyk912yFvIupEXRKvfI9dFJ8hTav+mmLAfmGE79vYsxszMXjyRKsftVcoi7+/5X
	w8fqJN2NOhr8qnER89cJBEduKtC96GuKNQTm3RLL2rh2DkoVkmqrlCU4hDw0o7HQvgc0CLW/ttq4J
	+zkGvHaNVdAfpT420eDIDBScfNCczWDwpzow1HGCpBNwR4FMEq4Lseznd8E89n69K+X6jIOHGGeEt
	D0SpZFsnjjQaPFNtih5svLMUtZ5BVVyd2fIbQDb/D0xbVy8T9Lu3Ck6SobymWF/XQeEEYWcWoZKGP
	JodUEH1g==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcnyn-00000003v66-4Byk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:35:12 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id A1B0420B7167;
	Thu, 25 Jun 2026 10:35:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A1B0420B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782408900;
	bh=nohWA6Z3QOs8Euk83tp6VSWyE7ASO/iSFcpEAB1p3Gs=;
	h=From:To:Cc:Subject:Date:From;
	b=eK3igkyLatBZ6Tk0y7WVi6+UeBtq5AXuE6onb51ImsVboRJaZbX9dPtZvW2yEgJgd
	 EHMc4bljt1luJvOB8uTWVADhy3oWB+vauUbKMO6NwyBL/PRm+TYrFEPGPJOPlxPJEj
	 TFFTc8l7mX2H9x+KoW16zMM245E89V0cVM4ZEJCg=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [PATCH v2 0/6] arm64: hyperv: Add Realm support for Hyper-V
Date: Thu, 25 Jun 2026 10:34:54 -0700
Message-ID: <20260625173500.1995481-1-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_183510_252752_D796BF07 
X-CRM114-Status: GOOD (  12.50  )
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

Realms (CoCo VMs on ARM) require host calls to be routed through the RMM
(Realm Management Monitor) via the RSI (Realm Service Interface). This
series implements most of the necessary changes to support Realms on
Hyper-V.

One required change is not included in this series. The two buffers
allocated via vzalloc() in netvsc_init_buf() cannot be decrypted in
vmbus_establish_gpadl(). Currently only linearly mapped memory can be
decrypted. See my RFC patch [1]. I will implement the accompanying netvsc
changes based on the feedback I receive on that patch.

This patch series was tested by booting a Realm on Cobalt 200 running
Windows. I decreased the buffer size and used kzalloc() in
netvsc_init_buf() in my testing as a workaround for the issue mentioned
above.


Changes since v1 [2]:
  Patch 1: Add explicit padding to the RSI host call structure
  Patch 3: Change from a per-cpu pointer lazily allocated to an array
             of host call structs indexed by cpu id
  Patch 4: Align input_page + output_page allocation to PAGE_SIZE since
              that is the smallest unit of memory that can be decrypted
           Remove KSAN tags before passing address to set_memory_decrypted()
             since __is_lm_address() does pointer arithmetic.
  Patch 5: Add a helper function to reduce repetition
           Check for NULL before indexing into host call array

[1] https://lore.kernel.org/all/20260521205834.1012925-1-kameroncarr@linux.microsoft.com/
[2] https://lore.kernel.org/all/20260609181030.2378391-1-kameroncarr@linux.microsoft.com/

Kameron Carr (6):
  arm64: rsi: Add RSI host call structure and helper function
  firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
  arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
  Drivers: hv: Mark shared memory as decrypted for CCA Realms
  arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
  arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms

 arch/arm64/hyperv/hv_core.c       | 155 +++++++++++++++++++++++-------
 arch/arm64/hyperv/mshyperv.c      |  42 +++++++-
 arch/arm64/include/asm/mshyperv.h |   4 +
 arch/arm64/include/asm/rsi_cmds.h |  22 +++++
 arch/arm64/include/asm/rsi_smc.h  |   7 ++
 drivers/firmware/smccc/smccc.c    |  41 +++++++-
 drivers/hv/hv_common.c            |  17 +++-
 include/asm-generic/mshyperv.h    |   1 +
 8 files changed, 249 insertions(+), 40 deletions(-)


base-commit: a4ffc59238be84dd1c26bf1c001543e832674fc6
-- 
2.45.4


