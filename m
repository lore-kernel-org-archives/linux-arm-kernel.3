Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC62606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6EZHeCV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ns9WH8e+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeZNYunybcxy/NfWb6jCfz+TaK9LyyfOatz74eHc0KM=; b=Q6EZHeCV8Wbmq0zUTSBLOh49Km
	uQ/IMU1r11QHpHKtYh992Ewo2IyB1nAXesrPnvvWBSWtX4cS+TmW+/8nEc2EVULGXOPDpT22lXtBG
	e5nq5/FGZgJ4/y2ID4hMQB72g3Mc3dtCauZI6C2kxUZZg7DWXk4GN3iWtmvEgtUCuJSNP0KZcIcJS
	XpW5cyvmDzi3T+R3WR2MSafQmKOzasCkacWK3l8bPD/yTsSC2i3R1FywRf7dGmT3MS0t+38sXVhWM
	aHb48ZaS1uxS6Kxpcvk8xRXHbs+lH1RzB+38qSkRH6RMQCesXOudUM+nm8xQkX2LJxO9csas0PVpu
	nIDJJFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWk-00000008S5a-48jo;
	Mon, 19 Oct 2026 22:08:18 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWT-00000008RtY-1lH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447682; x=1823983682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9RK0cTSErpvZvdFlmTLHSVOodu/G/WUGFbYDPDtGi7Y=;
  b=Ns9WH8e+DW9yrnHkeKinqelToZMBCeRCMELnReiVFr51DsE/I5ArPdK9
   bxRrK/CylQXGghSc+HrPMbbjpM3dnQgZgQr9pSDcjGabCUOMF+x5cqcP6
   dQK1wv87dUpNjLYtUh/dtJM/K2tFyRDgoF0Nnhxu/y8WS4axe3sEffPwm
   3gw5sBJyPsIxZSkbEAFOf7kjahEN6vAA5LrcthLROj/L+MIaN7Nd1dM6o
   ZbW8bUtLLOHnKOCcZjduKaiGzGGdl2P0q7cTDDpui/rj1VxY5Q94GgDh4
   uRh6Od0zSHPcJPUo8fdvpZAGiqtlZKopB+P7PlslM+mCrob5XG9Qceb4g
   w==;
X-CSE-ConnectionGUID: ZoNEoNVlRMigyXhbQgByNw==
X-CSE-MsgGUID: pqcW5asmRua27int/toC1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144220"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: Jy1DBh7uTJOEd+iqTAl12Q==
X-CSE-MsgGUID: QVEI9MElQH+S/ejUvlxmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708346"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:59 -0700
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
Subject: [RFC PATCH v2 07/10] arm_mpam: resctrl: Warn when no monitoring component is found for a CPU
Date: Mon, 19 Oct 2026 15:07:41 -0700
Message-ID: <1c68a6ae981095ec93250cf0e394bb4df15c7e66.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150801_485813_8A535AF5 
X-CRM114-Status: GOOD (  12.23  )
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

Setting up a monitoring domain fails if no monitoring class has a
component that contains the CPU. This is not expected to happen: a
resource only supports monitoring when at least one monitoring class
was picked, and only classes that cover all possible CPUs are picked
for monitoring.

The failure path calls WARN_ON_ONCE(0), which never warns. The
unexpected failure is thus silent and the CPU is left without a
monitoring domain with nothing reporting why.

Warn when no monitoring component is found for the CPU, as is already
done when setting up a control domain finds no component in the
resource's class.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 022920be1862..63c5bf45856d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1665,10 +1665,8 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 		if (mon_comp)
 			any_mon_comp = mon_comp;
 	}
-	if (!any_mon_comp) {
-		WARN_ON_ONCE(0);
+	if (WARN_ON_ONCE(!any_mon_comp))
 		return -EFAULT;
-	}
 
 	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
 	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
-- 
2.55.0


