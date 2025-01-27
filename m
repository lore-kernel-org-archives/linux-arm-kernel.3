Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F13EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=; b=HpBhUxVKJCtUTAilQUKp/JZQY0
	Zze6TNyqyLOJAT4uO5J1ZJVL9pYbde5nL+S9u/7ArEDQwNsDQunUF9L1igktL61gW8RKC4FiiqZHI
	akkSEU+7C6gma+pQrioDvc/cMN48YVdQ9BeXNaOfsLDdX78masBscGOuRADF7eS1MsegZUPHY0nO4
	Czq6bH4W/f3dE8Acd+njZcJ8vogVqtVcV07EdOXONfq94gImj5oGry/nRZnMeN4NAE107rsAnBO+A
	+/zkyL2/12ztcRn8LKnhbWo8Ib6ZCKZJ+JUIpJk/g/gOqUAGqOToGPOSop4xdmbidQmGfm69MFKDt
	sxzmhMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOdi-00000002Jyf-2gfJ;
	Mon, 27 Jan 2025 12:54:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVn-00000002IHE-42WJ;
	Mon, 27 Jan 2025 12:46:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2412112f8f.0;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982002; x=1738586802; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=;
        b=KirrtwCiyWowrMSEvisNZ6nN3O211R1NK/aDMjFqfxmrRmPkYY/K9VthUykeFesNwf
         Bkfe/I2mPiV522SY284d3cyQ959oyns/Yw6tSotGNMmneXVFmDCrKsnHi876WQHk+pwk
         x8qR+3nTWXXAh3QnsJZaus+Hm1aoui+mTC0dFbBU8F6MLPa+9k/BvUJHMT3gub560Qg7
         mgCJ8PS2JUKFaMLbC7QZUZ204js4BaGJAmPmpnpQWpFkYEmrH3NDbWLftKIUnTDN5Lla
         X0/2EWvF6kC8PnFTd2cTXNxXMg09JCGqz8ofhvRCPhuttefgtYl2djBG3OZrQC0fCzCQ
         IpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982002; x=1738586802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=;
        b=lWEhruG9/O7EPemYVxnLCaESgeaD3EarZFrPsAeDG7ltfFGrzw9tjgjTiSoBB/D2tv
         0OgsaucA3irTrvFxYQhzdT+AXQrGiR+8r3aRCXJ7lzIU8TKRApKKcPqRCkmxJuOb/DkB
         0vUtXshzGIiOsEwUTvSjol5mwNXnbJBV+V7OmKUizEzAzHg7/MJzpxW2R1+sEFP5HiWx
         /uBK9N3ixQ3OufD+qeRPAK7BqWMtu2S1L+yPULRvrwfJUbftQrufYlWY9QEUE/iuXoSP
         bd6eri8g/ntSveUuC41CXmDBl4iXUSzsu6UDwktV1NfgEBr2GtjTc9cStEUwdiH1CXJ7
         6wtg==
X-Forwarded-Encrypted: i=1; AJvYcCVWAGVoo2BgrJI0wUpKxIfI5Bgb25D/GNhsZIad9ZACPmenSihZ0iol7RVI45xZly1DSCZXiK0jy0+ODmesJt/V@lists.infradead.org, AJvYcCWNgJd6q0uWqnGDBkPOmEhJPDO6y6brwNz0x7yPgkDJMtx8Xp10AYAYp2QP9wmLbMtqVC9PFe+Jg8L2+Q9wQ4E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF5mMNUgXs8QcqZmUwIz2WoYIBMQvr7X6YotbnUl8P6aas1nI3
	Y//pphvyoKbq77JBzLCff5MbNgppErVYwglD+peEyGC13XWp8Zyi9oFbCQ==
X-Gm-Gg: ASbGncvgTndC/Ds+dvGSmPwv8EwV0qYnegh6PRHpoQtAas41w9fh99xC8vtIjb4WHXc
	h07xVFCPTRqURHJI5Uo+6bcPKDMTWu3t37Y/lyR91hoFq6t/exlgeptYRKcrKkY/aHmpJTishSH
	fak+R0H0QunV1rJ6U/V/B1QTaGNkd10UMbq0T+/VfpLkZ2npVosa26MTTMwQE8dIE5BQ6rml8P6
	rI8WE9xFfQ7+9F/bysHqFWR9lzaoN0TJYqojlsowHSQPOZ1+aPS805OObbsJgayTXLuIhs4LZz7
	jsZ8
X-Google-Smtp-Source: AGHT+IHrX173KgA+rgqZHkHs3tuUNpSaSEXjwu22A+m8kddcmuDUjvM5y8f1hco6MglQt+NpNTfPtw==
X-Received: by 2002:a5d:6d86:0:b0:385:e38f:8cc with SMTP id ffacd0b85a97d-38bf59e1e56mr47569296f8f.38.1737982002399;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6f8sm10808250f8f.28.2025.01.27.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:00 +0100
Subject: [PATCH RFC 05/14] ahci: imx: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-5-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1NlgzpHbgQbix3Tjr1cyaZKDfkb/onDz8/2tsI8b2ZE=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArlLlDES8G6JKV9p0Op22wBYtl2rLb+V7Ti
 W+1qGzGlf6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tcRbEACFMbe4lquiTg8wH1+fz/lciO+CSZR8KZFmtd+230WvkforLr5uPcLRedFysFe+Cff1WYs
 np7nr5MxphXZtLMUZSOxyo55mDN/cHAkMS4qWD7moxUnteX2uM2MfdYeAMzLBN9LlTQGscTFfft
 w/1ceUvnn/Np65CvWQbfGNy/BGY4B1IBS9x7cFnExYD49LbBPhU7m5aOi5TG/FabGKZzKAt1Eu/
 09kLqOs/xGogNLtYuEBy81+YCsRy+STuk6e1RP15jI96c3EyEgcXVvT1HBJqtmR5LDFmrzuh54u
 +H49Rc6/zpPai2e5km04GAJbJq1wNG8/ICar4FSN52KQoixJsv3ce9jJD/T4YQHRqt9IwmBv3PM
 FxUU0nSqVpOW2F3v1nehYSCCkTNX8NHdtISGNhtwHPTarAgtssNkuJSetHNJ5Wg1plR1nwUfzFf
 AXYCLS22gsqcHsClW6YseBZUsEX32zXkgL+EceWNozcTjKu9z0KzpRCAnjUPeS3WQE/R+M1abeO
 LJMKdS8C18mKQQ5LCp27eeA09XzI8Uqjvq3tvHyXGazGku36zGm8mGTRn+ppZYn0fa8qYtYd9qM
 hJwdL3XU11O4J0pt7nbGccn4oVSwn7GWba5qhczK5wU2DadFkkkKJn5gyHSPY60Glr/kyI3vYJN
 k/vV81JDW/BJV+w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044644_005722_C6128B0F 
X-CRM114-Status: GOOD (  12.98  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index f01f08048f97aa230877e413ba6e416d79779c1b..ec75a16c630a79ce10ea98b16c44c9a3908f869f 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -993,7 +993,6 @@ static void ahci_imx_host_stop(struct ata_host *host)
 	clk_disable_unprepare(imxpriv->sata_clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -1021,9 +1020,8 @@ static int imx_ahci_resume(struct device *dev)
 
 	return ahci_platform_resume_host(dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
 
 static struct platform_driver imx_ahci_driver = {
 	.probe = imx_ahci_probe,
@@ -1031,7 +1029,7 @@ static struct platform_driver imx_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = imx_ahci_of_match,
-		.pm = &ahci_imx_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_imx_pm_ops),
 	},
 };
 module_platform_driver(imx_ahci_driver);

-- 
2.48.0


