Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1099FEA830
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dq/YXT43RiPob4KZpRtQZKMuP8xl87UFxfdECNIzUY=; b=evJSOKKWagUbN+c44tHZXcVKn7
	PjOWGNDIiKhoriCaATCWT5iITC4hD+3HOANoww56zOGst6nkOhlBJuCgCVm4bedgrXjJ2KCAyzn84
	wX+GKjtRJd4NSFQf114jwRjnFWr7i8rwfEUzWvCJWca3Uglfa1O9/IXIwCU5WiguJlz3vfg0V8xJE
	aJPmc4Q7UKI6+Bnyzo9y1rG4wEZo9NNsr4m8LiQ8rd5L9a9QqeeYcsolkYXL/1qVnhkIqjfEOmRTr
	UgRxm5hAlueGRH5hsTveJxnWtMctU9GWHcYsUGP5aT2rVIfvHR1OBIl2VgKUbpVgFGetfkf1Uie6v
	zhbMXTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JZU-00000002wll-45uA;
	Wed, 25 Mar 2026 08:26:36 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JZS-00000002wkl-0KMt;
	Wed, 25 Mar 2026 08:26:35 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRAMnMNpPvpuCw--.51434S3;
	Wed, 25 Mar 2026 16:25:51 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
	Max Shevchenko <wctrl@proton.me>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
Date: Wed, 25 Mar 2026 16:25:46 +0800
Message-ID: <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3zRAMnMNpPvpuCw--.51434S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw1kArWrXF1UuFyUur1kGrg_yoWkZFc_JF
	n29Fn8XF4kJas8Zw1YqFsYvr12q3y8ZrWrGFs8Jr1Dt3W5XryUG3y0v345Gr4Uu39agF45
	ZFZ8ZFW8JrnIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI4
	02YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pEnYFtUUUUU=
X-Originating-IP: [112.94.102.202]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_012634_566948_ED6BCFBC 
X-CRM114-Status: GOOD (  11.05  )
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

The current mt8173-elm-hana.dts file only contains compatible strings
for revision 3~6, makes boards with revision 0~2 to fail to match a
revision-specific DTS and may fall back to the rev7 one (which lacks
some gpio-keys).

As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
the base hana DTB file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Changed mailbox to ISCAS one.

 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
index fcf0cb76a87c3..84638a07587f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
@@ -11,5 +11,5 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,hana-rev6", "google,hana-rev5",
 		     "google,hana-rev4", "google,hana-rev3",
-		     "google,hana", "mediatek,mt8173";
+		     "google,hana-rev2", "google,hana", "mediatek,mt8173";
 };
-- 
2.52.0


