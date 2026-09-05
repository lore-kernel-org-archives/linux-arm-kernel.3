Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBC4C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UDZuSqKd7ep1EuIdjJIZGgvEiPYZKoMthJDfuUMeNQc=; b=R8gM+inVTcfJ3neNk8Tseiyd8k
	ApKjAGX/TWut1Mp55a4LlCZbyrK/pgO7zUdIU2FB00H7IjWkhn2R0ql3S6sqjdYyVMeWsqgGtBiI3
	Yyi0KJOT7XmV8mQnF2r6y5B6Bm6ezbZdWbrIFcCQ6uQxST1LNaqN//Hn6pOamarA282fR1bOyYmTi
	x3ouJQp8yUoWZ9LmLJL3AcwopYAvfb+G8UcHVfzc+TGk5JOp4MeczAKBLzw/GWP+nPczdTXCpMQVg
	eRdZsatLPO34hwOSG/A3jWtt4YaRVN55Wzyv2oZSn/M7Q9qabFHIKfMvy7csCTbZUi6xL+xwbc5rs
	LNweJF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qh7-000000047UG-3DKX;
	Sat, 05 Sep 2026 13:44:33 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qh5-000000047Tk-1XEa;
	Sat, 05 Sep 2026 13:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UD
	ZuSqKd7ep1EuIdjJIZGgvEiPYZKoMthJDfuUMeNQc=; b=mIGOQmQTHMSIzTYHZI
	0QGqNlzCcNxz7bNSzZeonfUCIjLK/jUeCOmI9gnmnDa77Rk0jhqgal8wP7+xkMCb
	Gy7R36TDQ3bzxxi3HeN63O3qJK36qEIUzHR3vK1QZ7Qk+TeLD9huAbHjDV6eKyC2
	2HHFdEfbsBVJhJ7GRy0dSHJ4s=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3p8i0HJxqGy6VAw--.61702S2;
	Sat, 05 Sep 2026 21:44:21 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: James Tai <james.tai@realtek.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tzuyi Chang <tychang@realtek.com>
Subject: [PATCH] pinctrl: realtek: rtd1619b: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:44:18 +0800
Message-ID: <20260905134418.67619-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wD3p8i0HJxqGy6VAw--.61702S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWUAw15AFWkJr4UKFWktFb_yoWDArX_uF
	yUtrZrXrW8GF17Zr4v9w43ZFyIya1jqr1vqFyvqF13CryxZw1jvr1kWrWxGa48GFW2kryU
	GryUXF1Syr15ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRBT5tUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7RX1vmqcHLV1ywAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_064431_801525_07AE22ED 
X-CRM114-Status: UNSURE (   5.62  )
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

The RTD1619B pinctrl driver is a separate tristate object using=0D
rtd1619b_pinctrl_of_match. The generic Realtek pinctrl support does not=0D
publish an alias for this SoC module.=0D
=0D
Export the existing OF table while retaining the initialization order.=0D
=0D
Fixes: c7910f6aca56 ("pinctrl: realtek: Add pinctrl driver for RTD1619B")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/pinctrl/realtek/pinctrl-rtd1619b.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c b/drivers/pinctrl/r=
ealtek/pinctrl-rtd1619b.c=0D
index b07e50d..e03e1fb 100644=0D
--- a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c=0D
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c=0D
@@ -1575,6 +1575,7 @@ static const struct of_device_id rtd1619b_pinctrl_of_=
match[] =3D {=0D
 	{ .compatible =3D "realtek,rtd1619b-pinctrl", },=0D
 	{},=0D
 };=0D
+MODULE_DEVICE_TABLE(of, rtd1619b_pinctrl_of_match);=0D
 =0D
 static struct platform_driver rtd1619b_pinctrl_driver =3D {=0D
 	.driver =3D {=0D


