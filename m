Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E6109E523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=T4GdwvIF/JXq9kUXXvLxh5rZ24
	2RvocxBjVX1xvVHH1Yox2W8GRJrsPTTilkrwDIKOgMKjZ1KmjilUI+Z3eYMDozYTVGScEF1tWVp75
	aKS4b4G1C+yT+FtlOd4FupChH0xN13arU4iiAoZwseJiT7u1OtFze9VbSYXv5AOlcz/MezEtKAPRQ
	Or5sKx+GIg7fn57bbUzcta0YwsFkPIvFu7PozpYz6GL/pz2Ur5Myf67M6bWGuOefkZub4mGX2kzXM
	JFcyd4v5zhKV3j4xHGiogSa+CsTv3gFNIsDkAud7rhlNd1DI36lrVXx49Vrb+/TuYms6XzuL0RxaR
	hFK96ObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRM-00000004Jr5-3i2P;
	Wed, 25 Mar 2026 22:11:04 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRG-00000004JmO-3WwP;
	Wed, 25 Mar 2026 22:11:01 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 14AC5130050F;
	Wed, 25 Mar 2026 18:10:56 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476655;
	 x=1774483855; bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=
	aTd9TCq08/igQ8iJwApBVUcfwkQeQwpEFUTVzXu6+VMwQo4i/4Poq912PjfD62zi
	wX2F0rrFJU4F13TTDZol1kwjtaO5QyXVsCOYOMX1BoE2FNllcItqANt76yhsJ2z9
	BdZJcmSIRgtZgWuQ3vZX0JcLcEWk/FyVt9YXnjDr5WQSf1sJIwUqmK7HxbStSunL
	4g8yhD6zeY/XwyL2KODPketu5pT7lGtF1qEuS9hGfNqopK6/IRHKmcvDyVVWlnWa
	2Yg5MUvSvMe+dii8nmVKUJxooxcVC6UeRBzJuBx21a1q4logMUfMYwvRyiWVrX6P
	dKz1Va+z6udZanEQQMtX8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476655; x=
	1774483855; bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=H
	jBTLBIhsB1eyXhm3CTn+uNl23xhZ4fvUL9bSX2U0m7scDGn1vz0ofDq471d8eylS
	bkG5cMAlff6y9dZ30Fx7UgK2fuZPpl6N8b8La8T2VmcX7jbXqrOzFbzSuWKDKESj
	q+9q6qxycGevq8VU33Ek726zTKhb5pXZkJFJy1oZ1Do2Y+SVyVwACStQUSBfTAAH
	zdyhVTKcHyOzmaGeKXRHqKrfwTL3LY1TnVgjUc62IXForIOiquSTHN4Ur5oFEW3E
	3HhDk+TRpZZROZt03PSgojgf9PnRFgG397KvUDJtseVKAAK4Z8S6SfJHIVipqCsi
	46R+3c2RbGM7h5MWkqxQg==
X-ME-Sender: <xms:b13EabVjGyLXYN-cEJTQmRlynmXgjTYxd1oSoHQn6NkWwBL0XO6BVA>
    <xme:b13EaeblqN2suYmTqE-JfgniMipAu7PE3Ylemex5TiG4O_MPSW8PludxVuRRhmX0C
    JJ3rdx5WXzijmketzTwUCIE7odrmIbEwAewwmHQN7OaF7nCsUCt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepue
    dttdfggfdufeeiueetffegveefffevjeehvdelfeevhffhteekgfegveeuiefhnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthho
    pedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtg
    gthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
    peefudelfeeifedusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoohhnghdrtdigtd
    dtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrihgvlhdrrhhoshgvnhhfvghlugdr
    jeehtdesghhmrghilhdrtghomhdprhgtphhtthhopegthhgrphhuihhsuggrrhhiohegse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepghhiohhsrghlledtsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhgrughoihdrtghhrhhishesghhmrghilhdrtghomhdprhgtphhtthhopehsrghm
    uhdrthholhhjrghmohesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:b13EaRlJ6YqRcm48ny1-XqOkigigNF16O7M2KBTuyTOBlY8OsqUjcQ>
    <xmx:b13EaaDsROS00ifDWkpUXbwWmjLkId3mgKOYIgWvSIdJjKze111vJw>
    <xmx:b13EacL4J_kldm5_qIOdv4-QDvZHE-haPAVmttGC8YAr4Bw4Anh5rQ>
    <xmx:b13Eadw9JKRNByIhnGsX0XFX5VcUqMwr8cIPIwRrGNvDChGS9cDfxQ>
    <xmx:b13EaYlvcguaKb7IuXZW74_oQTT1fot8IyztgByoVVleuQStqzSjjaHC>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BF5F51EA006B; Wed, 25 Mar 2026 18:10:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:51 -0600
Subject: [PATCH v3 02/13] wifi: mt76: mt7925: add 320MHz bandwidth to
 bss_rlm_tlv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-2-5ca66c97a755@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=floss@jetm.me;
 h=from:subject:message-id; bh=oL0xrbX2LUVp9Q4JBTD78nnciF3VWT3fiWIhBG52oaU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1pMNfqc1RFhzmqHtA813FnwbxywVoIzRw15
 pHrwWHYSoCJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdaQAKCRC17sMLqGd3
 H7tsDAC3WTGrfOmpYHmrXKGZpsa+eey4nAjWMHYrI6TpzferR+P6mvg3nc6IjQYBznzVgdEL9ex
 WRkNguociWYgNqqLyPaxB8G/o5k7t2OxwGUhsSlwj8dwRIDuBr9WzoKAZN9optLHZhBSTYmjoJ9
 qwcvGblragoIXm0FuKhg4saLvmSvDT4I04/IqWSG8APiSFhKJHZZDu651hdrS17peX2oNAPffB4
 HVxso7uBboBFmcjPDDao9VxUkpZkWVfogyLPPLCpdSwYOGbTMa/eUzfVi0rLvqTLWRbqM0q8IKW
 XixxhRZLIwyoqcAITMwJ4KuTo/vqnsQnlfFPpGJeQpqKkgXKk1FgzwRneI9xvYi50FM7lks1OyZ
 CXwvJ7Jkk7nocDZaVZr6bvadbP3MH0N0X0u+purNZhlnFIjrw0V2Uia2DU93lGqftpvhYpHYwKJ
 NCjhR/8DUEF47z52rjwOH2y8s7HDE1DPdh9GILP4Yivm/dNkAui3kAsMmSetD+Xsqsqcw=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151058_929965_52C009D8 
X-CRM114-Status: UNSURE (   9.42  )
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

bss_rlm_tlv() in mt7925_mcu_bss_rlm_tlv() has no case for
NL80211_CHAN_WIDTH_320. When associated to a 320MHz BSS, the switch
falls through to default and sends bw=0 (CMD_CBW_20MHZ) to firmware
via BSS_RLM TLV. Firmware then configures the RX radio for 20MHz
and cannot decode the AP's 320MHz frames, resulting in complete data
path failure at 320MHz.

Add the missing NL80211_CHAN_WIDTH_320 case with CMD_CBW_320MHZ and
center_chan2.

Tested on ASUS RT-BE92U: 320MHz throughput goes from 0 Mbps to
841 Mbps (iperf3 -t30 -P8), PHY 4803 Mbps EHT-MCS11.

Reported-by: 张旭涵 <Loong.0x00@gmail.com>
Closes: https://github.com/openwrt/mt76/issues/927
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cf0fdea45cf7..dd5ecb07947b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2331,6 +2331,10 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	case NL80211_CHAN_WIDTH_160:
 		req->bw = CMD_CBW_160MHZ;
 		break;
+	case NL80211_CHAN_WIDTH_320:
+		req->bw = CMD_CBW_320MHZ;
+		req->center_chan2 = ieee80211_frequency_to_channel(freq2);
+		break;
 	case NL80211_CHAN_WIDTH_5:
 		req->bw = CMD_CBW_5MHZ;
 		break;

-- 
2.53.0


