Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0316ACCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR8MlnYcvCMtJMseI3jK/OgU34GXS2/kRPD0HOKmZGY=; b=K3CDIbS3b3jJVzJOxp5LuR7bxq
	Y9Rg6Irp44QctnkkGKumISy7GbuxePlSlhVVdmawaaeOsyDH+dj5uzNBFkDmNowKwCOjc8hBYc4td
	kqcpW59E+LdUxDf5VDDls90Onkj4tvoiZTo5pkaZOaR+eC/HGNAVzY2Bzly8R0TNaK4OhIi4Ccw+4
	L4nYanQcggApx6udskRYAK76kDZzqO7DUv3WHNl5OrU8vjo0nOCzB1ytMKM2RIUVbzOSg6bO7KMA+
	qCXGUMkGfTsqq+jnIpDifnIl5OwoCXlDky8TyscYI+frfy3RLyZlptztrWEshnO5L+tBm8nzefM77
	jOyJNvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t22-00000006aeD-3slH;
	Thu, 09 Oct 2025 15:58:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t20-00000006ad0-2G39
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D4BC48A7A;
	Thu,  9 Oct 2025 15:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B40C4CEE7;
	Thu,  9 Oct 2025 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025496;
	bh=VD+sWsMuMn62f0HpwunRDsLeC6U8QhG72Z4lydKbBNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XOPbP10kQH+8QtCycIPXPNTmww63F9Bhd5RCvcyxDtixTCQZPwFeJMKon4EAWGuzn
	 77jX4AZfQ1mELkLV4DhGac2JaFDc5VO3Q4sFadcbUV3mwBaOL9/Bwfx0Hi94jHWws8
	 cPwWI4sDWaZhKSHT1YuKQxRyIlxM0RTZHkDPlpXMYJbzfoQKQtz9zXHS6fUJo4B7PK
	 kjuBoylbDD/TI4PIC3imG8bSVZ9Dplin2KnioO/7J03L8E463/FUXjzlO5OePq77mX
	 gAuqCjPNIb3aqeiAClCPXDWsa6cAQ49Z6JYnpQMnqgHxXFE/n/bAsSQPGVaKjceLdf
	 xmAkFyNA7uhsw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bryan Brattlof <bb@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.16] soc: ti: k3-socinfo: Add information for AM62L SR1.1
Date: Thu,  9 Oct 2025 11:54:42 -0400
Message-ID: <20251009155752.773732-16-sashal@kernel.org>
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
X-CRM114-CacheID: sfid-20251009_085816_620439_F9AA21EA 
X-CRM114-Status: GOOD (  12.51  )
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

From: Bryan Brattlof <bb@ti.com>

[ Upstream commit 037e496038f6e4cfb3642a0ffc2db19838d564dd ]

The second silicon revision for the AM62L was mainly a ROM revision
and therefore this silicon revision is labeled SR1.1

Add a new decode array to properly identify this revision as SR1.1

Signed-off-by: Bryan Brattlof <bb@ti.com>
Link: https://patch.msgid.link/20250908-62l-chipid-v1-1-9c7194148140@ti.com
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- The patch teaches `k3_chipinfo_variant_to_sr()` how to decode AM62Lx
  silicon variant 0/1 into the correct revision strings by adding
  `am62lx_rev_string_map[] = {"1.0","1.1"}` and a dedicated `case
  JTAG_ID_PARTNO_AM62LX` (drivers/soc/ti/k3-socinfo.c:65,
  drivers/soc/ti/k3-socinfo.c:92). Without it, the existing default
  branch (drivers/soc/ti/k3-socinfo.c:98) blindly prints `SR<x>.0`, so
  the new SR1.1 silicon shows up as “SR2.0”—a clear mis-identification
  bug.
- That revision string is what gets registered in
  `/sys/devices/soc0/revision` and is what subsystem code keys on via
  `soc_device_match()`. We already rely on that mechanism for other K3
  parts (e.g. the AM62Px SR1.1 quirk in
  drivers/mmc/host/sdhci_am654.c:896), so shipping incorrect data
  prevents present and future AM62Lx-specific fixes or workarounds from
  triggering and can mislead userspace diagnostics.
- The change is tightly scoped to string decoding, has no architectural
  side effects, and mirrors the precedent set for J721E SR2.0 support
  (drivers/soc/ti/k3-socinfo.c:65-103 history). Risk is minimal while
  correcting real user-visible behaviour for existing hardware.
- Ensure the earlier ID-enabling commit (`soc: ti: k3-socinfo: Add JTAG
  ID for AM62LX`, c62bc66d53de) is in the target stable branch; with
  that prerequisite met, this bug-fix-style decode update is safe to
  pick up.

 drivers/soc/ti/k3-socinfo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index d716be113c84f..50c170a995f90 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -66,6 +66,10 @@ static const char * const j721e_rev_string_map[] = {
 	"1.0", "1.1", "2.0",
 };
 
+static const char * const am62lx_rev_string_map[] = {
+	"1.0", "1.1",
+};
+
 static int
 k3_chipinfo_partno_to_names(unsigned int partno,
 			    struct soc_device_attribute *soc_dev_attr)
@@ -92,6 +96,12 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
 						   j721e_rev_string_map[variant]);
 		break;
+	case JTAG_ID_PARTNO_AM62LX:
+		if (variant >= ARRAY_SIZE(am62lx_rev_string_map))
+			goto err_unknown_variant;
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
+						   am62lx_rev_string_map[variant]);
+		break;
 	default:
 		variant++;
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
-- 
2.51.0


