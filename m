Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA70E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 02:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Jvg0Pg6QADAYKLQ79BSufZAM+8nSNvmFLMFGULrsTo=; b=sih3Jx7TfNRDj3V9hdmXjrAYlz
	Sdsw61eCCh7uL2hmSqwhxkw8jFd4nDB5YGxmXBPFaIdDwcexvDG16VA9myMxIiujuJe8QSjOtu0+b
	UQWANPqlFpsIrwe+fR8va3zjZXwPF9pOLv3LBcx9oiais/tIxtNmqbapc+gJXQuJGGfUS+prHbFYC
	XUOspnN7gZAXELWJGaA+biuNt32l7U70t+eiUxZGnxW6DuayChkalLAE9PCjTTQ78HrA+yGg7fiOe
	vaZgw1Q0TCg66OmUcN7a67GPb0ObB3ylphIUHXubsx14rtDSmuZ+jXQpJm9+WZ/WL7UXwvI9t36aZ
	/VS0+PKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfVH-0000000BK5s-22b4;
	Wed, 04 Dec 2024 02:52:39 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfUG-0000000BJvj-3SKD;
	Wed, 04 Dec 2024 02:51:38 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so5608287b3a.0;
        Tue, 03 Dec 2024 18:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733280695; x=1733885495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jvg0Pg6QADAYKLQ79BSufZAM+8nSNvmFLMFGULrsTo=;
        b=iIzD3Nl7Ypmwk5aBmz8anuI0NCIhuxyw+FSCKp6WpqJD6VRSLEhxToEeO6Kw5r6D2q
         iXr9KxPRemIVN6UNMMr5KeAUcypT6Gtj+l4/BVFuPdXrJQMorafHHSFzZTAfrWV2ibPA
         vv/fCr62oe9nCyNQo4X66LkRt5yCUYDhlDIuhtWOIEYTuDeWeW24iyNF2WwA7PO4EHfZ
         iFZ4vvpfcMCELRG70pi2O21JUezOhiRWk5Wj4ik0lYh4fzsj3ud3k3GBlb+VLdCjc5Ss
         eVdts2Kn09kwMNuScRv7zHMjqRWsypLmEKLegbWzD0A5KPYRRQWwmMzKWG0dGyIfftc8
         /yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733280695; x=1733885495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Jvg0Pg6QADAYKLQ79BSufZAM+8nSNvmFLMFGULrsTo=;
        b=R5k2SpjxdAIIy30hDaTylCfRk7zcx+OqpaecY7ns1nvHcW8vdCYgVuLgQkgobsg1Zo
         VcP/pE6ZDf3+dqllZxRsNxHx9GysRwD0rMrtVHIB0IzKXrViFDM0TRncJfS6Z+JmssUs
         8V6wvOVH2KKRQBQ9kh64PbKu3ksZ00j5R2eqdJ1OumUkYXnYOXm2ElSrn8HF1Bcu4yY4
         bFU5cFtUEvUllyB2EafXON6MElItlha3Zc7cQP42TNQtnGmy4hKrViroCPwiTERva4Hd
         U1AdXuhWebjq81nE3Fsir1idmoOyRxBnHnsP7wInTrqwmlGr/IlBeNb8J1qYNmPI0lgS
         gZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCUmMNLkf2yXB/Se5JYqhwvhmofpyKQkx/7o5GF3OgV1lTqxp3W7jf32S4iSmHcWQ4a4a/s6WUUnUJ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzha60ecqiHzgVMlsu4mWvSixz4JC4koF6wEqCpy2rwRzOvLTS6
	q1SpnwO8N6clu8ILasFrqTT0oAmGkcTd0Hkm3h0XdJlPa9RBinWj
X-Gm-Gg: ASbGncvFGbF/NhHk86iwHcYKFgKOSSKOc1N2lpThRTGi1I2DNQBIWKAG+I81JjTFcQ5
	9F9/HZ3iir0kisWe/ElzfrzMrbtbrubruE96//2ePJ9ZnmBiarbZLB7GH9tBTd91ekButxxJ7KJ
	21hZf3Ad3z74Jceb6nhiPAEGxc9rI94S0E1Wvis9reilL4KQ1as2msqFHBwJiuzuSCvYbB42Wp1
	w9/GPwMWtaOAXKcdyHTV5acYSOn4W2S5NATEVM3DqPmMbuhayqWe1gCZIh7tPBxOxFdeeKpODBq
	UNu3bb+PQzFLrwd7vMjjDqg7WmlrEqOX6C8=
X-Google-Smtp-Source: AGHT+IFttF0U1tgPdpYoD0r2lWciPazvOLOZROv9q651a+C0Xkr8gVLNpSk8YHK8DdvLZdQM5K8iYQ==
X-Received: by 2002:a05:6a00:2e25:b0:71e:4196:ddb2 with SMTP id d2e1a72fcca58-7257fa63975mr5867476b3a.9.1733280695424;
        Tue, 03 Dec 2024 18:51:35 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7259114ec35sm74543b3a.126.2024.12.03.18.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 18:51:35 -0800 (PST)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v10 0/2] Add support for nuvoton ma35 nand controller
Date: Wed,  4 Dec 2024 02:51:27 +0000
Message-Id: <20241204025129.150525-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_185136_862156_D4075198 
X-CRM114-Status: GOOD (  14.48  )
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v10:
  - Update ma35d1 mtd nand driver
    - Add unsupported write page handling.

v9:
  - Update ma35d1 mtd nand driver
    - Remove NAND_NO_SUBPAGE_WRITE flag.
    - Remove of_get_property().
    - Add ecc.write_subpage and ecc.read_subpage.

v8:
  - Update ma35d1 mtd nand driver
    - Rename to nuvoton-ma35d1-nand-controller.c.
    - Use switch case instead of if else.
    - Move some parameters to be set during initialization.
    - Fix the ecc.read_page return value issue.
    - Add enable/disable ECC engine before and after reading/writing the page.
    - Return IRQ_NONE if (isr & INT_DMA) == 0.
    - Move the HW ECC related settings to ON_HOST.
    - Move hw_init() to probe.

v7:
  - Update nuvoton,ma35d1-nand.yaml
    - Remove required 'nand-ecc-step-size' and 'nand-ecc-strength'.
    - Add 'reg' for chip select.
  - Update ma35d1 mtd nand driver
    - Update space and comments style.
    - Add chip select setting from DT.
    - Add switch case which supports various ECC configurations.
    - Set reset before NAND controller enable.

v6:
  - Update ma35d1 mtd nand driver
    - Remove extra blank lines and add comments.

v5:
  - Update ma35d1 mtd nand driver
    - Remove unnecessary definitions and comments.
    - Modified DMA API call sequence.
    - Move the ECC check out of the interrupt handler.
      Check it after reading a page.

v4:
  - Update nuvoton,ma35d1-nand.yaml
    - rename 'nuvoton,ma35d1-nand' to 'nuvoton,ma35d1-nand-controller'.
  - Update ma35d1 mtd nand driver
    - Rewrite the NAND driver using the exec_op API.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   95 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 .../nand/raw/nuvoton-ma35d1-nand-controller.c | 1032 +++++++++++++++++
 4 files changed, 1136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c

-- 
2.25.1


