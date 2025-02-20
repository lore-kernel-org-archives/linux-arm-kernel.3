Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056C2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGsZ4tHaS7L/mqVU3EtMopiFDm7RELnWlt6gZ0yIYjQ=; b=mYulxA/6QwNE/QPKEW1/FQssVg
	Fap1kmrSo1r87T2tVVMGNNETan31LfhkNJI8JGNsGDBwwi7B+h9i1etPW4SrxOBAzp/LpYJvXI/Qo
	2u8/QzWULYarrwBrZZzG0BUrClp7Atdm0bTYVsY3dp9zWByb4mYl5Q6EOkvOvFZ3gFC6DhcrmuEFY
	2QbVHqA/EhCHFv0uHhe7VtWPNXc0ScZcaU2xQoU8fGax0yk40Fj027uglr0R78dEIL1MysamEEVxe
	NV2J0a0iPHai4klO39xd3m+zWOEmFxlVrIwKHCrSaXa2ND6tX35Enj75Ci3RckY/17+UlFF+LhNLR
	qTmq4PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl75l-00000001BXG-1IFF;
	Thu, 20 Feb 2025 13:59:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6vY-000000018kM-3xMI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Feb 2025 13:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hGsZ4tHaS7L/mqVU3EtMopiFDm7RELnWlt6gZ0yIYjQ=; b=nqx0k3LEdrgdvu4AuKwwj1sqUq
	yOuGDjUUMGv2KpPCHVvx0Xkz4QMvyhN305KBEzyzWxlNluI/W6ytd1NBENWR7/l4OXVTq2VuaAh1R
	8dzb7a3+7lSJLPZjUUoZiitnh8WHL+KwIpTEjKeWvdq19iuAzsFYNHe0it7TTdGc5O/g4SqFp9fY5
	9rC4a6f97sk0TpclzquV0Y5aCVlfXW9SUP68A7MdnPdLIm8r9kTdmj68+n/9YRCV4s97oYOlwv/jG
	Oie6vznU9HMlnkpHSU9R9mS2sXQa0H882oQpI5jpHmh25g/s9eeh1o3wvHEZ351XUxlQFyvf+PS8o
	IvD/huww==;
Received: from tor.source.kernel.org ([172.105.4.254])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6vV-00000002RnH-3d1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56B1561456;
	Thu, 20 Feb 2025 13:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A9CC4CEDD;
	Thu, 20 Feb 2025 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740059354;
	bh=hLX78IQJhSjho4blNERHsZLoh+IQBUydLUQRnCHy3Bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPYIIRTNVqeMFiMlGsrveziYs/FAPq/tsRf1aGRuKJWBjsBpcqrUq7ZXO0FCA/1dV
	 4O5p8lUcoyxepZOSqU9fsMZFdMlO8oKymJTf2SPpVQOTCqSsZ+TbmoNwQOH6mBoIeb
	 pAvs/K/diNS3rID6Wg5OsBKTyy9aGOhTKipYejkwiOWCNp34o9EynI5VaocOY1FxlZ
	 AsHkHGvw5dHy6jsy7qqIj83v3WPV042D1lIp93SF/AnH/akMfMIVhtBBeemYv/RURK
	 laWUV9zzz+LcwwtFlTa3QtMKGu6L5N+gEqb2E866P8db9jDbSVTqQD3GXNQU8TcE19
	 /qfUBc920zGxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tl6vQ-006DXp-QN;
	Thu, 20 Feb 2025 13:49:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: [PATCH v2 06/14] KVM: arm64: Consolidate idreg callbacks
Date: Thu, 20 Feb 2025 13:48:59 +0000
Message-Id: <20250220134907.554085-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250220134907.554085-1-maz@kernel.org>
References: <20250220134907.554085-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_134918_330816_26BE3ACE 
X-CRM114-Status: GOOD (  10.69  )
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

Most of the ID_DESC() users use the same callbacks, with only a few
overrides. Consolidate the common callbacks in a macro, and consistently
use it everywhere.

Whilst we're at it, give ID_UNALLOCATED() a .name string, so that we can
easily decode traces.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 9f10dbd26e348..678213dc15513 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2267,35 +2267,33 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
  * from userspace.
  */
 
+#define ID_DESC_DEFAULT_CALLBACKS		\
+	.access	= access_id_reg,		\
+	.get_user = get_id_reg,			\
+	.set_user = set_id_reg,			\
+	.visibility = id_visibility,		\
+	.reset = kvm_read_sanitised_id_reg
+
 #define ID_DESC(name)				\
 	SYS_DESC(SYS_##name),			\
-	.access	= access_id_reg,		\
-	.get_user = get_id_reg			\
+	ID_DESC_DEFAULT_CALLBACKS
 
 /* sys_reg_desc initialiser for known cpufeature ID registers */
 #define ID_SANITISED(name) {			\
 	ID_DESC(name),				\
-	.set_user = set_id_reg,			\
-	.visibility = id_visibility,		\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = 0,				\
 }
 
 /* sys_reg_desc initialiser for known cpufeature ID registers */
 #define AA32_ID_SANITISED(name) {		\
 	ID_DESC(name),				\
-	.set_user = set_id_reg,			\
 	.visibility = aa32_id_visibility,	\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = 0,				\
 }
 
 /* sys_reg_desc initialiser for writable ID registers */
 #define ID_WRITABLE(name, mask) {		\
 	ID_DESC(name),				\
-	.set_user = set_id_reg,			\
-	.visibility = id_visibility,		\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = mask,				\
 }
 
@@ -2303,8 +2301,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 #define ID_FILTERED(sysreg, name, mask) {	\
 	ID_DESC(sysreg),				\
 	.set_user = set_##name,				\
-	.visibility = id_visibility,			\
-	.reset = kvm_read_sanitised_id_reg,		\
 	.val = (mask),					\
 }
 
@@ -2314,12 +2310,10 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
  * (1 <= crm < 8, 0 <= Op2 < 8).
  */
 #define ID_UNALLOCATED(crm, op2) {			\
+	.name = "S3_0_0_" #crm "_" #op2,		\
 	Op0(3), Op1(0), CRn(0), CRm(crm), Op2(op2),	\
-	.access = access_id_reg,			\
-	.get_user = get_id_reg,				\
-	.set_user = set_id_reg,				\
+	ID_DESC_DEFAULT_CALLBACKS,			\
 	.visibility = raz_visibility,			\
-	.reset = kvm_read_sanitised_id_reg,		\
 	.val = 0,					\
 }
 
@@ -2330,9 +2324,7 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
  */
 #define ID_HIDDEN(name) {			\
 	ID_DESC(name),				\
-	.set_user = set_id_reg,			\
 	.visibility = raz_visibility,		\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = 0,				\
 }
 
-- 
2.39.2


