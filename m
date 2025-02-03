Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4EC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 02:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/M3u/UfzPn7K2j1tUy85ouRPJtHFLSPO1KCwoEDBz08=; b=s1s73CEF2PEQy+Zie50S4VKEty
	WqyZMFyLH0Aasfh/sTR5/crSymwZzMCRXAoYnSkkEhKAqfo8Yi8uwcHNoiXTQnBN9620qvxjfMM7c
	s4OxW+K4D5KijvkqIsOAfm6SgMKQXzFCYkDdH6HycZYdTg75gpRpXhGNskQJVfc4/fWgUQMG4S4vD
	HnXWggIoOEbPE4DPt2z9sfrUit9Ia9b8dwZeWDkTGOqQfvhqtfnFAUe2OagUQYR/BWlpX7VLExoA8
	aXnEXznTKcmJsf5mCVIaH30ld5WvLXd37AjVt++lAqTfBGz4vI+q70nfhOIgkzVzOvtANEiEXEMsU
	qrnK3RDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1temfQ-0000000ET52-1PIW;
	Mon, 03 Feb 2025 02:58:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teme1-0000000ESw9-1Ytj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 02:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738551418;
	bh=/M3u/UfzPn7K2j1tUy85ouRPJtHFLSPO1KCwoEDBz08=;
	h=From:Date:Subject:To:Cc;
	b=keaaDwqBcwuRr2sI322cGvM6QhW3T8VZUIxniSpkWNFtHxvEYmOnJqsDXFQTvVwij
	 TV62XwwNM8Lny3y/GlktCxB2By33Y+iKiDyxrqh09BD3xef6UI5VFwY26s3weL4xaJ
	 qrMrMhFX3YY9SHuv9T+JdhQrw/eV/nirx005KyFZBSSF+gTXotW0xcKu4itLfs2vuU
	 8HXubwBXbJvZyBaO+s/GWRpfUvE8RdHjK87epWug2CxO+pQZABSg3tvZxx46F0G6J9
	 64ZkKgFyBgnnAmohCv4wDPnkyP8flCNPAeAng42WH6+STBsZ+Fcgxm3nCgrbnQb5Dg
	 ctkVcjJ6ugq3w==
Received: from [127.0.1.1] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C2762703FB;
	Mon,  3 Feb 2025 10:56:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 03 Feb 2025 13:26:31 +1030
Subject: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAF4woGcC/x2MOwqAMBAFryJbG4jrp/AqYpG4T93CKImIIN7dY
 DHFFDMPJURFor54KOLSpHvIUpUFTasLC4xKdmLLrWVbG5cOQMzmNJwZRCMi3oNZXNNR7o6IWe/
 /OYzv+wGLOVJiYwAAAA==
X-Change-ID: 20250203-aspeed-maintainer-dddbbe22da46
To: joel@jms.id.au, linux-aspeed@lists.ozlabs.org, arnd@arndb.de, 
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_185705_749036_C611AE2C 
X-CRM114-Status: UNSURE (   9.40  )
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

From discussion in [1] and in-person with Joel, flip my entry from R:
to M:.

Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
Cc: Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..305e5530560e53c10f0b610fa7b4456ca78fdfc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2285,7 +2285,7 @@ F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
 ARM/ASPEED MACHINE SUPPORT
 M:	Joel Stanley <joel@jms.id.au>
-R:	Andrew Jeffery <andrew@codeconstruct.com.au>
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-aspeed-maintainer-dddbbe22da46

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


