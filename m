Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581FAE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UBQxKezogj3hUsBA+RD7NmdY71lrTIzCVtlr8uBqDlc=; b=ZoUeF+MnGJTCCx06nh43rqKTq1
	gJgpG+RDER7+s1x5GhfhLiV7LbUr2pr6AH8NWzFF3+/tj41Tb0itbQw1Pc25+KxRvwhxGUgnQCigq
	QTVWL4LgaYFLxtYoEf2KgECRRy0f88DVgmdz0geS6ssLIvyqUAk5hF5GsTRIF/9qt/bKtIWJTiWgH
	j/PRFcC1z3v5gCmWi7YI0x8UE3djAcC/+sYAavX749fQFPP3kplh6QjPRG7L5nQiGVa1dVXqcjXSi
	T+hw69a82THNUJjV3+bd8dI/LqZqACGvcmCRPzYXFMagY1ej/kKT9YmNfpeitC/XsK/qAsUgynr5h
	YXLKERyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp5W-00000001mXH-3gKc;
	Mon, 06 Jan 2025 15:32:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp4L-00000001mMH-1sYa;
	Mon, 06 Jan 2025 15:31:06 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso17053880a91.1;
        Mon, 06 Jan 2025 07:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736177464; x=1736782264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBQxKezogj3hUsBA+RD7NmdY71lrTIzCVtlr8uBqDlc=;
        b=FHNuSNRqsApjNFb1E59z4I1rbOzqkfmzf9bXuywWXh09JvhaPbo9EJqO7pzU+Zrhvi
         AWYm+1gUEUOMPUTfjB40WepvnQW0dSS6We1Y7aXkP9P3/+QfxF0KYg5Zggb/V2SWM0gP
         6zZ4G6SE3TyqKeEWMsx/hXc7xuF/4t/vsk9a5gPVGlp3zavFD8ZMXtidvameIXzjpis1
         Q/BvHF2AuRAAcAGGeh+uFm31NPGIfbJSDzScK/UnOE29f7610FL6NRUTb417ShlQtEoN
         pyobufo4SJfZs4CJQbpRWnNelqqL6mmdzTL9LDhCgYl4mYZBoSZjglxPVMQ5cQ2dkViW
         lY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177464; x=1736782264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBQxKezogj3hUsBA+RD7NmdY71lrTIzCVtlr8uBqDlc=;
        b=o6IU+g/yVL2m4gOkiINSNeI6vL6p7/mN8mnmBweNVKRe8U5f6WaAzndayMv2lsvC93
         YcrzD+IjzNSnLgSWlCHfKuBeu41ty0WzTzsDq1REIiGBdMcDuqxK46QXGx8ceSFG+vVm
         Re3ngGV31dPdI4sLaAYjx0Q21zrMZz0k1hFLaZTEHY6TF4+ns47My2srN6B7oy3Ybw7A
         je8uW7frjF9OPGCurRR/PWoJ6YYiXNonzS9kmt6hr4STwcYsDroqyCUzU5vH5eF4Q8DY
         C8/9bztdEm445VooF86hsK1UlUJl72fk4ujybkPDXF5lNTPsIksX2US6V8fxC7KkGbm8
         kxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl9wCk8gw3GclTzSf3cZjKMlcyrIjIPnY1MCOnxqQ9iM8Onnn/9GCgp+CvKOmXeMXL5zTkZDttHEMqTQnYfT8=@lists.infradead.org, AJvYcCW/Oib6+9RmS/rn1jLn0w/nKmVWUdvN76PSmfmDmnXa1C1eM7qyd/c7W262WDzS2laErb4veHg1gOH4xdabi4am@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+m41at2SM/dicTaGzHVYwXgeooJ3FDjG4CY5Qe2OrH0UCtnR
	XMXCMTYhb4o7tkLZ4YegrjAbREvkdGEf6mIu1pUFe/pGYnEwE312
X-Gm-Gg: ASbGncvT7ogVouL3MLrjDd0TGL/iCN4R/hGC8+SvQXyDXdBWXhrVcCNR2KVP70JFltk
	mH58TG8VLZNXneEqFO/NTtVDD27DPXgFKxF04E/LTFs8MA/lKSvG29W4EGAAJw7pW/KhdW28y/V
	5stF2iQ4o90/CV+uuMMRRDW/pIfbMEL3FhTaVfS9lBuRzqAyasoj+nzqSfmXmD2IZB3NDtwtm7S
	DOuTqyRa4mL5DKCUDiVihVgYj7Rm1N2oXWOuh+Z6hdxQROmFFnTsRlsAb44I/9/UTmmsuM=
X-Google-Smtp-Source: AGHT+IEpVXnpRJ3PoY57i1hGVLCcefGFkHNI6W7R1t5bdQbjKEwI0vc1uSmphBZQdLUQ9V1lS1z2Ew==
X-Received: by 2002:a17:90a:d00f:b0:2f4:465d:5c94 with SMTP id 98e67ed59e1d1-2f452e2e490mr84455334a91.11.1736177464159;
        Mon, 06 Jan 2025 07:31:04 -0800 (PST)
Received: from localhost.localdomain ([110.44.101.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2d9dd2e0dsm8507976a91.0.2025.01.06.07.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:31:03 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v1] PCI: rockchip: Improve error handling in clock return value
Date: Mon,  6 Jan 2025 21:00:38 +0530
Message-ID: <20250106153041.55267-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_073105_483125_DE1578D7 
X-CRM114-Status: GOOD (  11.20  )
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

Updates the error message to include the actual return value of
devm_clk_bulk_get_all, which provides more context for debugging
and troubleshooting the root cause of clock retrieval failures.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202501040409.SUV09R80-lkp@intel.com/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index fea867c24f75..ca6163f9d2dd 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -99,7 +99,8 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 
 	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
 	if (rockchip->num_clks < 0)
-		return dev_err_probe(dev, err, "failed to get clocks\n");
+		return dev_err_probe(dev, rockchip->num_clks,
+				     "failed to get clocks\n");
 
 	return 0;
 }
-- 
2.47.1


