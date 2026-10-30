Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AFB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LLDuiXD8;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TXgJd0ac
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zZCXHcsj20L277u6o8q/giVinaSkSlxz7Hty4A7qzkE=; b=LLDuiXD8Ugron7R+iwKxFRc00H
	uHOEvHuBj2WGmK7gYUDQf1PZSri3blvdyPi7LEEnHb1odsv0UqFcu0DmwdebR+shqdcQ+aFRdtDMm
	lb7t/jy/0AI9yRxNsgsYJZHErNPBFuBQ0F063ZzXy2Du0ralqoPD9unjDfMlBaH/VM/XMBcpMqfT3
	b1eAC3xTpYwMEFul6XQL2vAKx6bm+6fdBxBI2fMlWOAZKgPtxZanZVKjxuDnCj7z4grkX86eGVXbZ
	DHg3tIEI5pc0PJH6VgqlvwgRrV1uSge4WnOYrxe+ky1O0EfWm3cva7YSeQ5ejJiP8z/y4h5IIcbmH
	Yr+rNBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhwa-0000000B79p-1zJ2;
	Fri, 30 Oct 2026 08:26:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhwM-0000000B71Y-3mnd;
	Fri, 30 Oct 2026 08:26:24 +0000
X-UUID: 87f27058d43b11f1afed4741b24580c9-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zZCXHcsj20L277u6o8q/giVinaSkSlxz7Hty4A7qzkE=;
	b=TXgJd0acITUbVSUbpYLf8PcSmOd71MH3UY+R2/u0QV1tj1dQpISx1Knc+Uq1Ilv+yUZoWsL7A7Gqu5FO80QP7wTar8MoEj5eckqq0U8BEJU7R/KjT3U0gGEfjOZl2WPdiwTKmW1JiOqQKBqKx1UslyJlLWwcfeoDSd2eDH0tuXo=;
X-CID-CACHE: Type:Local,Time:202610300126-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b17bb1d5-f151-408d-bf2c-c1ce110b3adc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:f5805093-992d-41bc-b618-62c5d111cc67,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|16|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87f27058d43b11f1afed4741b24580c9-20261030
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1953510977; Fri, 30 Oct 2026 01:25:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:54 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:53 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown warnings
Date: Fri, 30 Oct 2026 16:25:39 +0800
Message-ID: <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012622_952369_7091AC83 
X-CRM114-Status: GOOD (  14.11  )
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

When usb4 enter sleep mode, echo 1 to authorized of sysfile,
will wakeup usb4 driver, but fail to create pcie tunnel, cause
the warning due to a race condition between switch disconnect
during resume and user authorization

When usb4 enter sleep mode, echo 0 to authorized of sysfile,
will wakeup usb4 driver, but fail to disconnect pcie due to
the PCIe tunnel had already been torn down and freed if the port
is fail to resume:

The check prevents a redundant lookup and eliminates the warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/thunderbolt/switch.c | 5 +++++
 drivers/thunderbolt/tb.c     | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e7ee9639c54c..7902172f4e99 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1849,6 +1849,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
 	if (!!sw->authorized == !!val)
 		goto unlock;
 
+	if (sw->is_unplugged) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
 	switch (val) {
 	/* Disapprove switch */
 	case 0:
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..69310622d786 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2266,6 +2266,10 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_tunnel *tunnel;
 	struct tb_port *up;
 
+	/* If the switch has already been unplugged, tunnels are already freed */
+	if (sw->is_unplugged)
+		return 0;
+
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
 	if (WARN_ON(!up))
 		return -ENODEV;
@@ -2288,6 +2292,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
 
+	if (sw->is_unplugged)
+		return -ENODEV;
+
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
 	if (!up)
 		return 0;
-- 
2.43.0


