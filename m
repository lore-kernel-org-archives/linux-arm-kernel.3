Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF07C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u4uq7fmGlh/XA4usOS9KLTTti8JWGLl4olBoqOeznME=; b=adJwWQlUWDFGedwoXOgE/pil9G
	7L8w0Rrwa41TMQzAarfXrOiA2YCn73ciavhTfwD3fkL5ctiR7UfnOxp3WTbmq0rm5Bl34LSmFTmii
	fNSbqHWHtADJDfhdhdFw9VjyK9J7KYCtbRp1RH/5QODwT51FVJPlPe22nQQxFAGzU8K6f1CBczEEn
	XJ+Nz3ea8GKr1B8TYesILCtxlX7RVDQrARASLU8mLi8kwFS2rwL9IdtJUJXIV0zeOW4C4FpajC3Q3
	4cQcGYhcrPJ9QsemEWpg98txQst9wRkc46jd04eg5rkovknh8VD4dVIWCX1G/NDpCITwMfr973jLv
	2F9D4WYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qWH-000000046Uy-3x1I;
	Sat, 05 Sep 2026 13:33:21 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qWF-000000046Tm-3QSU;
	Sat, 05 Sep 2026 13:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u4
	uq7fmGlh/XA4usOS9KLTTti8JWGLl4olBoqOeznME=; b=fvSJ78Z21fx0Jfmfq0
	UMDmcoKpLtF7sumJQ2HaxhS4mFm2LVH7D+9a3pkapPASKGWYM2dsbWIEcsi+80I6
	daVABUGBZzsznT6wuuIMMmZpmMF4NDpLg6HXKza/woLQheZMgrlhMwAzVRPuQHtd
	Q7fiGiOIBLx62bFAmiMuXK7VE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3P5sEGpxqJrZuAw--.15361S2;
	Sat, 05 Sep 2026 21:32:53 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt6735-imgsys: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:32:50 +0800
Message-ID: <20260905133250.63975-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wD3P5sEGpxqJrZuAw--.15361S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr47Zw4kAry8ur1xWw4fuFg_yoWkJFX_C3
	WDXryxZw1UtrZY9FWfK3WfZayxKw45ZFykXa45trW3Xry7CF1DXwsFv3yvvr1UWa40vF4D
	JF93uF48CFnrAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRvtCDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgVJEmqcGgUObQAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063320_308244_C588817C 
X-CRM114-Status: UNSURE (   8.00  )
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

The MT6735 imgsys driver is a separately selectable tristate driver.=0D
Its OF table is registered with the platform bus, but is not published=0D
for module autoloading. Loading the main MT6735 clock driver does not=0D
load the separate imgsys module.=0D
=0D
Publish the existing OF match table.=0D
=0D
Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock an=
d reset controllers")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/mediatek/clk-mt6735-imgsys.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediate=
k/clk-mt6735-imgsys.c=0D
index c564f8f..813241d 100644=0D
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c=0D
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c=0D
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[]=
 =3D {=0D
 	{ .compatible =3D "mediatek,mt6735-imgsys", .data =3D &imgsys_clks },=0D
 	{ /* sentinel */ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);=0D
 =0D
 static struct platform_driver clk_mt6735_imgsys =3D {=0D
 	.probe =3D mtk_clk_simple_probe,=0D


