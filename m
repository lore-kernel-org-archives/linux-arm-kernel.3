Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31643C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGullVisBxHPtHXU0eHR73ezsi7O9eK9w2hPnqkLNfM=; b=l9yOv0ICZR1g/O8sSCdRcYjxnh
	HcBnjKv4RFiAYHhdb0rGChmEudpOnRSwquKJwM4SpAN8CyAP57jBOt96v7SCd7tmwMGQX9goHk1Mi
	eaNV0viDFQDhit2F3JyxgBM4J8FxcDb73oyQTT6z4GzZtw4k809GRGz2t863l2Y4KuluBd49+/Nmu
	lD+iK4pW3Ae2CVrq5pe08EaLjyUenRDKyvNAr1QOLk9IXCdaoKfNDAUhiHQAousCUFjAfjuRY5Pgh
	CsWrbuOFypHHaQOgzq18fffQzqHMi3YzVq5hIORu9B9X2gp3UKKwHptJgGycIMsa+tnnz6Jp7V/Le
	UNuKLzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDJ0-00000003woy-1ktQ;
	Thu, 02 Jul 2026 09:01:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDIy-00000003woS-3w7d;
	Thu, 02 Jul 2026 09:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SGullVisBxHPtHXU0eHR73ezsi7O9eK9w2hPnqkLNfM=; b=ftNfW4qDWFUeRbGtYerSDMrTCc
	BuQsB54Qq7GbvpcDGdeues45FvH7goPCDup3S2PsuPVnI1oAD9TW25aOi6KwaSKKHAHXVZwpJjCpj
	XyvFnUkEfQ+lP1CyUQLW1OcFIA0L/HeqK4M6+QLDeyAIG07LZQcNZ2pcGn9wdbcJWyLK7j8z+Ji81
	17vWmomPqoS4rVXuMUAgFZ/QcIVz/zp9gVLY26Wlj3u3QuVZcw24FqJZk/0dGCYp0e0l/vF93b/fM
	7d3mRjOZyKKzCPJYY6LU4KX9xl0DhOonz6SWc7OfE2HHKwIA29XcLmJZtcHjWk0DJNpw8FRTm3MRM
	6/I/IFpA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfDIv-00000003aUv-293d;
	Thu, 02 Jul 2026 09:01:55 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66291GYc81817127, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782982876; bh=SGullVisBxHPtHXU0eHR73ezsi7O9eK9w2hPnqkLNfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=TgE+OIyMFlN+uSJvtM4qql8GfW+eq0G3JdQbOs+qaYad03MzACCopqyPxjcKtmlS2
	 C7rvGnDJH9RFyOoZD+0rY2aZZNW31BjRrLN147CvVLQLV7kXHJ4bN+f2GRub9pZyJ2
	 njqwRG7k7TVssEUuJI5vVoM7UgkziuS6rsqW8JVfQdjrenhQqeWLLSdeoF7Q9qVUKQ
	 8GLxYASQrn1YbUUdXXvlzTdXm5NH0G1HxMpcxPD7Br3W7OsfpAHzE4/0UEHpDnaecU
	 ST2iSP2x4W3vNJw13WZqIfYBLO+jc/J538pfEtq/BmcCRDqJKYfjyjKxRS17tX6WE/
	 hX8jmXVBXkvZQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66291GYc81817127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2026 17:01:16 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Jul 2026 17:01:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Jul 2026 17:01:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v5 2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
Date: Thu, 2 Jul 2026 17:01:13 +0800
Message-ID: <20260702090115.2564318-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702090115.2564318-1-eleanor.lin@realtek.com>
References: <20260702090115.2564318-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100154_007823_DEDB1F2F 
X-CRM114-Status: GOOD (  11.31  )
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

Replace "default y" with "default ARCH_REALTEK" to avoid bloating the build
for non-Realtek platforms when COMPILE_TEST is enabled on other platforms.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- None.
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..ed2bc3113374 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -646,7 +646,7 @@ config GPIO_ROCKCHIP
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
 	depends on ARCH_REALTEK || COMPILE_TEST
-	default y
+	default ARCH_REALTEK
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for GPIOs found on Realtek DHC(Digital
-- 
2.43.0


