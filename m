Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE9FCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=; b=GnDUNsySw4pH1uIgJnH5KzNw7Z
	KKRkH+H2nS5cmh8g3pWbe8HiCepIWUQROHY1L2HXxuzAVGi8xHGA4XauAln7iEJg/Xgeeh7czGgEn
	gE+d1xSyu7zKrGClFO1HX5pAMv4otMjXBIzYCibpvEZmP/p6KLNNGXMbnTvXu6ZKUQqWRD1Jgg8wN
	+yzqQycwZxAPNZz0rvJd7F0XVh2P87IuZK+oOJE0KbJYFTQhJYhzIQuEIB3qCOD4a7oMB/vX74sZX
	D4NLWMjbFe35fmRXSttZNeRPXNf0LBeV74m8H3wByAp5ca3peZon9H7uz3C/Fhai9RfqnUvN9OYEt
	gybxv95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkci-00000006ZFF-23Px;
	Fri, 01 May 2026 09:57:28 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkcg-00000006ZEl-2oXx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 09:57:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c76d797b180so1035164a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629446; x=1778234246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=;
        b=V33O0NPuG87N37zWDnu5funlXzBOLuuVTgUnkrR2msJMjkrdH4FmQM8gtH7IxEkdmu
         unMCYNk+GOiqcA+4HzMOBB4UgaYiyxuB4GdvIJmq3saLWDJmXnRbuAQAHwHBwx6YwYVR
         T7+/KC44OqNIf6MkGn3e10za7BB3H4mYXSsj/h3Rc9Ba2Rp/Z9P0C3A+S1Dg2Zk3fXO7
         WquXPC+XiqFIembo6Dmv9a6ejBvA4Zc/ZUcym8FVShycELE0imWqiCGJmtZuD6CJ4uQ2
         Ud3rmWgqPmBtyyhwHkiRtRJi+kbdEjI4GnQ4Kfh3FyE0oqMAP72J1CLh4Tosi4lQcLrK
         QMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629446; x=1778234246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JtSAsL8S4A9Pm+EutLuBtDes8X3zjz/YG0VQuIH4tno=;
        b=Cg/ldpOFdewnkr0rLEW7wHRajWXp4yeOV/F6Tm42rJHei6MtpqG0chYK9g7OeCuT7+
         s7INXmhFHJW6IjKCDVykt79ygXoDY3DLiT8JAawWTmYV7i1UW+SDptF7UDDMMfVhm4FV
         Z1wTuylkgkgSMEMi9oMnUB3Fe07G+qYDXCGjau9pd1x5Bn8wf0MKU/n2Orc91vEl1wpW
         eM/IKV8esNAjlG9P6IH/PpqTkP8leY0lUWmgqWmHdDUAXGMGft1qyQ3BH4XrmhT2/7l5
         7IfPJujHlB+/77EpGeOgOFRwiq/jaTHgWDf0vJXhrsSkIqXRcG+Hf17o1cJm4wFVf8sb
         IDSA==
X-Forwarded-Encrypted: i=1; AFNElJ9lRv0LD0+JzrjA69SjqE4Pj7ExzVcwx56K4JeFLgo6RHsQRptowd4Gx5sQZadbibXyq60DzNLy1veTByzTiexF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw15xDC7tkdqGzE+tmj2YJrGoADMIV4A7gYhwwq8WyrhJ6e8gf3
	mDw0Phh3YTlBuJ4woFs1f0VPuA2U25uvTRef0ubEt5sdftnII+bD+yFL
X-Gm-Gg: AeBDietM5khj4bDZr0zh2vSXAkysiu8bOjDfuixgSzzzSOMBqWwcXOxzkBqVDGr4U7p
	Ivhwi2kHBkwQ6iOFouxN9RXjmYZk/p5laDsUd9yrJlDPDJQEdUmMpa0ZH4pP0bxgPzqpDySpFOw
	k62mdgze1otI2UZkNWh62c0cHBs434YxB6q2n/4Joyt5K9lmtDvnmtaRoxua2luGssnOgHvwZE8
	goHQWI3Db7hcuyiudAEUSGwvLgl2ThWx1h8toJCNj/YUpPhbnruk9LI1IurWNeKRLIrdyWz/qXh
	6oZvFnvL02xxRbIUOkCxUgkch5Y5EyyLzYhGHIYBs1rKZ9bmoaTCNUCebEsooTZHV60s6c8aKzJ
	JnPawmpjOs7bxtLEv18N4UGr1KnO9FpUhcpE0aUMfoaH9xj/H5ZeLqCwR8kRGNuq8h46vY/6OoX
	+ri16BoKYwwGRMvQ==
X-Received: by 2002:a05:6a20:3ca3:b0:3a3:a177:11f2 with SMTP id adf61e73a8af0-3a3cf8f73bbmr8146741637.56.1777629445727;
        Fri, 01 May 2026 02:57:25 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:25 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/4] media: hi846: fix hi846_write_reg_16 handling
Date: Fri,  1 May 2026 17:54:30 +0800
Message-ID: <20260501095433.1609309-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_025726_712241_802EA627 
X-CRM114-Status: GOOD (  13.54  )
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

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
remove `else` in v2
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0


