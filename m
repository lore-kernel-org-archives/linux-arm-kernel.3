Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA48D715F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiTqFeAqAqNp207pw9vT4+RM4bBNWXoSddsLZdhjO4U=; b=Jqppa9heqPWErnmvOWZDRtx59M
	RMdbRZBWC2oFKT6wE2N6raZ8U9RBSypeLX48e2mXxN/lhEWrua8qfopD3gnHPrC3Gb8LWz7UvxW3G
	xS73LSOfggA3zDuIjGJ0E5twhEPTy9sd4Ps/iIaxvgjOz2RN/T5fNt9aCdSmzujJzLr36aQOB8+kz
	XLTsso4irbFD3mYDpE/5x6FK3e7fY8O164qILtXjq6rqGg1/4bo4zvUAG68bMx0n5faYFT78aNpIY
	RkZq+PpRQiIopM6Cy/5oCBZCPkjlp4cEaBjM4Gy6MNOSO+TnQjS4mSqlifS/sbOY6UXE6DDmu605y
	ZFTDMPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9N-0000000AO8E-1JCq;
	Sat, 24 Jan 2026 17:10:17 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9I-0000000AO5F-2y9W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b8860d6251bso236878366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274611; x=1769879411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiTqFeAqAqNp207pw9vT4+RM4bBNWXoSddsLZdhjO4U=;
        b=adMOZT12+bEMi8dUUEZcwKNHbnWv+zDMpefHftElQE/2yswVpGRNK1uD2u4C00DcRc
         Bz0sBCv+Wbv0RxrVLtFmNnnLmo57hMD0wgYznKHdN9Lzxn888WiGEXhXWEdd6Eqij2iE
         b7ckp63oqz0H40p5856yGebKuAA3g9d9CFK5nmz3O1t8q4C0VvKl73+arFiX1Ea9CAnj
         cBxvN3+y1GUQSnyLrP3sLFJPtQQOt3YMnQvsjKVv4Q68Rwp4FTC/jUBBWF4L0OpWxCo1
         r8taP6WYGe5BYzhBQ9hI/zfCP+/wlStnzGhdmtmwRfRgLI8ckZSgFDnopBamr0VPXrSe
         AV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274611; x=1769879411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yiTqFeAqAqNp207pw9vT4+RM4bBNWXoSddsLZdhjO4U=;
        b=Dt6u7+Mz5FFCWCiqSQOfo6Elcvvx+us8Df183D+0q2evMiTmdWZrkTEJmhNeMtAvky
         7frEwHndBqZKc9gMLJXsjRbQbsCcQ02cDeQGIElWynWeoEo8soG/sQeKMxnStvPqMWKO
         pnxFSYr87zBu0FGp0l+UEXOymbdTGuPk/NuomlgQ5sgA1n0iBC746PnaQ2/IVOGzz2h7
         8uO69251B2Lzcw854+o2H8raBgC53t1kcMFUSkUnGOL0pEOJKtWuxehUblyGkeGFSLhJ
         diVSVtKnTYW62jYFS/E3OT+OvW5GIgxQ1hJApuhyVbSiM9CqvIf/tP7r1/eVjltFoSPO
         G/4g==
X-Forwarded-Encrypted: i=1; AJvYcCUPl/sNS9m0kYDfYEl5c+ttCR9Qc4PcaEdQkFgpnhOLgBiy6/+X3/LG4Cr/9/gjC8C6apzNSzL66ghpBwIUBtgZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzK/++EqaR6w2QepUOF5TGOvTP4vyLfZKlaOxueCq1IZ9TwycP2
	X7UPBf3rI8+TigxpAowuuJHLPE8sENYFm75VjTj5sDehQ0k74bO7hEgR
X-Gm-Gg: AZuq6aIr1edkGy1WVxrNmYcEvCMk4rbtf1QkylZspyS3So5UrOWC8/pQv/nPPT845Tv
	JV5Q9aegb7MOht+VB7+JQtU7+7X28vERb3eOMrb+VCGJ4IQYEEYXaq8o5+TSSLvYpR9TzTwblat
	N+v+0vqggtPPJ3YXaXHP1p9/VU2x0IrmtDu+1/8p+cIXH8VpKfHevIeGsKtgxaR6zaiXVeD96JW
	sQdQCt1FBROi7V6rt7WiaZE3CxlIroSVCOpgPqx1rnHKTG+/RUMp2rUoPhWDMVazYv1m44uvWdy
	3usYaYce2/JQZvx2yVWH3oSfWVd18unlTn6XHPoLvwWhtVDVMY88fIJ3xae7Jwe3Nt4dXFG3PNB
	Plz4ntLcMd5cYGUuCwao38rUc9CAiroouD7UvCM9pIGYop9ySwF1kMydAphRSDJhjGmkHnzGIxl
	vZ0sDctAaFD2+ao7+NmLoF5eIAMkw6t3/5GrFKyVAXkqsLcsSBVX5zv81xaRwY3GacxZrn+tkqk
	W5O4LIRqe92tVE45i42sBPF6eeefoOCkPtS2g5wM9EuZw==
X-Received: by 2002:a17:907:78b:b0:b8a:f946:f7cd with SMTP id a640c23a62f3a-b8af946f83dmr67418266b.21.1769274610852;
        Sat, 24 Jan 2026 09:10:10 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:10 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:04 +0100
Subject: [PATCH RESEND v7 4/7] clk: bcm: kona: Make kona_peri_clk_ops const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-4-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=SMnT/0Trui6sxVUAxHuuQnI1eYrWJHdMPmTopIKWfio=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr7W+Bmel3AdGuD8c1rB/86WRkosGRNF0g1
 wis0tzGZnqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aMmDEACXdqhwpd6pbNP/tc4vXhkp0gSfJDWzbSi7DUfOhIqUD4sClltc2rBE5oiOJx/5F7dEJdj
 jGplyVchZi3T2ovS8l9bQGAjJZlb086lrc0OvRw580NKZrx3Ua58GXCN/i6LwaoYouZSH3oj+2l
 Xn039uwHTFOuOs9JfhshiVGlhSF78pCnQJt91RsTq/MhLhfyJ5G+jDFL64+RCYtz9012WIbGXYV
 rm4XKsqAw1vwHpZ2MAvWN9bUigcs7A74/Zsa2p9oCcveLhWgKWM3a0YgBdO5RigoRD1zgkFkhzw
 cvHQVo0hDI/eFH5VSIxmuEySJHv35ctcRkwHwwPwKqC/1hexPBsZekPG2hJ9WgGp0Q6P91GOIHn
 XF+MKyl9UkJgjg2l3DCxGUY1O0TBmX80wrSn6fPnX5kwu1Seso6wyxy+MFT/rf/Jv/4bDfDRnqc
 cSIiszRni0F/UnYw5RM9zasRkEwBm2FNvEDM2RSxLfHK3sS++ehn6+WXXb42pm1AlVhCNHuAmKj
 P9oXodRmRUobbx7tZ8VULwkI9rQnQSJEJxXAJ9A8GnBId5dU09UIXf5Bs/K+k17rKvvkj4o+d4x
 MuxhyqSLHGBpI3AXg9pMmMOdDQL32jBImO2q3qMmQA9Z/tzAiOwgZ5arX2kZWUi/P5lUORse0ug
 qlZO0h9ODCX3F8g==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091012_766025_8B100318 
X-CRM114-Status: GOOD (  14.00  )
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

Fix a warning raised by checkpatch about non-const clk_ops by making the
relevant struct const.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfca..2641eaa4ca52 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1154,7 +1154,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-struct clk_ops kona_peri_clk_ops = {
+const struct clk_ops kona_peri_clk_ops = {
 	.enable = kona_peri_clk_enable,
 	.disable = kona_peri_clk_disable,
 	.is_enabled = kona_peri_clk_is_enabled,
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index d7cae437333c..7064ce316981 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.52.0


