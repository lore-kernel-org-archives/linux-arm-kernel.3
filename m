Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD95CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIjY1eeOUHP6TsN3/G2g4miYXOjQ6gGHxOCz2hPjQzA=; b=08dVCv/vkSozTidXwZnkTsIa3E
	SF65rxytz3g0R0hAI0igZrlPhUmwJBhB2xwDzLJrPrx5Tf0zerj9UKNVCo6FOJy6+NZu7E9k61bUn
	ZA521BB/bndBqtd0GYIuDzQTkjiMqs+7R5t139iLt5ZTkH0fL1UfQH8TL2PVUDwJC/XaaSylfE8Ce
	3gNshsLNzsn+wJL43kauYdSOQ5mK2Q2nr04uICokJ2MEErYmqxv4McF9kJ8ucF/Fap3aDgXM9wAPu
	i9Z38SbmfFl38p4/9ODJGdNhJR1ri2CZCyoOcCYyKIcreGW3WCn1XDjGDyZq9zWPXKj8sEvMfW8CW
	er9dsrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWMYZ-00000002ar4-0y5D;
	Sun, 07 Jun 2026 23:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWMYX-00000002apv-3Vob;
	Sun, 07 Jun 2026 23:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nIjY1eeOUHP6TsN3/G2g4miYXOjQ6gGHxOCz2hPjQzA=; b=E3Vz5xwqYRIf5dcYpTPCN86ebm
	ZtbzQhOoIwsO3pWVCmGiLO5R1TTePWTc51f8lz4/RVTmY3R5LeuPMQ6TZWmUrZ8NEFZWtqfT0R0iu
	VV+fXSIO3Owmsd4t8zhRlx58AW9QaBj+Prr7EFZAQZObPT2CiJjMURs43hOjap3krKttPjhAha39Y
	RfOzW4jRkaa0sgjxBurtaFXspR9SKqDjYmtl2C6yrgSYW1Kd/APdetMhh123saL253AcNg2Me3uGs
	JsgY3WWsLdgBwwHaG/iPsIhS9KDOZt92JbSmwRFhqcbsN0Al9urYdkyqQOFf2MbbRsKA6k1iJ/v2R
	jlDS1PCQ==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWMYU-00000000Gci-1PNe;
	Sun, 07 Jun 2026 23:05:24 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0035B26FB0;
	Mon,  8 Jun 2026 01:05:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEYT4_UcjqVS; Mon,  8 Jun 2026 01:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780873518; bh=Zz4Hn5p9Yljerh3+9LIY9ZhIchk/XuvhmnwJB0hVIoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AYvx/miQSqHwHn3q556VCXi54+QdXIKgTNJfmMg7zfoxRbBU1uLP1WX7LD3UASm7i
	 T+2GTpK0YYT61UJ3OvbU/3Un74vK3O4TV+97y0SJS4AOoBMY+x9fPtHI2pNlXOeWId
	 Rqljh8C7JfLTt+mNVWtolI1nVN/3siCR1WZ2sy0QaA0E3SsF//tpuSTM2ardpLSGJk
	 QUbYZDyKRvsOa8B/h10J4kCLljeH4U7sGpdnZDhIhVz7ULWrlWbS63vr2isAtRZnUa
	 nTzHv6R7hbl2b/qkOLUnTK4nOt6xqF3BpaEURHCEoWQgHHgXjr22O/NBytDTuy73TQ
	 rvM7x/kLSUNFQ==
From: Marco Scardovi <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpio: rockchip: fix generic IRQ chip leak on remove
Date: Mon,  8 Jun 2026 01:05:02 +0200
Message-ID: <20260607230504.35392-2-scardracs@disroot.org>
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000523_017798_BF789E95 
X-CRM114-Status: GOOD (  11.70  )
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

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove/teardown, the generic chips are not automatically freed when the
IRQ domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic IRQ chip suspend,
resume, or shutdown callbacks after the GPIO bank has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by explicitly calling
irq_domain_remove_generic_chips() before removing the IRQ domain in
rockchip_gpio_remove().

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index bc97d5d5d329..9478a58f1caa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -802,8 +802,10 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
-	if (bank->domain)
+	if (bank->domain) {
+		irq_domain_remove_generic_chips(bank->domain);
 		irq_domain_remove(bank->domain);
+	}
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0


