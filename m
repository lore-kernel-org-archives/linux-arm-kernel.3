Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26F4C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lPw/wWSXo2eJSdLz345sTFelGNjA90qbx0vbS56uV6o=; b=PNtaPVOC3oSNTfpObK+IEMfWj0
	uiLBOSwULfO/JZNSDJORMN9W6o3Juag9a2H0FsLF+fEAGAh42pgwxdRLzuwk+EGYEQhjm853C6voR
	H9y6g4y4SBro7eYfoXlg/Bn8ykgLFoW12632oH5Y0sisrRSRuD8y5uYqduG1884+JFmAMKk3IGe+4
	YC8BCM4bv9LiAlNacedM1l01AIqOtx/jFXj/dUTPElZRKRNF4ZA3/FpMABU8li4NTPR9ZC1TB7ye/
	BxE33Nz0tMyws7D3RmUQixj39PwYCvs83/W8bc0MunfZAhyBtKscZBy6SvVkbmM0FFg+yJdH1dSfd
	zX0w0Vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Oi-0000000Gou4-1azL;
	Sun, 20 Sep 2026 03:39:24 +0000
Received: from mail-proxy25210.mail.163.com ([103.129.252.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Of-0000000GotH-2kZq;
	Sun, 20 Sep 2026 03:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=lP
	w/wWSXo2eJSdLz345sTFelGNjA90qbx0vbS56uV6o=; b=ppwvM48wDx5RbIyy59
	LXcgGSH6eAs8/QrjIuESzDuxxdKa9cCxDShcD1udcRjiwegiwVxCaZtFMRCPyyqP
	sz2I6sOh5YHXCKdaHkqXL+RRm9rRav94xl0paSOEPim+l5e6/OclfXWaZKSnp4oP
	74dZ8NulvOJz5A3xm2DttYEUw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wB30th6VK9qTwjXBg--.53646S2;
	Sun, 20 Sep 2026 11:35:23 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: james.tai@realtek.com
Cc: eleanor.lin@realtek.com,
	afaerber@suse.com,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tychang@realtek.com,
	hppiscas@163.com
Subject: [PATCH v2] pinctrl: realtek: rtd1619b: publish the OF module alias
Date: Sun, 20 Sep 2026 11:35:20 +0800
Message-ID: <20260920033520.12924-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB30th6VK9qTwjXBg--.53646S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryrXw4UCF43ur4DurW5trb_yoW8Gw4kpF
	W3t34Ykr1rWr4UAFyUKas3uFyfC3Z7AryUK343K347ZF15uFy7Aa47KryUCrn8GrWxAa13
	Krs8tr9ruF4UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziNzV8UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Ru5gmqvVHuAVQAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_203921_949057_2808BCFB 
X-CRM114-Status: UNSURE (   8.76  )
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

PINCTRL_RTD1619B is tristate, and the driver uses the
realtek,rtd1619b-pinctrl compatible to match its devices. However, the
OF table is not exported, so a modular build does not advertise this
alias for automatic module loading.

Add the OF export without changing probe or registration ordering.

The issue was found by our static-analysis tool.

Fixes: c7910f6aca56 ("pinctrl: realtek: Add pinctrl driver for RTD1619B")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260905134418.67619-1-hppiscas@163.com/
Use the full author name and regenerate the plain-text inline diff
without embedded carriage returns.

 drivers/pinctrl/realtek/pinctrl-rtd1619b.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
index b07e50d6356d..e03e1fb09899 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
@@ -1575,6 +1575,7 @@ static const struct of_device_id rtd1619b_pinctrl_of_match[] = {
 	{ .compatible = "realtek,rtd1619b-pinctrl", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rtd1619b_pinctrl_of_match);
 
 static struct platform_driver rtd1619b_pinctrl_driver = {
 	.driver = {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)


