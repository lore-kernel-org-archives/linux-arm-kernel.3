Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3164C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMyHEENm3aAi7+mpl/5ALuPQmurPsDkuZW0WhOp/NzQ=; b=DfFuO1Zo8d7mIkBnbiil+F6p7R
	rMbThjVRKTC0VboUlw27wbkQW9aQQYLzMuMYkTIsEDFad9m1Un7e2gfaEOZAhNq+dKxBs2HkAAj23
	Jf071FWNwej0udqP16EXb/vAddiZsWOLPo6aaRR1mOL2iR7R0xRt6MNH7KIZ2mKY/IXsXpfO9zQVP
	GJNdjGxwNsRDn1SQh2UNoVD+U2M3V4otOEv7JJPTtipkaL/HtjwguF+hBAkM2eWk7S6HklkUUtHPH
	RUnuSnv0QUw1tXnADfAdfc2pBwbXXZvVVy439fINy3zDc6dQm6vzCyN2zIMoaUcigX+GG1GP5IcjK
	7dQoVJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7np-00000008JDu-1jdf;
	Tue, 10 Jun 2025 22:50:45 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6OC-000000086Cc-0X2p;
	Tue, 10 Jun 2025 21:20:13 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5311d362528so245511e0c.0;
        Tue, 10 Jun 2025 14:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749590411; x=1750195211; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMyHEENm3aAi7+mpl/5ALuPQmurPsDkuZW0WhOp/NzQ=;
        b=idLkicYKhJnrTObveCnwmaxR7YrKKul9jKUkZnsflahrPy69pOEYsGaZJpzco/qthT
         mk+UbpGLGhXn4BQLN/2h3hx29rdIOvCjRGVFooEAqLEXAhTCEGnQPuJjXeq1k3nj7SW5
         xawT1W+T0hPu6w8Zwask33fYM9WrX4jI+Yy8uxlXNJ/qjydaci1YEzJeD9bFZ8eRig9u
         3Aglxf4koW/pAWAkZPHTD42nBWtGTFv4plLOWuikPgC4vQSESfh9J34cViU32IUFTMA7
         b2LCJ30GZYQRytnaoDeQzXdwpjGhvZwLd5QySp7EbDZUlFWnGrwbIoyweCC9yqJX3ovG
         wUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590411; x=1750195211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMyHEENm3aAi7+mpl/5ALuPQmurPsDkuZW0WhOp/NzQ=;
        b=qanCQLkm1k2E5+z8L2Btip3scU64d7FgS37p0RbcM64dzLLkM4Iv4pGDUnCD2z5y6U
         jQwptqHJIdZDLEfKoY1Ag6m68YiC+3lhvPadk47eapK7IDi8w1GYfcx+QOU/62nE6q3o
         AjtMCUnCCu8odlxPhGUdHE5EiIn7GMXNhG1NHnvFvnXq9ggz+Z396s2Igog8PKsRFw2i
         Ju+dYxRBPzzP/z5XkNC9GFbvxpT19NVSSWCZ4Tj8iYkipD6NbdocHA6AVFlbaxtg41Kp
         jDtwlYnz5W/T15TciwjhYrtogZg7nc/cnvrMuzOoxr/FSt/6YR6iHfi8rgoTDqRZF5oP
         bqMw==
X-Forwarded-Encrypted: i=1; AJvYcCUcx/S2+VQ4PThDDOTc8xN0aVXXMCsxoyLhclSZP4yYjc/H6YVAcMPE+3D1fEJh74WVGWYtUkEXQz11@lists.infradead.org, AJvYcCX7HjKK3xT2PL44nqsi73QbMukBQ5fST9r9S9P4GqRD0gZ9dsJJ92g7Xl2zfOWB6QX3Um6SuJMZQjwB3EDTvH2C@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6BnRqx6R3/k/29lyoYdH9v5Id5mAk2GTWG6IueoxL6oPulmIk
	YlA/g/Bm9sR9v74iykzCvWK/ZnOITdlV4fuHwKy70I02P2/ctfySJDvO4BHbUq0CGY4dwNFh
X-Gm-Gg: ASbGncuUWkSX0I+SDqidGzXZ5+Uljt754SVFDRgbu+HINsgEbYALx+jSqH7dCr7VsPs
	Z3vCmWULRmGb+9O/H1boMhUL/EkPMySzYZZHXRsXG2Q50ESiMNu/UPaDu3jc11kletncqJ9DyTL
	y4GDneJMIaIDrn1CdydMnT+TssKom38S0dU7rbtbtYCRQt+I5fA0bcN/LTmaj6pYPZeX2jDD6u1
	VO4HOM57OWwY4nCCvLf9sHSLTWdFM77jQRl+PeabAKpHPRV7ts8A7L6l8EOUn0cni8rasXgr0eu
	1FHGiJwz2JTu5XkqgTQbaa0UXS5YPuLoQRK+2ebyjRtkojeTHA==
X-Google-Smtp-Source: AGHT+IGMLQMogM9Y5TYRZq5x/+RY965YqubXBP0wkzvzdldN6Zcyb449bg6gGKSbqhDtgv+1p5DKOg==
X-Received: by 2002:a05:6122:511a:10b0:530:66e6:e21a with SMTP id 71dfb90a1353d-53122c960f2mr547052e0c.3.1749590410872;
        Tue, 10 Jun 2025 14:20:10 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5ce9::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113a7e71dsm2065694e0c.2.2025.06.10.14.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:20:10 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:20:04 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/4] PCI: rockchip-host: Set Target Link Speed before
 retraining
Message-ID: <87ca44fc3c34c5ffd3035d0d29b4ebabefed1c63.1749588810.git.geraldogabriel@gmail.com>
References: <cover.1749588810.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749588810.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_142012_168513_53DE3541 
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

Current code may fail Gen2 retraining if Target Link Speed
is set to 2.5 GT/s in Link Control and Status Register 2.
Set it to 5.0 GT/s accordingly.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b9e7a8710cf0..fd6f1a1d48bf 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS_2);
+		status &= ~PCI_EXP_LNKCTL2_TLS_2_5GT;
+		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS_2);
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
-- 
2.49.0


