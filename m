Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47052D232F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZHF4vfsJFm1aupN1jmbD+qYAjb58y1kZBuDxePB9Hk=; b=a+7EZ7NOFrHU1JiKYnQGGth+Ug
	c6pFdvYQ9tt057PJpHca4De6M7xAevGr5cvaYRmeTwfA1IPP3oo9Dvyz+cZAqkh02GurVwO51K1pQ
	cc3PvkaG8vjZ4cQSsoc9cQ0hSjSxhsT2saz3z6VvgFiHfiyQA0m9yCAvGDelgMC5wc4PNM4EEQNSI
	7JIxo/wuB0v32lYrOQCOx+0Ch4mtqPPe70Rs0c4Ksijd7RPIl0hQHLyOtbXnV8tjpVr/G/SgaPHEv
	PuTt+fkoEhI8F2nfyQ00c9R9ffOkfuLby/U4Q0tOiygEneccJ6JQtS9zH3pKpMwarqHZlLtsq27Lg
	zJHrnXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve83R-00000001vSR-01Aa;
	Fri, 09 Jan 2026 08:41:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve83M-00000001vRz-3geC;
	Fri, 09 Jan 2026 08:41:07 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXddwbv2BpeKtNBA--.31677S2;
	Fri, 09 Jan 2026 16:40:59 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: mediatek: mtk-dvfsrc: Remove unneeded semicolon
Date: Fri,  9 Jan 2026 15:25:53 +0800
Message-Id: <20260109072553.2741249-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXddwbv2BpeKtNBA--.31677S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DAr4Uuw1UGFg_yoWfurgEgw
	1vkFsrWr1DAry3Kw4Fyr48ZFW09a1DXw4vgay8KrnYqrWjqw15XFy2vF13Jwn7ZrZ7Za4U
	G3sIqa4FyF10yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-xYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rkl6F8dMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjTitxhQUUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_004105_316444_F15C4FBA 
X-CRM114-Status: UNSURE (   8.66  )
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

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 548a28f50242..c452e04a2b52 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -535,7 +535,7 @@ static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
 		dvfsrc_opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
 		dvfsrc_opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
 		dvfsrc_opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
-	};
+	}
 	desc->num_opp = num_opps + 1;
 	desc->opps = dvfsrc_opps;
 
-- 
2.25.1


