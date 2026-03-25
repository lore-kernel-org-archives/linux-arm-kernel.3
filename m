Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06037109E522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBjfZXsH5TqD0Lm/UbWCLodSYSgWB46anAeaAS2zRIw=; b=ZKH9knkuDkOt+x1lWAC8pjIVc5
	WNuP9EaukT7SXsp6S0R57TRuqBPWBEow3oGu+Wau4tkHZOo5Ly05wsvWXCd3RBiWPANy9E8pVWY7t
	grvaseatl0IBw3il/Obf8ZbMpD8g2ppjBXXzD4uDjwCmvZwtKaio52WN0vJ0Yr40lULpiQZb4a09N
	TerlAgHw/APW/V9fbNBm3o+JLyPaGOfQDCKYTLeqE4dUQrRkqI/w7oisVpKvzNYQTad7F9RtDPGbI
	EOdNrRKqassUZyX2vYIgi2Ew+8RHO74vMC7HOGXVXc0KbUT/khnHc5dpXkU8caVyHPiXkgfWAT+/z
	F2dq5ETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRZ-00000004K5O-3sCV;
	Wed, 25 Mar 2026 22:11:17 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRL-00000004Jp5-3zZ2;
	Wed, 25 Mar 2026 22:11:05 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id D5113130051B;
	Wed, 25 Mar 2026 18:11:02 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476662;
	 x=1774483862; bh=OBjfZXsH5TqD0Lm/UbWCLodSYSgWB46anAeaAS2zRIw=; b=
	pC2HTa80V46+g3tmKoKdkEQKgvxlW0e70gQwJYwZuvqDSFlRHir6mq8/0GE54Aua
	dU4w0LyXzQIZH4umk/x87eCQeoCOLgMrfJHCQQfMKUyG5lXhGzhuEn6zKJ0RVNQE
	tlAOHWV5EId3DJrmV9p73zCccXHVyxgT1luK0tTUQw6Dxb4Ujbs3LecZut4cNIF2
	snTlUzYvWdvFCas69ZQdXPpqSmxqOFpruwCdBrBmZNuDztw0qdtKnXAizTLfO9e2
	/PbhX/FgTSmr5Gz+dgWqKpZdVsaGhF6e5/XhvABjq977j9FSy+vaNXTZmY0QroXP
	JECukdVs2jMvAZKejA7r2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476662; x=
	1774483862; bh=OBjfZXsH5TqD0Lm/UbWCLodSYSgWB46anAeaAS2zRIw=; b=y
	noQXOxRgnNs16ti48F98UqeAh+6ykh1sN7nQEdiNIsUiTc3/IOA+FL2GymxxYclG
	HYvYWBDjxJcopFY45RrhzsmpbKLO9vI/J5c7Ji1NWFD3k59JKfShtj1gcqwGBBMa
	MNIhQPHcVmamz39dBpDiMSrb46DKZEUDgpWmRYAz9VjPCYnNgH0P+eUyCzc9czer
	qQ1e4iTw9b6xwkGa8GHs/vqfbVDF4X1yvraK0lQgqZLNlAsvI7DH6/2S0ykHb/8B
	n8+RYeVvNRiQHPc2xhIl5aV6+LtUZsAJmvwpSQh91MkQTY9IsJAYLYZhfUnyYvP0
	8iNkynCY3hYxO9Z4oIxhA==
X-ME-Sender: <xms:dl3EaQkfZmh0iOZe8HHRQedFW66kLbnQlMcfnxL_LS43zseYcyL2OQ>
    <xme:dl3EaaogOHlkkjSgMWHD2ObDtPPa6WQur44hpGqm2sBCpwUfi2AnyuQxtAjoXRYcr
    Id495s0ez6VfkWrymvn0eIQ3LXCTVBv0ZmAJpc5tuCqbg8jH7y7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:dl3EacTpkMTnEBdwAwjpEg0O_rTGAIDqPRit8qd2IX9oksH26qvvaw>
    <xmx:dl3EaRYZIVSqAhflBU9agyfNyIw5jUK1N3n5LHWRhQB5G5Mj6kC9Jg>
    <xmx:dl3EaaB5sth8xzzflu8kiF7-vq1Ejxpri2PIjmo9krQZE8huff3vQQ>
    <xmx:dl3EaYBuheMIn2JlBXxkNcy6qQvem7snpZKk9kF9T6j80OABTdPMsA>
    <xmx:dl3EaQdqqb0eYHMWK9wnCBkD2kQj_Kvr5C6VMUG0BzzNRK_mh-maYuVD>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7C4931EA006B; Wed, 25 Mar 2026 18:11:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:54 -0600
Subject: [PATCH v3 05/13] wifi: mt76: mt7925: advertise EHT 320MHz
 capabilities for 6GHz band
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-5-5ca66c97a755@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4604; i=floss@jetm.me;
 h=from:subject:message-id; bh=rpzkhIwTqH86iKAuSJC5SKpPFXHZZ6QEbZnRxkCG2ZY=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1qA4e4iRjmgoy1iomtyxH4mPjVkYGp3Spex
 cqq+WqPvIqJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdagAKCRC17sMLqGd3
 H/CHDACTZd8Tdj36xqh6X1UU4ZE2OxwpHYLiFRzCZEnQX82/JM32u1eTnA1QRXM6IC+4IYvJs2N
 Ow+hJbTBj0KPSQoJUH0Mb2PGqzvy207C5+xgKjVILxxEshIZlnAqsiCg/MjlCA1i6gXiw5PQeob
 UpvDfpTivHZEkSY/pX6Cy0g9MUbI4Urs7gVqKVDJPA75690HVArs7noTRaIx9IngqPZiNjIj6FV
 HP1WTq72VcLVO9+JPO8iNC4OObjz3z408xEsKQ9hpfncms8WtdGROkgIXkXt3mBuIAC79Sbic3i
 TQIie8JGYxbgjFgg60kwBIV9r22nuSgVNsQQudqoFwPtHCdJN0CIO53BVwIDNusTSCntUTWkGMN
 AZVhaf/GnVG18yExv0BiVhaXDJ+IiA+YAFYKZqU1Oceg0LbUvZZCq8pEStrDwYfjkleTfi7c+ua
 npU0Gff8iYYxSuBRuuxxKd16grdOGKQGBKPbzMg9H1YI+r/0mrz1GMnMU653sp/5kGVwg=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151104_082013_87F3A0A9 
X-CRM114-Status: GOOD (  12.35  )
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

mt7925_init_eht_caps() only populates EHT MCS/NSS maps for BW <= 80
and BW = 160, but never sets BW = 320. This means iw phy shows no
320MHz MCS map entries even though the hardware supports 320MHz
operation in the 6GHz band.

Add the missing 320MHz capability bits for 6GHz:
  - PHY_CAP0: IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ
  - PHY_CAP1: beamformee SS for 320MHz
  - PHY_CAP2: sounding dimensions for 320MHz
  - PHY_CAP6: MCS15 support for 320MHz width
  - MCS/NSS: populate bw._320 maps for 6GHz band

Introduce is_320mhz_supported() to gate 320MHz on MT7927 only, since
MT7925 does not support 320MHz operation.

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
 drivers/net/wireless/mediatek/mt76/mt76_connac.h |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 813d61bffc2c..3785fbf5ac99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -177,6 +177,11 @@ static inline bool is_mt7925(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7925;
 }
 
+static inline bool is_320mhz_supported(struct mt76_dev *dev)
+{
+	return is_mt7927(dev);
+}
+
 static inline bool is_mt7920(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7920;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f128a198f81d..cfce851a94e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -183,6 +183,10 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER |
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[0] |=
+			IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+
 	eht_cap_elem->phy_cap_info[0] |=
 		u8_encode_bits(u8_get_bits(sts - 1, BIT(0)),
 			       IEEE80211_EHT_PHY_CAP0_BEAMFORMEE_SS_80MHZ_MASK);
@@ -193,10 +197,20 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		u8_encode_bits(sts - 1,
 			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MHZ_MASK);
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[1] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK);
+
 	eht_cap_elem->phy_cap_info[2] =
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_80MHZ_MASK) |
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_160MHZ_MASK);
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[2] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK);
+
 	eht_cap_elem->phy_cap_info[3] =
 		IEEE80211_EHT_PHY_CAP3_NG_16_SU_FEEDBACK |
 		IEEE80211_EHT_PHY_CAP3_NG_16_MU_FEEDBACK |
@@ -217,7 +231,8 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(1, 0)),
 			       IEEE80211_EHT_PHY_CAP5_MAX_NUM_SUPP_EHT_LTF_MASK);
 
-	val = width == NL80211_CHAN_WIDTH_160 ? 0x7 :
+	val = width == NL80211_CHAN_WIDTH_320 ? 0xf :
+	      width == NL80211_CHAN_WIDTH_160 ? 0x7 :
 	      width == NL80211_CHAN_WIDTH_80 ? 0x3 : 0x1;
 	eht_cap_elem->phy_cap_info[6] =
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(4, 2)),
@@ -239,6 +254,11 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 	eht_nss->bw._160.rx_tx_mcs9_max_nss = val;
 	eht_nss->bw._160.rx_tx_mcs11_max_nss = val;
 	eht_nss->bw._160.rx_tx_mcs13_max_nss = val;
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76)) {
+		eht_nss->bw._320.rx_tx_mcs9_max_nss = val;
+		eht_nss->bw._320.rx_tx_mcs11_max_nss = val;
+		eht_nss->bw._320.rx_tx_mcs13_max_nss = val;
+	}
 }
 
 int mt7925_init_mlo_caps(struct mt792x_phy *phy)

-- 
2.53.0


