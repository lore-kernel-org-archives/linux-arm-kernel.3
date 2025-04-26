Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99141C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei3kn86kgjOCrXjqcY0hi7huSMn8vyHhayMFt55nkkQ=; b=MFsIE7Wz0GKYACpKorQMCZyR4+
	AJx1fQCo5wg0D5ITk09Qidq7zdwzX7r20njIUW4iAgXDqQOF6yxsMyaAGCEihyelLks2/I2DYqUvo
	7pR6WuFU8MeHwxsiarjZEDBSOs0d82eG6m4rNosOO6Y3pYM2oIxV7rDh1qGbzVOHKVPUL+WWKfuND
	4ef2nwEfoRA1CYvyQPDf7PQziCi598PUKJP/XebDAjXN8knianLm8JFWNiSG4xK/aP+vvFx5kOI73
	7EItY2yVZDVUg2M0TCdeLgteTC4DI9Wid77jsMF9/ERajbJBmhfuJmF0Pe0vo6z+GPAK9MR+t+juM
	ACcG3hIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fey-000000025Y5-2Phy;
	Sat, 26 Apr 2025 13:33:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeV-00000001z7w-0b8i
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 26 Apr 2025 12:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ei3kn86kgjOCrXjqcY0hi7huSMn8vyHhayMFt55nkkQ=; b=AfhCwXI18V/EeThE4CNps5D6Vw
	lfoJFaBdxJQoaTb0QOYdSVo4GZK5Cjh+HEDaS3ZD7ndiC0n7ip+v9E56/MyhjfaBxHBGIauQf0ijD
	kPxeZ+Ll6yzDnxZqJOLH13Y9OVg1VnUwhziOUU1pa0027QTihQB9CsCOoMY1ZlA0uTuAjOCYhBRUm
	sZfYp1UOAfq53wTD0QHA8Jb9fS+vxJJpfOO4ySIjQGbx8nHDB/G8BDHA4e6dTyxX3Bn3kVjEfcxrx
	GIcOaoHzsMY98rqjd4vIJKqYuL94HuIYZ46YDOAo+ErHv6JbFhHv68uTA/8gYeLyboJtC0AtgTJ73
	PvWA52Hg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8eeR-0000000CGFc-3gbM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2DC14A6C2;
	Sat, 26 Apr 2025 12:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B63C4CEEA;
	Sat, 26 Apr 2025 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670536;
	bh=A+mC25ye+oG3XUc8UJjrY3RBuqusPdAowX5mWr8jlBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfclUTbiIJw4FLjMWJsQpH6g+pK4VQWuAcgh6EhKjW6940++ZijS8COPv//4xxVX7
	 +fb+1QiyJ7cjji99PefkylhtE9fVt9aEC44Qm+xydeRz16hTha+AY6ydTmDTIGpGTQ
	 tPjT22/McKtmG8/jOPznzalV3MUUnU2fp/B91oWWlruQtk/dUX67exEVhkTZ3/Kzpd
	 n6WqInsiYMrg0xqNSkDBBXxIDY6GAOwk3aWKkthMFNnErm9+HruHem7OfR1gIWyj3z
	 Y/ulmn+sFEM932FNK9NKwAEK/easerfkMHwMYwboI1Ab03nMAg4lXk8aeeiNUGBR8v
	 a13HZAOIh+Idg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeM-0092VH-Dt;
	Sat, 26 Apr 2025 13:28:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 21/42] KVM: arm64: Compute FGT masks from KVM's own FGT tables
Date: Sat, 26 Apr 2025 13:28:15 +0100
Message-Id: <20250426122836.3341523-22-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_132900_400208_5C70C0DD 
X-CRM114-Status: GOOD (  17.22  )
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

In the process of decoupling KVM's view of the FGT bits from the
wider architectural state, use KVM's own FGT tables to build
a synthetic view of what is actually known.

This allows for some checking along the way.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  14 ++++
 arch/arm64/kvm/emulate-nested.c   | 106 ++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7a1ef5be7efb2..95fedd27f4bb8 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -607,6 +607,20 @@ struct kvm_sysreg_masks {
 	} mask[NR_SYS_REGS - __SANITISED_REG_START__];
 };
 
+struct fgt_masks {
+	const char	*str;
+	u64		mask;
+	u64		nmask;
+	u64		res0;
+};
+
+extern struct fgt_masks hfgrtr_masks;
+extern struct fgt_masks hfgwtr_masks;
+extern struct fgt_masks hfgitr_masks;
+extern struct fgt_masks hdfgrtr_masks;
+extern struct fgt_masks hdfgwtr_masks;
+extern struct fgt_masks hafgrtr_masks;
+
 struct kvm_cpu_context {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
 
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 52a2d63a667c9..528b33fcfcfd6 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2033,6 +2033,105 @@ static u32 encoding_next(u32 encoding)
 	return sys_reg(op0 + 1, 0, 0, 0, 0);
 }
 
+#define FGT_MASKS(__n, __m)						\
+	struct fgt_masks __n = { .str = #__m, .res0 = __m, }
+
+FGT_MASKS(hfgrtr_masks, HFGRTR_EL2_RES0);
+FGT_MASKS(hfgwtr_masks, HFGWTR_EL2_RES0);
+FGT_MASKS(hfgitr_masks, HFGITR_EL2_RES0);
+FGT_MASKS(hdfgrtr_masks, HDFGRTR_EL2_RES0);
+FGT_MASKS(hdfgwtr_masks, HDFGWTR_EL2_RES0);
+FGT_MASKS(hafgrtr_masks, HAFGRTR_EL2_RES0);
+
+static __init bool aggregate_fgt(union trap_config tc)
+{
+	struct fgt_masks *rmasks, *wmasks;
+
+	switch (tc.fgt) {
+	case HFGRTR_GROUP:
+		rmasks = &hfgrtr_masks;
+		wmasks = &hfgwtr_masks;
+		break;
+	case HDFGRTR_GROUP:
+		rmasks = &hdfgrtr_masks;
+		wmasks = &hdfgwtr_masks;
+		break;
+	case HAFGRTR_GROUP:
+		rmasks = &hafgrtr_masks;
+		wmasks = NULL;
+		break;
+	case HFGITR_GROUP:
+		rmasks = &hfgitr_masks;
+		wmasks = NULL;
+		break;
+	}
+
+	/*
+	 * A bit can be reserved in either the R or W register, but
+	 * not both.
+	 */
+	if ((BIT(tc.bit) & rmasks->res0) &&
+	    (!wmasks || (BIT(tc.bit) & wmasks->res0)))
+		return false;
+
+	if (tc.pol)
+		rmasks->mask |= BIT(tc.bit) & ~rmasks->res0;
+	else
+		rmasks->nmask |= BIT(tc.bit) & ~rmasks->res0;
+
+	if (wmasks) {
+		if (tc.pol)
+			wmasks->mask |= BIT(tc.bit) & ~wmasks->res0;
+		else
+			wmasks->nmask |= BIT(tc.bit) & ~wmasks->res0;
+	}
+
+	return true;
+}
+
+static __init int check_fgt_masks(struct fgt_masks *masks)
+{
+	unsigned long duplicate = masks->mask & masks->nmask;
+	u64 res0 = masks->res0;
+	int ret = 0;
+
+	if (duplicate) {
+		int i;
+
+		for_each_set_bit(i, &duplicate, 64) {
+			kvm_err("%s[%d] bit has both polarities\n",
+				masks->str, i);
+		}
+
+		ret = -EINVAL;
+	}
+
+	masks->res0 = ~(masks->mask | masks->nmask);
+	if (masks->res0 != res0)
+		kvm_info("Implicit %s = %016llx, expecting %016llx\n",
+			 masks->str, masks->res0, res0);
+
+	return ret;
+}
+
+static __init int check_all_fgt_masks(int ret)
+{
+	static struct fgt_masks * const masks[] __initconst = {
+		&hfgrtr_masks,
+		&hfgwtr_masks,
+		&hfgitr_masks,
+		&hdfgrtr_masks,
+		&hdfgwtr_masks,
+		&hafgrtr_masks,
+	};
+	int err = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(masks); i++)
+		err |= check_fgt_masks(masks[i]);
+
+	return ret ?: err;
+}
+
 int __init populate_nv_trap_config(void)
 {
 	int ret = 0;
@@ -2097,8 +2196,15 @@ int __init populate_nv_trap_config(void)
 			ret = xa_err(prev);
 			print_nv_trap_error(fgt, "Failed FGT insertion", ret);
 		}
+
+		if (!aggregate_fgt(tc)) {
+			ret = -EINVAL;
+			print_nv_trap_error(fgt, "FGT bit is reserved", ret);
+		}
 	}
 
+	ret = check_all_fgt_masks(ret);
+
 	kvm_info("nv: %ld fine grained trap handlers\n",
 		 ARRAY_SIZE(encoding_to_fgt));
 
-- 
2.39.2


