Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9CCC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOt8WXidMcA/3vdws/pbowopZJuQh2QH9PqXo0bIoD8=; b=qLU3L1y8KU1vgBVIWwY0NShsGM
	6ZYQo0yT39QNT2ygQB1j5YSkPOTQUWHL4KifNprHWSLG7Ix4wNfH+CDXMZR72/F3MfBVddqg6ZWTE
	OWb8ziKdH7L+t8heFTxyIukYCHY2zdPUXSzz1/xaXmwDeGok3YTrFECD75PG4phfXkB9lF/BwBc9u
	KgzLXQdALx5sitNct2DIjUVvorceASV88jKnR+zwNnJQAVba4PhwFs+B0ww3s+t0u0akLUuy6a1sV
	CxNQFU88M8Y1oHthQBTyuc8GhJia0JkbvLTC+EdiHaex0ieaq3i1AZ1u83Yrayr/3TZB/gIrI0FeC
	9eER0K2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8edX-00000002KYG-2qxZ;
	Mon, 21 Sep 2026 14:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8edN-00000002KUo-21DD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 14:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BOt8WXidMcA/3vdws/pbowopZJuQh2QH9PqXo0bIoD8=; b=cM2hCa+6V5E1LAjlxYIWJNiPhY
	sdmlLCu3WnNz/fVquTUrdzeVNr8rt9ZkjybwrFodZdDZB/XyTtLnpuajrfuS4Grdsql0C7TLAzyRc
	XMRdW/g+CaJByT5zwgsEvPtCpkGQXbM1DSUGv0KKbXG94EvRswgU4KIyMaGr1jbXtZWkJLYcURCzS
	oX2b552Bu3SRdgSJEl/2rnYN42+aTs+r7yzenm+6HgDvI7wE/v/9PwiMA/4TGQDWNGveihzS57ppT
	oa/LqO0QfHWlHNFIXFsfF2qxa94XFAc63S3SkhTlpoWuRzEE/jCPSkJNSezFN8iiZclvmlVNFRWTZ
	KZ5tvpKQ==;
Received: from out-119.mta1.migadu.com ([2001:41d0:203:375::77] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8edK-0000000CNaG-1o7X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:04:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DEbyYnw/QNFLD6hov3Wk8Emu00bFpjJHBWq6l30twn8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789999474; v=1; x=1790604274;
 b=DeA0SiAVyCbwA7WhbXf8p5FFtA1y9BGn+/at6/dcBj2TouLzRqimrd+JiZ9IpWw9i28ru18l
 Wvh3EotSdIL7vKByViObc7FL8CeaKxRWxMqAfzHKYtQIq6FEOURtCSE3EEdQu58i4T0q38I4BTy
 Fda4x2vD+FbwbbR2m4svxk3s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a77cef6fbb8dcc1e;
	Mon, 21 Sep 2026 14:04:34 +0000
X-Mizu-Trace-ID: a77cef6fbb8dcc1e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] KVM: arm64: nv: Read a guest hypervisor's CNTV_CVAL_EL0 from memory on x1e
Date: Mon, 21 Sep 2026 15:04:26 +0100
Message-Id: <20260921140427.2211373-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921140427.2211373-1-fuad.tabba@linux.dev>
References: <20260921140427.2211373-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150438_616026_C71A3077 
X-CRM114-Status: GOOD (  11.64  )
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

On x1e KVM keeps CNTVOFF_EL2 at zero, traps the virtual timer whenever
it has an offset and programs the hardware with the offset applied.
kvm_hyp_handle_timer() returns that hardware value for a VHE guest
hypervisor's read of its own CNTV_CVAL_EL0, instead of the CVAL it
wrote. Its writes trap to the kernel and land in CNTHV_CVAL_EL2, so
return that, as the physical timer's read does without CNTPOFF_EL2.

Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 14aada311bac4..4c965f9b1e1de 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -322,10 +322,14 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 		val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
 		break;
 	case SYS_CNTV_CVAL_EL0:
-		if (vcpu_el2_e2h_is_set(vcpu))
-			val = read_sysreg_el0(SYS_CNTV_CVAL);
-		else
+		if (vcpu_el2_e2h_is_set(vcpu)) {
+			if (has_broken_cntvoff() && timer_get_offset(vcpu_hvtimer(vcpu)))
+				val = __vcpu_sys_reg(vcpu, CNTHV_CVAL_EL2);
+			else
+				val = read_sysreg_el0(SYS_CNTV_CVAL);
+		} else {
 			val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
+		}
 		break;
 	case SYS_CNTVCT_EL0:
 	case SYS_CNTVCTSS_EL0:
-- 
2.39.5


