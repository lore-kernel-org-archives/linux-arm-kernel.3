Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E460BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jt985UGEH3eAqyqn2cjT9XD0Npxe6xA39gdpmvwC73Q=; b=q1IUuijByTtxpNC1CREMdzlsWw
	IMEARfUpcMPALpBHSzVjyHDQgnaV/5DZlz61+kt7QOKdMjS7qdSn9f89Hg5igeQ8njePpSvgQ3xe+
	kknxRPwSdFNEXVExKUVqoUMNv3QhjLZyEG3d92hu8/OM2K/4Hrxu8JUit2x+9MUqCyRLA3CCBPsS8
	xiHrMdpgr1vHlOOLXl2xwJY/BsCljSRQAxM+bg4kpDpm6kEm2/PHc/ivxy+GH8/BJiSgePNVhPr7Q
	odwiXhD33FUl/GrrE1JicK3PyPy+ZGVMDdiP/4TYErVVPlDBCiTft3D/XxJmFs785r1l0OPkeu4N7
	fUN5hOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTHy-0000000HWOj-1wGU;
	Fri, 06 Jun 2025 09:23:02 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTDi-0000000HVbB-4BOH;
	Fri, 06 Jun 2025 09:18:41 +0000
X-UUID: 354b21b842b711f0b29709d653e92f7d-20250606
X-CTIC-Tags: HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0efc04ef-84fe-408f-9e18-ff4cbbc641cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:0efc04ef-84fe-408f-9e18-ff4cbbc641cc,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:53816a4433045665c159fbe3fa3a4e04,BulkI
	D:250606171829N6GA982N,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 354b21b842b711f0b29709d653e92f7d-20250606
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 599363329; Fri, 06 Jun 2025 17:18:28 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 0/2]  Cleanup in rockchip_sai.c
Date: Fri,  6 Jun 2025 17:18:20 +0800
Message-Id: <cover.1749201126.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_021839_328519_D5058775 
X-CRM114-Status: UNSURE (   4.65  )
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

1.Simplify the condition logic in
2.Use helper function devm_clk_get_enabled()
---
changlog in v2:
1.fix capture flag in rockchip_sai_xfer_stop
2.remove err_disable_hclk
---

Pei Xiao (2):
  ASOC: rockchip: fix capture stream handling in rockchip_sai_xfer_stop
  ASOC: rockchip: Use helper function devm_clk_get_enabled()

 sound/soc/rockchip/rockchip_sai.c | 51 ++++++++-----------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

-- 
2.25.1


