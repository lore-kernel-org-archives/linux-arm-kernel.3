Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D160A3815
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DlZswev/;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvGK4d3Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMh63T5YwfVNuBDByuzphHs8PVFbK99F0ZI38rcR9bE=; b=DlZswev/LAHHvuUWUFxU3B5psD
	6ALEI3H/q/JVrxZQsh6PCNK0aCnn8jnh4IbBp5K3FlZLRNNJIAUwy5PuUO9C4Si8wz97X41+6HJnJ
	AeEX4HIF04UF7Qc2OUc74mG1zx7F6fDQTg8RbtkyxUy2LmbVxtRDKeJCirD0TOJxpmUeHaUZy/IXJ
	B7gnlNZ5uTIojXStRQVAwqLWs9fp2Y1Agyd3gyIGl68/rP1e2iDsFLDFl7x67wTixwbHmNavZ7a6S
	0PYpKXl+uzv01KI4dW6tpUI7e9RodrJTHKyACPbxQNzTYGcdBM3ExZ9Svcj49zzhjX06Hs9/wpYam
	ykY3xKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWU-00000008Rwl-0WGJ;
	Mon, 19 Oct 2026 22:08:02 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWR-00000008Rta-3hAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447680; x=1823983680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A/4iI36wx+KlAM4dI0iaxXZnnncEDWki1Hc3YEPdd3Y=;
  b=RvGK4d3YzpSkVyIxO2MWcMgYxbcFS4Fq3Syb3eMMBMP6Tkm0/bmxd2ik
   U8XO0+vKx/k3bEgcThoWZRxks7y2l/UtN19CSTsuVaEej6K1I9KbWenxA
   5kcjmYQikGzrdg0otnPwYzYyzb1RQTurYBF5ke9YJmF2J5h/HrNCA+NX7
   Atgg2Y3kt/cUNmySIi2pn4vvvrrjqwvT4LRndl9SZ3lGsI/ILjHxeOtUK
   YPXfG+RGKO8juFexvjrR4HYO7pSt9Ps4x7nZL34y/lEZW3BReaiKHj+vd
   fJRU1LJuDniOUzFE4OjvzhCyh4bWp/icmMF/Q4viWedlB0wph3SyCR6YY
   w==;
X-CSE-ConnectionGUID: j551bq+KRGKY6vA28hZ6ow==
X-CSE-MsgGUID: 9r65MvIURc62V7nH3GFIVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144184"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:58 -0700
X-CSE-ConnectionGUID: w1bfUud+RPubKmRNHnRaFg==
X-CSE-MsgGUID: W6aN0PCAQqe5Sh2hmIkKzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708330"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:57 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [RFC PATCH v2 02/10] arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
Date: Mon, 19 Oct 2026 15:07:36 -0700
Message-ID: <adeb2b33540572b5da5edb79d2ddacc9fc098e01.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150759_940005_25E85691 
X-CRM114-Status: GOOD (  16.86  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mpam_resctrl_alloc_domain() looks up the component of the resource's
class that contains the CPU and fails the domain allocation if there is
none. The component is held in a local variable named ctrl_comp and, when
the resource supports allocation, it also backs the control domain.

The lookup and its check apply to every resource, including one that
supports only monitoring. For such a resource the component does not
back a control domain, so the name ctrl_comp is misleading. The name also
makes a comment in the same function ambiguous. The comment notes that
there may be no ctrl_comp for the L3, which is true of the control
domain's component but contradicts the local variable, which always
refers to a component once the lookup succeeds.

Rename the local variable to comp. Keep the ctrl_comp name for the
control domain's reference to its component because it only ever refers
to the component that backs the control domain. Leave the comment
unchanged since it now unambiguously refers to that component.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 3d5f90f9f1f3..b07e5dd895dd 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1623,14 +1623,14 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	struct rdt_l3_mon_domain *mon_d;
 	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
-	struct mpam_component *ctrl_comp;
+	struct mpam_component *comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
 
-	ctrl_comp = find_component(class, cpu);
+	comp = find_component(class, cpu);
 	/* class has no component for this CPU */
-	if (WARN_ON_ONCE(!ctrl_comp))
+	if (WARN_ON_ONCE(!comp))
 		return ERR_PTR(-EINVAL);
 
 	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
@@ -1638,10 +1638,10 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 		return ERR_PTR(-ENOMEM);
 
 	if (r->alloc_capable) {
-		dom->ctrl_comp = ctrl_comp;
+		dom->ctrl_comp = comp;
 
 		ctrl_d = &dom->resctrl_ctrl_dom;
-		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, r->rid, &ctrl_d->hdr);
+		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
 		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
 		err = resctrl_online_ctrl_domain(r, ctrl_d);
 		if (err)
-- 
2.55.0


