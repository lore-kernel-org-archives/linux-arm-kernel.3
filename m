Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A15F109192D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=n5LAaPhKQwZj1E/6wyg2jGDrFp
	YcYUklV2bwvU4xxDNRXIPmeChAlqXvXOh5yYXG0mUHq3j7cPp2M80GWHi19KQcHziBsM/mngiVdkb
	2TIAwEu64c01dYjBvC9ZRCFTOhiJ+E7qNjA7o5HpoCUAkaUziuu6jSXx9uHdszH5srTV9QyUDzPFs
	Y9FyhXXwYQzNJpxPt5UjfYFvz4qEQNZg2KyDTRCbYf728tndl878ShWkYKiYVIqUO6XsTmUlZnJIX
	y7umr1BRSUS4dO8HRBBUjdsqGmx4shym7Kx1l1yDl5HKtUOVuToN53RasBqisRUkQkCciAk0MRUjW
	wcGDJPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnH-0000000BdWm-2zH3;
	Thu, 19 Mar 2026 22:24:43 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ln5-0000000BdOa-1xUF;
	Thu, 19 Mar 2026 22:24:32 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 5C82713000A3;
	Thu, 19 Mar 2026 18:24:30 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959070;
	 x=1773966270; bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=
	ZiRcPbw4zc9uGBItwlud/dxc+a3FDO/evSmNiTxBUkw6orRbQdG4mV/cy618KwoF
	zMNxtX0DZkw5BjLteB/wSRfZMTywalOyL9WqTsaXuhJHK51Yoyjd09K5sGvGOUKH
	TAexzZS8Xb8z3yr5JNn8wkw3dQ6El+Rfgma5v/ACZMBcawl5Sir1DxqtFt27EBjg
	lMq8K/fC4mTGJgXK4kvI8GX4PZYefvYjzJnLXz35l/OCfYc+XLxVAN5QaJ39BqBn
	bXraf+DskJGNyXTGVCnwQ02Ya13fZVBU3EFrOUqwe/5vx87wvJjxCwjy9H0sUxRc
	O60Xy+KEDC/81ggxMSappw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959070; x=
	1773966270; bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=U
	ZJYoQjkf4PalwEQyPOKcw13Hb9Oe+7uvAoWFsvQxX3pM56LXY7ob60cZ/K0eq4jK
	hJhrQ4kz788/TxND0+1d4vT8oBr2Gc7JQ6oq+I3RSFjWZ4MrQYH0swWw/xHeyFa1
	xbXrWkkYc6S5L3rdKRavRGVEiivJ85whVQHW5fJuzMuHCfUS7t1vjwHd3N5amY4C
	PjhVh1Fkf8gNuoG/PqS2z4kdX96vBsi9rxUV607Bn3+LCPFjdHPrJiAeBXl1M6O6
	p2B71l9Hl1QYZGJo2nU91qTRMMdkVTu1/Lvz4zPUmFisMo+1a0syYfn4DM1XR0Ul
	zG91+9Oj0eK4dfP6eN+kg==
X-ME-Sender: <xms:nne8aR51vpMCtQ2fq3V6k4I45vkJo8ZvJm321ix6t_t02vCOJkvIDw>
    <xme:nne8aZulh9xp60v3Wl0ZuV5pdJa_OPOJSBj7yY3Phkl_Y4VTFhMM78Ddqdjr9HZ6Y
    TP4it0wlGwA8I6L0QU6KMFYZ6TPPnjBZXWsDK5_njZwH_4NsLtCyvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:nne8aVpMv7-BCgSI07b_mUtsG5e1VtESpXjQCO73jJ5YDJlgIu7gzQ>
    <xmx:nne8aU21PAgjCOFAabY3rgdQ1hvLrxbvLNVG-eUbgyCZ4lZVNXOzqg>
    <xmx:nne8aWvYb-2rztKJNLuW1ji6zvhfTP-U4zL3dg3ttCJt5SAJMPWADQ>
    <xmx:nne8adFOfPe4pbEK07M9Ez_A6vA7I4H1RdicXDSNOSZOuSJIBsc9rw>
    <xmx:nne8acjHNAG4VlYhy1k_PaKgaz-J9Zbx7c8LifYFyiZMVy29LyNvQZPm>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 15EE41EA006C; Thu, 19 Mar 2026 18:24:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:20 -0600
Subject: [PATCH v2 04/13] wifi: mt76: mt7925: populate EHT 320MHz MCS map
 in sta_rec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-4-d627a7fad70d@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=floss@jetm.me;
 h=from:subject:message-id; bh=b6wuUqMM9LRMdvCkKcW9uEToGwJgCsTkr6DKPTvA7cE=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeQd1hEzMIZb41WgjqFGwoxTSAuLFLrK1lUn
 InlC2iFzFSJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kAAKCRC17sMLqGd3
 H7MIDACy9HwJsPhZrZ7KiIkj8lu8z63AZj45vXV+EZ6h+OALFug80DB6KH4fNwkC+Vzb8OJENKO
 1otFUeZIaj/8RWV1ZluwDGazyp3dt+jEG2nmXGdlG+8Ub4MvEROpI89fT4LHLBAXDGpl7oaaeG9
 mTFT3Vniae6TfmDKMXpWT/6BoS7rARtEOdo20jwL/RNJTHOQIgMV699Fb2pqtUQC/R1341WiaUH
 MWtfyB9k5q5bRI//gOM0o3P36k4LFZHUXpzN97qz+jRYgYlmAnZf/p0odP+3eX8vkDUNQvujGSD
 09DE7fJbbes1YkR1y2WhkF1qkK+E/L7yT+rq5SwflCnLHkuuTBOsOhmWNGvd8VL3/PNflx85pff
 eb69izVPmmQZ6TFCdwb1OoPGJaisXfj6rtdXZlrP4Se+b/zmj5z6Pm4bWm9rQ8j4c72VXddkFfG
 3t7uyB3GE+wY8DBV8KCXP2m3YvutACkQPwVnzHnGhwaoxpicoN+GXIi4eeKkchm9p1Rts=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152431_557479_CE569604 
X-CRM114-Status: UNSURE (   8.09  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The sta_rec_eht structure has a mcs_map_bw320 field, and the channel
width mapping includes NL80211_CHAN_WIDTH_320, but the 320MHz MCS/NSS
map was never copied from the station's EHT capabilities to the MCU TLV.
This prevents negotiation of 320MHz channel width even when both the
hardware and firmware advertise support for it.

Add the missing memcpy for the 320MHz MCS map, matching the existing
pattern for BW20, BW80, and BW160.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index dd5ecb07947b..a7f27c5014d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1683,6 +1683,7 @@ mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz, sizeof(eht->mcs_map_bw20));
 	memcpy(eht->mcs_map_bw80, &mcs_map->bw._80, sizeof(eht->mcs_map_bw80));
 	memcpy(eht->mcs_map_bw160, &mcs_map->bw._160, sizeof(eht->mcs_map_bw160));
+	memcpy(eht->mcs_map_bw320, &mcs_map->bw._320, sizeof(eht->mcs_map_bw320));
 }
 
 static void

-- 
2.53.0


