Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABB8CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=scGC82lmtFfVt/+rH55JPxyeN4hMWcRWm/ClysXmIqg=; b=dWagpXmg8joDopuyBBi1sW3nEw
	fFEcgfEVNv1KQMbaiKT/n8UA258NA8djycvGk3fKBE/PClzbT4ymhqvl1JzYBP/Soh1vDg9kVKQEF
	chPXcSTBaJupzH91ptbkbn+UQJm43x3iu1u7SU5xZnMVwMxSGk6MBR7mCOxDOuHt44P5KOM0xn1gM
	xXqkKH11YS3hCjyYm6KApAu8QW0nLiE40DLVqAWKNudjC6y4QjgaP/+F/E+JfUWlevFhLlXZepp/F
	MkU9PRHfdKmDi+qYX5CR1NPbyHEoDC+jvUQRXPQyquv99ZzRzUGq5/JJsJLHjchYBPmm73MME8hou
	RFd87jqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3ZR-00000009Z7E-2CTa;
	Thu, 04 Sep 2025 06:35:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Wh-00000009YIW-0EOZ;
	Thu, 04 Sep 2025 06:32:56 +0000
X-UUID: fa93a390895811f09eb0dd999d3936bf-20250903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=scGC82lmtFfVt/+rH55JPxyeN4hMWcRWm/ClysXmIqg=;
	b=vC9OUcFIELgZmfP35+gD+sc0hXPuAf0l1q5sd/cW7qA2GJ3uArlO7bNHdI85TGcuAFIzFKPxg3eGKVF+mDUJ7ql5Dl1H4MeH6naWNIHxujQ/LkIPZylUpfqygmqYnJOuGkHkCA8XVaIqfupAI/gQCHdq8LGZtAQk5Awna6cMfXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:603eb469-2a14-42c7-8594-262142007096,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:0134306c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa93a390895811f09eb0dd999d3936bf-20250903
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1652226577; Wed, 03 Sep 2025 23:32:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 4 Sep 2025 14:32:45 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 4 Sep 2025 14:32:42 +0800
From: <xion.wang@mediatek.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Akinobu
 Mita <akinobu.mita@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] char: Use list_del_init() in misc_deregister()
Date: Thu, 4 Sep 2025 14:37:03 +0800
Message-ID: <20250904063714.28925-1-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_233255_105914_12559449 
X-CRM114-Status: GOOD (  13.98  )
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

From: Xion Wang <xion.wang@mediatek.com>

Hi all,

This patch updates the misc_deregister() function to use list_del_init()
instead of list_del() when removing the device from the list.
While list_del() poisons the list pointers to catch invalid usage,
it does not reset the list head. 
If misc_deregister() is called more than once on the same device, 
list_empty() will not return true and list_del() may be called again,
leading to undefined behavior.

By switching to list_del_init(), we ensure the list head is reinitialized,
making the code more robust against double deregistration and
allowing safe usage of list_empty() after deregistration.

Fixes: b329becfc78b1 ("char: add WARN_ON() in misc_deregister()")

Let me know if you have any questions or suggestions.

Thanks,
Xion Wang

Xion Wang (1):
  char: Use list_del_init() in misc_deregister() to reinitialize list
    pointer

 drivers/char/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.45.2


