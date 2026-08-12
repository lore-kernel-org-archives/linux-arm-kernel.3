Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103C6C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhRaPAy4Dl83sOqHYla210dTHhsUaJ3aEMwaAfPhLDI=; b=QX4PCNSYqGrZpXacFa9TfUlTPd
	7ypf4DqiJ1S8z+6QHlWDnjdLlnCQF5J3YBBr6NbSbDEIcn7/POdZUDcGGNahKRq66tSXcUpdSDoSj
	r/qXPzrSG94J0YMQ2Wb8rkxKdQTOp9vyeM1JA6kB6rHR9A0IUl3dCp91Js9JxT1V4CpWbV+QwS0Kj
	hWrmhVibzBtiYYZDwBvi+osZzXd4h8p0pd1iq0CS79g/UT4dRZ/xb2BE8m6OT/znqodHkWZ4uTtCq
	Oh9KhNnH2dRAvvicf44mOaZ5nepRYCg4jWq9xgYkkvXk8ha3QXgOjTdH46qSKHr1bWasMHdRXHm2a
	FQ0sGpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyGP-0000000FEEY-08hi;
	Wed, 12 Aug 2026 02:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyGL-0000000FEDm-05cY;
	Wed, 12 Aug 2026 02:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hhRaPAy4Dl83sOqHYla210dTHhsUaJ3aEMwaAfPhLDI=; b=MUTJFcjoxfVVLn1pvAzZ9uoH+W
	3A58ZSNzlIRaQWQcHYnJ8lUaQK7pjQ7MeVBJpdq57oW27A0utY8DS15yDI+EjvMa/ZEQHsD1EvyUM
	O5OPpVljwpjvGmydyaZYI+suK9akz7JsuuMVUwaRT8Too33/99+eIhXzm0/TJiodWdPSctIxfGdM1
	94ElSKG91FY8zQYpunACm1kaCpPY8nVW7+Y2HAddsdX1S+LDGVQI1mFm+HSbb4NlU5meHhfVTS4II
	66maumpQ5p0/OiaqS2VTyC5PHZxM8VIvy9J2ngVBN9mdZlAFV2gMP03dTjG2Ypd8oz+w1p3HOSR5l
	TnCsDP0A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtyG2-0000000F2WJ-2qB8;
	Wed, 12 Aug 2026 01:59:57 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C1xISs93194418, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786499958; bh=hhRaPAy4Dl83sOqHYla210dTHhsUaJ3aEMwaAfPhLDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=LfmX36E/Zx0PVSW7UIq4SaSqCv6fmaM75/Gig9He8kgy0SX5EixDV2qS8Kx405sJq
	 4rESmX0KX88YSLIPmX6WVIGawNeeZtbgLF0/9L2ZdLzD1XIn4E3ns84jqJ3vhjSd6W
	 Io+ICiwWnaV/8E8OBlTrnvdUPZ41okSRHJOLKYxKsjIVV+Q6/HRhHsSGRDXYJLwTHn
	 SGDkOf6oDDgh3f9ByIkFhS4FNQ2KiJUKr2o45OJtlaOn5eZ8B/49TigLA+rw9WCXIL
	 NTUIZTSA7ar/gEPljL3ljh+PCKcbcGbgN2YgFx4DjwYH+4fTS1bIzGxMNQ9APA9kva
	 mCa9T4kYtqhVw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C1xISs93194418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 09:59:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 09:59:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tychang@realtek.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <james.tai@realtek.com>,
	<eleanor.lin@realtek.com>, <linux-realtek-soc@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<afaerber@suse.com>, <stanley_chang@realtek.com>, <cy.huang@realtek.com>
Subject: [PATCH 2/2] pinctrl: realtek: rtd1625: remove unused group name spdif_sel
Date: Wed, 12 Aug 2026 09:59:15 +0800
Message-ID: <20260812015915.3477180-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812015915.3477180-1-eleanor.lin@realtek.com>
References: <20260812015915.3477180-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_025955_587946_06CC6AC3 
X-CRM114-Status: GOOD (  11.35  )
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

Remove the undefined "spdif_sel" from rtd1625_iso_spdif_in_coaxial_groups
to clean up the code.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1625.c b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
index 796e51f9dff9..88f2be37f743 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1625.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
@@ -986,7 +986,7 @@ static const char * const rtd1625_iso_pwm0_loc2_groups[] = {
 };
 
 static const char * const rtd1625_iso_spdif_in_coaxial_groups[] = {
-	"gpio_163", "spdif_sel", "spdif_in_mode"
+	"gpio_163", "spdif_in_mode"
 };
 
 static const char * const rtd1625_iso_spdif_in_gpio_groups[] = {
-- 
2.43.0


