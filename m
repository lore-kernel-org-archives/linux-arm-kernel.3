Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F39BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1T6FrQp2okPwOD58MAho0evF8YiqmPgaoUsaoWni2dg=; b=MBflKbd/opb8efOOSynx1bXT8W
	m7h/0GoB2Wgmm8SKrCgA/+v7F5cHoafOrsDEbf6jS3S+0nzgImZV6a+TSZ1fIqtw/zP+5JE6EeecQ
	3pGTr+Iob4NO4p38J3hkbhNhDdCMMXoEimiTnmpAweekVYBfqUJ3jfKDb2kDAY9r1iRCJyQ1EQFme
	wz605dnugJOgCY4JsGsKEfckXR53PBwSVKPvatnBsODap3fQ4voGLRy8NfCnKlRP1Sjh/V9u6dDbB
	FcRiUcdlneVoyu7dF5VEuB8aKUUJa+jlYAmwv5X+xho8nalRcHm7dsHuInZ/uukUozRwIwvdaS9yA
	4zydPFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAwi-0000000CUg2-0Q3G;
	Thu, 19 Jun 2025 08:48:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAfi-0000000CR1I-0DaC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:30:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-453608ed113so2974615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750321856; x=1750926656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1T6FrQp2okPwOD58MAho0evF8YiqmPgaoUsaoWni2dg=;
        b=PGFIVESGv9TbuR3FWZRJOODhIFQC5mfgQJkfp5d6qVMq+pCsntdF1XdmkPtymmWPNH
         TadUF/M3yPaXx+RPRhmicC4IpMPwW7nQsN/hGM9zL8oI/fSpG5rOyYdG3K3L+TapMLwy
         Z0MKa2ERxAux+P6LVkoh/yKY+Utp41aaeQlxorkjz7DDHM6qByiVmfQmY2/bET9LjyhN
         FBWEQgniv5yrGi3NQ9e1rB/PtXIWXrQFEpCbgyBiBUz2e3r3hSxPWsF4XJ3NfWGImBRm
         vHbGc1nWl6gLP28chbIvg58auqrUnBgebWe1yvjHARfIAyuKZ3/HGRyFJEDYQjZ8T+iK
         9BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321856; x=1750926656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1T6FrQp2okPwOD58MAho0evF8YiqmPgaoUsaoWni2dg=;
        b=ixxT4e15cV+NtiZIxSH2USIsgTRH5IvU2+i1HdUHMDGzZ7qSmtpptC5i8dTdZ0wO3C
         j0reycqpb2g6WP5Km4jrT2gJwoexQUVDakILcudhepdzE3/oNwB6vmIO+up5JMeuBmiP
         loSAhM/qfUIj+MZBvmdZGuhJIL27uUO5+frs4nXrV1WslsBkX+1N62Fbws7GYkmSTuc+
         C7TRiL0c3+KOSH9MMBdCVF05BGK/NP9V7gZORqrY8RqV4kvSDlZs27ODW7MZ/dSTuBKa
         p9R5wWhNAcp9pcIQRBpJtRYIhHVqOMaDXENvk7xvPiN4ash1ck8+dPp67maUq1wW07JW
         gIMA==
X-Forwarded-Encrypted: i=1; AJvYcCUKoPH3jkZsoX7XZbRQrJmHTASEmS8A+P5laptpuhvuTXl1eXZ4QqNtnN2qQOJawRt8GfOZ8nOc3pgdxyflFmz2@lists.infradead.org
X-Gm-Message-State: AOJu0YwgRqOqRAKMXE4LVvGksLrT/aIl9sBtfVKTVmlNRN44AkEVOddT
	M84Tg/SNk3FsaIPoBd+dduQq38cG2YzHnaPuJPWv+r0wfOBzRfQY7AHp
X-Gm-Gg: ASbGncsP2e56bI1n2RkWxaOpBPcPmT7su3WgOoXg2/f71MsVV8GmFnFmu6g34HB5T40
	EQdI25EVQwHh4705cxxIlHb8wcx1ukh2cQ1Vw+dR963x9jtQs0dIU8rOK+alqOaob3Yqa0uGaN2
	62FCP+LIyPjxi/nUTE3OtLoN3gFv9PEu3t3IPYmQfe+FyzY6R8dIV0UAE8u6oqXMV//yDvDr7a/
	IKBVtwPdZq0bCA/4jzc+0+TiT+HIR774CE2yfX9fZ6ouf0gplaXJHHMjhoN+/e6zD8gRBTShvmX
	uRWLul1ZC/mn3tDD8Rwt1bTCL00iZRfE/Mawi7yki3PkEpXZqjbIu1pd30y9
X-Google-Smtp-Source: AGHT+IEQpQd/8hmEsQ9eRTPMz052eU5rjSLNmdJtdjr2u9+ZU4TSJSnOXYilvQhtflXrG48W5EC87g==
X-Received: by 2002:a05:600c:1c02:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-4533cab540cmr174416875e9.20.1750321856202;
        Thu, 19 Jun 2025 01:30:56 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453599c9854sm27663455e9.1.2025.06.19.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:30:55 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] clk: moxart: Make read-only array div_idx static const
Date: Thu, 19 Jun 2025 09:30:35 +0100
Message-ID: <20250619083035.1835133-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013058_092827_A7934307 
X-CRM114-Status: GOOD (  12.93  )
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

Don't populate the read-only array div_idx on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/clk-moxart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 3786a0153ad1..4d34d1d18dbd 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -58,7 +58,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 	struct clk_hw *hw;
 	struct clk *pll_clk;
 	unsigned int div, val;
-	unsigned int div_idx[] = { 2, 3, 4, 6, 8};
+	static const unsigned int div_idx[] = { 2, 3, 4, 6, 8};
 	const char *name = node->name;
 	const char *parent_name;
 
-- 
2.49.0


