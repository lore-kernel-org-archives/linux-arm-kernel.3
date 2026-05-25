Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA0CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAn1iVwcK/413PZPddrDU1ztUBuGSDHSiAFobjoCu98=; b=EuSbgv4jcsIpm7ltKuBkUSQ8Ec
	nR/egrT/TlwF78TX40GmNJm4P7XZWg0UtkGrsHjvM5k02gz93KO92/qJ8GeaR/hnBxuJoB4LxBcWB
	bHXm9Ag+IOvTBqXTY+Cr7tH8EZpLkKPyjwHMKuYGLKFNjmF6Q/KpSo4cpJ4Uvtnkgio8txhswpHHK
	Rn01IEErZP1nk/1f+gK5CdUYEsYp4Qj5QQ0DY5p3Wptit76KSz/Nm2vamZIi0jsnLXUr6f8vMZ49J
	1UJ1mxyFJ13KvjEXE7v9f+K2+ogGWdR803QNyDhWz91TCilYLGf7Qin5rmn5jq8Ijq6XET4VPSZzt
	9xeBNmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYOW-000000002ZL-2lzl;
	Mon, 25 May 2026 16:43:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYOV-000000002Xv-2Y6D;
	Mon, 25 May 2026 16:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TAn1iVwcK/413PZPddrDU1ztUBuGSDHSiAFobjoCu98=; b=VgKoxqXuoROXf4zxYwkxtAxuwc
	A0JlCHdbnoVSDKmtfGBfA7R3XrhWe5VZy9RjKwLb5jzokwyEt3oWUmNLbuumXPmbMfDFDYv8UHez6
	Q2F8npe6IoLI+pxwU92ZGFpmHxjr+5VLpwbCjnkpQMeKBCvIBXcP0h24kICHtqgUbKBJht3H+M74g
	u1U6ghOPHfOuOP8sYCC/AjS6Wkl1pMc0dQCNIGN1OkjxSYn3875UvLM2C/iRZWnw+pkiiPXKHHF2z
	D4eJLbV2zWvU8B5258DimknF099DP63FLhojsgtueTfzKHDJNfjSOHfrGfX2BLN3ZfHa/FJId6V6D
	YvurVGZw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYOS-00000009cXB-2FbI;
	Mon, 25 May 2026 16:43:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E0B2A27202;
	Mon, 25 May 2026 18:42:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNK1EPbJY_67; Mon, 25 May 2026 18:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779727366; bh=tYb7EiJrA7HY9h6NF25A/246WD8DV5q9e0H5fLjg+M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hp0HLQvqO1mb5Dsk6KPITtG7rPvFkpEOi2o/Oru9pe0b0MeolFOwfLECjLDA//ZGp
	 fTVwOWbtCJyskqQEmqg2jDO3pF7ULnA4nzf458Ai0aFExLs77d0UrOiedpeHU8s5+j
	 Imb5RzFMtBIJ6w0fqxyUp7H+2IYSybOsv33d7S5sVBy4PQvX49ohnjkycTfGvKJoim
	 1Dixd7VCGjW5/UHi1JPGQWXqatHABzYyZ1MPQBoKve+qgz2cvWBhOUaD3a995YCgJ7
	 Wcp/ji0TLGbQwZZhHUWdbNiqF1oHX0zndh+mI0j7T+GnhLQ8gakq64DhKk15KTpO9/
	 0580b2POZm1zQ==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: linusw@kernel.org,
	brgl@kernel.org,
	heiko@sntech.de
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 2/2] gpio: rockchip: fix teardown bugs and resource leaks
Date: Mon, 25 May 2026 18:39:39 +0200
Message-ID: <20260525164230.43307-3-scardracs@disroot.org>
In-Reply-To: <20260525164230.43307-1-scardracs@disroot.org>
References: <20260525164230.43307-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_174308_908670_64ECAE4C 
X-CRM114-Status: GOOD (  14.48  )
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

This commit addresses several teardown issues and resource leaks in the
driver's remove path and error handling:

1. Debounce clock reference leak: The debounce clock (bank->db_clk) was
   obtained using of_clk_get() which increments the clock's reference
   count, but clk_put() was never called. A devm action is now registered
   to cleanly release it on unbind. Note that of_clk_get(..., 1) remains
   necessary over devm_clk_get() because the DT binding does not define
   clock-names, precluding name-based lookup.

2. Unregistered chained IRQ handler: The chained IRQ handler was not
   disconnected in remove(). If a stray interrupt fired after the driver
   was removed, the kernel would attempt to execute a stale handler,
   leading to a panic. This is fixed by clearing the handler in remove().

3. IRQ domain leak: The linear IRQ domain and its generic chips were
   allocated manually during probe but never removed. The IRQ domain is
   now removed during driver teardown to free the associated generic chips
   and mappings.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 33580093a4e7..c804f970d823 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
+static void rockchip_clk_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_put(clk);
+}
+
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	struct resource res;
-	int id = 0;
+	int id = 0, ret;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
 		dev_err(bank->dev, "cannot find IO resource for bank\n");
@@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			dev_err(bank->dev, "cannot find debounce clk\n");
 			return -EINVAL;
 		}
+
+		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
+					       bank->db_clk);
+		if (ret) {
+			dev_err(bank->dev, "failed to register debounce clk action\n");
+			return ret;
+		}
 		break;
 	case GPIO_TYPE_V1:
 		bank->gpio_regs = &gpio_regs_v1;
@@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
+	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
+	if (bank->domain)
+		irq_domain_remove(bank->domain);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.54.0


