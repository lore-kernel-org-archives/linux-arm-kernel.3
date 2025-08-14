Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39692CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDLGrc7XefUJ5ohNJj2haJRU4klp5/mn3avrwA7UD50=; b=uEDyojVvhMD1PqPDMZ6R4PMdNW
	18afedac7g+Cdh3LavdBz2StJYCqvacmwjrbEMZp/vnl8qsQfIwyMqcf4S96TO9PYS7aVn7h+Ba/u
	34YiwLn2iyhO7L3zQQ8GA30qrEFC1O5064XSmQMzZV8oNUrQ9tsble6mULKcBE7Zd2+2W7nY/cOyw
	6A2yz6pbjQcVZbjNbOToW0C0tk8l7l4A/pDVGljloQq9Ujose61vCos5tg64UgGXqg6NXp2QYcSzD
	5BVaSaiTcusVRAiPsQuvPgzUfNdQ+8IAPf66W4A4XbVs6E3tDdtdBBhr2eKej3ydGzvS1RQVwCeCY
	bUVgiudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHR-000000008LG-3jWT;
	Thu, 14 Aug 2025 16:58:21 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umazo-000000005bM-1k5Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 16:40:09 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-333f8f0965dso9813001fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755189607; x=1755794407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDLGrc7XefUJ5ohNJj2haJRU4klp5/mn3avrwA7UD50=;
        b=qluBKyfQK/dkomgel5ffdD5YnoTNemvkbw7WiWGlgNQHOI2AIpql4tsQ8tM0DlyoAl
         MYN21LaoOi58Q8EXQse9bVd2WJE9keiqiSJ4iiPCZZCT5Fdv5jWUVayAp334wkg0tDON
         /EzysMRTpergroRiX/hUCYK4P836Wxkh5DddTwTtPgyW3KhB8fclFLZc9g45m2uE4+Zt
         SbQZI+8KyZIXq7XooO/pdrXkOXUL55SmutPrjmMzU3Lsu/cZ3pmrawx4nVr2aoucuHHt
         65AWS6/dlwH2+FwzRHxE7tINPqs/HJaasjcpBaIHWgRtnBrcJaKY2h7efTW50wC3vA+U
         O9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755189607; x=1755794407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDLGrc7XefUJ5ohNJj2haJRU4klp5/mn3avrwA7UD50=;
        b=CK0/d6Sbo5Sg7l1oxU7UKX7OMiMFzIwlo8du3B4eQwnSXA8WPfea3jbiqggqc++Q+u
         xNX0NmOxS37SjM7/K0j+U9tcCn8p68nxj8FM2jL72cBmDy3qQ4CDkNzDhPY7jsLuCVp+
         HasDc5/X5h9+/OYZfjosdrS+4woHxPMN3boqcXM4CeiaY/qvKLxwN52P4XF+W+Rr5A7y
         frx2/0y0S+3UjYA1zms7ufjIobgazhx1wxAIa9MX0aXkO1wllsTjGOS+BM39XDZaimeu
         QtjvcKKwDFjQYkBpPYrHN12Dyf5ya05CHmNu7PjicSB05ftc/hwXxA0e90UchyJI+aRX
         wMKw==
X-Forwarded-Encrypted: i=1; AJvYcCX8jfTwY3J5kQ0C9IAHc+kYm03rz6wwffdZEuCGKS9FmuJ0PyZyDJ4REQKO/QwpeS74gIIvF7GK1Y0yyqJNRRJP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Y+aprR22+aO9Sr+wrV0GIJ1K5jEvSbd/nwOuqdZhz7UT5aeS
	fdmqx+0dbjuyloXlp5vYybfgw4tm0eDKxkyDqeOOSbopPNJiPxYO/SgJE58NHuGNP+c=
X-Gm-Gg: ASbGncst2VCtTjJO42ypRH7SwFJw2iXNQv3QLJXJO3toKY/1RwtT0rxyI+/CdECm52j
	LO0YQzndrj+W2K4alwZEd3J0pW92mUvRt21UQDYUmE7PMIL3fF8pOJA5bS7PHpiTNnJdLiQAXt9
	ySa4/1Iou9qTGUGS6PmzCa/7/ezvCuDEUZB4CR2GwrBA+6DKy7EzVPIJD85UKKttG++gu4NxXj4
	SBN4bMCjAHApFoF20gr+MlfHbs5PASYIKfH4cPVz/Wbut8REMtgVtamKbHf1Omqjl6vG5tA8keV
	cv+psTr8pQcYiMGhICyU9wOkHdhuDYbcNCi0ZzVjwUAjqQZ7Xe449Ibs23aunqpS5YjFHvBRc3Q
	3AIx4aQ+7B+6YTRZnJBiFl2R9iol9SkXgwtHgLQ==
X-Google-Smtp-Source: AGHT+IEFL94JmGvZPp5eNi5FK7sGRKYEWI99/gbwaje85vEdJ5qlH9GjZqGIlwMIYqaQ4by2QSIJjA==
X-Received: by 2002:a2e:a442:0:b0:332:1398:5737 with SMTP id 38308e7fff4ca-333fa84dd73mr6683541fa.24.1755189606596;
        Thu, 14 Aug 2025 09:40:06 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8e1c71fsm3296301fa.48.2025.08.14.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:40:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Aug 2025 18:40:04 +0200
Subject: [PATCH 2/3] dt-bindings: arm: List actiontec devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-ixp4xx-mi424wr-dts-v1-2-b7c10f3c4193@linaro.org>
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094008_457867_319A50A9 
X-CRM114-Status: UNSURE (   9.46  )
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

One two IXP4xx device families from OpenWrts backlog:
Actiontec MI424WR revision A/C and revision D, both
of these are IXP4xx devices.

Revisions E and later use different chipsets.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
index d60792b1d995f909f621b3326e62d19223f6683c..b7b430896596aacb792983d8538b84f389cc5bd1 100644
--- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -16,6 +16,8 @@ properties:
     oneOf:
       - items:
           - enum:
+              - actiontec,mi424wr-ac
+              - actiontec,mi424wr-d
               - adieng,coyote
               - arcom,vulcan
               - dlink,dsm-g600-a

-- 
2.50.1


