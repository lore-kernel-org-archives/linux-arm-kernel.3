Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA950606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nO4AgSbB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oCxWLZkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=f7qXl+oFgNrZyAAUVUqI0RrjFdQvCwDXCCumBq2lEJY=; b=nO4AgSbBYQpFf1XqnAic+9ti2j
	bgPPeMJMQwaiA59O1OQyz+3Msf8EyCYQZe7Sdvi+9WdYveyN88MhMcr0GqRDgwhvo774jOOe7kD0W
	Y2Vyh4s8ZqGiWHD42htMf7YIJB+quG8QRmF3TO8ZEEzzbsEZv8HxldZXhI72TSHWXzEtCldrA8uaJ
	G5hTGVsOzZIug/UCW4W6YIPDRSYCuBuk0l0Lv2+SLYjletjqgFeyi6k78UqJJO0/it301vWYYzSaQ
	bkfDaAe6PqdIxlExuGqIPdT3IPHdhl+x74qAS2zaSYgn6VsjQycnEKWByUrfQ8d5KOq+CU5LW/EYn
	L/5iHrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzqL-0000000Ey6y-3MJr;
	Thu, 22 Oct 2026 20:56:58 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzqG-0000000Ey5N-3DtH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:56:55 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so154512a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702611; x=1793307411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7qXl+oFgNrZyAAUVUqI0RrjFdQvCwDXCCumBq2lEJY=;
        b=oCxWLZkGANvJlh/QSBsAE6ee9cFddMOxR1wrymIr8dtU455MR6FT+HNOkijZLta662
         LHemicB4AxWetekCP3+i+vMepu7VW1su0OsVp10gkNF1L5HOMuyFJEsNXA09IR6M2y7K
         P457K9wrg54c+w+q/feb7yeJYLYceWJ+ioUUGC02QT4fqc+krOwDlygzei/92DheqS9f
         lpfXid6BNLd+nvVtDNLZGI4nLd6+SpwOlTxOT087mjntY2yvIdaj/29jEpuFhkLkGEBT
         IWWygOqLZLWLQg7y/RKwZwfBj2iurQE1tINuuO0xtVK5wYrt7x40tacDtUpV+m5ACJDp
         czBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702611; x=1793307411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7qXl+oFgNrZyAAUVUqI0RrjFdQvCwDXCCumBq2lEJY=;
        b=GLB9PKFaNz00ysXiVXE8VJsNy7DoQYT4i0aZliVC441wd1y1ZBXhza9RjQyw21yjyJ
         hkmm3veVWLHD9Pb1i3BzRJ28ZUvABDoK/opIE/hWDSsgi2LPnwR1wfsgrUHB48uwFtzb
         nIFZq6Q3fJOaTHpGjT+nmh7htQXC5iHymHaq3WvpKgvck//pbBotp4KfIYEu/7wGh9R4
         mxcgoXTjzQ/xZwDCOu3wvnglOUhVq/UBbioSJ+HCkQtIIUMDTfCpmKJjdoFu+hyMFRg0
         v1F4xmORkryTf8TRu3eCr4tx4Y7LR44R1Ob4Rl4inxQsbLUzWTgFFdHRgaZkEqnp0AM3
         qCBg==
X-Forwarded-Encrypted: i=1; AKwUvBzYDBpXL+TjhyphL1dTsUgcSc3vRVNrX8Gojw5A4rZGNg7nwGTMHCaQN9qOggiC7wH07zf1QRDKOd/cwq7mOJVV@lists.infradead.org
X-Gm-Message-State: AFq9FYJuMLrRIELmcKtn5KiAxJAsOv845BTctyLVtQDle1FYwqkuL4zE
	zs6Ro2FWOMNHZcyV8JiVzKhitgwiFFy5lJwple0j4hNTF4eBZqOAQCcN
X-Gm-Gg: AYBFou1/ldt7WwUXUt7ONsHUap9Z3Uh82jpdVRE3aWjGvH5wiiHM85J7vtrbeqPpNeA
	2IoFdTMULj/xeEGSTkgVSOx3s4MMpkWfjUQP87P50J8YcBYgjsDIkuIzSdihS7iVpT1tGYxzZXQ
	AG3vOxbAfyfP/f3AMrTHpQpxAS88+IGUhMV8IWpPIENJyf9/2nz+OalIG87fY3xgNz5Vt6TbLk5
	7rOZqCvmRB2ErLkawC+/GzqwqS0DsIFHo7VdXthdVhCwG8f8S8AjAdx8qvuLR9wZsRSRqHwSXxA
	du/YxYchJXqWawJWiWkX5IewAsBExREwOc3PxK223+BRoU/8LDmm839cNVb8YMo1cMfgRXLlx9m
	K4NkVrN2aBjz5kALF21JbLXxTk+5YVWMPqYMmgN5U8iwPh+CuuCJ1ktTlqhAW8NSdTpchTgsZud
	v/6QXZwdFmbagIvqty8P+YPlg1aCsqLUKbRY4tV91E7IruPt6PxgSindO9VFFseG33C79P80Y3E
	YGKmdNOgmVWi1WqiBQ/65YrZ04ARulTV/dldL+CdRx+WPzOQc4QL99/9mN1U/nAlTtICHAxh3eD
	Erzy86EvVHLgWS8=
X-Received: by 2002:a17:90b:4a12:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3adcd7fe438mr149838a91.0.1792702611337;
        Thu, 22 Oct 2026 13:56:51 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada495315dsm6263941a91.15.2026.10.22.13.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:50 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: Tao Gong <gongtao0607@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
Date: Thu, 22 Oct 2026 20:56:48 +0000
Message-ID: <20261022205649.2351696-1-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135652_864652_9E93BA41 
X-CRM114-Status: GOOD (  22.89  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On EN7581, STP BPDUs received on switch user ports never reach the CPU.

Like MT7531 and MT7988, EN7581 and AN7583 only set the CPU port bitmap
in MT7531_CFC and are skipped by mt753x_conduit_state_change(). On
EN7581 this is not enough: trapped BPDUs reach the CPU only when
MT7530_CPU_EN and MT7530_CPU_PORT are also set in MT753X_MFC. Add
EN7581 and AN7583 to mt753x_conduit_state_change().

Tested on an AN7581 board (Gemtek W1700K, airoha,en7581-switch), where
only lan3 and lan4 are switch user ports. With RSTP BPDUs arriving on
lan4:
- without this patch, none reached the CPU;
- setting CPU_EN and CPU_PORT by hand delivered them, and clearing them
  stopped them;
- with this patch, they are received from boot.

Only BPDUs were tested. AN7583 is untested and is included because the
driver sets it up like EN7581.

Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
Fixes: d76556db10bf ("net: dsa: mt7530: Add AN7583 support")
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---

v2 was withdrawn after 4cb3cd670b2a ("net: dsa: mt7530: untag
VLAN-aware bridge PVID") fixed what patch 1/2 addressed. Patch 2/2 was
dropped with it by mistake: the test that seemed to show it was not
needed received BPDUs on ports that do not go through the switch. On a
switch user port, BPDUs are still lost without it, as described above.

To Paolo's question on v2: the issue is seen on real hardware (AN7581).
The results above are from the OpenWrt 6.18.55 kernel with this patch
applied; the code involved is the same in net.

The board has a single CPU port, so the test does not show which of CFC
and MFC selects the destination CPU port on EN7581. The comment on the
CPU port bitmap in mt753x_cpu_port_enable() is left unchanged.

The MT753X_MIRROR_EN() issue on AN7583 found in the v2 review is
separate and not addressed here.

Changes in v3:
- Drop patch 1/2, fixed by 4cb3cd670b2a.
- Add a Fixes tag for AN7583.
- Update the comment in mt753x_conduit_state_change().
- Add test results to the commit message.
- Keep Lorenzo's Acked-by from v1: the code change is the same, only the
  comment and the commit message changed.

v2: https://lore.kernel.org/netdev/20260923055103.949540-1-gongtao0607@gmail.com/

 drivers/net/dsa/mt7530.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 96832852c65a..5dbcea38209f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3335,10 +3335,13 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 
 	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
 	 * forwarded to the numerically smallest CPU port whose conduit
-	 * interface is up.
+	 * interface is up. On EN7581, trapped BPDUs do not reach the CPU port
+	 * without this, even with the CPU port bitmap set. AN7583 is set up
+	 * the same way as EN7581.
 	 */
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
-	    priv->id != ID_EN7528)
+	    priv->id != ID_EN7528 &&
+	    priv->id != ID_EN7581 && priv->id != ID_AN7583)
 		return;
 
 	mask = BIT(cpu_dp->index);

base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
-- 
2.56.0


