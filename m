Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D0E7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KG5lmNZtyXCb6pgu5zBnN9C2QjwXs0Ly1EhehnP8LtE=; b=P5rZWxUvLt7w+/qHKdQ9BPzzz0
	nhsXC6nBbs9JJZ7l8YbbGPYt1SXbo63AIRq+e9wkGdrsFcYB4vN7Zu6DE+Y3Z9WoMUK2v129YOv9B
	ManNElx4LC8dWgoji7XnnIwiUCpY3uPLiKNsROD70HcNY259derSKmkSnM4JliMIIgl3/CZdZvCi5
	a3kb7+MIwxfmNDxVWjE/Lmmz5ph8o/biOKM525nP40BbbIVW6f0wD032yVM0f7KQM7x2jJ0+7qOUj
	dh8zm0qY2q5zPlKoz36F8V9MjXCzFE4YXs8RVmeNUBRgZm8DssDLXNS1quATwXhLVTxx8erXC4fMx
	kew7ubYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyuE-00000005RlE-2t20;
	Mon, 02 Feb 2026 18:44:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytt-00000005RAQ-0CA0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Feb 2026 18:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KG5lmNZtyXCb6pgu5zBnN9C2QjwXs0Ly1EhehnP8LtE=; b=f6wO6eFR4c+5M5pIVVGTvKvwsK
	EVN20gSqtVfVBziMYVu3xcm332GiXqDdvkQRdfseZyTiU1iVINEqkksuedz4nXZwzL9ecl1x9zo2d
	aLzL71JvP7K9V5pb0ges8mTc/BAD6t4JU9Xz93p2oaSQNiMbx9yPiG4vD6yN4boCYEVxkwM5YLL3E
	Td7ZFabvJtjpY7Zxk8wVtHUlUB8zU89F1RD1SAu8CVu/u8PF+EBRpU/UPPA3B+YGS3JEyJNe09MJH
	GmnNrEWWvquxSqW9fJgZysAspJERBunQh2zUqXtcY8upMU5glDmTjFYNEHdPQmyciQ1VglOPc6t4x
	/oijblug==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytq-0000000F2QR-0Bxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7633F444B0;
	Mon,  2 Feb 2026 18:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1E3C116C6;
	Mon,  2 Feb 2026 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057825;
	bh=W6QElC8ez3cKzFnlWFTTok0DI6SuUFkBLxQ9HdMrWbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJOBosqN3dxHF90aKtnQo30khpNfyAeSsvJQ/2PKEye/M6Pqj0q7HYS0Uld/SGldy
	 KIq4tDdPwUgL1XSVFThZ5tW+wgAanrBUxOVxXQb08vqjc1fCx0HWIZn8AD4e5oBOwK
	 oCH4OVXAnkhrBFbI9lJ0JDWtVZM3PbdDd2Y0wL3uNF6rKZOFKI2vQTLmgtFP7JZSVL
	 DDqMytFOWIaEfUYrLB6ejxuXJgJWvm0WIngGxXRwF41lR7J+2mLQayBisMIeXaw89t
	 Oa7kv3g/R1HnfVGIqqag3nu8WQaLlb3r+zHF7M4YJSj7ZNZLufj8PIU7bduXCPQ5BC
	 qWhhqGqXXlE/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytj-00000007sAy-2REP;
	Mon, 02 Feb 2026 18:43:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 20/20] KVM: arm64: Add debugfs file dumping computed RESx values
Date: Mon,  2 Feb 2026 18:43:29 +0000
Message-ID: <20260202184329.2724080-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_184350_430358_47B04565 
X-CRM114-Status: GOOD (  14.41  )
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

Computing RESx values is hard. Verifying that they are correct is
harder. Add a debugfs file called "resx" that will dump all the RESx
values for a given VM.

I found it useful, maybe you will too.

Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 68 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 88a57ca36d96c..d33c39ea8fadd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5090,12 +5090,80 @@ static const struct seq_operations idregs_debug_sops = {
 
 DEFINE_SEQ_ATTRIBUTE(idregs_debug);
 
+static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, loff_t pos)
+{
+	unsigned long i, sr_idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
+		const struct sys_reg_desc *r = &sys_reg_descs[i];
+
+		if (r->reg < __SANITISED_REG_START__)
+			continue;
+
+		if (sr_idx++ == pos)
+			return r;
+	}
+
+	return NULL;
+}
+
+static void *sr_resx_start(struct seq_file *s, loff_t *pos)
+{
+	struct kvm *kvm = s->private;
+
+	if (!kvm->arch.sysreg_masks)
+		return NULL;
+
+	return (void *)sr_resx_find(kvm, *pos);
+}
+
+static void *sr_resx_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct kvm *kvm = s->private;
+
+	(*pos)++;
+
+	return (void *)sr_resx_find(kvm, *pos);
+}
+
+static void sr_resx_stop(struct seq_file *s, void *v)
+{
+}
+
+static int sr_resx_show(struct seq_file *s, void *v)
+{
+	const struct sys_reg_desc *desc = v;
+	struct kvm *kvm = s->private;
+	struct resx resx;
+
+	if (!desc)
+		return 0;
+
+	resx = kvm_get_sysreg_resx(kvm, desc->reg);
+
+	seq_printf(s, "%20s:\tRES0:%016llx\tRES1:%016llx\n",
+		   desc->name, resx.res0, resx.res1);
+
+	return 0;
+}
+
+static const struct seq_operations sr_resx_sops = {
+	.start	= sr_resx_start,
+	.next	= sr_resx_next,
+	.stop	= sr_resx_stop,
+	.show	= sr_resx_show,
+};
+
+DEFINE_SEQ_ATTRIBUTE(sr_resx);
+
 void kvm_sys_regs_create_debugfs(struct kvm *kvm)
 {
 	kvm->arch.idreg_debugfs_iter = ~0;
 
 	debugfs_create_file("idregs", 0444, kvm->debugfs_dentry, kvm,
 			    &idregs_debug_fops);
+	debugfs_create_file("resx", 0444, kvm->debugfs_dentry, kvm,
+			    &sr_resx_fops);
 }
 
 static void reset_vm_ftr_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *reg)
-- 
2.47.3


