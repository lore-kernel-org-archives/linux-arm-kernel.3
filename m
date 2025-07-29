Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08123C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SQyxRL212NH2CE2dAFaZIS3vSFyJbqnMjH8EoS/AicY=; b=tniAH4Fo1UbMMLmKe98QMmi/Hi
	IujowA4S/GvsXR7RAfejjVmXnide5RsTDC2RCE/dRSSubzpZb7+GKxCx4GhvSPPSvLyh7xiKehjcm
	33YQRcDCtvZjC19ZlkmezOoX57pTkwRh5rpVSFHqhJ1/u56aZth5ToUZIa9osrnQMTeO99Gxue4ch
	iOFNgrn9yqT/tWy4pocjsULm8KynnM6s8gQy30pGVWGezo4r1OXcdicptS6jncQPurxPWzGfkTR1D
	xNn4UqAN0YuxOTOq7olPfcnOkG/mm7g3bMTzYzDfZpHk2N658UUYqxLZ8fxCxhHaP3/dYfqmgPUgB
	Js9G453A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggcB-0000000GOSR-1eSR;
	Tue, 29 Jul 2025 09:27:19 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggPE-0000000GMK6-3zHn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:13:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7682560a2f2so859757b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 02:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753780436; x=1754385236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQyxRL212NH2CE2dAFaZIS3vSFyJbqnMjH8EoS/AicY=;
        b=b4A7anRrqduZpK8CskkRNRdI8aGl6V8On1BNIEttBe+2dSagHejqsZuwfJU29A29mY
         gwn2gXhU4njloTY1XJZ5GqTw3g3IMcqX6KBMUpu979vdsZB5ZeYIOAC9HitgybQGi4L2
         yZI0PLzgqau7o6b4Mk9yKy28MkKJN6oJcdsfC4G5tVVO94PfbklG2/E2pTPT4t++70iJ
         KpxRg+Fh31At3Zf9estDq3N651yDe2TGd2V/m1zp+wW4YotWr/mR+dDcBMfx0myNNtb3
         U1JslNd5Iq5mH78ExyyNbsqnycAMSEBzrUNTgRcSd8EozSTyLXwvQ2gQrz3B55541RQU
         OYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780436; x=1754385236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQyxRL212NH2CE2dAFaZIS3vSFyJbqnMjH8EoS/AicY=;
        b=tS/v1Kz+U60T/ZOSdVGpUnJBawx2wn6QjmulzrC7LV5921sIJlnpHtzq1ornA4TAwj
         xdN7dARBqPajnx5CgIA/2rEItMvIBL51sQykte8Bu6llNkDJvldi2fNBvoNid7hNBgi9
         HlfE7R7jR/0bG57HUzupotVWNBgiKnU4af8hkcowKV1cKE7zbJehF+vZ4KFcEOIPMPh8
         cOb7tR/kRb9E/kxGaSPycQG75rCO796KGcyNfX7dbNwPHb+0A0BhSYYRXOBW/6HC/gUA
         ygTrt+R48zkjPMRedCTHB9zLoXFaH87o3QRrGnmjGGErxZo+oYpPXspflBxUhCHLuqL2
         01pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAQXse6Hk/3bm6GDG7qws/aKNV5YlzSynFCMfhLbHID8QjLM4W4mqMaidE4fBqVPVjmSBpEye7DWap3JBbUmYS@lists.infradead.org
X-Gm-Message-State: AOJu0YxPr3pp/rc2lE2KqwkgmqzxYSQGWC3woospyJ1PP8acjBAGo3VH
	aQtKLYMmRFooq27n+FG58jFHuZaQrqCxxI07sqNt+uL4bZ+34mntD8CJXLqZ1A==
X-Gm-Gg: ASbGnctdDN/+k6Ylm64TRWGotwNM4hLlkx/W5BgM69GLWbsfoPSdFMi3iA6cslr1nlQ
	h3SAtkg/cZhbpVSnDW7LKp4Ap9QaRokIvAhImZmx55H/6YNuuVbQ865frO5Sj/3pTIcAZhlOa4F
	wyDp/u6keKKElLjqJtP9qF1OdwjwFk8yeSzEbW6x4HPZjI4JhdmO9833CU96VqarG8eNYkuvYsk
	m0caXpUBwoUVtWm4INyroTFAahIHOaKkzXu1hD5Iupq5dN1QBMOkYpbT2go8r9eILanUlOMA/z6
	v0z+d8y8WwaD9RR6rgbo76xyy085iCeCCEasbZXPIZejiexh9KQUdaFQx+lUkO7mCHZ7KClcAb8
	YbpshL6WXjwDnflRw+QA3+6QPW0FYLjCci+4r08uwHatZNsuE6lTdMannaCxuzNH1YnK6qGZ49b
	dsln3ukwsdeNwdutGgv51oJfVB1OhkZmTkOvlzicBPVOVEDAq8N822N9UhVA==
X-Google-Smtp-Source: AGHT+IEF+2Zavb47/riBr9cIbA+jDv2YfAkypoAz4HCbP7aW46kup2+kr9hS5IwmTEmyf3wzvvaWQg==
X-Received: by 2002:a05:6a00:759a:b0:748:e2d8:100d with SMTP id d2e1a72fcca58-76967298756mr3498076b3a.8.1753780435773;
        Tue, 29 Jul 2025 02:13:55 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e38d-c586-0429-5c72-053d-8858.emome-ip6.hinet.net. [2001:b400:e38d:c586:429:5c72:53d:8858])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b06ddsm7528612b3a.121.2025.07.29.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:13:55 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Revise Meta Santabarbara devicetree
Date: Tue, 29 Jul 2025 17:13:42 +0800
Message-ID: <20250729091351.3964939-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_021356_985485_8EE101AD 
X-CRM114-Status: UNSURE (   8.68  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Santabarbara.
- add sensor nodes for extension board
- add mctp node for NIC
- adjust LED configuration
Base on branch for-next

Fred Chen (3):
  ARM: dts: aspeed: santabarbara: add sensor support for extension
    boards
  ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
  ARM: dts: aspeed: santabarbara: Adjust LED configuration

 .../aspeed-bmc-facebook-santabarbara.dts      | 840 +++++++++++++++++-
 1 file changed, 839 insertions(+), 1 deletion(-)

-- 
2.49.0


