Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F87606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N5dVCQss;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhfPl/Bj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=; b=N5dVCQss7T7jG4
	p1E8ndGITDk47/I8t2YDJt514Um6S2qLyhtoz2VJ1EFgE5gPwx8wJjLDgizWxyyenkkfBYRe9Csep
	mbRRG+CUW3Grx2mLYswzY2B3hPaXaHesjMaS7f89YXAVeA5r9fEB3KGz81+eKueja91DraWtbXG5B
	OWJio9EC/sGto7kDx6fNGbs6FJSk943gOBUaRTpHNB2cOWq03RJiIkiA7cksmL12fMbnZZ964nqXi
	+RyBg7Fi7qJo8LjMJQAvNEyHAqjsN5rr7jbYRH78xAlnSm1GcrBlojD/0JN/YzeZiByAqry8D+4rC
	zrgLSJ9mJ2mz1CrOTn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpGI-0000000GARP-3uhZ;
	Mon, 02 Nov 2026 10:27:34 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpGG-0000000GAQt-1MeC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:27:33 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-353804b591eso5006607eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615251; x=1794220051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
        b=dhfPl/BjhA7iLgrewgVKnlCFq+/IKd94kUPWds2ZRhEzSc3F9yHZdbjqQAJ6imoQBp
         7cUrVHCGWi79CaWc9yh/dRLUgsyfUgxXWTL22ma3NCwVgqK9QCx+pJYu/9IrfnyZIqEA
         PoTmK5vXlMWHnnhhNHfoM8dkXoKtiMHC224CFSzccvsvjwSPY1+MCBnaikiAducJh+s+
         s9UzTPqBmSI0s5cbrXLqqwJ3eEV7es0wj4g7HtCmxDaYR+CGAUtZrJsa4fPN4pRQbFVI
         HuPMdjhc6UbSNhEkOpEkuAJig3f7gLSFLty6d8uDx85SXNmPUj3+OqZwJfpH4fKS5IzV
         KfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615251; x=1794220051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
        b=0MmS8BHbwszOPavCgJbGTAOzlu3tnLxfKtKkYQV+lepMF36hcejJXBOOjQj/K8uU91
         B5UX4N+8ZVtHan7JpzkMALZN/jtM0zhM2UNl7r1ywoiwzXcb5rtAqe414Y6LS94W1oti
         TzFtUt5xiChiJbq6C4n9bYdxDIO2iuIKU5zbJpRsQL5Xir36MK4wZVU8KQFesE+0rd6T
         A5rs58jQeZ85tDxGI+676f2iRcdcrabaT26MQP4raJLEbaEh45H+2qxwubFWQ4FlEUR/
         RKhIzE3zIKyha+jXVOKb8UiFOUMdL6Dcy0t/HYqcq+buqfG1ac3uejM1WXGj7PW38w4Q
         n3wA==
X-Forwarded-Encrypted: i=1; AKwUvBzmVDHp5pWOVmhIUbIhbXHO6WmlYeYkfCoBF1AZCZ1PQlvsuBzdRw8LrKuvorwVOBvLxhmBbwB6yGhzIZ6OOtby@lists.infradead.org
X-Gm-Message-State: AFq9FYLohjfOs9AesAooCbwm6dZdDmFGQyz9eW/4k/6fymFFVTlwId6z
	7oJ4+e46roltAFnAtwcgeTY+sogak9TJUoIwL/4SGIE5GMvlz08vUQdR
X-Gm-Gg: AYBFou0YNE9hw1jVJkBMM44wK6FJInBioCHZiGsigPny1BTQv8sTgpypEk7ocSRQbHz
	lyUCACZkVD3JwzIzbXh+zdL6pljVBXfwoymSfK2baVV/5XIC7tZwDVB8lNR2BahUk8lIh6WcO4e
	m5nePQ3uQz8setY9ZYQGI1iThl/GDdd0M9eZub5FDnG7F/Ug81oscagZ0o4qnltRTAf4Gcxq+bd
	ytCOvJlAbL/HDS/tx5+lBcarB+yxjnaROZZ0VvTNbdNhFYVSFwXYMzIr25vDo/vb3Oaeh3lEnMm
	ztZmpneUb6m47xZ6IRpgXTIYIGUS5tYcEeBQ//3vgYnlid7AYTqvGYqENm34lAtcW+alVylHeDc
	AtdICm3lxRkCO7RTY/OANXKe3lPGZLglE/wSvgzh7lwRmjv4LsJ6LE3FxgltuRfXikMsZ1PlLsT
	URR7zU4Qpy8NpK2SIibmwoVSgJIg+PhnZkDp69VNsgD7JnEh9XHdyFHAqg8kSRGFQeyilJm92XO
	WqfB0TxT2N0ENIAc46TYA5qjZfMPz8NsIUlDSkV9AyTy56pfdm2JIXum2N0wZTVGgysNd4qqJ4N
	YU1DnRh06gN1r5CmO+kN90fcexiMiziIG20zRQ2AkjU=
X-Received: by 2002:a05:7022:f409:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1ac5bda5860mr20263781c88.22.1793615250911;
        Mon, 02 Nov 2026 02:27:30 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:30 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 0/3] Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 15:56:50 +0530
Message-Id: <20261102102653.272056-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102065645.121046-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_022732_475118_072F4074 
X-CRM114-Status: GOOD (  14.00  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds device tree support for the ADLINK LEC-iMX95
module on the I-Pi SMARC Plus carrier board.

The series includes:

 - Add the ADLINK vendor prefix to vendor-prefixes.yaml.

 - Add the ADLINK LEC-iMX95 compatible strings to the Freescale
   i.MX device tree binding.

 - Add the common device tree description for the LEC-iMX95 module.

 - Add the I-Pi SMARC Plus carrier board device tree.

The module device tree describes the onboard peripherals and interfaces,
while the carrier board device tree describes the carrier-specific
hardware connections.

The device tree has been compiled and validated using DT schema checks.

Changes in v2:

 - Add the ADLINK vendor prefix to vendor-prefixes.yaml.

 - Move the ADLINK compatible entry before PHYTEC in alphabetical order.

 - Enable open-drain configuration for LPI2C8 SCL and SDA pins.

Hardware: ADLINK LEC-iMX95
Carrier board: I-Pi SMARC Plus
SoC: NXP i.MX95

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 5 files changed, 660 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1


