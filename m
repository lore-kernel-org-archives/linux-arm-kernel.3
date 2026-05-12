Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B66CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOwvgZaj8C8d3GPUA8TOM+3UpiD8i749mYQXLwcMoZE=; b=PQzV8rYMFyVAZ80DykrOiGpQTz
	BJv0sUhIdghQ34t600HyDVz6idvZN3PHqovPKHDWBmg9UsW9XMMNl/t2oQ2P/vZCd8iZ3yUXXrS9J
	YNvO6dI4dRChU2ScUzkoBNJdkGgdhCWWsSROmHe1lPlKNZGyL9Rm0scr5uPlIJ1EZW1nTbDyMAvRu
	2VKewKtT5LtEpAiaBOG4+7fIoAvPwUx2RK462ocX6zin8bmop/OVLcmAkkf+gLlYV1WCJVcMbUW+y
	3ABxIJKiN0G+pgPObMloljaBN7Nz/ovOG1qMB3M6LSwOzeI6OBSUeTZgIPCKThpgc9hp0SnleFhl/
	yE+gi/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt2-0000000FN9J-3IMl;
	Tue, 12 May 2026 03:34:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt1-0000000FN8d-3JXd;
	Tue, 12 May 2026 03:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dOwvgZaj8C8d3GPUA8TOM+3UpiD8i749mYQXLwcMoZE=; b=NOEvJVgPRAwkXjH38Cad/8UwrN
	iTEKIhtqPK0Mr1NA6OhQ9bQhroGzkg5W5wbC3W5j+03BA3AbmgzC+cnWRoUt9Zb5H8VnRtrfYbbL/
	Gn8nFgq36N5tmEJ9L7nxYn7JZGJIo2PynYG/8mvNYbVsqFdnX5V0JiYUq1zhSzAmBIhtD+nRd0l0T
	HOKmWcz1nvZYHOJ8qjosXBc0zM2CEEsQg//4ycW7CWZ9nppc51OQy0HfUSxYNMKwevRPTcc3w05qw
	kcVt4bituEU9BwAc1qU6b8NiuY8r9/iQ2+mUD2jtu+g20tcC2mt8rbPD+FNu3Bzlk6R9Zr5rFSjpF
	qHDsOZ2w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdsw-0000000DYbB-2B9s;
	Tue, 12 May 2026 03:34:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XIZS03571928, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556798; bh=dOwvgZaj8C8d3GPUA8TOM+3UpiD8i749mYQXLwcMoZE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=o//eQHsx/N3X3qO8pXBqvh5gG5QOP2Y5ngNpoV0FOzqeazt/8dUNdJmHNXCL+6tl/
	 g/W2xbZ2fibWQkDiaPMUse5UzjIgNZNpBEpmqO+IxrZbwUtIk7wTuRWO0eVxy0ckgr
	 w/RjJU9m2e0mfD0peJz8ObItJeEiNkfh70KDRAJ2t56wTGexki12FKLzV86JuGPFkD
	 cxFhyYNRH0xp5HIzuCuUiU8raVEum75EANdA72iWvqmqoTxD1MWupCxuIEbzctKx4w
	 PKnjcKq6nULplHkPqZz70SamIEkP9ANqcrzo+pkWmDg2H/rjcKR61AmY5jh6e6oZrM
	 Wu4XFJxd2G4AQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XIZS03571928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:18 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:18 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:18 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v3 1/7] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
Date: Tue, 12 May 2026 11:33:11 +0800
Message-ID: <20260512033317.1602537-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512033317.1602537-1-eleanor.lin@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043419_776602_A964FAB6 
X-CRM114-Status: GOOD (  11.23  )
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
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..504b4bdd75d4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -637,7 +637,7 @@ config GPIO_ROCKCHIP
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
 	depends on ARCH_REALTEK || COMPILE_TEST
-	default y
+	default ARCH_REALTEK
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for GPIOs found on Realtek DHC(Digital
-- 
2.34.1


