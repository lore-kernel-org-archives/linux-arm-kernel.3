Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62229C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 04:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=; b=TZNcxr8RZ8kcZUGjdt41JBr603
	7VSQ7sQVjB8B88D3zY6an+7D9nXrwq/8p5wcZfHv44zkF2YFxqTbOPrpQwLKH538IJ91gm6U8jwF4
	qGslMO0Ix921nw95157bnwUxhaessTGXECVPSne3ZGPa7Iov6pVHQ5pmNnfrQ7mkG7u5K7le15LFF
	2Jk0ms6NBKaukmHzgCzW0L0VihsF/LvlFtETCpSKRfAc1btXI1CDs4j9SPf5KbD+gC9N6w2TAaDoL
	rSFcLgUaJsRy0aUWnSTsLTs+8hXfWwco3vrDwB0Zw9SqReSJ1253FGiBm8tR7KZKH6UbvxcB3+Mmt
	4kYxOomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCz1-00000001wAZ-2QxD;
	Mon, 27 Jul 2026 04:30:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCyt-00000001w8y-0R6V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 04:30:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cacf197759so32792715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 21:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785126622; x=1785731422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=W7nrVb921jfJ6VuijhiUZ5au9Pm9oKwhB5BVPvCa1GZ4koh+ecui30A65PGlhne7Kh
         vgqtRsd9HQzp8EaLQ641oEjz4fFR4GGtRWhjGYQIWR1SJe70t/0IODrMQvtMjfzO7noI
         5uQq5qiSc1yt/4rU/8volCH0rEs0bOU41y6zGcxz9OZUSPp5uafTVLA8X7+onJb9eTuL
         y8K5VFeWgG7wldLiJpdZlApDjr4mcgfnJLS/Vjhtw0hMdbkVTF7I/eL++HuLxfS7X+6g
         VK9t5J8O4Fgn5GH0aZRa7g2jpfkM48NhSfCR6fDz4Z6/+eEKQ+DgufE48eifyA8lLwqx
         d5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126622; x=1785731422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFJNx9u+viXRs5tNEKp/mtIp21KgfUj1WmCFdRLL6fQ=;
        b=SkzBQHbGW2oZEkVrN3QWOiMZPVQ+sQZgIX7qGivuCq9WJ8fth/XDEh8UJ4pm6161rE
         +tiZq5NtiSi1Odfq0/RdwJo2mis3i1E5J9RNSz4VNHMA7uihwlnPdU20aiGfPmGoNst5
         Ks5sUs0ZphYO1nj7p4yzzGPSQcjJEUyJDNTupsuUbyU/x178pATTVHkWgy7+jTuwpV/1
         Bn8VO/59PnDyP/+X7P0um5Skcr3P11kKWpZ4ruyK9yaaHMPXxkzeDONTdnfmAsyW7nNi
         qMDn7e8AlRi1G4zK7Me4LmNX/cbr7CTEJN9MYcukA5YLGWXuy3FpNjQrffp+aNjLYRbd
         Kmgg==
X-Forwarded-Encrypted: i=1; AHgh+RqL5Qn0KWsSTv3Yp44SGYD2X1GGUNuPp1v2FCWxi3X84VLUAD7f15OCn4S2TvyYlB5xasnktuB3oSNWWNEnHYF3@lists.infradead.org
X-Gm-Message-State: AOJu0YzmcHxUNK60Yy5Ya9mOUDqRAcjrQmXZ+WdvwoG7xaacomawWRkh
	sEBk8NUUjctEF2K2bB7rm72Sq2m9hJtQrq5w1fTt3c17G7OQBb2JAmJKsKDjZw==
X-Gm-Gg: AR+sD10j1PrVog/o3GdAF/JpIsC7hHjCIaFv5aJUXJKxb6u/4b5gs5/0eEdXvIP2o+Z
	lktx3S0voAywaKZgfCusl4o5s7zTnZ8EfQ/WlDSurzg8AHsVcg0hb01vohgS3lonhmvoPYFW6Om
	bUSdQKSiIDu0RQsj9cRY5m2InZwZh6X25VPbFmivFqhsY2nA/YhHzhCRutYITNNN6gLKoZrRhof
	4U6ve2w56tL9MgkT/fQ92duHw1l6pNYj6aTC6GoxV+XQNwg0+7LPJ19YtOXgSLVwUiAR0TOIgJA
	S153XCGyyM1WjEi3ZYzQtLto0zz+UEUKvk9rv2SYL6jTsa6Z50BvN4enFCQq8fXTdwdQGg72zgV
	Tg4xI2x3oYZmb8V2r3zAiHlUPcFER5TTKgoa+y3XupWH0IWbLzVsaQNnCGW9gzlfcI+AIUOoFPx
	7Dz/R+aZRGiL7kknCinrrCm5Zzrwc1ysX8m385jS/G/A==
X-Received: by 2002:a17:903:1acb:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2cfde89bea6mr59939035ad.46.1785126622357;
        Sun, 26 Jul 2026 21:30:22 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm27372145ad.77.2026.07.26.21.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:30:21 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 27 Jul 2026 12:32:09 +0800
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ventura2_initial_dts-v9-1-504c0ec68039@gmail.com>
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
In-Reply-To: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=FazoqI/ILuJD9YIY7tvUgoQ9mGvSj/LgYKIkJKM/QVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqZt9OKqVk+UNOOZ7EOnO+1ZHiy6C9OmYUeEsUu
 x1L5wJuTtyJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCambfTgAKCRClg0K3CVbE
 gUL0B/9KNiCnj3/MY7JH+tcOx3Lwu1GKhMmkwHIXZbla+56lXC+pkC1DoF5xSYkfgP3spMwVfvE
 al5XVkXTycvd4M7OdAZeq3DNyx0I8ggxp1+ODZZGWzVUm+IoCa2xa59awM7AHCB6jGELzdwoX/u
 tk8iixZfV9INDS2pa3C+z1gFPocIhdy0pWAJUpxJMr70G7kffChSTMC6dF4tKxEAbBo7Jvtugf7
 YZlzN3LSQGwfg3lIPuQd8mPs06lQ8Ew56kG3lwyJlgg51JM2kk9MklPpVddjXpUTmWVM3HlyqLr
 WeXdmCjAbuS2Vinr/RI+yFdAM7ITJZcWBzsP7ZqmdOkWqCot
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_213023_187858_65DFED7B 
X-CRM114-Status: UNSURE (   9.35  )
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

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..b7e70868ebd8 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -98,6 +98,7 @@ properties:
               - facebook,rainiera6-bmc
               - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


