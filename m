Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3454FFD4609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vByrrmuYq8JjbY0LQ9meQth0I8mJWC5qiADKGasmzwU=; b=NOStfnHxelhyW9tAonLx8AXUE9
	CbKBoQYR2ewW9+BRHiIaxSX+6QN584pvivN0E3eBW9A3xQBlBVkEPQ+hjS++Uu+76eiqi5G7IgsZb
	BM0R8R3MoxFkxWCj05ER5OeuB98SAkXyWXcm70j5NwcPst9sguTAsoi524tLhkkawk3TgcA40W2+W
	PBANYfSh7d3V99bmySP5ndW02Cftx42W4c07OcVIT0tdFKDHfzk8UJCOyw1fN4Kt38CsOM3lIE86Z
	ekDagNIt6HPUNK71TitZM590jSQo+nxTHT9aCAGLObDs16BFDqUpuyEeIzXDaU0uAa0QIxCFPSQLq
	Y2bhmqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRGT-00000005G6Z-3qKF;
	Thu, 26 Feb 2026 02:38:13 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRGQ-00000005G5O-3dVG;
	Thu, 26 Feb 2026 02:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772073478; bh=vByrrmuYq8JjbY0LQ9meQth0I8mJWC5qiADKGasmzwU=;
	h=From:To:Cc:Subject:Date;
	b=PGF5kZWOwnTt8e61AUOsqMiexe9wcf5o5QcrekXR3i4YM1H3IetPaupJ53PX+U7ZJ
	 9YNC4S/Zyjrv3toYMyXyr88THGnmqOVRdATNGecfVN0utENWNuAUnGiC9sK/1X619B
	 PelhCvbFc3hMcuWmbuFKQiFPuOzTFDP7rWRDIsQY=
Received: from PC24010019.. ([38.150.8.229])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 96B15423; Thu, 26 Feb 2026 10:37:43 +0800
X-QQ-mid: xmsmtpt1772073463t06a9u899
Message-ID: <tencent_E4FD5D6BC0131E617D848896F5F9FCED6E0A@qq.com>
X-QQ-XMAILINFO: MeukCuWaRbQlPPIO4Jinb8VNP1gkfsKHtBFkcmKFxGqfHtznrB+MrcwoKn0VZ7
	 89rQx2rLA3LMDXkigBh1LjAghFT081elnyMXkIOyo0WZ1jDb5Ktsg0JU5Iab/Nvb5JKYTMoiPYAv
	 JSgtmApBbwxAnclrQqZcTejRPIULepviitqIyXsCLxDob/h2sqS/2j8V+N4zklvwJkKdYdRGIPSl
	 h9FG0Xjlrn4m3mIOZXJF+Vl5cvJ/jnTlxd9af5kxvcxSs6w1j+D+084kqrXoKM+8cfFJrL5OrJhU
	 MTCaol6wY6lqqP2mvLNftLplHWu50cRbevMF/zgRMryxirpPcf853YBMkNL1vHtxdzGtvCKUIP0L
	 9ox4BgEZlaUPo3yXY+g+bqAQX0f251KOYk2qr44NCPvcyCDYzVMuPtq+NcsM3zIGDWkLAxnHHbv7
	 VGbQuQQEttW3VnFhYxrGRt/BMBJSsjjZ4ragTSY+9LXNxR0x615182eO+fF3k66O+PppDgrAODXj
	 3ypRkW+r9uGmS5TY+JRvVNIqRhUJVZ+m8wis0PuoiZfzKfdMvILQgfv4um/Q/Dl1OEbJarLsPOh6
	 8oVE0K4+QobAcExEpU1tus8vxewd5h7qC6e16pnAy283XsK1KYktxR+7igxGHxjWWUuAdk3ia42D
	 6Wixy1Zvbtd2+gNDAaAMkG3KL5moQ8eD7CHbYF9K/28SeNA1jo+q/o3l4RAgxXrJ2t6dHcwNi3oQ
	 4MZQoShWxSwEeQ25MksSHDMCkzGvq/oREZv/qmJrN6NqQNUsVJnyF1R4Fc9q0Wa54MxNIl9hql7a
	 LrNmnu2Axh3YTjSsdMjg5dFcxHsoCXjr039EDeExLkRXZoCHhWwcibkI8sgh8TdfyQU4KHutlu0N
	 fCXpdG1o6OAlq3vWYka2bV0sfNN5Uio1cleiOCxNtkORTCBXmYjO1WU+RB7itOWipEBx2PzvW8DZ
	 6deFnguQ6rHWt01zADmGCN4penNJxjGUxq+gr3pREELN82ijzCwzICCpxheTXGV2DX31fqPzA7qj
	 aG1Ignsja1v1TgLaTkn2Kp/cWfDEA2roDrsqcQa0MXqdWsXvNTDEhmn16rGXgC2/GPxV4p+A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhengping Zhang <aquapinn@qq.com>
To: lorenzo@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	zhengping.zhang@airoha.com,
	upstream@airoha.com,
	Zhengping Zhang <aquapinn@qq.com>,
	Simon Horman <horms@kernel.org>
Subject: [RESEND PATCH net-next] net: airoha: fix typo in function name
Date: Thu, 26 Feb 2026 10:37:08 +0800
X-OQ-MSGID: <20260226023707.2077737-2-aquapinn@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_183807_390063_A45E24BA 
X-CRM114-Status: GOOD (  12.33  )
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

Corrected the typo in the function name from
 `airhoa_is_lan_gdm_port` to `airoha_is_lan_gdm_port`. This change ensures
 consistency in the API naming convention.

Signed-off-by: Zhengping Zhang <aquapinn@qq.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 62bcbbbe2a95..3779f93b47bc 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -76,7 +76,7 @@ static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 val, reg;
 
-	reg = airhoa_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
+	reg = airoha_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
 					   : REG_FE_WAN_MAC_H;
 	val = (addr[0] << 16) | (addr[1] << 8) | addr[2];
 	airoha_fe_wr(eth, reg, val);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 20e602d61e61..59ed7569f7c3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -626,7 +626,7 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 #define airoha_qdma_clear(qdma, offset, val)			\
 	airoha_rmw((qdma)->regs, (offset), (val), 0)
 
-static inline bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
+static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
 {
 	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
 	 * GDM{2,3,4} can be used as wan port connected to an external
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 2221bafaf7c9..9e07b4653af1 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -321,7 +321,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 			/* For downlink traffic consume SRAM memory for hw
 			 * forwarding descriptors queue.
 			 */
-			if (airhoa_is_lan_gdm_port(port))
+			if (airoha_is_lan_gdm_port(port))
 				val |= AIROHA_FOE_IB2_FAST_PATH;
 			if (dsa_port >= 0)
 				val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ,
-- 
2.43.0


