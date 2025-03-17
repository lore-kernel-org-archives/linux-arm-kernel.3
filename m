Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05083C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w87Zh3I28Z1+Sqxqq72rJtkODwwHBc+MVhcgl8wWLzQ=; b=eQdpyybcsQpxqEktfxR525aBj0
	w15FEGyugDOdqW8OYDfMjKP4p0k1rXyfOC97Thb1BJP4JlRrBokcA/sdfqiVRcH3CRX5DvkbfgcQT
	lJtYiJqURIS0tyockQNwDZdEhGq+1PGsQ/2ODHQmYRY4bHWS/mI9YY8uNNSlO75S2OFthSY++U+VU
	6J75QrRYK6tSndS9K+lU8bG3GywEx5BciIUyyw1+Q05e4z+eUphYfBTR6qcsWik1uiSOQpvoAYMm9
	xDGCXXuVLLmSlYNJHMSq+3ju6WYC+UsKzlEo1N/t5uoK2upyfzy3EMCqlmKBoK6gZcF8/CCs2/NjS
	gwEMuCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBoM-000000032Gx-312l;
	Mon, 17 Mar 2025 14:51:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBZ1-00000002ynW-0PGO;
	Mon, 17 Mar 2025 14:35:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so2916391f8f.2;
        Mon, 17 Mar 2025 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742222133; x=1742826933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w87Zh3I28Z1+Sqxqq72rJtkODwwHBc+MVhcgl8wWLzQ=;
        b=ki/eyrR0pTRNgotqx9hx5oQFgCEmAlO1GYB8krRp7kH33rdj5b57yptom0TGcxgkeW
         aI3zExjrQCjQVjmPGvbjYsX0z525wG0lXIPE0OqPlnMMVSRdWYO2zeAePkszyH3dIGiz
         xxhGKO5pG1xFDWrDCJTJiCINZlWRsAEjN4k7NgqbT5CMvxZ25gQIVsFaN2Ymom+RKCH5
         KJDip4EzeB6w/UP/cUQ5fR0eqhaCtWIUc2ujU4U51QwH8NS5kDZtKVB5eOPdzW/Nuu3v
         M1SxMF88fCJPWU3Idlyg34UC4qrUIt1AkXxPOQ2JJHkHk3DEmbudZCuLGKJ1SyYejjoZ
         ffMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742222133; x=1742826933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w87Zh3I28Z1+Sqxqq72rJtkODwwHBc+MVhcgl8wWLzQ=;
        b=FUWOVtM5yanYL+kuvfDpOvgLWFmXFmTiDH8ac2wNIKmCLWo799lHhLt3MRX4/ohJQK
         XD/WvvfXNRaijk8ZNDbCv8oz7KVJJuMLDW9OI6oX0HSRR2V+3/ZOt+JSdBIMsxAvl7dk
         OwvucAyfXLO0aZNWW3YF02iBiQ2YRF8Qpei/zJmxgGdcQPI7rI12Q0i1C399+SBWPI0q
         N6AmokM92z7WnbuWTuWLFrKox2rIIwvHBhuXqTkACbs7xVH2+B058sEqqHnya9SF932k
         TmIKtcUfV4Ax/nWr/akJ8kqNtkuyuhsRhFg5GmelrR2AQiLRPnAZpf42qsxQBZUQ7JA8
         vg8g==
X-Forwarded-Encrypted: i=1; AJvYcCW8zK08OZCOkmd6hRW3MXcH52jImIQV9/XiK6najwUk/xZkGrgseHTOteDkKeD6R7547KYSerSzM46K5b75KAat@lists.infradead.org, AJvYcCXJvIErC3bqpkB1U2g0I5E16TiwgoaQIWnUpOBwiRf+JH0A0NgjRaH+ZfKmww123nKeHD4hOTwkJbIyKEuzhi2eUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznu+j3wpJlWUtUNU847SfuJNWi1B/0dN6fOYDTl7KiBMTMRbyJ
	a0MAJLGJcFaC/m6PI4quUlWxd0gsO7EaeYeWTrcfn7wu2SKB+rV0LZIZeIDIiIs=
X-Gm-Gg: ASbGnctUqzxZ0Pr/QlPgb0XObeEumQTuIA3aPtwtEGbu8OulXc7h/3IF00qJ75MeW80
	kbuKAfq0vQvKr7sywWwWajMZZrvjQijFBWrQZ5CSJtweBgi2S8LB8eqxNu1+R7UNHve9csOf1qU
	7mPlDmfl+iaDr+Kh+GdagE7lcN1qWmZARjdB8tas7JGjI6A0eKjqirLBXvBeNrJdmRsNMAlAsIK
	nYPiFC1RpQXAJQrp6DLLurfFv6a86gnN8w+uOc0Uy9IV0WWihk9fAOCdmil4JKwagHlMy+l9z+w
	dBUJS5ZAYqJk0e2MKX1/jntUYFwAAuM0TDVqCuWEQOCFlQ==
X-Google-Smtp-Source: AGHT+IGj2U95C2D/UDRSgWDo1hfyu3+i9z8iABs6gkm9zWiBp79gxMqCjLlCuVAE4sL2PJ8+U38jmA==
X-Received: by 2002:adf:a348:0:b0:391:401f:bfd8 with SMTP id ffacd0b85a97d-39720584500mr11131524f8f.55.1742222132717;
        Mon, 17 Mar 2025 07:35:32 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb40cdd0sm15208107f8f.77.2025.03.17.07.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 07:35:32 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] PCI: brcmstb: make const read-only arrays static
Date: Mon, 17 Mar 2025 14:34:56 +0000
Message-ID: <20250317143456.477901-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_073535_133426_70F5C20D 
X-CRM114-Status: UNSURE (   9.67  )
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

Don't populate the const read-only arrays data and regs on the stack at
run time, instead make them static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8b2b099e81eb..d258b571f642 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -832,8 +832,8 @@ static int brcm_pcie_perst_set_generic(struct brcm_pcie *pcie, u32 val)
 
 static int brcm_pcie_post_setup_bcm2712(struct brcm_pcie *pcie)
 {
-	const u16 data[] = { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030, 0x5030, 0x0007 };
-	const u8 regs[] = { 0x16, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1e };
+	static const u16 data[] = { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030, 0x5030, 0x0007 };
+	static const u8 regs[] = { 0x16, 0x17, 0x18, 0x19, 0x1b, 0x1c, 0x1e };
 	int ret, i;
 	u32 tmp;
 
-- 
2.47.2


