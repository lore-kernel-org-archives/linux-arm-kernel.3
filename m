Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978AF109E522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=R5zl9rskGg1XtMKu2xX9YaIPgY
	G3o7FaLMf4Gd1zuSafLTln3m+xfGW3Mu8o7yq/mxiBLaVCPzywOhda6RDaEwFeuHik7cNNa1b7VO6
	Txxld+WEgq9NLoKXlw8Hcf0fhC2iXbJURuas8EMj/KMnCA9r45GyUUiyJU87cveqSe72iOw4n6BDs
	fUMas//691cR2uJPFLKP/uIPb7Yu62m4QNvFNp/sfvKDTbxytW3ncJpTud8oB1v4RQLgdot4byEs2
	qLV5C9IvuSIaskQJZEo50hTTMjvo98vbIyM55CBC+EP+SkhfrPCwA1AaFcMlhxHbMsVMZ5Djg32QC
	09X9zthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WSH-00000004Kkx-3j21;
	Wed, 25 Mar 2026 22:12:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRu-00000004KQ7-3xDs;
	Wed, 25 Mar 2026 22:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=nSFE68HStqzGhbE//XJtgwS5gt
	uBrpCukJ8rOANTqwCYXbcsebFF/b5VlOQ+c9YcoKpxeI3xVpMtdXTks8SbsLVYUQjapO/GbATx+7k
	QU4USrb/XcNW1JPns489KwvMDfw+tL3v2/OKuxDG4wP/tRHWSqsST4gad1QqIYKb8KJE0EXMHxLZk
	AfGP2scpq8fa0NMxyFeZehil1mZi8Bi+pb/T+5qKo3ufgwx+M9onDD/B3HVJX+clp6bjZJGZ7VVPw
	sN1iwcw72eOTEZam0GeC0C+BLGf6qI+G+x7P9MX+WzrhgaJUYUYCFMxuPT+I+v60J34oHSbNx1orE
	sgM6GL6g==;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRi-0000000798w-1mwU;
	Wed, 25 Mar 2026 22:11:37 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id EC6C1130053C;
	Wed, 25 Mar 2026 18:11:18 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476678;
	 x=1774483878; bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=
	SnNfzvIEayMvvFxOqwdPoLrqnYJvY2cIiDhFrCdrj0qqj/d1A2o4F16xV3Ni5tBO
	fqdbfuhFAbOSmNaen5PEokI30zKsGzX1ql35NACfOO3ngxegHTu/iHYkucqi1Z0N
	mrYbHLwIJqUh09lqO6y1kevd0CcBXwdslOIfHKbFFPlCS6/u1Y76O5JdhZSotWYh
	IIRIGSLMDGa+JjK/3j63VHTeuNITsTkhWuYQntgOUpruMUYa55zxt/vGh+7onmCG
	d2iYS4PZfAI2D8c94E2Ym48Y8m8fh6kjS4Zl/SNGowktMXlVVyuvlRlNDzbbKyKe
	pOW+6gE+YDygXawW/t3s+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476678; x=
	1774483878; bh=M6mqwUzvrAper/bN3xuewcXmVlq92pIpxYo4QqPfYVo=; b=a
	70f6694tz62Xc8j8aDTbl4XL8fBjUhrnpwzEFEIXCkBeppYlruRhJokcoKTyUHnL
	b9BrYuDXBrMmpQbkrPMxbO7CshUyZTBPGTbb1UYEXbStgfI8SAZjy9eADwwt8yZF
	PwbBep2h2WZdP02DQjbehNsqy/zAJSR6yT6UrGhtFRMKONSgqudxBzxoQJoUZY3s
	A+NZ4GMo09Yx/jZWkrhx0SP2GJ9Yj8UF4YcEtp4Dq+xkjWwltaTdRNoaCtxW8nCr
	CHdgaSuvZ+JolLKFQtNkxWDf82OXyrv8xs5XkOEQkLi90YR1LOg547lvt4vLZy58
	rim8oDqGtl5EA/GEbNXFQ==
X-ME-Sender: <xms:hl3EafriAVxtPaAInhLnXOwA4NjaRA_VU071yMNF-eySFJGjqUCyUg>
    <xme:hl3EaUcUwcTPpeZuuTYK8MuVk_5Vl5AdCO0R8TLp9xfmdxeixEb_A9mRolDjivqId
    74r_63N_PEL6GL1OCZXFKUmkfakOvLzOmAlwKkkM5BxdtMbcDuO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:hl3EadbGh157rIcHRoMYkHRDU0VfJsC-iI8OTCAuonPPRSyn7YnZFA>
    <xmx:hl3EaRlE9DPeE0qd3-SF0lN4PBjGIX-OMoQkd1Fa-U_4zlHxw8Oa3g>
    <xmx:hl3EaUft8gB1qD3B0CWyD1Iev4iqR69bYbkBmxEvcL18HAL-xQCLRQ>
    <xmx:hl3EaX3Y2Q2_rFfHeYqguGQNnRIGzJKRgw_OqVds3m0rI16qG4JdhQ>
    <xmx:hl3Ead5PIgqJzG-4QHbPMBoBacl6zUCopEGTh6YO4cflLoEqQ6qzTX_a>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A54FC1EA006B; Wed, 25 Mar 2026 18:11:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:11:02 -0600
Subject: [PATCH v3 13/13] wifi: mt76: mt7925: enable MT7927 PCI device IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-13-5ca66c97a755@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3386; i=floss@jetm.me;
 h=from:subject:message-id; bh=nz8eyDAP8ActMVY+DXN7zhQnBrM5b9VLE4uS6ZrmhBc=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1qy4OIzFSfVctdeylxN5WN7tUEOZFYihOYc
 hArKVR8gEOJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdagAKCRC17sMLqGd3
 Hz13DACpvg2+LOJwEmxAMtdMLLvl9b8p3hqly1uXSDGdGGGFLf5pdYJvjqXrCejT7VLB14pVlux
 /j+bMutS/fM6jxaJguR24s8ZPwiyA8nXSFX79u0Vo9vXxxhKL6G1JpkEykVj/bgxN+oT2VHKIZi
 aKH6UrulsXzNSckegviWbRRAwDKDdfnc+I0WIW1WARdYe4Jut+WQ3CvQtd7TjJrb/6jRO0Mgb+t
 rl7SZPWfg5KoB2OjQ9ZNMfJSYlbx45P9c3B9F4Nmf95umaHzLs4BJkak3G1IMGUhsEINTudMGmc
 tHz8jkCDZvUDRwzUB4gJ5ZgN8Pn9eDKT23NQj9KcaoryYTDrTdjrCJHF2+f+QPi14xzJmTuUSth
 MZk603BcqP4binMIZJIV7z596TNGyYBwaNTQ/EQgV+qDwEnO3V4nvQz/XQVYnFyVNU22Y+fZDHJ
 oIfm3BGyGmyVXywit2ZZLfdU+wCC2TK2SKU4bqK90bOEZe2nMjUyEIRy+zhbi2rxs2B7A=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_221131_535376_D55667F2 
X-CRM114-Status: GOOD (  14.01  )
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

Add PCI device table entries for MT7927 hardware variants:
  - 14c3:7927 (ASUS ROG Crosshair X870E Hero, Lenovo Legion Pro 7)
  - 14c3:6639 (Foxconn/Azurewave modules)
  - 14c3:0738 (AMD RZ738 / MediaTek MT7927)

This is the final patch in the series, enabling MT7927 device
enumeration after all infrastructure (DMA, IRQ, HW init, band index,
power management) is in place.

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
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 29 +++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 693e08f35d68..00c3601f14ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -16,6 +16,12 @@ static const struct pci_device_id mt7925_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0717),
 		.driver_data = (kernel_ulong_t)MT7925_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7927),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x6639),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0738),
+		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
 	{ },
 };
 
@@ -530,7 +536,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927 ||
+			pdev->device == 0x0738);
 
 	/* MT7927: CONNINFRA power domain and WFDMA register access are
 	 * unreliable with PCIe L1 active, causing throughput to drop
@@ -546,16 +553,16 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		goto err_free_pci_vec;
 	}
 
-	/* MT7927 firmware lacks the connac2 feature trailer, so
-	 * mt792x_get_mac80211_ops() can't detect CNM support and
-	 * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
-	 * Force CNM and restore the original mt7925 ops.
-	 */
-	if ((pdev->device == 0x6639 || pdev->device == 0x7927) &&
-	    !(features & MT792x_FW_CAP_CNM)) {
-		features |= MT792x_FW_CAP_CNM;
-		memcpy(ops, &mt7925_ops, sizeof(*ops));
-	}
+		/* MT7927 firmware lacks the connac2 feature trailer, so
+		 * mt792x_get_mac80211_ops() can't detect CNM support and
+		 * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
+		 * Force CNM and restore the original mt7925 ops.
+		 */
+		if ((pdev->device == 0x6639 || pdev->device == 0x7927 ||
+		     pdev->device == 0x0738) && !(features & MT792x_FW_CAP_CNM)) {
+			features |= MT792x_FW_CAP_CNM;
+			memcpy(ops, &mt7925_ops, sizeof(*ops));
+		}
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
 	if (!mdev) {

-- 
2.53.0


