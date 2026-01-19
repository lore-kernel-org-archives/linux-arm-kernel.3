Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ABBCCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNMML/VuNh25QmGXHqI9c5GU4AilrbOqSpr0b0Ncf9I=; b=uCUopAp2pO50ePzLeOi0SzcEvc
	EZno4zfZtN1fFG+E+SyUg0o67NsGA5xkVnwSTvq5rIU4Di8RbbKJFEg3iPr2cZGU1kF4rzXbOgrUV
	G9H8cJpWOdDOYH2750DMQrWxyDRp9c2f9s7aIqSBw5/6SOCedXJ4Hyn9XmHNf/1DTuagQGcEOO3bM
	aNOMZstJfwy8pgAnPey3gKrCw7lTfoViG2WlqqHTeasCzXItErwc+BwRk1egjt5nOwrRYZOtSKHMK
	3/afpzO8X4xcFWdW44ubq3NTDKnjSbpImgIMlBKJvdATNTcibMr8dJarKkIwwKaLwEDXryF9/Qc4i
	stiCKcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhogP-000000024DC-2tRF;
	Mon, 19 Jan 2026 12:48:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoft-000000023lE-1Brd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 12:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yNMML/VuNh25QmGXHqI9c5GU4AilrbOqSpr0b0Ncf9I=; b=LPvgBuj1MM6NyxPgO/1DTaErrE
	XRhH5Ee6FT5mPDwrxaQCeTEcLNGYTId+nkGfYWY79T32n5bikC1+wdvZqLUeq58WfaXlw5L4Hp44w
	qGc66/PpiVIpaAkTYr38Z4TvmXjpNSjIgrna7zZUvr56mNVonRMnXfg5qHxSUD2MEJR+32CqWYyfi
	IH0Us0bMEoTGpRlBnVBnrwnOHh1pu4AirWClk7Zz23nuSL0/2y8tiH/V36e/cKonsBxl/tP7MALNh
	tZqXykX6ehFtyJ+hKfifhr2kkIMlQsIKlTVd3XDfhe2DEU13Kdxhemd8q3cPU4e7mmWNO1GGqZ/Ol
	GXtIc+Bw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofq-0000000C6Us-1VwC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A02F406D3;
	Mon, 19 Jan 2026 12:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BACBC19423;
	Mon, 19 Jan 2026 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826881;
	bh=rCOXphOI3XK5NnEllmo3VoHDVO0FW1vpq5O+0ieRUpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+WpvLTFQhrGPx0xi1BvJMivvp00zo/X4d1UCM9uPt4jAwVgDlqhyLUmiejG4PLyL
	 VrxI8K94/3rV3bBzoK59aC9F0qnGzK09jOkE1mtcutqIiMynnESfRGf05GLA1DLXvm
	 WtmYOyRWAAyIkGJ5kM24yERZy9MZrDnwDwu1kpt4tVTGnCtj6XRi18HW9wyH6taZu8
	 2MjF5YOJmXQecsvzpbDhxnlQW+Pw6SH6VOPfrb7wPpMZc2RhV6or+aNDY//j5eomAp
	 GbIUvvaLyuwBZe20yjZviluvzhhN5RVcvclzXgUG262URiayk+4JhZxMtNYFgYq5fk
	 5f1bTbnmWyNTg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 22/35] KVM: arm64: Change 'pkvm_handle_t' to u16
Date: Mon, 19 Jan 2026 12:46:15 +0000
Message-ID: <20260119124629.2563-23-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_124802_605152_C16C7F1C 
X-CRM114-Status: GOOD (  13.62  )
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

'pkvm_handle_t' doesn't need to be a 32-bit type and subsequent patches
will rely on it being no more than 16 bits so that it can be encoded
into a pte annotation.

Change 'pkvm_handle_t' to a u16 and add a compile-type check that the
maximum handle fits into the reduced type.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3191d10a2622..60a5c87b0a17 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -247,7 +247,7 @@ struct kvm_smccc_features {
 	unsigned long vendor_hyp_bmap_2; /* Function numbers 64-127 */
 };
 
-typedef unsigned int pkvm_handle_t;
+typedef u16 pkvm_handle_t;
 
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 9f0997150cf5..c5772417372d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -223,6 +223,7 @@ static struct pkvm_hyp_vm **vm_table;
 
 void pkvm_hyp_vm_table_init(void *tbl)
 {
+	BUILD_BUG_ON((u64)HANDLE_OFFSET + KVM_MAX_PVMS > (pkvm_handle_t)-1);
 	WARN_ON(vm_table);
 	vm_table = tbl;
 }
-- 
2.52.0.457.g6b5491de43-goog


