Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4EFCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xzHOX3PBzbOwNIpPnjr0WO+42GVwbEKF3VLPxfIiAo=; b=r5WwYp5DkKBQz7O4ieiN4ZCkaQ
	EP7abxxRa2QF5RQtYzwhLIsBcwsGS6cZubi/xGJRxaZqOgqKF8K6iJA7K8gmXodk4zf6vfgplIgXC
	GuMjRf80ZSzSvOQc0pZkf0gw03Z28Y79Y4TxFlqV2RnjTiSng4gSRMclV/8RnEzqb+2QWUZvQgjgA
	4sqf+tK8AEMLxNg6dQu3ogoHeViegxdf8Wut7AfRLr1duUdxZq9XAmCKFfk+QCo+c8sdjwTkzl0CF
	mqIQVEPtwOKoASE77hxsEgKBUNiMqcDBSubuzeel2uHQ5bYOmmBqvqYszGmMTViW8miypbo1AY5sq
	uHC4Yhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e8-00000003y5V-0QWK;
	Mon, 15 Sep 2025 11:45:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7do-00000003xkT-0Pow
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 11:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0xzHOX3PBzbOwNIpPnjr0WO+42GVwbEKF3VLPxfIiAo=; b=kcNwSVeIbYEOzGKoM4ngRX8VP8
	Rf3be/cAFcjkLQLl4TcYbp65X1THTqORH2sVtDZUymKin94frEyD3uv7Nv/BFYSLqcfoD0suHZcY5
	bK2LUBwnFBu77tdqBm1RCtEuzlvGXBigDcYO5Y97Jws4lZ6LbAGMkCUohydADvzDOvrUtB+fWMAiN
	+0oHdDkObdA65KcziwWsEYJdUnRgC0bziRQkDZUEb+E5YmZB3yLnlVcLR6SmRfUX3Yu6koHO0cn1b
	fQ1oe+bzrzIqkAYy1KGlNbCJQa9SYUzftDSL2ykc5tmBNGB8+cj4b+DRjpI04ysrxNmPPNJijrQ06
	mtLwlTeg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dk-00000006xAF-3QkG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 578C744963;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0F4C4CEFE;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936699;
	bh=6s66At4Y3xWWNXiyYuFX05mylZmGoxm2uLgtoUWeXiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmzyqXcl6lY6d8jCKbzMWnQBIMj3Qdmm2RH23MLhQZOXrKEGnJUBWe7YEsSa9wUkZ
	 FRlPSg+IM2zog2EAzaJw8H+utTAzH5D6qYzRCyHYjljn2hvXnLdVKhoSe7l82SmKno
	 f9jhArycNs4MOz2dycgH6Fsdu05UQHkT/VVFn3Hv14mEpRPE8E+byp/AcSxASme0/P
	 rYTanIspErJCI5b9MqaE9x5aJ2CyfYj3AVmJ6QoVgVCxkaFDrtxq4O4psAc9w7K4w3
	 1GHLQ0Gn777onNovviQc6VXwmg0meaCmezWJcGii89dh63iozOZnEtuzzWb5NkYl+0
	 kimjNBQvJcDjg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dh-00000006MDw-2Bbe;
	Mon, 15 Sep 2025 11:44:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 13/16] KVM: arm64: Add filtering hook to S1 page table walk
Date: Mon, 15 Sep 2025 12:44:48 +0100
Message-Id: <20250915114451.660351-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_124501_410801_67FE6B1D 
X-CRM114-Status: GOOD (  13.72  )
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

Add a filtering hook that can get called on each level of the
walk, and providing access to the full state.

Crucially, this is called *before* the access is made, so that
it is possible to track down the level of a faulting access.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 14 ++++++++++++++
 arch/arm64/kvm/at.c                 | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index f3135ded47b7d..cce0e4cb54484 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -288,7 +288,21 @@ enum trans_regime {
 	TR_EL2,
 };
 
+struct s1_walk_info;
+
+struct s1_walk_context {
+	struct s1_walk_info	*wi;
+	u64			table_ipa;
+	int			level;
+};
+
+struct s1_walk_filter {
+	int	(*fn)(struct s1_walk_context *, void *);
+	void	*priv;
+};
+
 struct s1_walk_info {
+	struct s1_walk_filter	*filter;
 	u64	     		baddr;
 	enum trans_regime	regime;
 	unsigned int		max_oa_bits;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 2f6f83cc8d19d..c099bab30cb0d 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -413,6 +413,17 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			ipa = kvm_s2_trans_output(&s2_trans);
 		}
 
+		if (wi->filter) {
+			ret = wi->filter->fn(&(struct s1_walk_context)
+					     {
+						     .wi	= wi,
+						     .table_ipa	= baddr,
+						     .level	= level,
+					     }, wi->filter->priv);
+			if (ret)
+				return ret;
+		}
+
 		ret = kvm_read_guest(vcpu->kvm, ipa, &desc, sizeof(desc));
 		if (ret) {
 			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level), false);
-- 
2.39.2


