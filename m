Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733B606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h2ro7yLS;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RCItmiej
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4jhFytiI66cmmm6AXrsnro4R7bcDCLYlnTCIFvr7kE=; b=h2ro7yLSKPhXsI2SZU8Gr9NMFt
	B9KF5QaXdQmV7e+4dD+fmjyLYSWtlKBRdfAKwl+BHu6wtVtR3dKMKonqbBl4Hc8P4KluJDKdnumGi
	WZ1yAE1Ht9HSKOmlhyJLsJ1oPl1qlQ+3vXfOmIa+YgdnawFu/3Kyy06ICvDEyuzeiP0s3EXe2aSgx
	0x+zvYAJNHDvqkrorbc87L2p/XHcUOgLFr/+AAt+nrTpRO7fMJe6ywcGFhDN30025h9WXHLxItJL6
	TtedPw0+r4Cu1OfJi1CsPByWYO81YMVn+qYu/9/M8Qe7rTFCvPbK07P7tEb6psvYLhiJ78sPwjV8y
	ygEzmgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWS-00000008Rv5-3f9F;
	Mon, 19 Oct 2026 22:08:00 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvWQ-00000008RtY-2mRW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 22:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447679; x=1823983679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QQ9Bpf+tsb027Xat4FCScbe4wCVN+lfOpBdhngzVWbE=;
  b=RCItmiejCztd7CV0qzv20O3pnDMRDWOL62/34fnbr8qT5FWyu+6pUEFC
   hSdvol3A+iI/6dTSxMKu4HVuubTzQghuAXsEZYurBts6ame9kysx4DDoR
   0rQGL8PLgB5i/1py8jKH0Sq6TbtEJQn4kvXKV2ke4kLQa2KeJrdxBg0Bv
   /PNOSpCb+ELhhunr6qBG/74nuHQ+DSrmjBpJMpOtzrSMAbCzA5bxnTwbC
   Aw3JXcHFPnO0s8MlSxq+JlUe6vK4/v+ZvF3zT9AK+laKJW5+DjbCJWtQp
   A527dZJ80swPpBTbyoK1VmEuPkGOtuxZnn1gOr5YEK0cxWMxjE1/MPyIf
   g==;
X-CSE-ConnectionGUID: VJ+pt2oeSdiQY/ejO7+ATQ==
X-CSE-MsgGUID: 5mmF7S/1SZGoj8uWRS/GxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144169"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:58 -0700
X-CSE-ConnectionGUID: MDzYSIG1SLubFn/53ZVIWQ==
X-CSE-MsgGUID: 0up9jIBoS/GQn2uwDl7dZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708324"
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
Subject: [RFC PATCH v2 00/10] arm_mpam: resctrl: Separate MPAM domains
Date: Mon, 19 Oct 2026 15:07:34 -0700
Message-ID: <cover.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_150758_738554_6757F525 
X-CRM114-Status: GOOD (  16.14  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/

The MPAM driver represents a resctrl domain with a single structure,
struct mpam_resctrl_dom, that holds both a control domain and a
monitoring domain. On a system that supports both allocation and
monitoring, one instance is created for each domain and its two
domains are added to the resource's control and monitoring domain
lists.

Holding both domains in one structure requires control and monitoring
to be done at the same scope, and ties each control domain to a
monitoring domain. This does not fit the proposed support for multiple
controls per resource [1]. There, each control of a resource, for
example a "min" and a "max" memory bandwidth control, has its own list
of control domains while the resource keeps a single list of
monitoring domains. With one structure for both, every control domain
would come with a monitoring domain of its own, which does not reflect
the resource.

This series gives control and monitoring domains their own structures,
set up and torn down independently as CPUs come online and go offline,
in preparation for supporting multiple controls per resource. Along
the way it stops failing CPU online when a domain cannot be set up,
and adds checks when setting up a monitoring domain.

  1-2   Preparatory cleanups of domain allocation
  3     Do not fail CPU online when domain setup fails
  4-6   Separate the control and monitoring domain structures
  7-9   Checks when setting up a monitoring domain
  10    Comment update, kept separate for review

An earlier version of the domain split was posted on its own [2]. This
version incorporates the feedback from that discussion. It gives each
type of domain its own structure instead of duplicating the shared
one, sets up each domain independently instead of undoing one domain
when setting up the other fails, and adds the checks in patches 8 and
9.

Patch 7 turns a WARN_ON_ONCE(0) into a warning that fires. It is a
separate patch because it is not clear whether the silent failure was
intended. If it was, the patch can instead drop the dead
WARN_ON_ONCE().

This is an RFC because I am only able to compile test MPAM changes,
which is also why the patches are small and each change is justified
on its own. Patches can be squashed if preferred, for example patch 10
into patches 5 and 9. Testing on MPAM hardware would be greatly
appreciated, as is any other feedback.

The series is based on the for-next/mpam branch of the arm64 tree:
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

[1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
[2] https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/

Reinette Chatre (10):
  arm_mpam: resctrl: Use find_component() when allocating a domain
  arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
  arm_mpam: resctrl: Do not fail CPU online when domain setup fails
  arm_mpam: resctrl: Split control and monitoring domain setup into
    helpers
  arm_mpam: resctrl: Give the monitoring domain its own structure
  arm_mpam: resctrl: Rename struct mpam_resctrl_dom to
    mpam_resctrl_ctrl_dom
  arm_mpam: resctrl: Warn when no monitoring component is found for a
    CPU
  arm_mpam: resctrl: Require a component for each monitoring event
  arm_mpam: resctrl: Require monitoring components to cover the same
    CPUs
  arm_mpam: resctrl: Update the comment on monitoring domain setup

 drivers/resctrl/mpam_devices.c  |   2 +-
 drivers/resctrl/mpam_internal.h |  11 +-
 drivers/resctrl/mpam_resctrl.c  | 325 +++++++++++++++++---------------
 3 files changed, 181 insertions(+), 157 deletions(-)


base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.55.0


