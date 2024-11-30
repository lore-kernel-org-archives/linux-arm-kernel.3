Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C001D735F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aK0dV1gfejvgX5AVRAv0AO9jA2ssYUcI54wSBwP2RLM=; b=uK1MhHWHxrXx/aSjkJmc4cQO+L
	E13qLLxjo/5ZScEXWoZBJL5wBicU67G/9vAyboxEsjE1qZZk3Q7JTUbZnLxbjZkbnP7+d/8spTOKL
	XrIj2+HJllgKkOm1I6phs6ccs0DXAEOZbiPDolbRw+BNi5RYdkIejCPcaTOq9xQFkquxeoBeN4lqu
	OwnypYrvmBnNIesSRaD9nuu7FeDr0gIIETWWvepUaFeg0RPtDWo52TyeLOzYjLru/XOpV8UcR3/vV
	Ckfm0o37M14Zx/vjdCkRzfuhN4X6il+bT8ZWyA7FZZ5Kuo4w2Gm/PQk1b4XS/ldm0kz5oQ1wfPUCt
	Q6WXpDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKIv-00000001n4W-3HsX;
	Sat, 30 Nov 2024 10:02:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKHv-00000001mhF-0XFy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 10:01:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cfc19065ffso2973726a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 02:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960877; x=1733565677; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aK0dV1gfejvgX5AVRAv0AO9jA2ssYUcI54wSBwP2RLM=;
        b=cYSVwL5jIkC8i/Y4jU956YM0nI7w+uepV4Y57G480YioY87pC29hdhq/Z0hYFE3VPe
         ovi1FymSpBBKZroccMPisC346aaCv5raEL7XYpw+HUuge4SOoX7c3AezBnZKK4EJLJDA
         ttH4hXWM7KYkmWfbHwOl0sT7EyXgoFv5Udj+M6VxtbrA40NyZpKVmtE30SwaHiGSxmhg
         p4J9KEP3jBRoj6miLhxRAGHEPgx48dm7jb88iWMk7QlUtFwRrkEuojW7f+zDrecdf5tY
         3SsUtr9th6NKeB8zRUtEDA6t3PEHx1NlChWyedPi6Y4XMGwJ2GOIF1ToliseztyBqIvL
         QPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960877; x=1733565677;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK0dV1gfejvgX5AVRAv0AO9jA2ssYUcI54wSBwP2RLM=;
        b=jFh5UaqnIEVlvaUj9jFregQt1Jz+zHqjDhZmP1cM2lQjI8PsxFNPYrksarL9fgUXNj
         qiljPXyPfxjt3ZBb9LrZRbCQxSqZewCzcSB7bWPTC3dUb4UujQGzb2ijvnQqW3kxDXEN
         I5JzF5FyOLqUnufEBss8UlPBnOhtjiunHcpen+ILXSRpkj9Qgpd3vuMBr7hy3HQmuGC7
         UYOiBQ2jNgidboAFAsjey/8RreeBabM+wtHnH8bZAbHbzz6gjN6vpDn+A0+cClPTD/ZA
         5Mo3/Ch2JvFamKqp51z7eQN6211GkazVXCn7qwNbeFlBa+kJRg68yecsijir9LC6lbt9
         W3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhuxrUimlozOKoVbGBaeLdW7pEXD7N1l97a4TuGHx0dgq6xkG3t/adyx4Sb3oQbVZg2yM0AH3DjEd3P37HJV1c@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4C3UHHrC3PwuIbXxvftbZSs/nMWvWkEO4SNbF1/c1oiRXoR9D
	HhGom522gGO7fR5ELh0b5GIvaw9iaY9CKIl6bh2YaZpPNLpyxnOMD3NEjjjrbMs=
X-Gm-Gg: ASbGnctRL7y/LOueUM+niM7HutNaiP3+NwKvzIj8jvPDVOq4Vqg3wcEOIHBe2NUIxAx
	c51sGuRrCBCJUIO41OGcCjbLYMkSUt8uTQXDrTxFccm9/PCvqfaueg+3Vi6wljGeSYNm6MOYZwK
	a6xNzRLL2WIpg7wTQ76jBr+RRqAOeijdIRYc1sBkVWivQL2mdmsJjBiXMw6fV+oGVBXT7LgupdH
	xGY9QlVzOSBHw6sngTwqVOBGgZ+ZgRrpswqS/hdQFCNxdOPlO6Px5bplTvLDMKWYOqjzl1f
X-Google-Smtp-Source: AGHT+IEtv6gd869K+dRtqKZE6OGZWNVbaOzagbrsUDx5xx6VOeUmeXvzJOk8eFEsMgnWDlwVcluldw==
X-Received: by 2002:a05:6402:2116:b0:5cf:e3cf:38af with SMTP id 4fb4d7f45d1cf-5d080b8d46fmr14459310a12.2.1732960876730;
        Sat, 30 Nov 2024 02:01:16 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f5fdsm2670060a12.15.2024.11.30.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:01:16 -0800 (PST)
Date: Sat, 30 Nov 2024 13:01:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <8b0fefdf-0e5b-42bb-b1ee-ccdddd13856d@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_020119_156858_081604CC 
X-CRM114-Status: GOOD (  11.09  )
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

Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.

Fixes: c35a85126116 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 1064b7b06cef..34162ca14093 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -784,6 +784,7 @@ static int rockchip_pcie_ep_init_ob_mem(struct rockchip_pcie_ep *ep)
 						  SZ_1M);
 	if (!ep->irq_cpu_addr) {
 		dev_err(dev, "failed to reserve memory space for MSI\n");
+		err = -ENOMEM;
 		goto err_epc_mem_exit;
 	}
 
-- 
2.45.2


