Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F13CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArYnu/1YanuqdlV21/ZctLMYIsPxKet83mcYTyOtQec=; b=HPs207GhbGHq2nVDHX0HHgZQij
	y+GHt4DfywC0y+h8pX6SqkkChaC622dImbdpZwgxY7EloHvUP02xVahHykIxiWKaRiqsOk7HiAnAQ
	eAnZBJbsYtyyvx3U/4kT4RDXSZ7jSSwCAuiBAVLVGyT9p5gEPeXFwlGlbAP7WFa1Fyiq166oczQm3
	f15z1s+qJtHwZ2sz7LHVwVIRgOeJh+1CnqJzucxI7CVAvIq5CmAwVAcLqwTTo5FOLONZcFQiORjCM
	zm4RIYiDAEHEY8mc9ZinaMjTHR8utygPBXgxM1gYwxwsBzpJrG/8v7Fb5H//TZcdnCCUrPLTsobXP
	mWKk03sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUxw-00000008MR4-2wxL;
	Wed, 24 Jun 2026 21:17:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUxl-00000008MMl-3DVz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 21:16:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 218D1C6B3BA;
	Wed, 24 Jun 2026 21:16:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0645B601C5;
	Wed, 24 Jun 2026 21:16:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F1C1106C8468;
	Wed, 24 Jun 2026 23:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ArYnu/1YanuqdlV21/ZctLMYIsPxKet83mcYTyOtQec=;
	b=ZFrS24GqxJYKAJxoy9vCQOrpfZcgIPX4nupird0dtQGbPOfrq5K85w4+9dM3I4kgnQQU1b
	xS7j5cKtUf3hTEUhPzEr7DM/aI4xGHfGpXNeDwXbebuxiMRrf0ogFptnLEVS4xpRHKPQZG
	TL2AXUkzoktLkRQ6JDUljTvL/R0D/k9RcIDsVeMqaBiqEFepjCEgt+Z748zSGpdgwCc5fy
	Y9xkKiy6TAw7SYBClX/8310oKVePASQodwOA60f3c13Z1BQOiWfLD2osHNmH3NTgO1kCTb
	dhDeb73oZjjqnuPSKkXSOhoG7hR+W+urvycKhp30zAhb25LQyCH74LjYwcFsUA==
Date: Wed, 24 Jun 2026 23:16:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 0/3] rtc: Use named initializers for
 platform_device_id arrays
Message-ID: <178233558807.1517260.17147492956958938039.b4-ty@b4>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_141649_982766_49D203AD 
X-CRM114-Status: GOOD (  12.19  )
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

On Thu, 28 May 2026 08:48:09 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> 	 struct platform_device_id {
> 		char name[PLATFORM_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;
> 	+	union {
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 
> [...]

Applied, thanks!

[1/3] rtc: Drop unused assignment of platform_device_id driver data
      https://git.kernel.org/abelloni/c/ba5dca876b54
[2/3] rtc: ab8500: Simplify driver_data handling
      https://git.kernel.org/abelloni/c/6e2f1f0184da
[3/3] rtc: Use named initializers for platform_device_id arrays
      https://git.kernel.org/abelloni/c/041ca8884410

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

