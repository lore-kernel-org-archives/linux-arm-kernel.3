Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD60CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rsUHVkzZaZp36viUnZ0K/EbyNwm+EVEnUQ5b1FzHDOg=; b=gh0bEl9vhD3MWMdoUBLRnCyXeO
	H/k40R/OP0B9kXEwRIJ0iF0m4EgedG/76XgkMFy4wnUpr0gYFrLOZmsvqETwGvOAGEsNaALdGUFQl
	4jDwX3vqBxnXiGGjdVTcJhqJedJv08mZIIgn7onGDYLllCj38pQgfzKrE5AM2QsdLmj7cLHPebSEQ
	oebTdtYKgNHIurmlVGAQw4DZ1rR2RIwNgyvISlGjiyn+z5wZ/xghLsnp+EXt0VaztXXQhKPgzmLwm
	Q7mc4pDflMk7k22ErHv53imEEXz+UTuTu0Kvy5O65w+LVFXBzgpXfkmwt57tvZOUtDqpJdm/jpYH2
	t+t42/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYG-00000001TdD-1ZCY;
	Sun, 14 Sep 2025 14:18:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYD-00000001TbF-3Hin
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:17:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2349342f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859476; x=1758464276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsUHVkzZaZp36viUnZ0K/EbyNwm+EVEnUQ5b1FzHDOg=;
        b=W8imCIwKjUnpEf9GS2oD4aWlHlIwe8T9byIeoygjiMVw5NuQ5cZa093zmaxGH8yepW
         N9EoZNnil8tvAZwPodZcc9mzpgM0iH4bl0yTAhnOeU+lAzht1WxDBwOceiAglo+w/iaw
         wSaOW535TSMBT+MiPJi512u9yE9Zol325x245QlWgUNzCrkmAyN4xkwy3q0smHaPxCfG
         VCDM/PelxWcwjjahDLDzNqWzeR5HLW1babhzOZBvhn4fAve4xdsSDryX1RMcag1UZ+Wj
         VxZRSewvh+MDI2n43haFKqzBvt61ff1gOxg6sTOr9AB1VcgpSP9Th2ji9l8tZVmxPkwX
         NUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859476; x=1758464276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsUHVkzZaZp36viUnZ0K/EbyNwm+EVEnUQ5b1FzHDOg=;
        b=MNlFRua2hAgdHyBMhCJNmImdih4TkPm2fu5e4BH+wDU1D3Hplv1g+D79p4+iCW/esd
         MGBZUDeuOZiIM1JvLPglY56G48D40ETeo02wq2UDABWMdRwWJTSnIf9g1g1h1YVQJKSM
         HfqEJRucsD1E5icfYE9iN0s8z24MzeeonWYpff/8ekQVjhR/6HoMLPv6rAXAZ69dvGqF
         uZIQnWCnL/WiZDUtGUtmiY5KMjOCa+SgkGRLVwgOFy14i5rSISlpPf55+h44sUyz65GM
         cijL97olfkyC6XR2faDNZIfApFwnak+bF9bGk+0PHkpevuSfd/S364kCsgpmCTvppmkk
         YQnA==
X-Forwarded-Encrypted: i=1; AJvYcCW+S470QEw5PTwQiRYSZnBQrET6fO3gzMO/tNCpc1hWGPwusVAjPEfyTwWHGIwzndYNqBq+UdJhEw/IjIcsGWoO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7GCKAWn4D1RfRmVhK7KsfLUIcuFHh/R7Vawhd6rL8/WskECz9
	T/lUjL0h/DYOiB2hDI50zXcwF1GfYw3o5Mgr3oJujX+O/2ySW6BtChFb
X-Gm-Gg: ASbGnct8usUUzpbGbKF5FnG1bQVlu79HfLVpYvAE75TmKvG3P7tGQ6ffkS32eoPvp3/
	Vlu/UIDzvCCXIvgSj5TnQzzksSGD0/bYpmCgxeZPASU1s5stNZXjHkSd0hI60KxBqqwnW6p+PLt
	RSS+GfPUsVDZOI93oeam+QocQdyd5YkmRbqbngvfnhQ4A7KcWmHiqHuWu5HXm3QIo2Fy7cJHWmS
	cFowvGH2wQSCw2NYSerX+o8O9einmZhRDP+EF8H29jT+Zp3f0vs8VyHBjnGpDpCR3rs/vXcD9nN
	+hGkwNgrwh9Yn9fQIuIC4lTc85mZ6tpN+RE+CpbFKKmSIolg+2d3SJkJPCsNothC7EriSnjCqmx
	Wx0P/SSbyyoAMj922TPPvi8F3KZmIv6FJ+aLQW53o+46vyBN3oRDyp+83YlR32Jv+noM01J2J74
	aT1sDeJBKK
X-Google-Smtp-Source: AGHT+IG7SrhD2n8YR6eRCNsiBeL2SRv1fue30YukLFK37eQXkOEUvQbSB53x/xhqHBpjrKKhjtKgHg==
X-Received: by 2002:a05:6000:270e:b0:3e7:9d76:beb5 with SMTP id ffacd0b85a97d-3e79d76c25emr4400712f8f.14.1757859475877;
        Sun, 14 Sep 2025 07:17:55 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:55 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] phy: exynos5-usbdrd: support the exynos8890 USBDRD
Date: Sun, 14 Sep 2025 17:17:41 +0300
Message-ID: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_071757_867463_1FF168AF 
X-CRM114-Status: GOOD (  10.16  )
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

Hey folks,

This patchset adds support for the usbdrd phy for exynos8890. The SoC
features 2 dwc3 controllers and 2 usb phy controllers. One of the USBs
is used for DRD, whereas the second - for host. The host one seems to
only be used on the MV8890 SBC, which... I don't think anyone has,
really.

Code from this patchset can and will be reused for 8895 (I actually based
it on my old 8895 work but decided to upstream it)

Best regards,
Ivaylo

Ivaylo Ivanov (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add exynos8890 support
  phy: exynos5-usbdrd: support the exynos8890 USBDRD controller

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  25 +++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 210 ++++++++++++++++++
 2 files changed, 235 insertions(+)

-- 
2.43.0


