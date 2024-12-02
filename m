Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DEDD78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MO7RndIL4M9BqBFNQs9/VUiPinRWNZHXUCcV/Hhz6kY=; b=jTvhr1AmRqUig5+0bZgrPwHX88
	NA8HcMkDNOzuDhC/0hY4EU0ctVDNRdp5totc4dhz3M5uQeJnt/npgaB6pVDCIvwgBY/XJeTC8wFlA
	KdGsiZ7ZqFaMS2+lttHPsvLKpKxVoIKJ5qFNryNNOAdNB5/nOKN51Vd7c014R8J3jruHeuWmPrlVs
	+i0NWIWO0A0EuZayPvmBM0KzsMVZYvPXou48Cjr3bhGD19Vc9a+pzSK7vkGRiR92d6abVWdkgh/y/
	SWinGTFa575Cx9O+9TFTPPhqZi2SOpnZ0enrKdAFzfNpMOT3yrSPm9IBuZElyQ0NoibKfZVrHYoGI
	/u+9OhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7d9-00000006UsC-0hqk;
	Mon, 02 Dec 2024 14:42:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7UY-00000006Spc-1cGq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:33:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so40037965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733150016; x=1733754816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MO7RndIL4M9BqBFNQs9/VUiPinRWNZHXUCcV/Hhz6kY=;
        b=L91Oe052GF4fSOvN3W7tpFdpadJ2jx8bFUmO+t2w32BKuwHxSTmMO/2bMcZi2YOcd3
         9rM8wxOmqIBs3DHuMSwOpDhukkb5yYC/YOwviZk1ljztIqdwhcvuhhhFhAo0TbfXPTGR
         hUT866nriF/6tuGm0boHjh5bAlfIeIB1pSIU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150016; x=1733754816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MO7RndIL4M9BqBFNQs9/VUiPinRWNZHXUCcV/Hhz6kY=;
        b=PfLRSFB/2lZPZWCgbvNFcX/7bwwhzAfMrkmQkL1WtHWyAbsLUF/hIlZx0UuUFLrNXv
         bfckkp6L/+A1I0MtIbBN1zZihR/n6OQ89JWy/73cf433o0i7/MolEUlk/LlAdoBcyOHL
         XmYNprk84Tnu787NGDm2MukjUjBEhkghsOaiXRTpnyBhQ3gZOyGK969NRk8DuTbXSGPz
         gI/Gq6k0Jt1n39VLJiSSCVXDnP7y3qOPD0KEns8IsBfLVl7uwfsmYP8jhjLjvDBeIeg3
         XvFY1HxpXyf9e9/OEupXU3N5aKho5eWdA41UXAfznN6ki4aCMN4LS5o0SmTGdNYE3A1P
         GDHA==
X-Gm-Message-State: AOJu0YzsXtTOzirZFUOXIosS6ehR9+FsRBZdo8GugAL7yD75N3qRhQMF
	h6haENAfnuQRCJ70y1FTGasO/dycKD1zsNzjNlTaTyolpOC0RdBcXMJywsuGFb/jKHW2z2QyGMu
	z
X-Gm-Gg: ASbGncuDxzGjv4ZOn4SV2JHY95636b412inDvHV5KvNgQWk7zkgiSjSYatC1ufL4ISU
	+/ZHojVjD3bPTIypal/HtPDwvjBpzZ8LSMNdIY8QW0ulwwNeGGSNndqHWraOi+5iFYAMjs08k6a
	e6uOuOvwN3XuuTcEIJES7XNSWNRtsR+xq16B4FA6AlIZwtbAit6T6s4F+J1jCd0l12k4FT+aSVV
	YkNc8V1V2FHZ8013b3A7KYOuC0dzz1q/Ra2Ajt36OExKlxj+hFG0V4hCFVmLfzL0fJGcr762Kg3
	waduBHtIuiVr/lElvx3TJ/y/SwAf1L9FV7dxIAtvtpu9UeQ=
X-Google-Smtp-Source: AGHT+IFnRH0g2zecuvkeg70vcEHwDBSX16i2HnGbj1QA8WdxkOgfJwLhEB0xy8ebIOY3bQXUoeRFnA==
X-Received: by 2002:a5d:5f81:0:b0:385:e9ba:acda with SMTP id ffacd0b85a97d-385e9baaeeamr5801500f8f.2.1733150016329;
        Mon, 02 Dec 2024 06:33:36 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4312569f8f.69.2024.12.02.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:33:36 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
Date: Mon,  2 Dec 2024 15:33:30 +0100
Message-ID: <20241202143331.126800-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_063338_706099_16F8661F 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Romain Naour <romain.naour@skf.com>

The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
SoC are used to drive the reference clock to the PCIe Endpoint device via
the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
obtain the regmap for the ACSPCIE_CTRL register within the System
Controller device-tree node in order to enable the PAD IO Buffers.

The Technical Reference Manual for J721e SoC with details of the
ASCPCIE_CTRL registers is available at:
https://www.ti.com/lit/zip/spruil1

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779..032cdd30d95f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
-- 
2.45.0


