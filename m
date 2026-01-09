Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECEAD232C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 01:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yojVdkVYHEA3WHCWVg9zc/5nPJAZbWKgh3L/xw8AM5A=; b=O2mGtUjHitnUDZJWjUjSYmYlyW
	qqcLiIOP5/eO1TTT61BeRI+Ga8jz4vXQ1QNPwL9+haj5QIxr4LS18u3j/GU0iB9HctSM7h928vn+0
	6NCUGc6aeUsYqy/noWdewZsDQREMhc0Ct5q63wjBie8UHiBEPezg0AlQEZO0hvm6XeLxh3Yc5OC4e
	M3vV2/zdMnkhE2sMKe4No4koFhcJO6AopflvDLvM5dWfhAq4dx1r/wTfTzU2OHQwa4VbzFrOrjKJ/
	bNeLj0aGELOAmqI4sb2ldz6n7y/4z/cA4oxQsmOWDedlrvm13hLIjwUddgfDbbYXAdMSAzngOTHCR
	/V98lKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve0yR-000000013PL-3sLK;
	Fri, 09 Jan 2026 01:07:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve0yO-000000013Ox-1wuI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 01:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767920836;
	bh=yojVdkVYHEA3WHCWVg9zc/5nPJAZbWKgh3L/xw8AM5A=;
	h=From:Date:Subject:To:Cc;
	b=NQmI1+fgWdJ5GeHjbbC44pL6E+Gys7iw/Z3udY1xs2SLGEZaG8njphGX5EoFN3Di0
	 s8GpTcJ10kU+9KKuigurCulVWJJjGbVo4xzeL6KurvLApxaEtZMx/5FHRKsyrCV6sv
	 rMVYd3qhspwKJLjAlasmA1TyIzRKqKVLfd6mynri/imdCffjYCNEjAY5CUSaIOiKw9
	 /hR/kO8SsKvrWia0YT3y3+8zXPEt9tBd8byKcc25+qla7pRCfUXAzi3sz5pmjGOZj8
	 qIpjPtAMykfDhr89okyDgD8JKGt5Hmh387NvwnkErX2inQA++8w2SO9tDwutmDKwt5
	 Jd7ls/v12Jgog==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CFFFA7E142;
	Fri,  9 Jan 2026 09:07:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 09 Jan 2026 11:36:31 +1030
Subject: [PATCH] MAINTAINERS: Add Andrew as M: to ARM/NUVOTON NPCM
 ARCHITECTURE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-npcm-arch-maintainer-v1-1-a0ec6aee22fb@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAJZUYGkC/x2MMQqAMAwAvyKZDdRSpPoVcWhr1AxWSUUE8e8Gh
 xtuuHugkDAV6KsHhC4uvGeVpq4grSEvhDypgzW2NY3pMB9pwyBpxS1wPhUS9NF00Xmy1nnQ9BC
 a+f63w/i+H6JVwqNmAAAA
X-Change-ID: 20260109-npcm-arch-maintainer-8b09b48e2248
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, 
 Drew Fustini <fustini@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2391;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=0TkzNnBG5o4mR+8ZRgS4ZQ2kwsVZgCrbYagnjJ4fLRo=;
 b=owGbwMvMwCW22PjiTL8dD5cxnlZLYshMCFlrI5XuzWpyctv9OVt+dq37mDA915jBMunNsnu5W
 Q7FnMc2d5SyMIhxMciKKbKsCLQtvLt5UvzPA9nHYOawMoEMYeDiFICJnDJg+B80M9DrIdeGVTN9
 Sh4mhQQbzdt8P3X1DLYDll2Jks+F1FsYGZ7EXpjJq6Qex+K+5np1yesqLXa9V9rxN/MqZ9TPTZg
 6kwUA
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_170728_746899_ADDB0BE1 
X-CRM114-Status: GOOD (  13.77  )
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

Nuvoton's NPCM SoCs are part of their iBMC product line[1]. NPCM arch
patches have historically gone through Joel's tree along with ASPEED
changes due to their relevance to OpenBMC. Commit df5e674c7a99
("MAINTAINERS: Switch ASPEED tree to shared BMC repository") does what
it says on the tin - we now have bmc/linux.git on git.kernel.org, and
I've picked up the maintainer role for it.

Document that I'm continuing to apply NPCM arch patches from the
openbmc@ list to the BMC tree for PRs to the SoC tree.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Link: https://www.nuvoton.com/products/cloud-computing/ibmc/ [1]
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
I'd like acks from the current NPCM maintainers as confirmation of
this arrangement, but in my view the only concern is that it just
hasn't been documented until now. I'll follow-up by sending this
to soc@lists.linux.dev for merging unless there's any opposition or
preference otherwise.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..cd9d18083d8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3130,6 +3130,7 @@ F:	drivers/*/*ma35*
 K:	ma35d1
 
 ARM/NUVOTON NPCM ARCHITECTURE
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 M:	Avi Fishman <avifishman70@gmail.com>
 M:	Tomer Maimon <tmaimon77@gmail.com>
 M:	Tali Perry <tali.perry1@gmail.com>
@@ -3138,6 +3139,7 @@ R:	Nancy Yuen <yuenn@google.com>
 R:	Benjamin Fair <benjaminfair@google.com>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
 F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-npcm-arch-maintainer-8b09b48e2248

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


