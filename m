Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACE6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4nJtmzs3s72W2NuiRezNDV2FXuDAq3PNr3+BgRsWsJM=; b=4mPYW6qA1vHACbcdUuK/ywre5A
	HH+h0Ez4uZNaMRdH0nvTS1ujUq/h4cMuH36fxW8LSQ/oX44jBlloGKoEU5Ee4r8sqkCDTYmafh40q
	mRBAgzrGPl9Jjaa+bC5DkYRcjhjhnugjutRv982W1be/+HGHDh3zstsoeKP4aXqzJHt+NFmJn9Rgc
	Fs8okjzgG2BgLtcYDUXPctP11tNpkUwQF9oC+L9rmncpMUV5o4yjbwxLGD7PlVYKE9ZH3ZRC8e6Lx
	tg+8iLbJqdmiLRJvr8fhNq+dXqGKGE/HbTP1o6aqdUK41gs6TBlJBnaVMC7MSssy5rrv8aKJY4SwZ
	o3IuqTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfj-00000008qWH-0Yt8;
	Tue, 08 Sep 2026 11:07:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfh-00000008qVx-0Ttg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4nJtmzs3s72W2NuiRezNDV2FXuDAq3PNr3+BgRsWsJM=; b=GWNpZ9u/AnUTjc6tr49XmyHctC
	rpcC56N8oY3BKVGSMK8vPK/9BNXIeX+b2HihANsBGgfi1yW3LdzzrlldtDZ3RBsIW1uf05AuDWgKl
	Evg0hpZJQ6yYc3owBPfBvbmkighM0akfLtNc/P1BvXS+LUqXsHXXzp5gP90UdvXYRu6NwQgoTfY3/
	u/Eqp/jICNZ4I/KRC7Jfm9l/AUA+nk6AClfBPbqXz5n7DvureoM5fXHjNM72ekU0TMuXruDj4iKiR
	4XrwSJRsxCIKA4Xf1e7wCWiho23owt1PFFNYHm0kHo87CI31SjbysbXkVBWYZi3wi/2Zfs2rKWopI
	4syFeKRg==;
Received: from out-81.mta0.migadu.com ([2001:41d0:1004:224b::51] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3tfe-0000000HJpJ-13gO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:07:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nIpoc5sfHGTXjBAy3ABWY1KxxnQB5xQPhoL+P57mMcM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788865638; v=1; x=1789470438;
 b=Fky8TGAOiy8DE0IDEkqE+srgvlRiIcysThTrBbw9d2Jad2Ij4Hb3t7FmNUWr5P4pNsDYzFCA
 WQkbeKjliMyLjAQ2HguMBM7+tGzA/BB2sv2+L0Om53PmGughuj3RTctPTFSlFoXOYnsKyq4X+V7
 113EeIvbiHjPNDTofrB0bKx4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6d105b631239bd15;
	Tue, 08 Sep 2026 11:07:18 +0000
X-Mizu-Trace-ID: 6d105b631239bd15
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] KVM: arm64: Fix host access to the EL2 stacks
Date: Tue,  8 Sep 2026 12:07:09 +0100
Message-Id: <20260908110713.1540304-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_120722_478584_D2FD834A 
X-CRM114-Status: GOOD (  11.62  )
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

Hi folks,

The per-CPU EL2 stacks are initialised as host-owned after pKVM init.
fix_host_ownership() walks only the linear-map alias of each memblock
region, and the stacks, mapped in the private VA range for their guard
pages, have none.

Patch 1 is the fix, and it needs none of the other three. Patch 4 adds
the check that would have caught it and would catch similar instances
in the future: once the transfer is done, walk the private VA range and
fail init unless every valid leaf is hyp-owned, or is hyp text mapped
without write access.

Patch 2 is a fix in its own right, but to a different bug.
fix_host_ownership_walker() matches hyp text on its stage-1 permissions,
and that test hasn't matched on a non-hVHE host since 7.0, so hyp text
is donated there rather than left read-only. Nothing crashes, but the
instruction dump on hyp panic reads a page the host can't access, so
the Code: line comes out as question marks. It matches by physical
address instead, which is what patch 4 needs too. Patch 3 splits the
start of the range from the allocation cursor, with no functional
change, so patch 4 knows where the range begins.

Based on Linux 7.3-rc2 (df2908090cda3).

Cheers,
/fuad

Fuad Tabba (4):
  KVM: arm64: Transfer the hyp stack pages out of the host stage-2
  KVM: arm64: Match hyp text by physical address in fix_host_ownership()
  KVM: arm64: Move the private VA allocation cursor to __io_map_next
  KVM: arm64: Check every private mapping is hyp-owned at pKVM init

 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 20 +++++
 arch/arm64/kvm/hyp/nvhe/mm.c                  | 79 ++++++++++++++++---
 arch/arm64/kvm/hyp/nvhe/setup.c               | 16 +++-
 5 files changed, 108 insertions(+), 10 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.39.5


