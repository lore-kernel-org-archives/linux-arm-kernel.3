Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF043CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 02:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uajlJ9IdqCFc/wQs8+7+c85ig5TZGgylUIfMTi3Hupw=; b=tBvE6yw3ZtLZgtRKNwvZstMxMk
	ysJuN+57nRMdDFHPyHdWRNOzSKGquql07t3rfW70Q9BjZmD+dYIuNNDNV3vBwI4Zsjl00A3FCfS9N
	UrW8UaBIpn9BhUmRthxuk0uadiXVd7d7WiRG5LkvBbCi2EVnIMiGzYwvCqxvYJ4GSERiJfh5SnYUH
	uWpH4HZ0MQ5s0MjsnpQFN8gSuUdXT6qX0f/IwX+I9C2qlkNUIfC6FdGmCNA8LLorfjN5jiez4IhIr
	m+Fh1Deqwwi/cTSFR7HNK/txKZNYf+0+AxhRAL6KvY3+OuBfqaxgndV5VS2kY3He0noLFz1Awunj9
	KlvxLxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQc8V-0000000CXCL-3GDj;
	Sat, 23 May 2026 02:30:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQc8Q-0000000CXB5-3GVr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 02:30:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36931e4f5e8so7087827a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779503442; x=1780108242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uajlJ9IdqCFc/wQs8+7+c85ig5TZGgylUIfMTi3Hupw=;
        b=XfuVyJA428N2oLenXggPZpsiMYhtskaGZ+rUvYKn6fSc1m741Du5ElquSNO02Fk127
         6vGN/QM5oY6qMXcd7UuIc+n06O0wUOcbIhGtyBhb7RVvJHUKZ72KXVjYolBnnxr7INWU
         N0fPCnocT5ab4SK4h3yu90MGCoOoo7pb6nYXHKm4Z2pxVoXvju76onlKLx0+F2axk2Fx
         mPhkfok0PHQRwMKX1WGsQHUYiSUu6KQZu6HGWKURt/++H56Mw3ANQPqAXFW2MoIIrSWK
         aPvNc8q4G62TCc10m9njILTI98rn67Sl/BgFiDJFGaxqDMkJtRLs8unqH/nh8/OpJNyy
         017g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503442; x=1780108242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uajlJ9IdqCFc/wQs8+7+c85ig5TZGgylUIfMTi3Hupw=;
        b=eqDqDPABu9ZYB8IIhYtvoqdRdNYsdnXlgebfK3py/ZsLe6AH04y8NtOXvDIJEJdHVC
         dZUMNoLOB8t6NOGsIYvuNOh9MYIVOb4Ceze5zSzVOPtrQaxNyX1hO+eN7wQUaHgQ0LHG
         DIAoXOT7lKwoSXfh73nxN4sMmc4+27ctAs39jAOW0bFVaejpfZmE10cZmph5BTUY0UOT
         ze75OxAzEoBQrP64X+28s+hAKQ8sSsS42a1crqnfOP7uRoYUl4VTkbkPHr/xjLBvpIvn
         PLujhP62JCcXGvWd8z49c15JnTpgzFkXLIib+k2t4oDF8d4tcHd/eV9646ywaosXOCsV
         SecA==
X-Forwarded-Encrypted: i=1; AFNElJ+ORD3Xx4Y1UenT5JEfTm4NjQB7bhaTPBouJKRVqZzizpW8lHfPtV4KLrc0lLQYNXJIuTlDv38JPpErFDxq2OlV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvc0RosNoxmKGmYHiVTtFlXma1UWImgZq8FWrYtDGh/ssHIXBM
	T2I0r5Ie33ZwkXZ8et5ufmTxZYwGTl72fAvn2b3vAJ5zzrGHI3Jt8xhd
X-Gm-Gg: Acq92OG4/q002wapZex8fgoQe5Z4oNXj5pnlU6LPyiITB9z55f2I2AtAXHkj4TDeuJA
	JOXHWRKd6ut8hUiatv9yIQbZQTkTQoRViWcLcoOpN1ilP4erglU5Yfpw2y1Oo1XfghUquVB2SS1
	sbQrz78uf1sHVMIcuz75yLHKuIBqhTNV5maUqkZnKbZqCbnzcdaXFqXj/+u+DFhgyBO9b5OCheo
	shRi+eTnUipFJTONk/R17nvDKBgwYJ9miRnsmZ6vMd112+lKHzH4G8DWC7mjfzwZnuN9dzwtv+/
	9wyCOcNoneh2TNJDZ9ZfuuuzkvTcu8QkPbYo7NFx0wY1d/HHNr3+nnlMx3Wdnt0oneS+lAT8QrR
	HMoUSZqHM+GWF5hSknQcbDM9JMeYSP+yYSy3pBxZ14QXOAigo0c3RhgWB0MWYYLK+m/FJ14iEsF
	+Q9hK8czDj6A1UV/MwBE8fZEf3sTzaXG/EF/Gc4o6V/DGK5xSxMVvRIhPL3KijqrDXmt9JyFWr7
	ugi
X-Received: by 2002:a17:90b:3dcf:b0:367:bafd:9431 with SMTP id 98e67ed59e1d1-36a67448b48mr6109633a91.8.1779503441893;
        Fri, 22 May 2026 19:30:41 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm3010287a91.1.2026.05.22.19.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:41 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Date: Sat, 23 May 2026 10:28:07 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin
 settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-potin-update-sanmiguel-dts-20260522-v1-1-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779503436; l=2395;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=ab75eXWBcB5dHj/FlHKk33zIKemAgVJpWwAxAx7n/ww=;
 b=xF6jdZ4fIdGmdIfPmf8Wo8rovbwKz+ugVULJfctiEEq+ALXfJ/yVbnX1LAQXDR30lhljFcG7k
 9iKOifluoJbCZ/C7YCPnaoo+c2o+DYZKVu7o+61HIs6ONQSJUEevezi
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_193042_826625_9EC055A7 
X-CRM114-Status: GOOD (  10.43  )
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

Kernel dmesg reports IRQ #44 being disabled due to unhandled
interrupts from multiple PCA953x IO expanders:

```
[ 447.047861] irq 44: nobody cared (try booting with the "irqpoll" option)
[ 447.063124] handlers:
[ 447.068176] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.087268] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.106344] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.125421] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.144513] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.163587] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.182663] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.201756] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc310>] pca953x_irq_handler
[ 447.220837] Disabling IRQ #44
```

The affected IOEXP nodes are missing interrupt pin configuration in
the device tree, causing the interrupt line to remain asserted and
resulting in repeated unhandled IRQ events.

Add the required interrupt-related properties for the affected IOEXP
devices to ensure proper interrupt handling and prevent the IRQ from
being disabled.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 74c8c1772109..61dbef45f8b0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -334,6 +334,8 @@ hmc_ioexp: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
 
 		gpio-line-names =
 			"", "", "HMC_EROT_FATAL_ERROR_L-I", "",
@@ -552,6 +554,8 @@ smm_ext_ioexp: gpio@38 {
 		reg = <0x38>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;
 
 		gpio-line-names =
 			"SSD0_PRSNT_L-I", "E1S_PWR_EN-O",

-- 
2.52.0


