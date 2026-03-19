Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44090109192A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=pFhE8Vh3vvpLAg9q/Nw8W725IO
	snmm56LNBiJMwEAHnISfrNsJoSi4ej+20QKd3/PfspLFuCCrpBskVHkhi+TJpUjB5cOhRg+T/tI/A
	D9VBNvbR0KicJJl7crp2TzP2w7RVxFZGOY5sOjOgn5WttVghN+bI5rCcv1zlMBj5O3F41Icnc6Apw
	W+xu6kFHjXcavQ2IaPnmDVGn2BokWOHQ8elzVMTm8QxZU71T5XnE2wWhuymh/NxTTaOU0eYl7QxVA
	Rkm8dprzr0Xbob1gaTBQ6NZDCS2F9jM0QZHoSGW35oF39+1EiSYDqwR1H05KSZW0rPcJGgKa5D1Gj
	m3wc0agA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnB-0000000BdRr-2Aeb;
	Thu, 19 Mar 2026 22:24:37 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Lmz-0000000BdLU-1lBQ;
	Thu, 19 Mar 2026 22:24:27 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 553FA1300099;
	Thu, 19 Mar 2026 18:24:24 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959064;
	 x=1773966264; bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=
	T/oMt3gL6vM5XXXD5iGStXtepG7MEvbatbKheqegwW7Vg764fLCnhmbcN4FYeJe1
	Lk4a/1Rx1zMQWhz8uIjoUImsW4lKbfgwZ9bzZyIgKN4bTnmdpt73wIChGGLJ2B6U
	Ume1BeGOfaYxzmM8Y5pkrNjqi+BJ3DfENwu+ydY6BWGPIY1JsmezEzKB+5SvZwF8
	pn42YKI95c1haR64+yiI+BTUa/PJxJmjCB1ZKGN7rLE5VnQgGMUYXoGWgNPtVTep
	1gfCkuw/0YPqBMB6H8oi/X/yAeOrtZgGKV+yHlrpvBclNHkMCeOdY2jfBsOiOqmA
	wrOMJ1+A4/7PMwp+2e0A9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959064; x=
	1773966264; bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=1
	7Mzejps7pfm4JolCitPkFvEMYpOECckpx2Xxv2G5+gr9rztvjKA1QkdIzKMrAcez
	a4RStBPIJDsrIZbsDh3HU/Q2EC+qZOO1LQCOsMkLkB+AFOFc6zcwFt7mLm7C3aHs
	t55nb3ru6ALzTTo/j5fT5S1bUWiWbY6wt/OM1hZWQ2haDVu2/yj7/6HEdXUYOQHq
	THAqfvXAn6boOV8jdMKyQFkGbmAYNnFSk27BngNRD6QbCj+pbvESLpErEkfHVDv4
	J4zVXW19rtx2kFiOSsi96zJ8QrwC8sNvZQ7i/JRZhzPGcttn2apbyfeehMNlLtCM
	t6N5NFTOS3e7tZ4lTa7Fg==
X-ME-Sender: <xms:mHe8aXB2Wi0nInlKHZnaVx21FGYv6qiTwu3kXEpWojxP5NS_CUe17g>
    <xme:mHe8aYXhu8DaIypZXm43LNtC9J0pHl4EUvzydo1rvgwqlgyvByxYR0aru6oEqPVuQ
    a8EEFrynHfiBH3zdrsg_sgSTrrrv6ARdgM_JTHb3eHos70gu1t3QOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mHe8aVwNloYeBmD6iy8w1XbRZKTESA0ZCjLgAa-IhUL4p8YANYd0mQ>
    <xmx:mHe8aSev7Ew-aFBx-08S3PKjHa2zkQd_c9Om5VF2HMeKKHi7sWHLCg>
    <xmx:mHe8aT0Wz6eg-bsjNbSPSIzM1eujrhpDWQ1Q5z8qrjwKToRSb0HtFA>
    <xmx:mHe8aTtNLP1ukgfki_ooo7c0tWmkJ-7StRZHszX-LQrPG0AuKpzqTg>
    <xmx:mHe8aTTBiPAinZ6bu6JrtsNkuU_b-VNIklB-pT0HzqchHXVlVGTRvtus>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 079371EA006B; Thu, 19 Mar 2026 18:24:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:18 -0600
Subject: [PATCH v2 02/13] wifi: mt76: mt7925: add 320MHz bandwidth to
 bss_rlm_tlv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-2-d627a7fad70d@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=floss@jetm.me;
 h=from:subject:message-id; bh=oL0xrbX2LUVp9Q4JBTD78nnciF3VWT3fiWIhBG52oaU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeQM1UeD5VnQ9wjqUu6j/sz7dtyOhS1NJNEN
 lYq+/tgNP6JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kAAKCRC17sMLqGd3
 H80aC/wNHmTjAL+3tuCHYF3BJwsK1kXW2AJneZctvf+yz6XnZplPXeP7GVTKx4FRlCySIe3j19Q
 fL0rxBVomu481PG0T5dbnnc4xfQUAAU/XCWSPO0Uvq91v2AFqWd5WT62TV7mfnPIz6lWKEEeHDA
 uBY1W3X8wMx4Tsyg0daublZniuAb/BIExbmt/EvEdoAd9nc+M7DG/LUawdCsrLs6kjqcqm9hnvT
 vc4LS5j8am88h9FLdmLfrMWraELq1ljKr0FtNDrwHNyobVSal/B6/ODqNpaQ+g0bEpHplo3BuTf
 MMSVYmMawfcU5K+v0TY2mzEld2/PwQWVeW0O4kZT192QEDqvejbaU/JbXhkveyI5LkEFtc5fMGq
 g8NbBV2KvoCHR1DcMC2JPLD3lOGSI7P0SS9fLJOsD8L7RQ/P1wX4n7SKWA6Hdcd6yXJZ6IMzTvI
 9iRjrCgvWPfZCuRVUWkcFqBxn/02CmmhAO8OkNKzhFucqogxIIDCbwK/2kcCm76UgddUM=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152425_497713_0D11D040 
X-CRM114-Status: UNSURE (   8.79  )
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


