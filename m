Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C4F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYmqaQ+3roN0f9mUOUW/q5o2NIBbxC+TWxe+l+KJALw=; b=HxrsV2gG6+0uDVQjYbAlvl8531
	zwVaeak9kN8KzlEqmUA9PbRGNy4sxLe02/aMWtKQDTuS2JJ0iuTHjolXcOkOiWxrGMvosk9tPBasN
	wwUk2GWaU+ptMEbs6uYNcLM+pRC7hZNN3/I81rdaSCdieKVk8iD4tY6crn1o1Qq0MqVovlk0/JcVf
	VRaKhnSqjSKFc4XHKf8jwprQssnACp+3bmcx+DNmAlOjPjmx4YW6fvjlVf4lF4vGs+CjvlRB5cMTs
	UqbkN/IplzrG4kxhpGrO9Hcm044Uuewae5QB5wVT4EaZ+RrZq2w75nYp5QgxMct46m1iUPanwL8jh
	4K9zGXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEocn-00000006zwv-2ryM;
	Mon, 20 Apr 2026 13:25:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEock-00000006zvU-1V6r;
	Mon, 20 Apr 2026 13:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAF5044307;
	Mon, 20 Apr 2026 13:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F967C2BCB4;
	Mon, 20 Apr 2026 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691513;
	bh=lxK8mzMpPAy8qmTHJCf6vQTdOIk5p9rqZwYog5ZsSSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qudr/Zds1sfzyFWF8NnKa9jtzk9qx9nUxcjfaV3vuQ7/ucJMq6rbMTXy/STS4BmHE
	 TG2Qf/M1voGNIUcSALgo5WSOJg7Er/eBX0b9/+UNxzef6ZdYM4qft0Yqcc9r8mp4gi
	 B2HMU5TNnCvgf1MVjWOGO2cvJaA2w5PCfniabzKKI2jMatM6VPdacFiFIOOx2VA8i3
	 0X71Wil+fk+snGXjyrrq8oUkx5KnBr1aqJICD8VVyvcE2LAYE2uo+5gf6WODkmmaR6
	 gU8dT3aMqGG3zzcMRRRfeQoRkxnCG+8NbWVnvlQGZCdjDKohjRa5LFThJC7P5PG/rA
	 DaV4QI1bklpoQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] phy: phy-mtk-tphy: Update names and format of kernel-doc comments
Date: Mon, 20 Apr 2026 09:17:48 -0400
Message-ID: <20260420132314.1023554-74-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_062514_501080_2EFCE8BC 
X-CRM114-Status: GOOD (  19.26  )
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

From: Vinod Koul <vkoul@kernel.org>

[ Upstream commit 8d869bc943cfe5db08f5aff355b1d8d3abeda865 ]

mtk_phy_pdata documentation does not use correct tag for struct, while at
it fix one of member wrongly documented.

Warning: drivers/phy/mediatek/phy-mtk-tphy.c:289 cannot understand function prototype: 'struct mtk_phy_pdata'
Warning: drivers/phy/mediatek/phy-mtk-tphy.c:296 struct member 'slew_ref_clock_mhz' not described in 'mtk_phy_pdata'

Link: https://patch.msgid.link/20260223071032.408425-1-vkoul@kernel.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my investigation, I have enough context to provide a thorough
analysis.

## Analysis

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1** - Subject Line Parse:
- Record: [phy/phy-mtk-tphy] [Update] [kernel-doc comment formatting and
  member name correction]

**Step 1.2** - Tags:
- Link:
  https://patch.msgid.link/20260223071032.408425-1-vkoul@kernel.org
- Signed-off-by: Vinod Koul <vkoul@kernel.org> (phy subsystem
  maintainer)
- No Fixes: tag, no Cc: stable, no Reported-by, no Tested-by, no
  Reviewed-by

**Step 1.3** - Commit Body:
- Bug described: Two kernel-doc warnings:
  1. `cannot understand function prototype: 'struct mtk_phy_pdata'`
     (missing "struct" tag)
  2. `struct member 'slew_ref_clock_mhz' not described` (doc says
     `slew_ref_clk_mhz` but the actual struct member is
     `slew_ref_clock_mhz`)
- Failure mode: doc generation warnings; no runtime impact

**Step 1.4** - Hidden bug fix detection:
- Record: This is NOT a hidden bug fix. It is a pure kernel-
  doc/documentation correctness fix. No runtime behavior changes.

### PHASE 2: DIFF ANALYSIS

**Step 2.1** - Inventory:
- Files: `drivers/phy/mediatek/phy-mtk-tphy.c` (1 file)
- Lines changed: 2 lines modified (comment only)
- Functions: None (only a struct's kernel-doc block)
- Scope: single-file, surgical, comments only

**Step 2.2** - Flow change:
- Before: `mtk_phy_pdata - SoC...` and `@slew_ref_clk_mhz:` in comments
- After: `struct mtk_phy_pdata - SoC...` and `@slew_ref_clock_mhz:` in
  comments
- No executable code changed

**Step 2.3** - Bug mechanism:
- Category: Documentation correctness. The kernel-doc parser rejects the
  struct doc block because it lacks the `struct` keyword, and then flags
  the unmatched member name.

**Step 2.4** - Fix quality:
- Obviously correct (just comment text)
- Zero regression risk (no runtime code)

### PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1** - Blame:
- `9cc82c2498b4f` ("phy: mediatek: tphy: Clarify and add kerneldoc to
  mtk_phy_pdata"): first added the kerneldoc without the `struct`
  prefix. Landed in v6.17-rc1.
- `d6306fc5d77b7` ("phy: mediatek: tphy: Cleanup and document slew
  calibration"): introduced the `slew_ref_clk_mhz` doc line while naming
  the actual member `slew_ref_clock_mhz`. Landed in v6.17-rc1.

**Step 3.2** - No Fixes: tag. Effectively the fix addresses both commits
above.

**Step 3.3** - Related changes: None relevant; no dependency or series.

**Step 3.4** - Author: Vinod Koul is the phy subsystem maintainer. High
trust.

**Step 3.5** - Dependencies: None. Standalone 2-line comment change.

### PHASE 4: MAILING LIST RESEARCH

- Lore fetch attempted but blocked by Anubis. The Link: tag points to
  vkoul@kernel.org posting.
- Record: Patch was posted on Feb 23 2026 by the subsystem maintainer.
  No evidence of controversy.

### PHASE 5: CODE SEMANTIC ANALYSIS

- Only a comment block is changed; the struct itself and all callers are
  unaffected. No reachability change.

### PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

**Step 6.1** - Buggy code presence:
- Verified present in stable/linux-6.17.y, 6.18.y, 6.19.y (checked files
  directly; same problematic kerneldoc block exists in all three).
- Not present in 6.12.y and older (the kerneldoc block wasn't added
  there).

**Step 6.2** - Backport complications:
- The diff applies against the exact same surrounding context in 6.17.y,
  6.18.y, 6.19.y. Trivial clean apply.

**Step 6.3** - No prior fix found in stable branches.

### PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: drivers/phy/mediatek (PERIPHERAL - MediaTek SoC-specific
  T-PHY)
- Author is the subsystem maintainer

### PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1** - Affected: Only developers generating kernel docs. No end-
user runtime impact whatsoever.

**Step 8.2** - Trigger: Running `make htmldocs` or similar against the
file.

**Step 8.3** - Severity: LOW. Pure cosmetic/doc-build warnings. The
struct's `slew_ref_clock_mhz` member appears as "undocumented" in
generated docs, but no functional issue.

**Step 8.4** - Benefit vs Risk:
- Benefit: Silences two kernel-doc warnings; correct generated
  documentation.
- Risk: Essentially zero (comment text change).

### PHASE 9: FINAL SYNTHESIS

**Evidence FOR:**
- Precedent: recent kernel-doc-only warning fixes have been AUTOSEL'd to
  stable (e.g., `45285d357287b` backlight lp855x, `a1bf8ea50cbc4`
  kfence, `18b6574d4c647` net/bridge, `c2277e285923b` scatterlist,
  `1cce5a5ecafeb` mtd/docg3) with similar "struct member X not
  described" style warnings
- Stable kernel rules explicitly list documentation/comment fixes as
  allowed (zero runtime regression risk)
- Small and surgical (2 line comment diff)
- Buggy doc exists in active stable trees (6.17+)
- Author is the subsystem maintainer
- Patch applies cleanly to 6.17.y / 6.18.y / 6.19.y

**Evidence AGAINST:**
- No Fixes: tag, no Cc: stable
- Pure cosmetic - no user-visible impact
- Does not fix a crash, leak, race, security issue, or data corruption
- Fails the "important issue" criterion strictly

**Stable rules check:**
1. Obviously correct: YES (trivial comment fix)
2. Fixes a real bug: Marginal (kerneldoc warning only)
3. Important issue: NO by strict reading, but in the recognized
   exception category (documentation fix)
4. Small and contained: YES (2 lines)
5. No new features: YES
6. Applies to stable: YES

**Exception category:** Falls under "Documentation and comment fixes" -
explicitly allowed by stable rules as zero-risk.

### Verification:
- [Phase 1] Parsed tags: Link tag only; no Fixes, Reported-by, Cc
  stable, Reviewed-by/Acked-by in this particular submission.
- [Phase 2] Read the diff: verified only 2 comment lines change (adds
  "struct " and renames `slew_ref_clk_mhz` -> `slew_ref_clock_mhz` in
  kerneldoc).
- [Phase 3] `git log -- drivers/phy/mediatek/phy-mtk-tphy.c`: confirmed
  `9cc82c2498b4f` added the kerneldoc without "struct" prefix;
  `d6306fc5d77b7` added the member-name mismatch.
- [Phase 3] `git describe --contains` for `9cc82c2498b4f` and
  `d6306fc5d77b7`: both resolve to v6.17-rc1.
- [Phase 3] `git branch -r --contains d6306fc5d77b7`: present in
  stable/linux-6.17.y, 6.18.y, 6.19.y; not in older stable.
- [Phase 4] WebFetch of lore URL blocked by Anubis (UNVERIFIED); could
  not examine review thread directly.
- [Phase 6] `git show stable/linux-6.17.y:drivers/phy/mediatek/phy-mtk-
  tphy.c` and the 6.18.y / 6.19.y equivalents: confirmed the same broken
  kerneldoc block is present in all three active stable branches; the
  struct member is `slew_ref_clock_mhz` in all of them; diff will apply
  cleanly.
- [Phase 6] Searched for prior fix in stable branches (`git log
  --grep="slew_ref"`): none found.
- [Phase 6] Verified similar AUTOSEL precedent: `git show
  45285d357287b`, `a1bf8ea50cbc4`, `18b6574d4c647`, `c2277e285923b`,
  `1cce5a5ecafeb` - all are kernel-doc-only warning fixes that were
  AUTOSEL'd by Sasha Levin into stable.
- [Phase 7] Author identity: Vinod Koul is the phy subsystem maintainer
  (confirmed via MAINTAINERS history).
- [Phase 8] Failure mode: kernel-doc build warnings only; no runtime
  effect - verified by reading the diff (no executable code changed).
- UNVERIFIED: Could not read mailing list thread (Anubis block); did not
  verify reviewer feedback or stable nominations directly.

### Decision

The change is a pure kernel-doc warning fix: it adds the missing
`struct` keyword and corrects a member-name typo so the kernel-doc
parser emits the correct docs for `struct mtk_phy_pdata`. The broken
kerneldoc exists in 6.17.y, 6.18.y and 6.19.y stable trees, the patch
applies trivially, and the risk of regression is effectively zero (no
executable code is touched). This falls squarely in the
"Documentation/comment fixes" exception category explicitly allowed by
stable kernel rules, and there is recent AUTOSEL precedent for
backporting similar kerneldoc-only warning fixes (lp855x, kfence,
bridge, scatterlist, docg3). The strongest argument against is that it
fails the strict "important issue" test, but the risk/benefit and
precedent tip it to YES.

**YES**

 drivers/phy/mediatek/phy-mtk-tphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index f6504e0ecd1a7..acf5065295072 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -276,14 +276,14 @@ enum mtk_phy_version {
 };
 
 /**
- * mtk_phy_pdata - SoC specific platform data
+ * struct mtk_phy_pdata - SoC specific platform data
  * @avoid_rx_sen_degradation: Avoid TX Sensitivity level degradation (MT6795/8173 only)
  * @sw_pll_48m_to_26m:        Workaround for V3 IP (MT8195) - switch the 48MHz PLL from
  *                            fractional mode to integer to output 26MHz for U2PHY
  * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
  *                            read from different nvmem (usually different eFuse array)
  *                            that is pointed at in the device tree node for this PHY
- * @slew_ref_clk_mhz:         Default reference clock (in MHz) for slew rate calibration
+ * @slew_ref_clock_mhz:         Default reference clock (in MHz) for slew rate calibration
  * @slew_rate_coefficient:    Coefficient for slew rate calibration
  * @version:                  PHY IP Version
  */
-- 
2.53.0


