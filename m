Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E14CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBU+1kZuI0At1ohJXG1/+0Waqh7ipWTS1UO2JcAWGl0=; b=szzK2Taa12Y9uPK2tsbVnoICEe
	ooN04fz2fvfVo2NpRonlnXF7u3IeabYYimGkO8Gm1WS+T3XFQkqwJ8eqsR2h521PWngCZvfYZKgpb
	gegel/ORUQn3QzCQKAjc7fjWAIU5zR6d6rBD4GKmpN9pGoLXqtYZIxBe2Ck4JsMcWQFSH/ZhLpykH
	6sQri1qX4kZG9TKzCnB8/t+/ZJuzieFOn5OVrjnS5fZiixKlgyXoHw0f92XCcILdzKinRp0CXUk+r
	CWxJ55k5dQ6mtYl7cIbZmqK4VhNHLWP4uQ0ZpNbpdAivkmRu++D7W5JdxLIB73vOdmpdblpN/ZC1A
	2hplD88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t4K-00000006cBy-2t2n;
	Thu, 09 Oct 2025 16:00:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t4I-00000006cAR-3Eo2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CAA6236D;
	Thu,  9 Oct 2025 16:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6178C4CEE7;
	Thu,  9 Oct 2025 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025637;
	bh=ALThAbtUaT72qVaCD2dRMI9yWcRKFS93pvx7JXbR47M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhXRQidww2WXw5y5l5wJAu+aLeXMytEbRgl7OR8Uuzm7/sU+HiyVjWtrbGWc/kbwG
	 uH7wQrd5K0jGL7MXnLQc8LrWXdKIMCse5S++sW9UxxFvzwrk6v7vScl2sdVxwBX4G+
	 iRUfk/iXxrptgEHQEsyBZIc44k/U6H9HU8cxS81F3GJnMOV9F4CGk71iDnueWO9RA8
	 nC6pf73As63lhcLjaDOAEYnBMVKplCueIhwtpP36sxXpMEES3phH7l2jFtmrVVFFwo
	 NGVyaG8F56L8NZHq35wN+V9OeE27sIIu/TG7hZgbyBiOnu2viRsg+WXoR9xi36tqnJ
	 ZA+rJtjiUCnOQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Janne Grunau <j@jannau.net>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Neal Gompa <neal@gompa.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
Date: Thu,  9 Oct 2025 11:55:55 -0400
Message-ID: <20251009155752.773732-89-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Janne Grunau <j@jannau.net>

[ Upstream commit 442816f97a4f84cb321d3359177a3b9b0ce48a60 ]

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,pmgr-pwrstate" anymore [1]. Use
"apple,t8103-pmgr-pwrstate" as base compatible as it is the SoC the
driver and bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What changed: The patch adds a single OF compatible to the driver
  match table to explicitly support the Apple M1 (t8103) PMGR power-
  state nodes. Concretely, it inserts `{ .compatible =
  "apple,t8103-pmgr-pwrstate" }` in `drivers/pmdomain/apple/pmgr-
  pwrstate.c:309`, keeping the existing generic fallback `{ .compatible
  = "apple,pmgr-pwrstate" }` just below it (drivers/pmdomain/apple/pmgr-
  pwrstate.c:310).
- Rationale from commit message: DT maintainers agreed to stop extending
  nodes with the generic `"apple,pmgr-pwrstate"` and instead use the
  SoC-specific string as the base compatible. Without this addition, a
  DT using only `"apple,t8103-pmgr-pwrstate"` would fail to bind the
  driver.
- Scope and risk: The change is a single-line device-ID addition to the
  OF match table. It does not touch runtime logic, data structures,
  Kconfig, or probe/remove paths. There are no architectural changes.
  This kind of “add a new compatible ID” patch is routinely accepted for
  stable because it’s low-risk and purely affects device binding.
- User impact fixed: On systems providing a DTB that omits the generic
  fallback (aligned with the new binding guidance), the driver would not
  probe, leaving PM domains and reset control unmanaged. Adding the
  t8103 compatible restores functionality. This is a real, user-visible
  failure mode when booting older kernels with newer DTBs or bootloader-
  provided DTBs following updated conventions.
- Alignment with bindings: The bindings already enumerate SoC-specific
  compatibles, including `"apple,t8103-pmgr-pwrstate"`
  (Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml:41).
  The driver now matches that SoC-specific string directly, which aligns
  the implementation with binding expectations going forward.
- No regressions expected: Existing DTs that list both
  `"apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate"` continue to bind
  identically, only preferring the SoC-specific match. DTs that still
  only have the generic string continue to work via the unchanged `{
  .compatible = "apple,pmgr-pwrstate" }` entry
  (drivers/pmdomain/apple/pmgr-pwrstate.c:310).
- Stable policy fit: This is a minimal, contained, non-feature change
  that enables correct binding for an existing driver on an existing SoC
  and prevents regressions with evolving DTs. There’s no security
  implication and no interaction with critical core subsystems beyond OF
  matching.
- Backport note: On older stable series, the file may reside under a
  different path (pre-“pmdomain” rename). The change remains a trivial
  OF-ID addition to the same match table in that file.

Given the above, this is a textbook low-risk backport that prevents real
breakage with newer DTBs and should be backported to stable trees that
already contain the Apple PMGR power-state driver.

 drivers/pmdomain/apple/pmgr-pwrstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/apple/pmgr-pwrstate.c b/drivers/pmdomain/apple/pmgr-pwrstate.c
index 9467235110f46..82c33cf727a82 100644
--- a/drivers/pmdomain/apple/pmgr-pwrstate.c
+++ b/drivers/pmdomain/apple/pmgr-pwrstate.c
@@ -306,6 +306,7 @@ static int apple_pmgr_ps_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_pmgr_ps_of_match[] = {
+	{ .compatible = "apple,t8103-pmgr-pwrstate" },
 	{ .compatible = "apple,pmgr-pwrstate" },
 	{}
 };
-- 
2.51.0


