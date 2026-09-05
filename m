Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95590C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dJjbs7F/aSeREhZ4M4hX91XsW5vUHNRiOu4hPmmpt0Q=; b=pxa4V5gw3lEN9szIaU4fnot4e4
	vRgLkkQgtXKZAm75HUOphtL+K0jqiijSFEHmLNsXWMXsiLyWHzlSfeFmuMvNUBGxmXldtbYNMP7Kf
	Fk7tYwPzh6cBnjHuPtg8oxOuuXgTarp2Lldyx2nsrAfoKSih0syHMJBvesZ+ZfWA/M2GAY62MWWAY
	7otOtbhQT99hkzXkNrWaEwxTfIS5sKmQxN2x42jImjcz83YccttFQahgm96sEvky+TSv02Fu1qJQd
	jZ+0ArH4oj8muaW9mdfek9O/1ec5Pt11u/dp6297zY4FUytzTCxPqCGwcSWzPF1S17M45EC9gzbwd
	llSl5Baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qYi-000000046un-1r0m;
	Sat, 05 Sep 2026 13:35:52 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qYf-000000046tm-1u0f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 13:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dJ
	jbs7F/aSeREhZ4M4hX91XsW5vUHNRiOu4hPmmpt0Q=; b=HwncwR6yTjqlh4t2lr
	7kFWgKNfa7ZqR0434Jsqro3uBPiYmx0W+uu3Jc4pMYl/s49GrviT8VdefhIKy+ij
	VCK3FloFhoyDpPrYaOzIskGGXZRh+TnsOtcYaiSIydZ9APl02+T3Z3zjzPILerct
	l9GZybUFcIujlW56DlXFzxtG8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBn7IehGpxqqn1WAw--.53861S2;
	Sat, 05 Sep 2026 21:35:30 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: a523: Publish the MCU CCU module alias
Date: Sat,  5 Sep 2026 21:35:27 +0800
Message-ID: <20260905133527.64811-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wBn7IehGpxqqn1WAw--.53861S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrWF1xKry5WF13Jw18Xwb_yoWDuFc_u3
	WxZrWDGa48CFWDAF15Aws5ur9Yv34rXrnYgryj9ryaqa4UZFyfAr4vqr1DJ34rZayxAFyD
	GF1kGFW8u3y5tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxQJwOWqcGqIkOgAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063549_950068_08ED6835 
X-CRM114-Status: UNSURE (   7.75  )
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

The A523 MCU CCU is built as a separate module. Its platform driver=0D
uses sun55i_a523_mcu_ccu_ids, but the table is not exported for module=0D
autoloading.=0D
=0D
Publish the existing OF table. The main and PRCM CCU modules do not=0D
provide alias metadata for this module.=0D
=0D
Fixes: 598e4b6713b5 ("clk: sunxi-ng: add support for the A523/T527 MCU CCU"=
)=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c b/drivers/clk/sunxi=
-ng/ccu-sun55i-a523-mcu.c=0D
index 197844f..f5f0f87 100644=0D
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c=0D
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c=0D
@@ -453,6 +453,7 @@ static const struct of_device_id sun55i_a523_mcu_ccu_id=
s[] =3D {=0D
 	{ .compatible =3D "allwinner,sun55i-a523-mcu-ccu" },=0D
 	{ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, sun55i_a523_mcu_ccu_ids);=0D
 =0D
 static struct platform_driver sun55i_a523_mcu_ccu_driver =3D {=0D
 	.probe	=3D sun55i_a523_mcu_ccu_probe,=0D


