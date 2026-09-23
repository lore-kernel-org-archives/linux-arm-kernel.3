Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63CFC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=; b=05OvwcquIyZ0G52Mqt37M/2hS7
	Qa5ARjbvA6bPpTB2yKUQU/ITSbPwFxaojXuvQF2gfNvetNa7XnAlp8cnEca9INB+oOQtSmldkWq98
	+sMd/deknJwejPGshAreVDMV0azX9HBvwK12t9lvNJf1mmD8BDG2M0dG+6A8JDqUn7KZ7SQ5Css+G
	1WvhbpthehhBAC5+ihou9NF4dtKAX6RegIIMIx36wXvZb4JlTxaCO1jz0j4MX0EDEGfRBesTITw7G
	6hSGTDLyQ2uP83kbSlIMgkzn39DxwIUZSk8em+2pPjXnpK2NHjyQ+7tNJ1TXkDf8lb+Udnyn++D3H
	253gYnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fyq-00000007E1Y-2xqb;
	Wed, 23 Sep 2026 05:57:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fyo-00000007E1P-49In
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 05:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=; b=S5x3k0Tm1R+E6PxYA+hspPYDN2
	MvSJY0BgQWA7B50wuKXtk/LR7ozvxX/IO8qKF2LJ0kcLdg0SszvouVi6XyKhyP+Yl5tMGhUbqXD4n
	q5Qe55SB1Ya8mAJzAGN5bP3KR0qlWrDijGKcmhctH2odl9zWClTunlmFWQXjgk9ZdyhaT3kFuqwQK
	QiTrtGHhEuTqm5FeXw95Li4h/jS96C+tKE3LAh0Z488bwkcVzSuRQo6orOzmnFBCCGyAVmlsJMJ/d
	3w8HQyKMqu7LSQ8MLXjCVTo3KA/XHMaseLZW1dAaSjNCiHoZpjhAz6EqxkSdcxkncaRayuPIhLe3A
	BDqg9M4w==;
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Fyf-0000000EP61-1Qyh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:57:17 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-46accbdfb21so511479fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790143027; x=1790747827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=;
        b=C+hbvk20GjaK532tI563taMCdi8qLTfXc5E4hSTwzXofpR6fcShmo9BGv+aRp6qlUY
         DjoQ/s1nM4FUhwenMSMamOVBwzA3iZbxgod/kckJWw7OvlLRJB/byziJGue3oakKst7o
         4cXa2Sfk+rFc3WvsnUOv3WKo+lSJ33KK5HYC96ZVu27EjorLStyVcTbNyBXAvQxHBC82
         0+U68js38WEGa+66e7/9kHlxIaURas3ANtcSfSCJ9k4xiv15gS8Xrow4aYn3LDuSkrMn
         ObVanVL+lp3HHy7JOJLIYiWhSUDcXUgVjjlpl2LOiXwJ7FgLRSr1aUS6WSDVzyBntZoj
         zVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143027; x=1790747827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I4xevnwT3ppSAEaRbNTpjJDMceK72lG36tesANdB7I=;
        b=cEmEgUDKB2cfUILBluFAiyIgaoAoIhEGVUgklrUIaZ5VM5RFmKTv84E5/RXEECdoTG
         CssZkHnS7niRJeLJAju8oeRPcWH3A1O0rnbSn0DymWEHFQiQc/Ok/tcC2hNPJohBQH/R
         9eT/aeNdB2CrqDHBBypVTeKCAvP9effV78vPHff2om3vsyvbEKVVFvf1vZNUsgdT+Czg
         F8wnFgxdyp0m0o0img1yOBrch0ka1sqT6mYHfUTvrXTvlz38rjeq9iAl77GovByDCrab
         S5h7mTSOiWtFEokfblCqFr0ICTplFk4p5+thT/i1NbTgMcuadWBtt8hKjbqXXmQx0XuC
         P47A==
X-Forwarded-Encrypted: i=1; AKwUvByDgGDNqFcK3p2IUu4XDtucbq7G6HA028OezIFD+J6/H/sfKJfMu0vlIhEqZXUgqWnWQGLW5NGo/SVwFAO1jjGu@lists.infradead.org
X-Gm-Message-State: AFuF++mFH8kUoNxLoN6lar4yTGQIICAqb+hzppJBi/cSQTvnwlTuO5KU
	fzkHV1x/qKiO6KGQy77woh4wpLdRpbYjZfGwHLAxNw/fefMMS4hv6yZOG2WBG7Pn
X-Gm-Gg: AYBFou1mXRBgdDKMFek+h2Qdaqv0tt/eqskqnUkQInzML4INrv6ICNq1KzNN4SEUL3e
	msHKVUQDRJ3vlu1LvN+aao1DIO8nyBoKeftjw0jZxMqmM01+FWR1GqpKHCRiYt3AFfjP0EYwwLJ
	68gMNYk/7dupkUymTveXB08+UXPY4r9tSyetz8a3RmiO6DyS1IM06IsJ7ZmSN303b5093GAl/A9
	2/IBpqSzhtsbyq2eJhQvFeVKnMUbOwz++/dAVMG9kuoEFfhtA8fCzbajGcSpie+pShlf38fc7bC
	cYL9w7bWnmQTSJ3k86EM2deC6DgZLvMVhdmp6kXJuTbM2FU1HzFW2Lj9zSiByAa24KND3T6Dz6x
	tixJwBgGGQZ4xCqK6/J+SSwWy3xlNmXRixNvXTFrbVPTquBKSeeDJzoFdpmO0GIRr7eB5X3kio0
	2r+z5EMaeVDTFaMk5SmqxqQgIvYglUU1lY5JWITHKl9ciRvFeIQjEG3i9RcOEudO+hHyZk5WUQA
	3SyAlPYUBkqxgsrRWGcDp8PyxPNYpGXRgWyVrsPlsg73r4gWUWQMxc=
X-Received: by 2002:a05:6a21:ed0a:b0:3dd:a197:cf27 with SMTP id adf61e73a8af0-3ddf828a55fmr1675049637.75.1790142667003;
        Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dffd6ddsm691486b3a.48.2026.09.22.22.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:51:06 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>
Subject: [PATCH net v2 1/2] net: dsa: mt7530: use consistent egress tag for trapped link-local frames
Date: Wed, 23 Sep 2026 05:51:02 +0000
Message-ID: <20260923055103.949540-2-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
References: <20260923055103.949540-1-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_065715_455716_608282BB 
X-CRM114-Status: GOOD (  15.68  )
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

commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
link-local frames") changed the egress VLAN tag attribute for trapped
link-local frames in BPC, RGAC1, and RGAC2 from MT7530_VLAN_EG_UNTAGGED
to MT7530_VLAN_EG_DISABLED, with the intention of passing frames
through without VLAN tag modification.

However, in MT7530 hardware, MT7530_VLAN_EG_DISABLED disables the
protocol-level egress tagging override, causing trapped frames to
fall back to the egress port's active VLAN table (VAWD2) rule. When a
bridge with VLAN filtering is active, the CPU port is configured with
stack mode, causing the switch to insert a VLAN tag into incoming
untagged BPDUs (01:80:C2:00:00:00) and other link-local frames before
delivering them to the CPU conduit.

Because BPDUs arrive at the CPU with a VLAN tag (EtherType 0x8100
at offset 12 instead of 802.3 length <= 1500), userspace STP daemons
(such as ustpd) and the kernel bridge drop or ignore them, breaking
STP convergence.

Use MT7530_VLAN_EG_CONSISTENT instead. This instructs the hardware to
keep egress tagging consistent with the ingress wire format: frames
received untagged on the wire remain untagged when forwarded to the
CPU, while VLAN-tagged frames preserve their original VLAN tag.

Fixes: 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped link-local frames")
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3e61eb3c2b1e..20bb07fac0f7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1309,39 +1309,39 @@ static void
 mt753x_trap_frames(struct mt7530_priv *priv)
 {
 	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress
-	 * them with the EG_TAG attribute set to disabled (system default)
-	 * so that any VLAN tags in the frame are not modified by the
-	 * switch egress VLAN tag processing. This preserves VLAN tags
-	 * for reception on VLAN sub-interfaces.
+	 * them with the EG_TAG attribute set to consistent so that any
+	 * VLAN tags in the frame are not modified by the switch egress
+	 * VLAN tag processing. This preserves VLAN tags for reception
+	 * on VLAN sub-interfaces.
 	 */
 	mt7530_rmw(priv, MT753X_BPC,
 		   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
 			   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
-		   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+		   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
-			   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   BPDU_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :01 and :02 MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	mt7530_rmw(priv, MT753X_RGAC1,
 		   R02_BPDU_FR | R02_EG_TAG_MASK | R02_PORT_FW_MASK |
 			   R01_BPDU_FR | R01_EG_TAG_MASK | R01_PORT_FW_MASK,
-		   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+		   R02_BPDU_FR | R02_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   R02_PORT_FW(TO_CPU_FW_CPU_ONLY) | R01_BPDU_FR |
-			   R01_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R01_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   TO_CPU_FW_CPU_ONLY);
 
 	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and
-	 * egress them with EG_TAG disabled.
+	 * egress them with EG_TAG consistent.
 	 */
 	mt7530_rmw(priv, MT753X_RGAC2,
 		   R0E_BPDU_FR | R0E_EG_TAG_MASK | R0E_PORT_FW_MASK |
 			   R03_BPDU_FR | R03_EG_TAG_MASK | R03_PORT_FW_MASK,
-		   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+		   R0E_BPDU_FR | R0E_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   R0E_PORT_FW(TO_CPU_FW_CPU_ONLY) | R03_BPDU_FR |
-			   R03_EG_TAG(MT7530_VLAN_EG_DISABLED) |
+			   R03_EG_TAG(MT7530_VLAN_EG_CONSISTENT) |
 			   TO_CPU_FW_CPU_ONLY);
 }
 
-- 
2.55.0


