Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5869606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vggEGI1h;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO37nZdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fbEtnkUKPu+LL9E6R37XAYXOIcXTLbcLWYw0vich8Gw=; b=vggEGI1hiCjsduwI/7mFttOX8/
	1vde/5OIDBBEMlNER4N7MsqvkC1M16oms7GQzXVVfwSCAK7J6YAdRFEMrrJ9mW1rnPdV+L8//mK3c
	JCpY7LTCascjTt0ia8ef9NEyZTNm/3EBcvwW6j//VGZjCJWLIKnUQepzTc3Qh/rjAoWNuaJCaPEK/
	GWE76/3OcycOTBLC5XKuVMzEohaK3a4ScPe684OmCl0JNrY5c5pc01CqhQ6/LqP5WUKW/LNE3KGmd
	3G4hXhQN0/eVUkKCZ/dEwwQvFKDMkgNVng9rlJqZnNoKIVHub5h++QE7v39xQxzAspTY2ddLGrwdt
	BgFGDb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi3q-0000000B8Fw-1wnD;
	Fri, 30 Oct 2026 08:34:06 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi3k-0000000B8Ds-0hJQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:34:01 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so221144a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349238; x=1793954038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbEtnkUKPu+LL9E6R37XAYXOIcXTLbcLWYw0vich8Gw=;
        b=GO37nZdwYAolfSN+v4HkwR93E+uKob2LCck7OORxljkIinkRhV+yEvJqBArmPXkL9x
         cPP2cUUwbfnEcTCelMOd+R1PrzNd3di5tnkV+Z2OLGCedxnCY57lcxNacSoSS9pelVkE
         qGZgPDZJd8r4URbgnIMvSi2M5ZjLQ9iDzq2NWL45VYj6hpQWb8PzO3MRdf0mi0mGMx+z
         P8zItpAYsKU3Y9F3Zo0Z4tCrkSTpiWmRjbLgkQVWoOjlaNLcw+9faHkOvXCFLaXRkAC9
         tkewScbdQ1Nuh8sxcHOYpog/Q3yob03dd1gyb8xdIlIq6xWWBa4ArghqhQ6V7vmZE0fI
         DQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349238; x=1793954038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbEtnkUKPu+LL9E6R37XAYXOIcXTLbcLWYw0vich8Gw=;
        b=jkEiGqbiwcZ2QYsSJd87hF8VF83B1NjSwRBp+gX3N8kymTVhbyn4C/Oc0g518yF3Gd
         B8jEF1AbdtYI1muvrxAC5hOHhR+T5xfxEtYm2U0eHw+82y5ZML/Jp2Ssh9NsKOFWp1qZ
         qNTpmzMJ18gGUkGkzYbZo54rqowKBpPegbjMi+tESyRH0xlSz1EeBZFZmevj+nwRdnnj
         HUQr5SiJq55LjUKGHf2B3XuvQqDgAHiH31WnifAtmbz0KhzFud3PnIYj2NiI2w8Nt0EJ
         XtSHBxxoEHysdHJccWGatZcuDP/45HGQerPSkjCwWqzyfW7MSXJhFg5SkhCF1v0cG0jI
         aAeg==
X-Forwarded-Encrypted: i=1; AKwUvByIHJSzKCJxSBCGYOmGaeEJkjIyGNpALv2ZwVdmBkzw6zLXIMYCPkze5vA8El5t5ALf/65sSuGXjwy0wEVGzXVh@lists.infradead.org
X-Gm-Message-State: AFq9FYLwgi2LxNSL3GSTT13fsa+hnxlAzX6LIXaO+wEstYfwd2KsgJM3
	JmFymAETTrZPnNxMbzCl3LF7tri6a1Lw5pg/MgpbxYLw46AIyIbF/wZl
X-Gm-Gg: AYBFou1PLxbfT7m0bkuhIvfqeCis8bteozVlkgF5zEnienzG64pJBlaM3h5S7BYpM2A
	gSUJCDjt9S4kpWZSie8Y/xVcD3SL+k4HQHiVfdMhUIomYBv9Ge+PxjPPXUfO5uqbU8RYl1e9cOl
	BX/bIl79FVnF8Cz8AG9ALbjlN0K3N3fsyoA5jxJiOy0s7gzajMA7hWnRzQJ6iEbThc0cUKzsmfU
	ujBLQToqTUDWgRqCWqkZlpQIUV1RzlX72o1KZZybImXlTJU8fgpb8mzr4xEQdzknMjVfqCCFljw
	8aH5T3pn4oMw1hBzM+7Yc8HSifX8a4KpISIfb7PQJVW3JJKn4vcV/SAEXkLP0eBPACvwqXTj/wq
	UcNiWqDdblzpP39qs/r27ZGFNgCnLkId4jriz3hYGFWsl5Z1M/kEflpPTrZNqKVSR2lgoh/xW5x
	i0bppnkhHcVFkvPgcVcvzbKjbkZgB9Li/DO5nGnMkFoF5ao3DD80KYKRFDFXYNTruiPXBu+5ldZ
	iQafP9fJSsHQaq04W5e2NKxNlF6b49n/p+0aUk+lwvzk+yWTctKm2JCXHvr2zdRt+N7LCyFrarM
	iSpNXCCnP+qNM9RsZAXmdSW6oPmczUw0QvH9vkNj06UGdVPQsZkMZ4SeEGsPLSR5bzBnK5My/xq
	vBIxNtBT3DniCxplGEYflreaLAlf3FjTZcl4+TNjexVQLvMMYYJ8CkTDZtEjHnSBzejSVOYCivH
	MuU3GOBw/l5LR/ty0+OISr/3oNXq3onLWCQuw=
X-Received: by 2002:a17:90b:2f0f:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3ae8974a292mr952529a91.22.1793349238418;
        Fri, 30 Oct 2026 01:33:58 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm1490961a91.1.2026.10.30.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:33:57 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v2] Documentation/process: Add a maintainer entry profile for KVM/arm64
Date: Fri, 30 Oct 2026 16:33:51 +0800
Message-ID: <20261030083351.3040604-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_013400_224047_4FECA0A6 
X-CRM114-Status: GOOD (  37.45  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM/arm64 has no P: entry in MAINTAINERS, so nothing tells a contributor
that the kvmarm tree is used for integration only, or what the
maintainers expect patches to be based on.  Marc Zyngier said a profile
would help.

Add one covering the trees, the base for patches, the submit checklist,
key cycle dates and review cadence, and point the KVM/arm64 entry at it.

Link: https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
Link: https://lore.kernel.org/all/87tsnb2dtq.wl-maz@kernel.org/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Changes since the RFC
(https://lore.kernel.org/all/20260925085621.562448-1-matthias.goergens@gmail.com/):

- Point at the MAINTAINERS entry instead of naming maintainers and lists.
- Describe master, topic branches and shared branches; drop the open
  questions, which the RFC's Sashiko review had also flagged.
- Base: prefer -rc1 to -rc3, not kvmarm/next; leave conflicts visible.
- Subject lines: capital letter after the prefixes.
- Architecture references: prefer rule identifiers; drop the comparison
  with KVM x86.
- Testing: selftests usually at the end of the series, reproducible
  performance measurements, tests encouraged rather than required for NV.
- Key cycle dates: no new features after -rc6; how fixes are sent.
- Review cadence: stability of commit IDs; answering bot reviews.
- Posted as a new thread, with the documentation maintainers and lists
  on Cc.

Steffen, Marc asked you for a short addition on KVM/arm64 on s390 for
the Trees section.  I've left it out and can add it as a follow-up.

Oliver, thanks for inviting an updated patch.  Corrections are welcome.

 .../process/maintainer-kvm-arm64.rst          | 181 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/process/maintainer-kvm-arm64.rst

diff --git a/Documentation/process/maintainer-kvm-arm64.rst b/Documentation/process/maintainer-kvm-arm64.rst
new file mode 100644
index 0000000..3b0bb56
--- /dev/null
+++ b/Documentation/process/maintainer-kvm-arm64.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+KVM/arm64
+=========
+
+This document describes how KVM/arm64 (``arch/arm64/kvm/`` and the other
+files listed under "KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" in
+MAINTAINERS) is maintained.  It supplements
+Documentation/process/submitting-patches.rst.
+
+Overview
+--------
+
+The maintainers, reviewers and mailing lists for KVM/arm64 are listed in its
+MAINTAINERS entry.
+
+Trees
+~~~~~
+
+The KVM/arm64 tree is::
+
+  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
+
+This tree is used for integration only: no development happens in it, and
+most patches should not be based on it (see `Base for patches`_).  Its
+branches are:
+
+``next``
+  Changes queued for the next merge window.  linux-next merges this branch.
+
+``fixes``
+  Fixes for the release currently in its -rc phase.  linux-next merges this
+  branch too.
+
+``master``
+  Follows the -rc tags in Linus Torvalds' tree.
+
+Changes leave the tree as signed tags, which are pulled into the main KVM tree
+(``git://git.kernel.org/pub/scm/virt/kvm/kvm.git``) and from there reach Linus
+Torvalds.
+
+Topic branches are managed by the maintainers in their private trees, and only
+the result of integrating them is pushed out.  The exception is shared
+branches, which are published when necessary.  Where a series also touches
+code maintained elsewhere, most often the arm64 architecture code, the
+maintainers may set up a shared stable branch, based on an -rc tag, that both
+trees merge.  Say in the cover letter which parts of a series touch other
+subsystems.
+
+Base for patches
+~~~~~~~~~~~~~~~~
+
+Base your patches on a tag published in Linus Torvalds' tree, preferably -rc1
+to -rc3.  If you rely on something merged later, for example a fix merged in
+-rc4, say why in the cover letter.  Patches based on linux-next are
+discouraged.
+
+Do not base patches on ``kvmarm/next`` either: it is rebuilt regularly, so a
+commit on it is generally the wrong base.  If your series conflicts with work
+queued there, leave the conflict for the maintainers to see, as it is a sign
+that something needs a closer look.  A proposed resolution is welcome.  The
+exception is a series that strictly continues one that has already been
+queued.
+
+If your series depends on something else that is not yet in mainline, such as
+another series under review, say so in the cover letter and name exactly what
+it applies on top of.
+
+Use ``git format-patch --base`` so that the base commit is recorded in the
+patches.
+
+Submit Checklist Addendum
+-------------------------
+
+Recipients and threading
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Send the whole series to all of the maintainers and reviewers listed for
+KVM/arm64, not a selection of them.  Post each new version as a new thread,
+not as a reply to the previous version, with a cover letter for anything
+longer than a single patch.
+
+Subject lines
+~~~~~~~~~~~~~
+
+Changes to KVM/arm64 use the ``KVM: arm64:`` prefix, often followed by a
+sub-topic such as ``nv:`` or ``vgic:``.  Selftest changes use ``KVM: arm64:
+selftests:`` or ``KVM: selftests:``.
+``git log --oneline`` on the files you touch shows what is in use.  The text
+after the prefixes starts with a capital letter, for example ``KVM: arm64: nv:
+Fix life cycle of the nested_mmus array``.
+
+Architecture references
+~~~~~~~~~~~~~~~~~~~~~~~
+
+KVM/arm64 code tracks the Arm Architecture Reference Manual (the "Arm ARM",
+document DDI0487) closely.  Where a change depends on architected behaviour,
+explain why the change is needed and cite the Arm ARM in the commit message
+or in a comment.  Where the rule has an identifier, such as ``R_QXXPC``, quote
+that: identifiers stay the same across revisions of the document, while
+section numbers do not.  Otherwise give the revision along with the section,
+for example ``DDI0487L.a D24.2.70``.  The same applies to other architecture
+documents.
+
+Testing
+~~~~~~~
+
+Say in the cover letter how the series was tested: which tests, and on which
+hardware or model.  The KVM selftests (``tools/testing/selftests/kvm/``) and
+kvm-unit-tests are the usual test suites.  Put selftest changes in patches of
+their own, separate from the KVM changes and usually at the end of the series.
+
+KVM/arm64 can run in several modes, which are described under
+``kvm-arm.mode=`` in Documentation/admin-guide/kernel-parameters.txt.  Test
+the modes your change can affect.
+
+If a patch aims to improve performance, describe exactly how you measured it,
+in enough detail for others to reproduce the results.  Measurements made on a
+software model such as QEMU or the Arm FVP say nothing about performance on
+hardware.
+
+New tests are encouraged, particularly for nested virtualisation, where
+coverage is poor.  Depending on the change, selftests may not be enough; the
+maintainers may ask for testing with a VMM, for example.
+
+Userspace API
+~~~~~~~~~~~~~
+
+Document changes to the userspace API, usually in
+Documentation/virt/kvm/api.rst or in the files under
+Documentation/virt/kvm/devices/ and Documentation/virt/kvm/arm/.
+
+Fixes
+~~~~~
+
+Add a ``Fixes:`` tag for bug fixes.  If the fix should go to stable kernels,
+add ``Cc: stable@vger.kernel.org``; the maintainers may add it when applying
+if the bug calls for it.
+
+Key Cycle Dates
+---------------
+
+Changes for the next merge window are queued on ``next``.  New features are
+usually not merged once -rc6 has been published; from then on, only fixes are
+queued.  This is not a hard rule, but posting a feature just before -rc6
+guarantees nothing.
+
+Fixes for the current release are queued on ``fixes`` and sent upstream at
+intervals that depend on how severe the bugs are.  There is no cut-off for
+fixes, but the maintainers may defer a low-priority fix to the next merge
+window.
+
+Review Cadence
+--------------
+
+Unless the maintainers ask for a new version sooner, allow at least a week
+between versions of a series, and only post a new version once there has
+been enough review to justify it.  Posting more often delays review rather
+than speeding it up.
+
+Pinging a series that has had no response is fine.
+
+Answer reviews from bots such as Sashiko as you would any other review, even
+if only to say that a finding is wrong.  Pre-existing problems that a bot
+points out, and that are unrelated to the series, need not be fixed in its
+initial posting.
+
+Applied patches are normally acknowledged in reply to the posting, naming the
+branch (``next`` or ``fixes``) and the commits.  The maintainers try not to
+change the commit IDs of applied patches, but the IDs of merge commits almost
+always change.
+
+Minor problems are often fixed up by the maintainers when applying; if they
+say "no need to resend", don't.
+
+Security issues
+---------------
+
+Bugs that let a guest attack its host, or a nested guest attack its guest
+hypervisor, should be reported as described in
+Documentation/process/security-bugs.rst.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a162e9..183bf34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14596,7 +14596,9 @@ R:	Zenghui Yu <yuzenghui@huawei.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	kvmarm@lists.linux.dev
 S:	Maintained
+P:	Documentation/process/maintainer-kvm-arm64.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
+F:	Documentation/process/maintainer-kvm-arm64.rst
 F:	Documentation/virt/kvm/arm/
 F:	Documentation/virt/kvm/devices/arm*
 F:	arch/arm64/include/asm/kvm*

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0


