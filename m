Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FEFC83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gFnfW/IMLkVNKoAcjZLNbDItT8tOK3CM6ZLLCmvj9UU=; b=ZYe99PRoZZCJlh37lod/K3SpVV
	1n563i7HpbpTpVSD/bbl/oLJXZ8hAvKy1REXjZse4cwts+sEHllKQeHeweqTMndar0/VyTGl6kdBJ
	pjn3Xt2ym+bNPfnUhHBPcZTSSWAijCp1RJlrXo1nhOn5lW3CPtvwNV247w2kkelwi0h/JbH3uiklt
	mgFjiskUX9UpeOUGkGO3gTlDSHbUDgBDGsU+KMfOSkwhIY4nmhedxpeUGl+9tbTkwIjMIRUi3TWLP
	OwP9zZjAfGplUKD8AIrdweqoILIN6RUFYK60CweUJ2RFalpeNbdk6nguM+H1lileqEDqJguLv/+NI
	Dg8mB6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubePT-000000051f3-0zvF;
	Tue, 15 Jul 2025 12:05:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube6C-00000004yWO-2anN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D14DC5C57BA;
	Tue, 15 Jul 2025 11:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 807C0C4CEE3;
	Tue, 15 Jul 2025 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752579927;
	bh=RSNF4QNrAE+1Kk9FftCVUREPYx43lWjS4Rbg2fpa9eg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nBoM/oxHF3ACntns3OkIrWJpbnSeboMsAUsRQhkZNEM4fAqklyWU/SFrB7L1+eGjL
	 9KLCi2YWLWXNl2+GYcIhSd6dScfPGu3dmi7a6x3jc5M+LXVGTivX3cUkgWUwcWng34
	 tyRoNHcX7WG6l65RnJB0R1NTBQL8/Lmt58l/S7QzH3GfcOMQLvb7ChB+n5pWyhvJ8b
	 1BPmx4I8dSNvPrv7u9TenIacsx4BRcTItQimaSnI6aFzeyLglAgRNETqgIH74DfLgp
	 pmmFSH+JXcw03FGLl86v0dFeyHI7A+lrIU0iE7ZzAogX1cjWeqxxLIqAFTSSSMbBmZ
	 mKOojuQ9yODbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76301C83F21;
	Tue, 15 Jul 2025 11:45:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 15 Jul 2025 13:45:24 +0200
Subject: [PATCH v3] ARM: multi_v7_defconfig add /proc/config.gz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-arm-config_gz-v3-1-70c45c58e073@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAFM/dmgC/42OsQ6DIBRFf6VhLgYeAaVT/6NpGiqgb1AbMMRq/
 PeiiUmHDh3PcM69C4kuoIvkclpIcAkjDn0GcT6RujV94yjazAQYSCZAUxM6Wg+9x+bRzLS0Sqp
 KamOlJtl5Bedx2nu3e2Yfho6ObXDmqAimOABnwKqCMw2qpJxak9BeccKxqOet02Ich/DebyW+1
 f50t9EEh/DrcoIs+RKkFYL7p/xy13X9AOKiRacRAQAA
X-Change-ID: 20250329-arm-config_gz-7d656859ad59
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=I/3GWpsPLyZxKfX4eh27wP6dQGm331pGxZH6FdZ4teA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBodj9W1Yz3cTm9JWk9P85lh50y/5Kv/xLk26ysX
 2Rxj5JveFqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaHY/VgAKCRBgAj/E00kg
 cuobD/wL7Xc/x/i1TjsG3wLOosZX6Ym3M3YIs/KGdJ1dpZ4C+8S1K92MxZq67fbFz9jX5yw6nQM
 uNsI4SxHGe8g+Yd9/gJmeXjq7ZgP9iiEUj/YJhIEOtGlt89pVzZM/M403WYJQPBaIlBpO02v9VU
 pLv2u+fuFvX87llrbCTVE6KfMf1d/3b4Z3Vo3u9o9p+CSurcdwr2xXTZIwjK370Q5l0gdKl1BVG
 TTYf4npyOqG7mKEL0Gh+OFQXMaMO2hj9VkHcTQ0Z43V0BngoMgGpRVNt03J9LuLI/c/sSniTzZ9
 lBHwtMNpyHsndM4l6u/oNn/ThrMR8QwFfWDx+bCOvG6egWNMX9fFNdaQyWdUie76b3JTdev4jsk
 AUaymjvsAF6vaz9FqWDfGISe+ThDyRMOjvUBi4d89P6ywz9D8WrYSkWr2wSdns2k/6BaMU3hMLS
 /eYzXjyH8PXCWe04B7HYPkLFniUONWWsWJRVGiV6l3dnlaPv74uARAu3nvZGmmbrjEwZn4dOkaA
 /wgaR3MtBuLXG7DaYzYu745iXHml5QZTrl56JiTausvUvgAwiltz8PglLhTcdkUd2zmUOFYnJ2E
 gf1sCBeN/1MCPlU9hrCRqSX30xf9fquMckYUYpmdLSOUezvF5JaqFnsNbahwvK6eLTBvvTofU9F
 h7gJ+KIyowEj2rg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_044528_751532_488EBA37 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

While 32-bit ARM isn't that widespread, multi_v7_defconfig is used for
building more generic images, where having access to config can be handy.

arm64 and x86_64 already bundle config.gz, so this is an effort to provide
the same level of comfort with ARMv7 devices.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Rebased against next-20250715; otherwise, just a resend.
- Link to v2: https://lore.kernel.org/r/20250329-arm-config_gz-v2-1-f725d331fb5d@ixit.cz

Changes in v2:
- IKCONFIG is now module instead of built-in (Greg).
- Link to v1: https://lore.kernel.org/r/20230612210208.109267-1-david@ixit.cz
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 65df4014c4a603bfc6d5810cacf50f904321e9b2..5180c90cb5da1cfc91db39346c4b20d888e0a621 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1,6 +1,8 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y

---
base-commit: f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f
change-id: 20250329-arm-config_gz-7d656859ad59

Best regards,
-- 
David Heidelberg <david@ixit.cz>



