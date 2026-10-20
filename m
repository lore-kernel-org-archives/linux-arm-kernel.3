Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E79606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UTl+Hi0g;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=XT0Yt2yT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DlRQrLuCp1pQiPvoZuE03RamHxP4GUYs64HC5pBSfnk=; b=UTl+Hi0g3LxyAK/uIXQ7sXpW4W
	ENo1AD5lxqwQOojaRef1SW+T6Znf5FFNVWFO2s3ANMaiTyrF5dUGbD1yprcbLMN2StPWuS2Q4hkag
	V3qGVOYQcs61ZIOzG6HRa+74poM2kXuG+bUsiME0fv6zByoGyw4lhNhN4Bqf5VZTwACykL4ZR/1vp
	yp+Smtoi6JCm+11dZC+HL+uKO7BVnRrZiqAmY5fvFVGfmAn3X7w+a3LJFk0pMO5jpdS3oNneKkkTT
	NHQVfr5+zcR/9UCJuSD+1Wb92i/dtz6TksiGdx6C6k2XO5FcnR/c9uo1aYA4V4aU8GR1Dnp5oaS+D
	xyVaSTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5gb-00000009FW5-39Ih;
	Tue, 20 Oct 2026 08:59:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5gZ-00000009FVa-3EUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792486746; x=1824022746;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=FIHdx2fBc52egtG9sz56x/Sle9+Dbim4lb5RV7ZqdVc=;
  b=XT0Yt2yTHNqI/TW4Y6Sq4Hw/ljhGoKVlWEvA9XRq5SP9M0GX3/HTn0Jj
   bkT3H2FE+sOq6NUOIDndgn8mOABRADCgBs3DBW+WJPDIJrXRmokaQEwYD
   guCS/j2TmFElPnmmpuDitg5aSJIaBqHWw1PQLvurzPYEsVF/7+I0VHEzx
   0oTPwjaaCWSXg9Gi49RQCegR1hRq4I9i9eiUe8LRdg5upRcjkRwNUeOVD
   u+yHQsZph5IVwmsACV+WExjdmMtGtYXOb+qbIqRVj7fPGhkpx/oV0dsu5
   VLEg94LSf4q8Rlknrsa1mhzu9/FajBZTJwSeAR2qHlZRlikW/pYR5mIG1
   Q==;
X-CSE-ConnectionGUID: o8FD05qDQcuAdhvUGHh3Fw==
X-CSE-MsgGUID: BZp+t77KTViALDwbfgmOQw==
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="75728452"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:59:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 20 Oct 2026 01:59:06 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Oct 2026 01:59:04 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 20 Oct 2026 10:58:58 +0200
Subject: [PATCH net] net: sparx5/lan969x: do not clobber the PSFP cycle
 timer update period
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-sparx5-psfp-cycle-timer-v1-1-00f2908f096a@microchip.com>
X-B4-Tracking: v=1; b=H4sIAFEt12oC/x3MwQqDMAyA4VeRnBdICg70VcYOXU23wOxKIkMR3
 93i8Tv8/w4upuIwdjuY/NX1Vxr41kH6xPIW1KkZAoU7Ew/oNdraY/VcMW3pK7joLIaJQh4ivVi
 IodXVJOt6nR9QZIHncZxKD/5JbgAAAA==
X-Change-ID: 20261019-sparx5-psfp-cycle-timer-c02f9a0b1e01
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, Simon Horman
	<horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_015907_820931_8FF95304 
X-CRM114-Status: GOOD (  14.77  )
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

sparx5_psfp_init() enables the periodic stream gate cycle timer update,
which keeps the cycle start time of each stream gate within one cycle
time of the current time. SG_CT_CLKS sets the update period, in system
clock cycles.

Before this patch, the update is enabled with a full register write of
SG_CT_UPDATE_ENA only, which also sets SG_CT_CLKS to zero. That is below
the documented minimum, the number of stream gates (1024 on sparx5 and
256 on lan969x).

Write both fields, and set the period to the recommended 10 us,
computed from the core clock since it differs per target (6250 cycles
at 625 MHz, 3280 at 328 MHz).

Found by an AI code review agent, and confirmed on lan969x and sparx5
by reading the register back as 0x80000000.

Fixes: e116b19db202 ("net: microchip: sparx5: initialize PSFP")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c
index 83b37f95ee46..fa19a48f941d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_psfp.c
@@ -322,6 +322,7 @@ void sparx5_psfp_init(struct sparx5 *sparx5)
 {
 	const struct sparx5_ops *ops = sparx5->data->ops;
 	const struct sparx5_sdlb_group *group;
+	u32 sg_ct_clks;
 	int i;
 
 	for (i = 0; i < sparx5->data->consts->n_lb_groups; i++) {
@@ -330,7 +331,14 @@ void sparx5_psfp_init(struct sparx5 *sparx5)
 				       group->min_burst, group->frame_size, i);
 	}
 
-	spx5_wr(ANA_AC_SG_CYCLETIME_UPDATE_PERIOD_SG_CT_UPDATE_ENA_SET(1),
+	/* Poll the stream gate cycle start times every 10 us. The core clock
+	 * period is in picoseconds.
+	 */
+	sg_ct_clks = 10 * NSEC_PER_USEC * PSEC_PER_NSEC /
+		     sparx5_clk_period(sparx5->coreclock);
+
+	spx5_wr(ANA_AC_SG_CYCLETIME_UPDATE_PERIOD_SG_CT_CLKS_SET(sg_ct_clks) |
+		ANA_AC_SG_CYCLETIME_UPDATE_PERIOD_SG_CT_UPDATE_ENA_SET(1),
 		sparx5, ANA_AC_SG_CYCLETIME_UPDATE_PERIOD);
 
 	spx5_rmw(ANA_L2_FWD_CFG_ISDX_LOOKUP_ENA_SET(1),

---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-sparx5-psfp-cycle-timer-c02f9a0b1e01

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


