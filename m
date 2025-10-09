Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277BFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXdO19ljQW48TvVbPCBftBuK58eo0FTel/AQX6eds7I=; b=VTVsynnpmkM7osVoGbFDLRSGZD
	jCpwDhUv6pvuHuRsaiuqzlfWXZsqcxG9zlD8gzalzL5XwjVfQjb8pbNiwNCLGJs2wCmwLq2VUNgfg
	8+6MrwgV4tgijwrjIRa/7+w183GmVpaNMm6E/1OxEbV9ph+hYQghK5zavs8CrIJ+Sym0NpfYk07dK
	uZ9/ewlLriO1pRxvS0U/1friI44AgjNJzXZBUYhkSG1iAinuvyUZw3D1Vh3C72pChsebYWRmyGrnI
	LBIv4VV6JY4obaFs6EepqjlpRYH7YKunOai1a1WDe2ck5dwzXmtAGXeBUY6lTNHx7pP1LpvDyo5en
	s5fclddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t2s-00000006b4O-3yVF;
	Thu, 09 Oct 2025 15:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t2p-00000006b3T-43pf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF0F43E85;
	Thu,  9 Oct 2025 15:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AE9C4CEE7;
	Thu,  9 Oct 2025 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025547;
	bh=M0d/cnF+33Don3wW+JMwAO13Eu7zb/6Dnpq8fGlfMhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcn/J2afPcTrFDBMLgiS4CVpym3bncuukc7yvJ72sLU3SINS2CPr/x9bugDsGCTLl
	 y8gGyBu6cu2L3POzZJ6Zdjzi8H5bS8ilDsKlkbwoZOzzr9c+2JYhXHnU5i4JxhXG0t
	 bVZUoQ25yXBwNCCMAaKCtLvKvDQCQRf9rNw9NtRXJAc4e7fFYuRXIVY0E7D3saCWSl
	 AKnT20P8fcjBJzrcfXoqN4DuKyBcDWsPYEjdBcVxUfE5Xs+BdkrwruVHm7jKv4I9Xa
	 YY3QP+uQv7kS5elqBIFUPk7ByWYlRvMn0sBKeq/S62pJHSIsVZg4MDPD5khNXG7CJ5
	 OJjcAdsd2mcfg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Janne Grunau <j@jannau.net>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	sven@kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] mfd: macsmc: Add "apple,t8103-smc" compatible
Date: Thu,  9 Oct 2025 11:55:06 -0400
Message-ID: <20251009155752.773732-40-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085908_051379_43ED1D03 
X-CRM114-Status: GOOD (  17.09  )
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

[ Upstream commit 9b959e525fa7e8518e57554b6e17849942938dfc ]

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,smc" anymore [1]. Use
"apple,t8103-smc" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
Link: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-18-507ba4c4b98e@jannau.net
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What changed
  - Adds a new OF match entry `{ .compatible = "apple,t8103-smc" }` to
    the driver’s match table in drivers/mfd/macsmc.c:481, leaving the
    existing generic match `{ .compatible = "apple,smc" }` intact.

- Why it matters
  - Devicetree policy is moving away from expanding generic compatibles
    like `"apple,smc"` and towards SoC‑specific base compatibles. The
    binding documents this pattern and uses SoC‑specific compatibles
    with explicit fallback chains
    (Documentation/devicetree/bindings/mfd/apple,smc.yaml:20).
  - Current DTs for Apple SoCs use these patterns:
    - t8103 (M1) nodes include `"apple,t8103-smc"`
      (arch/arm64/boot/dts/apple/t8103.dtsi:900).
    - t6020 (M2 Pro) nodes use `"apple,t6020-smc", "apple,t8103-smc"`
      (arch/arm64/boot/dts/apple/t602x-die0.dtsi:105), intentionally
      avoiding the generic `"apple,smc"`.
  - Before this change, the driver only matched `"apple,smc"`
    (v6.17:drivers/mfd/macsmc.c showed only the generic match), so
    kernels without the `"apple,t8103-smc"` entry would fail to bind on
    DTs that omit the generic fallback, causing the SMC MFD (and all
    dependent subdevices like GPIO and reboot) not to probe.

- Risk and scope
  - Minimal and contained: a one‑line addition to an OF match table
    (drivers/mfd/macsmc.c:481). No functional code paths change, no
    behavioral differences for already working systems, and no
    architectural changes.
  - Security-neutral: no new I/O or parsing paths are introduced; only
    device binding is enabled for an SoC‑specific compatible.
  - No negative side effects expected: the new match string is specific
    and does not overlap with other drivers.

- Stable suitability
  - This is a classic “device/compatible ID addition” that fixes a user-
    visible binding failure when DTs conform to updated bindings that
    avoid the generic `"apple,smc"`. Such ID additions are routinely
    accepted into stable to enable hardware that otherwise won’t probe.
  - Although the commit lacks an explicit Cc: stable, it meets stable
    rules: important fix (driver doesn’t bind on modern DTs), minimal
    risk, no features, and confined to the MFD subsystem.

Conclusion: Backporting ensures the macsmc driver binds on DTs using the
SoC-based compatible scheme (notably those that rely on
`"apple,t8103-smc"` fallback), with negligible regression risk.

 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8f..a5e0b99484830 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -478,6 +478,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_smc_of_match[] = {
+	{ .compatible = "apple,t8103-smc" },
 	{ .compatible = "apple,smc" },
 	{},
 };
-- 
2.51.0


