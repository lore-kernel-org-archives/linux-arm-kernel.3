Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C64C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yOviihCd4OWzkU4ZWy+QayOXt7VAoSjwQrUlx7gxEjI=; b=4VaU69MlxQ3GVZ+c4NsB01aNBB
	mwUt7Jt+ynGTgm7zy5XvH8Gs0nHq8T3k8zqNHhLt499lsd54eERz6yCStj2gxFXBR/K2myKDO4re6
	BE5QIZ5LUO4vJq+i6SxnfeAM0FUtua9HEO1wl0V2q5bHR9Pp8egDKNhcqiBeZj/kAic/Eumqf47o4
	V/mhqgXj0LRYLK63FiP9qclUYQpCKDAd9qz5zXZlIXvdxye41Kw7vgeC365QvgNzCtW97AynpngrO
	eMjYjuhHaRGSuJ1sNbF41YllA9WTYzuq3rjfhjigiUkJuJkIlhDckHBsWb/p1JbtkzJGqiD2sKG9O
	NqtVb9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQH9-00000001ZIU-0MsW;
	Tue, 04 Feb 2025 21:16:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOsx-00000001Pgi-2N0E;
	Tue, 04 Feb 2025 19:47:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa67ac42819so897930466b.0;
        Tue, 04 Feb 2025 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738698421; x=1739303221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOviihCd4OWzkU4ZWy+QayOXt7VAoSjwQrUlx7gxEjI=;
        b=Iq3AQEXzO0gBCTtE6URYILuH880UtGfnEsx6RKuF76a1txussJRJMQZzpSdgbhUHYV
         GXD9+xH56sf7rzDcgN7pfariIUvX3I1qB/AnMBR92GnYNAsId8f2faihYWe55HCtMa1P
         01vnQzCaPCCMPQoXkuRdqWYRClT+z3QbznhtocYQRGSov3NSfrR9UDkatSTbgXV5WY1t
         1XI3p2vMGfI9fvmWNkDe+VtnIA4a6LAlqHl7sLJROW7d5JOAIV04T6s4HWlh0n0JRssS
         7lrnDVdX7s6q48spqbGa3ykvXr1IabOa8rvuAopxJRJQrlr91yCg6PpgTKYsPx8r01Wf
         2icQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698421; x=1739303221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOviihCd4OWzkU4ZWy+QayOXt7VAoSjwQrUlx7gxEjI=;
        b=nEX6/LuxJtFSemDYMMCBmch2QfJ4/rSNQJaFqVsEh0KXbm5/yWEXxkWftKqJA1XGg2
         ZLbdZ3UDA4PG0kyyDo+2cWohebMCTAgsoNRfiEcxzeN364ZIHniofE92tFmJRcVqqqfj
         EZUHmsAYySQvu7Sr0f4KsDHIBAkPWx5/EGnLPZ9n1rv9wt7hSp3oSe8DAPy+66v95yzQ
         YVfTGWv+nt2X1Ki+WGsznVyKcJWzeeHrhsmfD1kucmPuWhkavNzeJO1DCpQ4KcuTgOeN
         jr9LhFm9EsQteABm1fGnE9lPFEwVDq3csniwz4Oazeyy9qyUsr1BVSXFe4FsKaOhOHIf
         lQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZWOqpiUAPqySx6LJCjZ7Aso/r+xQnxX/kcU8ADFYT802/1KXzTxMikyp7LwC0SCbIN8rdFPjtvzp4xyej5Qk=@lists.infradead.org, AJvYcCVpvnYPn5kDFyC8nID+mhS+ze64R9AQvPtoqsuHv6trI3/vY5kPxy4qhTzpKGTxN+XUQr+Zvjw/UdTBGdT5aYqV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy84QddILL+cLd58V4uYWPwXXcD/v7fY8DLYgOVnA6Kwz92kXR9
	P1Jd/DnpGhip76iV90MWzy0ZdzoArZSv3v8FtIBK6SLNNb8wIq9SPt5b4A==
X-Gm-Gg: ASbGncuCMjurzEbyj0RPckd7k3F7SF6JRtLEYitsbN5XfNw67fMUVre4CYKZ8pV54YA
	aAIZzsBPAEVBC/ID23eQG1PYSIdxqzaONbytf0FD2V/PHUDM9TdZR/1DwNExNEHzu1k+ctlTbEZ
	ikjxtMOszoHPJ02n/5+yixezoLYMJMcMgB05IzSVP39dOMPcmUawhFMJ5cfTzNX/FkEXOrz4q7K
	7w0sHEufox/0Vc+0u4j3UGxM71978Z1VnnIgOjE83Vk+VjcFIjHztyILsVrDURrRmrVB9qw3P+O
	53gqtrE5dskecaC8I0cSguR6tqSuHHdedQmzseGWDCRbTBNEIRcLqJu1vGoaxg0EMpszlPNv3Db
	mMFU5UlAygHeSbLndjapo0wyFbqDD+L/K
X-Google-Smtp-Source: AGHT+IHeWXuSOX8ugXi7KX2sQvDZA51J6pn9rqEUJAKyCLo9RjU0qJQZ+hTlul88ONSzO+JY3LViIg==
X-Received: by 2002:a17:907:2cc5:b0:aa6:9eac:4b8e with SMTP id a640c23a62f3a-ab6cfdbf7e2mr3456200366b.41.1738698421177;
        Tue, 04 Feb 2025 11:47:01 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc8838d5a1sm7644954a12.42.2025.02.04.11.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:47:00 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v2 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Date: Tue,  4 Feb 2025 20:46:24 +0100
Message-ID: <20250204194624.46560-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114703_601294_8E1C8A89 
X-CRM114-Status: GOOD (  15.08  )
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

mtk_foe_entry_set_vlan() in mtk_ppe.c already seems to support
double vlan tagging, but mtk_flow_offload_replace() in
mtk_ppe_offload.c only allows for 1 vlan tag, optionally in
combination with pppoe and dsa tags.

This patch adds QinQ support to mtk_flow_offload_replace().

Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
of PPPoE and Q-in-Q is not allowed.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---

Since the RFC v1 did not recieve any comments, I'm sending v2 as PATCH
unchanged.

Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.

 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index f20bb390df3a..c19789883a9d 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -34,8 +34,10 @@ struct mtk_flow_data {
 	u16 vlan_in;
 
 	struct {
-		u16 id;
-		__be16 proto;
+		struct {
+			u16 id;
+			__be16 proto;
+		} vlans[2];
 		u8 num;
 	} vlan;
 	struct {
@@ -349,18 +351,19 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
-			if (data.vlan.num == 1 ||
+			if (data.vlan.num + data.pppoe.num == 2 ||
 			    act->vlan.proto != htons(ETH_P_8021Q))
 				return -EOPNOTSUPP;
 
-			data.vlan.id = act->vlan.vid;
-			data.vlan.proto = act->vlan.proto;
+			data.vlan.vlans[data.vlan.num].id = act->vlan.vid;
+			data.vlan.vlans[data.vlan.num].proto = act->vlan.proto;
 			data.vlan.num++;
 			break;
 		case FLOW_ACTION_VLAN_POP:
 			break;
 		case FLOW_ACTION_PPPOE_PUSH:
-			if (data.pppoe.num == 1)
+			if (data.pppoe.num == 1 ||
+			    data.vlan.num == 2)
 				return -EOPNOTSUPP;
 
 			data.pppoe.sid = act->pppoe.sid;
@@ -450,11 +453,11 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 	if (offload_type == MTK_PPE_PKT_TYPE_BRIDGE)
 		foe.bridge.vlan = data.vlan_in;
 
-	if (data.vlan.num == 1) {
-		if (data.vlan.proto != htons(ETH_P_8021Q))
+	for (i = 0; i < data.vlan.num; i++) {
+		if (data.vlan.vlans[i].proto != htons(ETH_P_8021Q))
 			return -EOPNOTSUPP;
 
-		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.id);
+		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.vlans[i].id);
 	}
 	if (data.pppoe.num == 1)
 		mtk_foe_entry_set_pppoe(eth, &foe, data.pppoe.sid);
-- 
2.47.1


