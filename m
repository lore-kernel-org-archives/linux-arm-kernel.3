Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mtIr5g1U;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AINF7SHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=; b=mtIr5g1UlEdL/ij8N7ugtAbDng
	WfM/qoQPQmvoCvxXZT7IKXOMGKkM+xRvqif5o//gLzBZA8eWHCrGTjRAix2N1jL8Q99z8fAWLd/Xy
	H/XaeBSYtPIuAsZNfgeBEftk8ih/HtC7Gti9KkL0ok5CPWPoDoCQwrBjOd18eoV1DK5Brm4438Lg6
	KpqqEVHhAXV8pG5NZkOOnJSl6tUkMDrM1RuQ9y8HlsxCrj3BpjOvvE30BO3GzYjisjnbbo0p6OC5+
	jv5nJnM0uascGJo+jQjOJ0cYMAhMDSPCx6QcruhNotvGPJ8RJ8zvU6Yv7gl3yd5T+KerzjJHex+Pn
	cloKg1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKWZ-00000003ZQg-0SSM;
	Tue, 03 Nov 2026 19:50:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKWV-00000003ZNf-22V9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:50:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so34827405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735421; x=1794340221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
        b=AINF7SHTXF2xQpXgc9vp0OWVe/ZehAQQH9LhGiFAJl2zwQc9CYzZWE2MKvEWnI0+MU
         HBbsYKUbOHEeTAWPFhKCGtqnuKvNS3oMH9JGXkLYGB+giN3AGnGife4aOwS/5n65ItwV
         Xnixw3fox0Q6fwzSA3y0enwbu80S4ayhkJObL39NxLveRurVjJado9kcFVeaph7jx9SQ
         93Yv3Td3xim/I9BNpACIYQ7Rr89tJpsHYnQeRitt3s0F6KQ26tuaELK4nCPK48b/83No
         XrseVQeu9O0WZdf9cimWqxtfeBH5uxzx6wDOjlDT5qHKbovqNZ2OpwGlN4soQjD9o9hH
         yFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735421; x=1794340221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
        b=SzwTbzawyzS3BtBf1EPUEhuFVuOxwJn1cpPMaJCM9G1vvZ6euKLxcqmpLCFm+gjL/V
         CMUj2a0+Jq9m6rF5hlwk2XZJv8C9fAldo/3SbvDNOBLlKvjMh4OGP+TC31GYOhSRDfWg
         azjLPuqUbK4kjh8GYjnGYHJQ1d/u2EQoxp8yg+irUyhPpFZcxdn4RTQGFPB/+SE3PkeE
         xhugHxxA51/faqJnRZloLvpd4wxdEw87ZHLIurCCbWYtdexZKurVqdV0lQvqYuzqh5sc
         SOf6jo8sGgM8QUUDg80ZIBV9DwCG584juRGQJte9g6wZNA2FoN/dN34YRiknEmDyY6pd
         6T2A==
X-Forwarded-Encrypted: i=1; AKwUvBwCFzXH5/KEE2hA1uy5m5gR7v5AY1PnK7lsRpCV04d06SXFYaRp4k761tC9Sey0DAh07yQzoPLnm+HUdVHSDnQ6@lists.infradead.org
X-Gm-Message-State: APuU4Z+x1JiD9DQLA8BSLFEvfBzfBElYLRomL0v4x4a+szgUkA67Q+uc
	CpVG265AdGTLlI7NhMaY336zLVq1MI4Lolfv/P0jaJIVCo4Wu9700omD
X-Gm-Gg: AYBFou0j7yxre27fnBKiBdYsEU4Ed4U/U2xgInWjKSDEmcrEfffqC8k++MrC2lf++xl
	LGAGeamGWp6MsVUiRtIShlt/MaS5MX+vdmMK8FKm9sDbkfqcTuV+qyUinzGGOceynreK3qepC4/
	WawQJRP8xkx2Jo+jxM7R2CUSLsjkN+dN8NNw9nbGpXgTr3sx4Ds5rfExUWXfMOZYPQSbWickrbR
	ohSN51X/urc6XFgRzSlfcBYPOdl7DxFG4B2RYVC34AtAChoLomni4pe88RoI1F03YQdQM7gk2Iy
	WfR4nWcVwURsokQfMDbwQOYDcheSDVXib1SwDBWFRr3Yw05L7Fn+yyu+Lf/AMA60mS07L7KrJv/
	nVKSOYssySi04QLNc3aQIlc3mucmXzdkVvGTdwiMn1QXv1pJwgPrtxH3C8Z4UUlCWWJIUVUjq5S
	twzZgrAgWCUQS/EbssnAcffXnM2ZjwehMWRN/vbhMttfSxoZzCxPomETxWQRXSyloT+8fIZuMxA
	s1AqSmdfh7R130fkO83xQPsYiLQn2p7diyIjlLvU0W80jIojWHxN7oL7akKFrGNPGD08P8A/Ate
	GVim/C3+oFwnCzSAwPqq8cex3/kufGOBE24+Oc514NiZ0lyrd1mQe08nBQHj0d0ZPAQZN+foES/
	Gg8KWVT/5S4TSFpnKIsAyZrVNNn38SzczOQ==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr143567615e9.29.1793735421412;
        Tue, 03 Nov 2026 11:50:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fc9d6b0aasm417802f8f.2.2026.11.03.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue,  3 Nov 2026 20:49:58 +0100
Message-ID: <20261103195007.9721-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_115023_569237_2F5A439A 
X-CRM114-Status: GOOD (  13.96  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v5:
- Rebase on top of phy/next
- Add Review tag

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  14 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 823 ++++++++++++++++++
 8 files changed, 1292 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0


