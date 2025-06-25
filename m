Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE68C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=; b=xN5dJvNghN+90M9A+0FTb1s+dG
	ifw65gl21JlOkAWv3r9LiHkbAMWDfVECwwj9AOu9pgJU1Wyx924tCs7mMSj/WfwOCiYAczFXBnYtg
	t1q+f6NGRMoRu/RJkDykJWcLdkFudh0pQLgEkyh/nC8Uf3MoIDxz6DLoU8tEsqowIFa85/luB6n2a
	12zsrKsxLf+Rs4QKcK1rNgMvhLCarxZlku0YTSMa26UDZhCMQCsbiX69jXPGrC2JQmoBNNVbNGtTO
	0Zodwa9bU+faGLgeYHHZoKEtHBGuaYbtPpADFIbU22SOGJUk4X9UarsIaUWxjV44tmmAY6SN6zVoJ
	gvVxw0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW2U-00000009lv8-0VtD;
	Wed, 25 Jun 2025 19:44:10 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURxK-000000096Ml-2VWi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 15:22:35 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-610db3f3f90so820624eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864953; x=1751469753; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=VOAIB3r9BOaapouj0oQOEXKsnCbHvBhR1WFVP/tLMSCw6xJhtB7GBPnCmpl098aWx8
         TaL3tmvUUImXE9IF3EU0IW4yVKXrqXEjs9DV7o5HYk5VCkKWt4MMFaknZHFJZkNwrn1H
         tUfeK6ZWp9pr8H4/VUhKQnuWH0+XLx7W3UloN3j5Y0ml+KG+se2knZsdHQYbwZEhgCwZ
         w35yZG3tQvikyL6rGWqeMxrCSPbOpWJU+DuCbqlft4SOdsXCfksEilA8w/iEnWXUuizl
         xRIvPULmOlJp0DxGYFb21Zevi7EBAC1TCHREFMPNR+ml8aQlzHXM07/BOPkz1x6/MgYP
         2m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864953; x=1751469753;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=uLbaMlmRIPtA2Q/IzYEvur2skoWOioH0sQd4RHautpRMzwscJJ8P2fqyxodK7x2ZCj
         hbkVGPTknsD05yRnRXWB+aStExTdh0c27dpJdddqOKAlSfa+P9MrSVsXLOywLJiqbDJr
         Nz/KzwLlT6Am0MMwhX2Rt24JWRC1d/TJMYIA0yY/8IoYNa1g6Ifbw9dAa98HTl0Ct9KM
         q6v3UDltMB/v2mrsLuvKanxo0S/X5lr+TSFWADHqw14bIoN8etK+7uPr9SmilVxDvcHf
         92+9TBfJwHD5Lcxav98xsB6yqij1sqQHBAGzMNlyKgFlrlhQ5Q7MFs8uQrMyg7gRwC8m
         hSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqyvKz6JaR6euD5OeqlKoa8XEmGiqr69+B3I57dEphNirkOhKNda1A8zEQmG9tIOUQ8SVzTcxjlSIKKAiAVRNr@lists.infradead.org
X-Gm-Message-State: AOJu0YymNhoBAy6piJFa/SqoJYPsARcoM50eOS7SMzcx4SWpUg4N0HQO
	WYFHKglNvA8hCug22AU9UGIUA8pW6DoKPyozOXk1i7EP8AR32uRftd83urPIHXwn+zw=
X-Gm-Gg: ASbGncs5FZqfvB/Pf+BiG4Qg6A+ylScVXvNuY2h1mbOhQp85TfxEZLuvoOiPfPP+/ZE
	XOSrBje9fuku/6ZZJHhRpjHt30iHCSrq0t1JieirUdFEEDWIF1NNhO0d5rxrarEeK+Q7P93n5OJ
	dFFgGrF16R8yaWDHL5BbQvnMYJoulWKafKpXUa782Gp+DrepYpiseYR7VCQ4tCxBEnvVRSCtO3X
	ykpnHMvx3od9Dmu6O8x/UjMtWZY2BVAvrnHqvLTrYLoRH/OvPPedlW+x3BoDcI5Q6lzpWxJsbA6
	vSaOCtiN29/KGjGPzWuUmmqLrI0aGYa0jM4j/doUrNSOwPKwDrKf4NR4A9MSVjbifr11zw==
X-Google-Smtp-Source: AGHT+IHuQoqa1u0DUHvl6z0O9mvk8424s2tdSOokLX0655c7GkLUoXhQQnFWEefCze0j3O7DZKz2Sg==
X-Received: by 2002:a05:6820:99a:b0:611:6fc6:e6ee with SMTP id 006d021491bc7-611aa3f4864mr221261eaf.1.1750864953563;
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6115b7f813dsm1629279eaf.40.2025.06.25.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_082234_638406_817808E8 
X-CRM114-Status: GOOD (  11.73  )
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

This was returning IS_ERR() where PTR_ERR() was intended.

Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 6501843ae72d..3a4645f59a44 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
 		if (IS_ERR(base))
-			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
+			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
 
 		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
 		if (IS_ERR(state->phy_gpr))
-- 
2.47.2


