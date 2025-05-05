Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B387CC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IEjDuBdOsPYO+y+tIF/6nSzBmphEZRY1ZsgA0HOsHeU=; b=3XyGncLZsZE/MUnbhS2FOkHS9N
	DubyuDUZ3CeyNlnHTfgX305b0wvvGiyd5lfhluQ5Sbl4hQu5n3KV/5auOYPVrECbosULMoAUN5Nw8
	WHocdHYfg3dfHSbSTX5UdSLPedjtwFZx4f0M0cPU2xpQEN+tlo2FoegKmcrp0fNpHQaGhCJgZXFC6
	/RXfsOmw7HaaOFmH1ZPzoVFdJC4I9/LONLAK/vzAOJ4uyPQcDZxxdjGWYnov6RxY58cUQnTwb9rBN
	IEF852sgn5mfWeLKmZDrMH+nNOi4IGhOdjtHOhUraBqmsN2GL8tBpEyOKtATsl2GRBJxudiEnHajq
	4hNPZw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Hd-00000008Nic-19R4;
	Mon, 05 May 2025 19:15:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1Fc-00000008NXK-2L3E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 19:13:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39127effa72so286594f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 12:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746472394; x=1747077194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEjDuBdOsPYO+y+tIF/6nSzBmphEZRY1ZsgA0HOsHeU=;
        b=QycHiQlEk41cN9jtdh6qeVrTbsafSqawOzGfm932xooOCxG3nIzTdE176KBY2Kugjn
         /Z5Hn5yKwZlToJd18+AXSmfAKSDAgg5wb3gszwJmD6lErHm3nkKJocXxumarWWjaD9Uc
         vc7+RVGg1u8LzFwwNtW1Yk31mEBsvBFJxk1fDM4vjiwMg8wg0CNTNl7mUTVermByedx2
         eSaaHK0n3K5hYp0SWFwg4xzF1PCgXAfKSdAQ7m4yTxxpE4A5N5Swx8kCpBA+XiCknZKt
         I9rvbVWYgHtRnlfp1/Prm/ewcs2LbTn+0uSr95nPdfTC/u7yWX+/Q1HDIpNGCMcficSL
         /keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472394; x=1747077194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEjDuBdOsPYO+y+tIF/6nSzBmphEZRY1ZsgA0HOsHeU=;
        b=wjiQyFtuZoEKO99Mh8kfmSv/lsTugk83emQZ8d50o7W55nitOp5gEi73kvpn0ISbQx
         79yiQlMbwjzMjebPMg3w79O0pFGCB3RxFr96urCIKDBErWUfRrpXcBURb70mtDun6DrF
         YfPEw0+8sybng7dvnx091du37M/d72m3auKI5X9hQo/6X5bk4kerIlj73CUzMHQeulUD
         AGmuleSeg+olXdol0coucYtwAmSuoWxSIPizwvPN39j255X+Sag6mkhn+lVf4ArrnlyI
         Ra47bUxMwPvn+CIZ6KoaSiLPlcpkv/+fKHnXFWvWyUDQIcsfYb+CySox8rfZcth3kaHc
         jnpA==
X-Forwarded-Encrypted: i=1; AJvYcCWrfznYWqp/MWf7H2WvRB6giBBYg8GEcZrbyGXJANxFKgJBVbeeyg6dsETeeIBYFOJyxlVSGWimcI35nVwf4eIN@lists.infradead.org
X-Gm-Message-State: AOJu0YzxC3z1VGqcnClcKfutA1fPy7AKyBXTmrrTjaf/o5cHMuiaLiIe
	QOhM5HiInhxWGHxT5sYJgrd1qvv65Nl5zrkur3yCPktb4BCzR8n0dS2WNE59CVA=
X-Gm-Gg: ASbGnct2ur7qHbcLGUyUk9Q3zc6Ebi4TtaRoE+1aHRKAOY7+guTlyBispRqv/xjSzWK
	scGm1jRarGvQTJu7lKBU2n1MU8I44+/Z88tmzee023Gzi/CiRy02h5hXqIPx/J96Vq7EQVWdkrN
	IJJrOi5FJiPnipKMXWYU3cbl1WrrEseL8EUxFVmJDXOY7muzAWnhTbeD3o0f77Ebya7K0J7Svfq
	6OuR+D6ilCJao89FGYWeZ2XCHvYIib0KgPSe1e0RuZZaS1m/P9qW3trlngln414mRBeehzpgInQ
	UBHTCgIwBKwWGwYek9V+6EKPVhBp/BOKAypvjy6alSTstoaGlQ==
X-Google-Smtp-Source: AGHT+IGnEwPXSGVfzEWgeXcfxl9O2WHXAoBamZsbcNfubSHzkp0c2F2nBnFlg8hKndBC84tAi6bDcQ==
X-Received: by 2002:a05:6000:2485:b0:39c:30d9:48 with SMTP id ffacd0b85a97d-3a099adc58fmr4225096f8f.6.1746472394539;
        Mon, 05 May 2025 12:13:14 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae32fesm11060549f8f.22.2025.05.05.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:13:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: broadcom: MAINTAINERS: Cover bcm2712 files
Date: Mon,  5 May 2025 21:12:56 +0200
Message-ID: <20250505191255.304500-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=HAR08SHskoeKoz/2PbQPFoZW0IvufpjYIUDh6fOQdZE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGQ23mm8iJikWukyappwMPXe0hVtMEVeBU9p62
 vIBhURgujaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBkNtwAKCRDBN2bmhouD
 10RnEACTlcYV4pNmTNQR29gUDZjXOND+/zxx0JHufvywe1G1Gv1h3JzqN+wSkCOilaVN+aXonNf
 hWgmrNzxMcJLAQVzR/CneUFSnsfjv4K3SyvBwoWJYDwNok6PWo11yOmHw2vm2egTK7uue1EDuTR
 VpZ4lwY5MTvkvytbm1C/xFmF0GYgjNGQQLD2yv6aHCfoS6Q9JVDEbkO5FvXefLf2cI2/p5fsILD
 df1pVrYBLj/TP7U/5atUwvls/2zfPU4rAn1PeRkdM7300ln1fYfLtHlsqB+5qsdEt9d8bS8bAvb
 +CtPT883nuncsj2WC5z6njl0L8SsaG7HrnmCPb1tzlrMCAXeOV9lQ2MDdZ1vfOx8MjLKxFsgg7B
 oNEzoiZKxrlL2n8ge0qcxBl2tXWbiS/e2FNMPWC0qPCUCXtmqa5A2WT/TiPNjpzEeOFKOBkmqQz
 EmjuD0ZEU4sKXORvixLAzq4Ds1JiOc+NzwIcWIEVy/Fh29u0AVmkSWDxW9eBy77ZnFt7Gt4Ex+c
 qrS/Fr8PnAYaXha6RTgs7cszdBenhGZ4aOp8WI6iZbfxHEtYtFNf0VFNWrFRnitTSUtsZ3+xbb9
 QXZ9GH8jA/BlGXpLxnrmVTO6rixpljs3WL5p4PQ8+MkyJJnkv3DOLBBAR5RLlbbRFehnHkXDdMg gVd9M6KR9LQ1v9A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_121316_593964_779C555F 
X-CRM114-Status: UNSURE (   9.82  )
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

Add bcm2712 files to existing BCM2711/BCM2835 entry, so the files will
not feel abandoned.

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6768aa56a311..74d2b84afeb2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4605,6 +4605,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/staging/vc04_services
 N:	bcm2711
+N:	bcm2712
 N:	bcm283*
 N:	raspberrypi
 
-- 
2.45.2


