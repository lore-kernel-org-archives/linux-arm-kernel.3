Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64920606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFDc+I4M;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgbrLven
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=; b=lFDc+I4MqMVERc
	CyJQqAXAEVej3MnimXDpSnvv5zUJNHNr9UEYohEkSPaDwl/n+8lM1RNxln9IY4mQo7FVNA+bjWgyJ
	i+4Yj42Yn4I66tXF/AQz7vB83R6tN+K8kFeW/W2tNcVAhmaqoTOaRwGaEdNcdhdmxhn5JpygDV0I7
	yzGoYcTKeAMPZZWlL3UHNoY6VOIg+igIOYzuNWguX03cNJDYTXsA5mkjuWBIWGSiKyRJ/pk5Emt1B
	cxijBW8nXH3Wn59zxP3WkJy9jozJkUxvYfXkJYy5Ew4KZxHdxrKRnBNG76P5uo4wt0lahvsM95Yy3
	FjJ2yJlypstJEicAp+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN2F-00000008vN6-3Bfb;
	Thu, 29 Oct 2026 10:07:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN25-00000008vEW-2bRV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:06:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so19505375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268411; x=1793873211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=MgbrLvenUYKVKnhfE43rff3H2eAzlM4LPwtHL99fA6l41coBZ8fFkkkQke99DxahBm
         1uavbW2ndnU+99RRjVlAPRuuz1h3FTuCRh8Etx6NO0WqO9q1yGSphP4DNS7vbb8RlPU1
         NCdJiF8byiueMCii1v3pGGHLJVsnE/sT39BDg0qoIATUIxitqusOuZqIsoSkdhMu+x6K
         LOAt0PaQwz2At49Vyw6pUjZdCv12Em1CZXwEhv+YpTDFxdv46GMs45Imws7uk6wz+VP/
         H/K5Mc2INBL1kD7VWSc3u+FojQWOPuNf5HirzKgWEmEx75AbqHyvCtHZDoRotVxCezFh
         A/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268411; x=1793873211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=MMtsX7H+07m+eRI8FWMz6LHNJY7DgGVneJxDc8uj20tADJHfI+buIzLxQ3Vf7Ms/kT
         vwmU/UPATzcrL23x1PpTN0ZmN+LuIKoix7lDIscB7f7z10iQm1VaCP+uwbShSKOk0oPP
         5BiKt1Zd+Tk7cS4+8bSi/zmb7Mvw80M7xL5XGADnFkJApvGmK8OJ0MNH1IgQs4PruI8u
         bvbCg75DYtyemZ2B8s4YZEvjvujlYgtZPrzRQwxvJ/+rDhDkLxWyVoxXucCJF74P7fIO
         fIoAklp9VbxU4FLGQrZt3FRt3YU4UQNSNCKcSvG+ME+eltAhwXuvo8CWPQW85LFeZJJn
         J6QQ==
X-Gm-Message-State: AFq9FYIngk1H+gD7141HbV59+Mfwqi7QO2z1sWJDl3DzOBJxCY5eKQNi
	T3PGEYd06fPymv/x8zoX1NGzjOQp2QzjhtLpbiBbT002Twwx7cjY5Auu
X-Gm-Gg: AYBFou2b04+vB7p2P5ZwW7zDgp89d+C5tJGcOmYJZQG0gXwD9PJ9OGodmGJQ7x5b0Dp
	Y2ttjs7kc9cdgDDVo0Fu3G6wxRlHBZctZmT4I6IKOTlEsCxhroAvnsxdd5K6PDCblH39u8GzckE
	/NdIMtRSyeaSItwc7fwYA6NkG5LGv1ZSk7Cnz3AesEXRmzHKBlhkN91NjB6RAmg+f9UNcLb9Apb
	4xUzDH0ZTFiK5BlVEL10aG0nvOjgquqCTJdROhLjGDXI2pMRdDnomX7yO53sc6NAGhS+uUz2Oqy
	s9/Xlb0uwc34jqoEZ33bd+g09m1PA7SdWH1nSXxBB0+f62MUW2v5AeQ6XuKkMRUgTWdpzsankq5
	tchMAjO8zi8gX2M/m0p339G2Gc00B4Fkfj4TVJe8MddeyunJKleX8irhEaanPiSXC8QiOKmyhb1
	h5+A2UnNxlLG4dL/jzhUE1TSgs2apGi9r5ap61J2b6clvPr9tKQLetc3+RjmJnZr1BkLpsVykhz
	3x6fR8S0gh86stVdCFm6osn59q1Kff14NUi2mK2fZoDgiUMSEtbWAwFmfl3Sjjoc80RFu59KSBZ
	tNqr2aKLv5yY3ccyORre920PAarihbSZHX+2olO25srngztXvKFKJ7aFZlI5csURWF/3b9F5dKE
	LpMF9+SjA2A==
X-Received: by 2002:a05:600c:848c:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a966490754mr125374865e9.8.1793268411167;
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:25 +0100
Subject: [PATCH 3/4] mfd: rk8xx-spi: add system sleep PM ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-3-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1163;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=1zvikwnDADGbJGUr+2C96ExmTpaaJdX4ozWbby5F6T0=;
 b=TCcmm2uv0Oq0jbsQFif9J3wiQ6uFZZOT6azcU9/u4jfR7utKpgVScfiFRlrkXexfBrw4RHf/7
 9Bb1HPxhFwfA2EYYzIpbfsEiuGXaDUD7LUMrp23QF3huhIpCcXvZ3KQ
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_030653_875302_17734888 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Unlike rk8xx-i2c, the SPI driver does not hook up rk8xx_suspend() and
rk8xx_resume(), so the RK806 never gets its system sleep handling, e.g.
keeping its interrupt disabled while the SPI controller is suspended.

Add the same PM ops as rk8xx-i2c.

Fixes: 210f418f8ace ("mfd: rk8xx: Add rk806 support")
---
 drivers/mfd/rk8xx-spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index bb85fe60518f6..a0b7d7a058108 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -97,6 +97,8 @@ static int rk8xx_spi_probe(struct spi_device *spi)
 	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(rk8xx_spi_pm_ops, rk8xx_suspend, rk8xx_resume);
+
 static const struct of_device_id rk8xx_spi_of_match[] = {
 	{ .compatible = "rockchip,rk806", },
 	{ }
@@ -113,6 +115,7 @@ static struct spi_driver rk8xx_spi_driver = {
 	.driver		= {
 		.name	= "rk8xx-spi",
 		.of_match_table = rk8xx_spi_of_match,
+		.pm = pm_sleep_ptr(&rk8xx_spi_pm_ops),
 	},
 	.probe		= rk8xx_spi_probe,
 	.id_table	= rk8xx_spi_id_table,

-- 
2.47.3


