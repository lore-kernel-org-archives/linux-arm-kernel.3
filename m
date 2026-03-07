Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4479FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPSKM3QYVOcFDvng3faMKvZZN8LqVSIHWoAzKRCTAZ8=; b=E6jfYWjHPSDF6e+r9Kc6yOM0Dq
	qedTCuYtc1RcO6c+eXMsWHKldG8hlBCJcb2K2eeNAy+N7pf5UL8nDOVNSFk/cf3W1Ni1lDY3LQlVC
	45BcLUHYuRP2C7oPoELMyhA3Dal7+22C8kTvloybEa82awy5vTbZ4Lkq3N/UNjth2VA4OfFJqi60Y
	SCDEQt9zmXIwv8IeTlW7nwNoUhpEMy+JVOGO7HqVbQPKPon/4dnhxsZrwx5zi7BC7ycVFwzclNRWm
	NFQUJ8KJumNGMfvgzq79ao3ydT+U+X7t9UE+/9mhed0qWBr1SzTReeTfTPcg9XtplFcnBPVaV7X5G
	uDLF1Xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcV-00000004j4B-3E0G;
	Sat, 07 Mar 2026 00:34:15 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcR-00000004iwG-0dIx;
	Sat, 07 Mar 2026 00:34:12 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 4D0311380AB4;
	Fri,  6 Mar 2026 19:34:10 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:34:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843650;
	 x=1772850850; bh=SPSKM3QYVOcFDvng3faMKvZZN8LqVSIHWoAzKRCTAZ8=; b=
	ES8gN2g91ZN4V71Hrkfv+G3zV3C/s6x8wCCKZZ/8cXI9fA6Zc+kBVCbOy6SGemLm
	/dhpn+dCKxTGvQ8czjSDbT+7T7rsq9/HMlT8ZdLQFcBPauy6fo4fGSK7TBegTdG8
	CVuW8UdQuEZdDgRM4eHlehUB0g8MT9QfJAATBdvb+iQkHtNXmmnDEzqNR+zDYy+F
	/7NhSwsJt/+6/nn/FDsel0hdlgXwbjL549GusQbMb1blW9LkazGMGrxn/O5sL2Kv
	SBGs0FFMX9rvsE+bwJUfL9PNPM4vjUgfdX+8+qWKvojoPkZ85NJeG6c0QuxQ3PiT
	Tzw7qimd2JacbojlLkP/pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843650; x=
	1772850850; bh=SPSKM3QYVOcFDvng3faMKvZZN8LqVSIHWoAzKRCTAZ8=; b=K
	qShWAJyDTfnCdQZnIhmG8qd+x4Xs/Ruji8ir1L7PesfNax0QFqA956/qnihcklKl
	rZxtsAnVCZQ4aGvzp7Ms9Hj8WSEVJfdKY7lyKV2A1SCrBFKqZNcx7490en7/hGlP
	b1ZmWYTA2TCQ7Rh8qGTQv9BjQm7cU87JmyUY3eDVA5OykPHSzZ/s8LpRXNqhCYFO
	47liRut97miphIicoLjbYsyRlwGEOwcdMh1V0z6iDazlUxtA6mqBUB8aGDFhEL4h
	qKEIYi3YfyNPD6W0QLIeYd4WnJuO+vB4tja2/p9F6TwXODtD3Kk21D8oOyMxm4lp
	7Fiiu0jmTDEOJtsS2512A==
X-ME-Sender: <xms:gnKraVjj9qvLEXNe7wm-VycQpsHmn2h1-CwRe_PCC9Q5-ZGdYMuhPQ>
    <xme:gnKraU2wDslORc43GI8Q_GbPzjE1gKQkmBqRHtGn3wq0JzKRkB8Knpw3pVg4TmUeA
    Y6ISqlqx_nj4o9yQIAdEWcuaho07F2EdiGrX4GipBM68AvIAwPwqfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhsse
    hjvghtmhdrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholh
    hlrggsohhrrgdrtghomhdprhgtphhtthhopeefudelfeeifedusehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheplhhoohhnghdrtdigtddtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghrihgvlhdrrhhoshgvnhhfvghlugdrjeehtdesghhmrghilhdrtghomhdprhgtphht
    thhopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgh
    hiohhsrghlledtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgs
    ghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgrughoihdrtghhrhhishesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsrghmuhdrthholhhjrghmohesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:gnKrabi4B8QkJwQw1aIDnnZwYr8-r7UudDSlO9UG07bVnGzWyCpMrg>
    <xmx:gnKrac7pL0Nj3_9TuXy0NEciQdJCsubEQl6mW_vIsQNZYp27v2BYfA>
    <xmx:gnKraYqxiS1jY_DGSwGpNTIGsbpDhZMEiQOepJE8U3hdLj7jFqIG5g>
    <xmx:gnKraaVj_XxpXEx_wXyvByKBtjPmzrx1ACtL0tzPCGc0iEhjJr9tKg>
    <xmx:gnKraXM-JSsE_odE577K_0wZCwZ4w-mnvSE1cT-5mCcx534IGDRLLnhU>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1B2BF1EA006B; Fri,  6 Mar 2026 19:34:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:33 -0600
Subject: [PATCH 14/18] wifi: mt76: mt7925: disable ASPM for MT7927 to fix
 throughput collapse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-14-c77e7445511d@jetm.me>
To: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>,
 Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Javier Tia <floss@jetm.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658; i=floss@jetm.me;
 h=from:subject:message-id; bh=tCHjsPhpfMH7ZEGqWpgSyLniBJo0Zn0CURYGz/GzZP4=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JQNGtFbWdcTB+Upou/8YMJmJGJHU4QfNdko
 PteefI72lmJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyUAAKCRC17sMLqGd3
 H36oC/41zVdsrE9+qtrN8xyBaeB/dnsrzUqhOj8nfug75FVdVifSRtQeDkJreXUiZYZal5icoL6
 XYbiTtxDACEOMEL2d/omAJ7EJXdH5BSftEhNr1+igQYE2xHjQZlYzN1ManvElv5hU0HYbWvVAdD
 INvyzqKA3ba4i9+xhsp6iQLTMuqYRH6+/Y1L83OmH4DeqmIPCcJbkAK0ZvuAJ4buaDYHfqcNeFu
 Lm2NXJCZ6L+6l35a6HseZiXr6pQl/WYEzRvEzPrmgzhgDByPovnFBykxJzrzgzghxxVIE0cEdNG
 tkXpAFrx2YP1EZOkutZc4ZXHSBq6dAyvSqutta4YKu3l6kKV6wVXoZVoOY7p9KkznlUd/+mjr8B
 bzfziceaPc0vkz+R2MAqfEGVIMvw97RRloirqSVXXIF3QKnsMpSSzZ2W3jxFGAU5WFspBiRoWAc
 nha6HcdDspsdcFxmFtdwBdRgRCZ31Ax+OUAFTCbgcmGGQIHYjoOaE82LeVlgfapHOi3xI=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163411_391590_13A22779 
X-CRM114-Status: GOOD (  10.75  )
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

MT7927 (MT7927) exhibits severe throughput degradation when PCIe ASPM
L1 is active.  Upload throughput drops from 1+ Gbps to ~200 Mbps, and
intermittent download drops to ~69 Mbps have been observed.

The root cause is that MT7927's CONNINFRA power domain and WFDMA
register access are unreliable when the PCIe link transitions in and
out of L1 sleep state.  Unlike MT7925, MT7927 depends on CONNINFRA
being continuously accessible for CBTOP address remap, and its ROM
reinitializes WFDMA on every CLR_OWN which can race with L1
transitions.

Disable ASPM unconditionally for MT7927 at probe time using the
existing mt76_pci_disable_aspm() helper, which handles both the device
and parent bridge.  This disables L0s in addition to L1; L0s power
savings are negligible for a PCIe WLAN card and this avoids needing a
separate L1-only code path with CONFIG_PCIEASPM fallback handling.

After the disable, mt76_pci_aspm_supported() returns false so the
2-3 ms delay in __mt792xe_mcu_drv_pmctrl() is correctly skipped.
The pci_disable_link_state() call persists across suspend/resume.

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
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 6275e78777b0..e6830404c8fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -516,7 +516,14 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	if (mt7925_disable_aspm)
+	/* MT7927 CONNINFRA power domain and WFDMA register access are
+	 * unreliable with PCIe L1 active, causing throughput to drop
+	 * from 1+ Gbps to ~200 Mbps.  Disable ASPM unconditionally
+	 * rather than only L1, since L0s savings are negligible for
+	 * a PCIe WLAN card and mt76_pci_disable_aspm() already
+	 * handles both device and parent bridge in one call.
+	 */
+	if (mt7925_disable_aspm || is_mt7927_hw)
 		mt76_pci_disable_aspm(pdev);
 
 	ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7925_ops,

-- 
2.53.0


