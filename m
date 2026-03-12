Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA18FED2F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAhVxta6V2SCbFoU96jfQLb5ZeKv/YN7RIFaGVx1brQ=; b=o2F8uBfcORJoVy9zNfox5xJrGX
	VcrW9GBV0wyK1oRftj7NUF948GYjgxOANlzmPS72ONpLTHUxv3rSFERiFKkikvQZ97rqY8iKUBXh4
	wNS1TCpcMg0ZXfRSSIWIoqbq+FM9WVUh1g+u+S8hSFHxTDVXtdJrOUr6E3csfqPdYSc4djlTEvS4X
	Zfjwp1F88ogPrvTR9nLsnKF+TrUUBz2FTVNdBDeTlhTXhUy5wFfFhSgywkPZ4SI3thyTX7CMzeld+
	kGqWjjc50QZmVeDggz6uc51xfJNGo+/zR9MYzNkRe99RquhWuELuyvcUsKY3a/t7K2+rvzL7bIT5a
	/9wDpTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cOF-0000000DlMI-3nX6;
	Thu, 12 Mar 2026 09:31:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cMa-0000000DjZB-1kR1;
	Thu, 12 Mar 2026 09:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rAhVxta6V2SCbFoU96jfQLb5ZeKv/YN7RIFaGVx1brQ=; b=Va6egaWBISSmOcYtGswVSoC/nH
	KEXhpS69hitE+LkpEkprNBuE+dBblG3vSpQ413XteN2tpziqwU7wvR9xSJORc4cHlhw6xTMoqCWi7
	TRbtj1omrz1fxUh93BX02DE3s+M5JmhVm1Ct7mGA3djPl0+Wz+lxKYLWZlxP0S8743b1AZWbWHgca
	dpxu+DuUi1sLUzj9nOyt/4N6wHxSz8EoskHtx1RqOj4p011lxXlXCWkrrQVikfFJNldVyEL1KgI3X
	xHXDU/qIbjJCu1pQEaeysPdWWsLz+DTy/R2lvMtv9HSH290GXELWSN/u3WAEDxpf0GX3XCpCK/TlQ
	Weh1G1Mg==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cMW-00000000pFs-3Ams;
	Thu, 12 Mar 2026 09:29:51 +0000
X-UUID: f646be621df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f4d7e341-bd61-4127-ba7c-e946e958d0c3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:171f10e37180db0ce32dd69488f4bca1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f646be621df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 480705546; Thu, 12 Mar 2026 17:29:26 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 14/17] spi: sunplus-sp7021: Use helper function devm_clk_get_enabled()
Date: Thu, 12 Mar 2026 17:29:06 +0800
Message-Id: <27c512cbd32d6a9ee083e36bbcd971dd242144a3.1773306858.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773306858.git.xiaopei01@kylinos.cn>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_092949_550240_E3D2BBBB 
X-CRM114-Status: UNSURE (   9.29  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-sunplus-sp7021.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 789b092fe8c0..35601212fb78 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -389,11 +389,6 @@ static int sp7021_spi_target_transfer_one(struct spi_controller *ctlr, struct sp
 	return ret;
 }
 
-static void sp7021_spi_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static void sp7021_spi_reset_control_assert(void *data)
 {
 	reset_control_assert(data);
@@ -460,7 +455,7 @@ static int sp7021_spi_controller_probe(struct platform_device *pdev)
 	if (pspim->s_irq < 0)
 		return pspim->s_irq;
 
-	pspim->spi_clk = devm_clk_get(dev, NULL);
+	pspim->spi_clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(pspim->spi_clk))
 		return dev_err_probe(dev, PTR_ERR(pspim->spi_clk), "clk get fail\n");
 
@@ -468,14 +463,6 @@ static int sp7021_spi_controller_probe(struct platform_device *pdev)
 	if (IS_ERR(pspim->rstc))
 		return dev_err_probe(dev, PTR_ERR(pspim->rstc), "rst get fail\n");
 
-	ret = clk_prepare_enable(pspim->spi_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clk\n");
-
-	ret = devm_add_action_or_reset(dev, sp7021_spi_disable_unprepare, pspim->spi_clk);
-	if (ret)
-		return ret;
-
 	ret = reset_control_deassert(pspim->rstc);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to deassert reset\n");
-- 
2.25.1


