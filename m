Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0986A109E52A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=kpUgwo94g7jPMp4o/fRDSBkjeV
	QMqelmkYHOmn3bixq+Es9KxQDIcOUsPG41yaTfh+NbGUvGzCaPJrdIZ1Ewd3gUa1tF5OrOciOaHPS
	SugwbUlVhSF29wejzsxwhx9l9knqzKjzvbWlUztU9ENAubFQzDIUlYQL8Fbf5/eNk6jl4aBI1Qf8Q
	9yKUlyh7Srbo3JDTldgxzC7X3lfnIDf/wgL1lk56WbLoxhV4Cefi3f2NYYq2xVpimKLC9RaIRs1Xf
	XTAS7su+vnMKbGv2kjuzbTfjsWE3yq+nB+QSq0MRZqXirCmpEYy5LLo+da6aCDYN9xXN1dpSqP0xg
	d/9CCQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRO-00000004Jtb-2Ocn;
	Wed, 25 Mar 2026 22:11:06 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRK-00000004JoK-17sR;
	Wed, 25 Mar 2026 22:11:03 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 2E1EA1300513;
	Wed, 25 Mar 2026 18:11:01 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476661;
	 x=1774483861; bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=
	nllXHRZF0AnyRl7gtIweLoKF+5ybTU6fQSfQUhaebATNQHFrK3cOEpcdo5V4dH88
	BiFNUNyF9G0eeMIxa0BX6RDB09JvX4DvfxkpC7B4f/CS4FjnDyxUCUO3K2cSMzgl
	QAuIDIVlwfpZrlo5XoNVxuuT4FQXqv8n9G4valNPBH1F7DZFkxPxjbd1CZqXj4iJ
	F6CM67+mU8EA8LdgCZbU/XxOSSmHzOt0wpHRAChdjtbvSmLguKoeIP1eA7SlNZOc
	ffFJEqaTHD0yWQmAEEf+OvPCM4YMFiJss4A93XLuE9SXwykS9hfWZUHVt1Nn8Efn
	sjon6620xFyQD0tZ/11cNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476661; x=
	1774483861; bh=3c3om6+sjsXCFA8fMVuyG6m2PTBcXdiHeFZPaFuV0Us=; b=s
	LY7tC4lJEksSlWfu4QqOV1+W/ChPPv5quGPB+koA6LzUa4yFi+H6b3mVmCaaPRUc
	+e4galswWiqnCsBIAxP+mgDL016MybvIKiUV7IJXl2Im7+3nk7emREFKE8uTeXW6
	7DtOzRRAsoXS5Hb2oMk470R0SbOti+xoNLY/MTVAfBBVNA5jQNE/5d8R58tk1SXh
	+O9FJloPvLOt9XZzMScGomAEoXnnNbAz3w+vJEjHnNNcAeo6zl7fw895ft/2iT6H
	hVBh2cIxo6sJ8449qnCs0Fj8DQFKVsSa0MjrH4X1ZYE29QnfKhEqzIInEg4WuOAB
	hPaGZaqhn4cVPYoMnziwA==
X-ME-Sender: <xms:dF3Eae0jreHKkDbUZAR1NMh7ta5Alx8a0W2tjRJMQbdpA0vJhrf3JQ>
    <xme:dF3Eab4NCiUt0FT-BEjeixJPVLm4GV1nbpV-pJQ8DQaPy9dDlKMeofuTTSKLtpZh-
    YpySY79WjOed_afW5h49xlIfeh9ufNRmfTLyiU22_cl-mSUuxcZ>
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
X-ME-Proxy: <xmx:dF3EaZGOMtxUt5fjM1DMKI-d3PivCT9IVMKWiKBXG0oxvK8patMd7Q>
    <xmx:dF3EabhQgW9xF3r7B0WQxJ0FO1cDkuShFYKFRTk0qsEdVB-kRXgFPw>
    <xmx:dF3Eafom7JkANQG0NsNjm5MZUBXSF98OIRoFtqFHhdCsgFvcOGu0tw>
    <xmx:dF3EabQ70oTeag4nyg44IfUQqmtVoNPdoMv5B5m0UkecLWqI7jBCJA>
    <xmx:dV3EaUF1sKCKuQgVb5cfPP_-X7-ECIFLZO0HDc-vskllgWVnpylurHyT>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D33101EA006B; Wed, 25 Mar 2026 18:11:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:53 -0600
Subject: [PATCH v3 04/13] wifi: mt76: mt7925: populate EHT 320MHz MCS map
 in sta_rec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-4-5ca66c97a755@jetm.me>
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
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1pAI7AXpfmMiGndQcqS7Vuo+jQ2KPjQmyd0
 GNo5A/gEVaJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdaQAKCRC17sMLqGd3
 HzD9DACDDpYw1OL9JL4L/QaxXf9k3up+HAQxAo4ZC8wYyLVj4g/J6Yh3Uh1ivH8gCM4rzWdzU7b
 zcfhy7c86MA1fQAo2eJ8p3FZZIO/rrW1vKGk9orziHEgV0bIaVZ+EhG+zTtRDuxb72ZZeC06vbR
 42YTiBaBYZWAQJeWz++9obNVkyHwUui5NqVRFls6YRgtLkygsvSzdQXtOAuXLc7B0RLPz1D/eGN
 2SlbO551jijmM+Gar2JpqTgQPOre1iZBb/GMnmFN8hYST41Z1PuhgJOyw4SCzuGX9W+RrvE1JAH
 vBG1YnoS6mh4Kw7B1rVBQjIdntMm00qPPDmPcJ6QmKaOpvS8sSfOTGKtiRLW166bpdQCVlUyUew
 CVqZlj6LQtSqIejxmLPzriVq4KuK1cZqxzr83ekdjoWG56XrKBWZCcRs0W0sN3+0gQ4YcZunI/M
 Qa6ksyIUekKhRshGfmOCaZz0Z1K7ro9t42P9T1AZSep32Kts+L3oGmDYGHc82cGROzpAI=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151102_346896_19DB8A19 
X-CRM114-Status: UNSURE (   8.83  )
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


