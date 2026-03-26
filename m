Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD22D10AB82A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=lOgc6BGIS7h0xB5AXtuZkPvR0I
	sh9q3FX7XGACvdoMUNV9HIPSuxbhR7UKxCFvPnRenMrHCuZM0XB4mqdvOfbP8jnAahOLIcENydwiO
	1AMiTglDmokKTI439LEto+8bXXum8M6TSnQChRc4JqMBiuxFByUcMdfRD5U6CZFaXZ0M1Apuf9CdL
	ojybe0ex06LU3KSPJsVK8b6bM1NHBeJLvsDjlFHf5ffQDXQ5Edp0BXmnnWPKFjC7gBJhYEeZU3uqx
	OaiYpg3XJDcFR6980mv48XBpDuuJRlHWaqT/jvgmENpL7DVqPqcR7Yjpg7QTjNhTcp9n3VQr02LAh
	oSYQ2P7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s1x-00000006DtK-2SvQ;
	Thu, 26 Mar 2026 21:14:17 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0K-00000006D5W-0st6;
	Thu, 26 Mar 2026 21:12:37 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 6EA371380151;
	Thu, 26 Mar 2026 17:12:35 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559555;
	 x=1774566755; bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=
	mrsZhwOzgcPr9dphzmhExpP+pIM7+mJwll960UL/GxF7bdVAZ5QgE+fYHMy7+c/o
	6PpDBN19PAW7Rk+IKqqvjVAMGkiIPuAQSgJy/dDd0mQF/Z29u6XyGq3417Li1Ovf
	i6U7K1V6nNZSnOSaCdSzUj+H/u+YT7+PKH9qSlKKZWUbUqWev7EQMD763z9M9MnN
	evK1/Rk6ZUOCVY5jF/aVwqRoZskVh0EKRYeSIhkROHJYbkmCnNMyMq9ObFNejWUQ
	D7AYWvtQ604j/rJ8FsaHDT8U5QOfI6Y9XOOoKg5QRHagFOcfG23L4Ofl9Msnyj7O
	gCzTAfmw4vFWNcxayqcM6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559555; x=
	1774566755; bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=1
	XzLCZa+lypjYYA1FEUvVXwCTkOcD6y7SpT6voyzeEd3zhqqZsOutw1e5y51OtG7V
	lzztd/KY+UlCr5RgwWh26lXfg7Y+xY3jrFwMm5EmUNOSV4SXIByz7Y9Glci/zOih
	jYrvgqVhAmbNu4YCuFdXQh2lEDMWdsClz8bNo6k9K3d5c+V/FJzkq7wI5CSwWOTP
	2XZArrwK7hJpH9Kl+CKBkANvZOyTBgOI4wAM3MOW5cMbctnksKf60YOOB0Jdp4An
	RhNce8EIR+518MCOBpmGgswyGqX24HZGpDeSEQzZi0zV3OVlXgxy7RiyBsM+1G+F
	Kbd4AVM78gVqsstuMfvrg==
X-ME-Sender: <xms:Q6HFaVyG6ruaQSh5e5kCBjpHIrjoAz-wGMr2shhLDxFhXKOPoJSF4w>
    <xme:Q6HFaQGx8DfJvUnLgsviVjWdW21aenIBkwkJStbPVEGivaESI25gs6X6KEOArQ6z-
    Ji-OmH9sRD-Va6W91RMnRuxs_VwZEhZHAlbZKuD-B0QrLe7DY2A_xKX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Q6HFaWhbx8C_KZNlyXszmnPYRIVKdQc55GyIQllnyayAbQFHfwNFyw>
    <xmx:Q6HFaUOyGbufkV3bRiAGc-wtvbc7PBL5udwC8nwCwlFtaddcPDBf0g>
    <xmx:Q6HFaSmRlCcp_Glzt6sMAJhjufVNruIgtJHPjJKR6R2ZG9PlDTFcwQ>
    <xmx:Q6HFaberQcocxkCF8UOwVV8svlH8nER1D9H1OBHI4yZUEdry84hsvA>
    <xmx:Q6HFaeDc_iYXndIHBJHdNxvOCUZpS3pPxSd-gGF0jAjdR_kmFijaBy4i>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 406961EA006B; Thu, 26 Mar 2026 17:12:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:28 -0600
Subject: [PATCH v4 4/9] wifi: mt76: mt7925: populate EHT 320MHz MCS map in
 sta_rec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-4-8ab465addcfe@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=floss@jetm.me;
 h=from:subject:message-id; bh=b6wuUqMM9LRMdvCkKcW9uEToGwJgCsTkr6DKPTvA7cE=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE4VlACD2f9ty4mlsbzwGy0NEwbgy6c4WFYF
 8lR4kQZQCCJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 H4kfC/9KZLfgtUqSRYhbjzjUEaTO+NJNxIJ0l8g8fyZLKBpgPH+l587G1knB3e28L+Zi1C25vNu
 1tK3NTnxKFJmsOWDbM4aGzl3f5n9sdWEb//6JG4/OWgVIJYivtGeOWvV93PtTxdPaEeZsKAn055
 lLInTHEwF0Y/C3WEj8q71x54AalLIffT9IASc1Q4dRsM4L0PtR0Gibe/M0kcItULF8PZtWthOsm
 iEx0aOTdXDN1s0wWzxo0LWnjjwq8DeLreszR2ggix2hRbP4CbrSg6sLNfDDvDYVP1MMVc7nmStY
 juUMAgjHn6xX00XCuSE71ANjvdj3QTCphfcEfo+dG6b/IIEiRO74Mf6s0aK77iMaSVDxKVDTgmR
 +/Po3fFghyfJo2TSp2dQIPb4fo/gbFJPmGjGVtZrt10WmlgPtuh+j/oQC2+4nO1oSR2hB9G37EE
 ngz1QrgKkjydGeCjtyO38KlYd/anmE/xwwclZr4ZNweXVfds9yRUD3+OeqJ6guWpXX8Ig=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141236_323055_895F27BD 
X-CRM114-Status: UNSURE (   7.84  )
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


