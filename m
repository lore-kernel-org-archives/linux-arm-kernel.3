Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=if03nAQu;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Cc4G9LaZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nFSrdi8B+V4M8lR/Laz8DolSkuuYIVlmri4bckiEtjg=; b=if03nAQu+ziVyUwjj0U3eHye+L
	01oantT4GWMQVpfA2bnaCyXZnGNoNpzq05jGyW/DzLpMaWWdSlVHTSitBZy6L+aLZq2PcGWbWa4Ei
	/pipvq2EsN0tJlYtlPItdKYZAKvcTr9AGeOP5X+t9uxMeP/DtrNEBTLBzMtspDFBLbGTk7u0wq62B
	8P16Y9EyDUaBzTg59zDhKPjjG8uA4OwAmahBnCPsQggpFOeul4x5mNrDki+azZWEJ9kz2QcGWyFIz
	/9f+auo53fTewDkxqUBWgOXwWxHFRPpD8yd7OyKAOaO/sC4F7MWXWp2QKlN7wabwXHitRNkuOt1LF
	NGyfa8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhwF-0000000B6vy-0syO;
	Fri, 30 Oct 2026 08:26:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhw5-0000000B6qh-1qk4;
	Fri, 30 Oct 2026 08:26:07 +0000
X-UUID: 871fbc6cd43b11f1acbe4559397dec65-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nFSrdi8B+V4M8lR/Laz8DolSkuuYIVlmri4bckiEtjg=;
	b=Cc4G9LaZlSxkLaREgge9ctCkV8Lm39gB77Q87m9WLSG4s67dGo2Kkz6uQzdfnFcXI0G0yydxBDiQIQm9d3F8C+0+WUdVwSpLdFVjW+r11nOvSM4LkwTMyvivsAz+eKG6HAsn60P68vTsF2GOGFHhF6rn+JaVeHuTFsgtSxBqRf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f57225d2-2b0c-40e9-8442-42583e9bcd4e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:7cfee7ed-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 871fbc6cd43b11f1acbe4559397dec65-20261030
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1318583421; Fri, 30 Oct 2026 01:25:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:53 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout value
Date: Fri, 30 Oct 2026 16:25:38 +0800
Message-ID: <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012605_482337_6CCFE0F2 
X-CRM114-Status: GOOD (  12.03  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

when plug into a usb3 device into usb4 hub's DFP to trigger usb4
driver wakeup, encounter usb3 link up timeout issue, then cause
usb3 hub disconnect:

usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
...
thunderbolt 0-1: device disconnected
usb 2-1: USB disconnect, device number 10

Completes link training at ~1.48s and transitions to TB_PORT_UP after
change the timeout to 2.5s:

In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
1000 ms. When add tPhase3 (100 ms), tPhase4 (100 ms), and retimer
transaction delays (tCmdResponse = 50 ms), the physical link is
allowed by spec to take 1200 ms to 1500 ms+ to complete initialization.

here are two retimers in the link, if more retimers add it, need more
time

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/switch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f890..e7ee9639c54c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -500,8 +500,9 @@ int tb_port_state(struct tb_port *port)
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
-	int retries = 10;
+	int retries = 25;
 	int state;
+
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
 		return -EINVAL;
-- 
2.43.0


