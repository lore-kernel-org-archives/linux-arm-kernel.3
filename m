Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F62C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ba8rcUXQdsLarFisL+/pK+7ENc59ySEgz7MRaAReypc=; b=vNzC0gGsV5fyixan7wJrzxleU5
	5ktEDFSw5bi3G7jR6X13JfeOZ+oeIHxHldcz8mC911ggS7aVGwEr3p4pt3aoXr+26ZrWinkiq/PiH
	N/T6ZUJ0+EWYwGaje50H7pEFMNauQL1WjC0RDec6f4kmj05gXXObpbq3//Nt2q9kIRRgJev3ClqjW
	u+ficoqXafCmnRsdaQLAFfq7DBdiMN/crSDzoTBx19wnHIJvcAUOTRcNpmH62LOdpM+V7llzCAfiI
	dl2N1GoBwJ3jvmHuriQaE5znZyp2AFjuUvHiY2BV15rkcj3sF+i45yXv2b0BocqgheayYHnFuP3TW
	jO+j45VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxMi-0000000EWLL-07iM;
	Wed, 15 Jul 2026 11:01:24 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxMf-0000000EWK1-2pX5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:01:23 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6662551100bso6032626d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113280; x=1784718080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ba8rcUXQdsLarFisL+/pK+7ENc59ySEgz7MRaAReypc=;
        b=qIhqkheHnyX6yd81k21fdxWCAv9vQyDuahygZuRy5gHBzBMX2xhuwhEecStLw1EPUF
         4NV53O+9Ys/jQAZYETaim9TIrWZ0xbiD1MNJnQq7CqrGzomShAtXGRGoTQm4JsHVnn5z
         LkXT1qMbFwQB3KjCuDYFpPpBP6oJ1bmDAacWXJ1mIXtOr1Xfd6NDE87kjdQO+NQUNhH9
         oGUViONMh4tPkycvpcbQFVQull9l8dOR6NDrfoV++lfreH+8AQF2R1BihQnvpgIoY7Nt
         jsp3I/WEtGriLEszQ17hOFVdDcU8OZO9OGVrvAIbepERHTM30hYTqS7ZArGVZGX4dEqX
         wLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113280; x=1784718080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ba8rcUXQdsLarFisL+/pK+7ENc59ySEgz7MRaAReypc=;
        b=a051tJX4QZzJsdUSBybcb+wv+fUZj7CxeD2mwav85BpdHB9pPq7lGKPvD+tW1EkF8l
         QtVQ+GNUK62sDGj07IWIDsqkFjHgwxapcW86pAwAMUydeghGzqm+jdJxB0jCOAbDa2Au
         I9/r1B0P9O6MJE3TP+rGU0Cq8/ZPE1GvvXf88a4fbQ7lC8LKwKQoxNSrRbnGVzkrLTkS
         3Onmi8HbiyyCOpxUO8hHhQLZQlNudurzB1kGtFByPlrA4MANaAnLNvVz0RBPH5L95n36
         0mL9grN4O04Zii4t45jqly7Mjl1CB6cPiaQLGRcgRSAGrp6EpzMB8ltJVLqRMIt0usg4
         b9Vw==
X-Forwarded-Encrypted: i=1; AHgh+RpOADWpvjOKwfYmnjxXSm+l/KigW+DzxbSfgfipACY9IcesYaB3hFilPPBbaptYGJvzLlYcGhO8o+okCuMID1uR@lists.infradead.org
X-Gm-Message-State: AOJu0YyDARq40DT/IvIPnIU6zy3LtCm7dnu0h1KeNp/ks5Tsz3nFDqY1
	Ovu/ZTxyQq7XTL9JYUQmWUd51ulQq73vUIxzz6sU57yOA557oWIphM7N
X-Gm-Gg: AfdE7clU26q7fP6hn23BLFLnya81RjTYvfszbboO0dDh8kv2EcWg8zLIzykK2XUi30A
	/Yyz+S5VKnK5M3bCzV6e54iO/l7wWWU1eimD0Qf/J6BrjdwcAB2dD01H9DmI1k8Nd36te0eT8sE
	AfZon9wQtlOP+JYXfQ0wrCNQGmpNe9EiaZBpaNXmljKaLf4Yb+RtL5C2YLKtB2RStAQN6bNd55+
	rTqHeQhbD10nlgY1DIb7az6dRsuhcMJHS5cYw8+sbl2UTxfMpV5qRHAP0iHr2EunHs1I/jf2uvs
	yrWyJMdLa4wvJaXuPU2qoPZtETwBIVUnyoao6QwyCnpWiCpHJnTwsvj4DSoaDYBXNJM2jipXvZD
	Eq3GSbkhJG5A9v1beVt2iosTosihKwlPDDpiCjp8sUX4oYgvnbnXYj3fgip9NUvIgxs5VV89vTw
	k94yfQ5HMAz21iKf72NUDf
X-Received: by 2002:a53:b118:0:b0:667:8b90:2e5a with SMTP id 956f58d0204a3-668078c895bmr3427781d50.102.1784113279355;
        Wed, 15 Jul 2026 04:01:19 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fbd8c5esm59066d50.3.2026.07.15.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:01:18 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] nvmem: rockchip-efuse: add RK3399 OTP write support
Date: Wed, 15 Jul 2026 16:31:05 +0530
Message-ID: <20260715110107.409204-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040121_718162_5103274C 
X-CRM114-Status: GOOD (  11.99  )
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

This series adds write (OTP programming) support for the RK3399 eFuse
controller, gated behind an explicit devicetree opt-in property.

eFuse bits are one-time-programmable (OTP): once set, they cannot be
cleared. Enabling write access unconditionally for any board using the
rockchip,rk3399-efuse compatible would be a significant safety risk.
This series therefore:

  1. Adds a new boolean DT property, rockchip,efuse-write-enable, which
     must be explicitly declared in the board's device tree to enable
     OTP programming from userspace.

  2. Implements rockchip_rk3399_efuse_write() using the Array Program
     Mode (A_PGM) as described in the RK3399 TRM section 21. Each bit
     is programmed individually using a software-controlled STROBE
     pulse of 15 us. The SoC-specific callbacks are managed via a new
     struct rockchip_efuse_soc_data, and nvmem_config is moved to the
     probe stack so read_only can be set per-device.

Hardware precondition: The VQPS programming supply (1.8V to 1.98V per
RK3399 TRM) must be present and correctly sequenced during writes. The
driver assumes the board power design guarantees this when the DT
property is present. Future work may add an optional regulator reference
to enforce this in software.

Tested on RK3399 board with rockchip,efuse-write-enable set
in the device tree. Read-back after programming confirmed correct bit
patterns.

Hrushiraj Gandhi (2):
  dt-bindings: nvmem: rockchip-efuse: add rockchip,efuse-write-enable
    property
  nvmem: rockchip-efuse: add write support for RK3399

 .../bindings/nvmem/rockchip-efuse.yaml        |  11 ++
 drivers/nvmem/rockchip-efuse.c                | 152 +++++++++++++++---
 2 files changed, 138 insertions(+), 25 deletions(-)


-- 
2.47.3


