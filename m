Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B2ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFT0RQOMS+topVvZAqeyNR2zSws/Cv0BUNtoXg3vmkE=; b=hi1owSUtGG3hDplIBhhmhiqCsJ
	UvgVeXJsyoSAetvzAvRnlalmED/m4s9iTfX+3n8KbmcsSrgn0phVwo0LMyGm52lvLlTAQu5CUIqp8
	R/6LmrNXxQvpM92gkPfyikRnT2BHgN624mwPok2Ctf555Ve301zwXapJHooXkvcZfhRoBeGd7L5HW
	VhwoPsFS/1n82+ITrJHN4bwgiE8YWDK85qMKIwv3DVWNffX72oQrUqEFGj5GoxsSqXdrsggkFP8sp
	VV+iz2VZ+Oy93MxxVe/uYw9xy/LdsjmsQeMn6wq53dMIxh4wqper1lgz1bjzoEo+FkHe18Fp7UOcy
	iIqWPWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD250-0000000CS2f-4Agt;
	Sun, 26 Oct 2025 14:50:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24y-0000000CS0V-3fGx
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 26 Oct 2025 14:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AFT0RQOMS+topVvZAqeyNR2zSws/Cv0BUNtoXg3vmkE=; b=QBcibjsHOReirsGJ5lWgBU0Wh/
	0bskxx+9kRCaAHRTqVgxU9PMReh+iwbJqp0uBdySYM/dEv3nKvGPjNl+e8WuVJbItaJJV+T//b8Od
	qX3ZSRrpG7fCVDQN9uHAbuqbGFGEyPyzJJx8zv1JDXYuJK46EsQA/PR9ay3CcCccfvkeZls5SpRVE
	omCgtL4lStbfcsysDINV2vDAQMReLUNJheDb7GmPAwdm6kTFmmXWmGSFZdQXdIDd0fjuQIo1216u6
	2+vaiHLCWU1Yo/3f5+/MnXnUGdeZFndVLwU17G7Kc150j+bRYneDQEyTdoVevbsgHCcRF8WnvMr+7
	9JMudeQA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1DB-00000000fXo-1Lux
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 13:55:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EEEC44F47;
	Sun, 26 Oct 2025 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2BDC4CEE7;
	Sun, 26 Oct 2025 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490239;
	bh=2MBAaFZNwmraGivu2UIRCGodtNSsXBGb3gZYEGmCiYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o2WPcYy0IU+y5WtiDCDdDhP2g/J3s2WRZfLM6iCl0P2QB/lIRMBmPFF/YhheYfJVw
	 hNl7ukqKEXRSNgnv4a8qn9UbIPVOXnsqchgf6IRRL1WDGOS7AbUwWwRBKkWuJJwbkj
	 k12QKP98Nmdtx1a38Zm/cvkAKkhkpfVXyapZsX6R2oBr+mSQWJfYfuKayzJiZ1Gqz9
	 kaUPaR3Ov7DnUMI75K8oto6jpnUNgXvbJd89GMrOewsMk+PucvVMtTmmYVV6czDBgg
	 7REmqQQj9p2VoBdRcKsIaJWA8CE/+z8zxHfCrOiHQbI+taIu99Ib/o3rl1jL4tI2mk
	 3nlBQVPlggo2A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jacky Bai <ping.bai@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] clk: scmi: Add duty cycle ops only when duty cycle is supported
Date: Sun, 26 Oct 2025 10:48:54 -0400
Message-ID: <20251026144958.26750-16-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_135509_828079_C36D9587 
X-CRM114-Status: GOOD (  17.30  )
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

From: Jacky Bai <ping.bai@nxp.com>

[ Upstream commit 18db1ff2dea0f97dedaeadd18b0cb0a0d76154df ]

For some of the SCMI based platforms, the oem extended config may be
supported, but not for duty cycle purpose. Skip the duty cycle ops if
err return when trying to get duty cycle info.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – this is a low-risk bug fix that prevents the driver from
advertising duty-cycle support on firmware that actually rejects the
operation, avoiding real user-visible failures.

- `scmi_clk_ops_alloc()` wires up `get_duty_cycle`/`set_duty_cycle`
  whenever the duty-cycle feature bit is set (`drivers/clk/clk-
  scmi.c:311`). Before this patch any clock with `extended_config =
  true` populated that bit, so consumers believed the duty-cycle API
  worked even when firmware returned `-EOPNOTSUPP`.
- In practice, a refused call bubbles up to drivers that rely on the
  feature. For example, `clk_set_duty_cycle()` in the AXG TDM interface
  aborts audio setup if the clock op fails (`sound/soc/meson/axg-tdm-
  interface.c:249`), so misreporting support breaks real hardware.
- The commit now probes firmware once at registration time and only sets
  `SCMI_CLK_DUTY_CYCLE_SUPPORTED` when
  `config_oem_get(...SCMI_CLOCK_CFG_DUTY_CYCLE...)` succeeds
  (`drivers/clk/clk-scmi.c:349` and `drivers/clk/clk-scmi.c:372-377`).
  This simply reuses the existing accessor (`drivers/clk/clk-
  scmi.c:187`) and has no side effects beyond skipping the bogus ops.
- Change is tiny, localized to the SCMI clock driver, and introduces no
  ABI or architectural churn; the new call is already required whenever
  the duty-cycle helpers are invoked, so risk is minimal.
- Stable branches need to carry the duty-cycle support addition (`clk:
  scmi: Add support for get/set duty_cycle operations`, commit
  87af9481af53) beforehand; with that prerequisite satisfied,
  backporting this fix prevents firmware that only supports other OEM
  configs from breaking consumers.

Given it fixes a regression introduced with duty-cycle support and keeps
the driver from lying about capabilities, it fits stable backport
criteria.

 drivers/clk/clk-scmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 78dd2d9c7cabd..6b286ea6f1218 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -346,6 +346,8 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 		    unsigned int atomic_threshold_us,
 		    const struct clk_ops **clk_ops_db, size_t db_size)
 {
+	int ret;
+	u32 val;
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
@@ -367,8 +369,13 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	if (!ci->parent_ctrl_forbidden)
 		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
 
-	if (ci->extended_config)
-		feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+	if (ci->extended_config) {
+		ret = scmi_proto_clk_ops->config_oem_get(sclk->ph, sclk->id,
+						 SCMI_CLOCK_CFG_DUTY_CYCLE,
+						 &val, NULL, false);
+		if (!ret)
+			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+	}
 
 	if (WARN_ON(feats_key >= db_size))
 		return NULL;
-- 
2.51.0


