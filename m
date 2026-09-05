Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76037C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ueC5lIuArC4NcqzIcMwBR70F4cNYRtDiIKMXLIakGak=; b=GDI9EgsvuR7NC7NUtYRCjrop0D
	oyZ1f9kwmO7jMKMti215gurzZU0bjTppmZW7TSmDy1WRl7keVYTl6pXrozTPsnygI26PnpF2JiS01
	7GLr/8o4TI0xUqF1TUnsTr9z/mO0BbdrRVWLlUtR4vYclr80IityA7wqHGFlf2GRG2/+eHRNS5xWV
	CUaTqUsflL8qgjfVJ6ONNuC0U5VFXaeJ2koMEbT1mKnYbStHKoK2zqny2OmqXtMYMjp8BUstlTr+8
	gG7NJwJuWLGypDhIlNBShniXYl84ltIvD+Wm5yzBTQiSSmMKLU7QBaKgwU33lyRWsqsJ7Q4E7K2G4
	axJ8JuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qYB-000000046og-0kbe;
	Sat, 05 Sep 2026 13:35:19 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qY8-000000046n9-0yyJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 13:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ue
	C5lIuArC4NcqzIcMwBR70F4cNYRtDiIKMXLIakGak=; b=mH/aEyBS9/bpfl6S0P
	eDwFxpjmwSSuv2g/jxoO5JsoaowSIVMai8x79y8DGpX3MlW48s9ZQeWTX/rBIUUs
	1n42y7Ll8M+c/CuRrYNTK4UUiK0r9NSmY8DYDB4XQXBs09lfVD4HPyX2zzIiUuzf
	ctdT7rmCU+pdoNXjZTohPkY3o=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3_41+GpxqLJ+DAw--.3882S2;
	Sat, 05 Sep 2026 21:34:55 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] clk: sunxi-ng: a523: Publish the main CCU module alias
Date: Sat,  5 Sep 2026 21:34:52 +0800
Message-ID: <20260905133452.64544-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wD3_41+GpxqLJ+DAw--.3882S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWUCFWDKw1xJFWfXFyUtrb_yoWDGrg_CF
	n2qrZ7WFy8CFWDAF1jya1rurZYv34rZrnYqF12934Yq3W8uFyfAF1v9wn5X345Xay7AFy7
	J3Z0gFW8uw1UKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxQBoMWqcGoAiPwAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063516_661375_7CDEB009 
X-CRM114-Status: UNSURE (   6.84  )
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

The A523 main CCU driver supports module builds and registers an OF=0D
match table. The table is not exported, leaving the module without an=0D
alias for its OF device.=0D
=0D
Publish the main CCU table without changing clock initialization.=0D
=0D
Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PLLs=
")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/=
ccu-sun55i-a523.c=0D
index 20dad06..d0c4c70 100644=0D
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c=0D
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c=0D
@@ -1685,6 +1685,7 @@ static const struct of_device_id sun55i_a523_ccu_ids[=
] =3D {=0D
 	{ .compatible =3D "allwinner,sun55i-a523-ccu" },=0D
 	{ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, sun55i_a523_ccu_ids);=0D
 =0D
 static struct platform_driver sun55i_a523_ccu_driver =3D {=0D
 	.probe	=3D sun55i_a523_ccu_probe,=0D


