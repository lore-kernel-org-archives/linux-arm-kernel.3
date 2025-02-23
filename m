Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C96C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nkyzhUAIUILTehy2NCed83PYthn0cUXhH41BKltKmU=; b=0ogv/78wSRah/QXkbWr5Xm6VS3
	jA8W8xwYSENQnmwUwfTr1Q6rPRSJCQ0SiOv5g9ZRYnZmbbS1jz8JqT7DzYlwj9ctAuunpK2MoBHEw
	Hi0vrT36CVEdlYsPL1S7/AduRbApjFAyIWeEKdjFyPKCE47KVQsOPIeBSJ4gWMZ+/umesUeaBJb14
	eNpVE5rLr7Ub+YGeHPpse2Z4qBc8zY0gje8ApTr3jE3AW2K++KUTWaZGwf9zXcBe5qQzTo+GecSNn
	mKAX1OSx5U4qOlDmaXLVMVn865H8jAgBM4A6JQZLCZFOcJJMSJRQmCSsfDDkt/+eT4NBNStneXwpJ
	ouasmpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5pe-0000000AXXQ-2ZPe;
	Sun, 23 Feb 2025 06:51:18 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5oA-0000000AXNq-0ZDI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 06:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7nkyzhUAIUILTehy2NCed83PYthn0cUXhH41BKltKmU=;
	b=UgrXzXR7cRT8tR2FkAsO2LRawUq5GElco1X3tJXMpFioNkaIyfSQRPuZIi1QEJ
	YPVGkVFiZ/Wg6SWANKfz+kzKP6z8DUC+bMlGL2dnNA5xwdvhjrDs/c4nrtUASYiu
	xh5MfToa7LVgSetW/S3dAIn1+rgPYzMRfFgS1z/ZjeUYU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXDtT6xLpnBAiLCQ--.21546S3;
	Sun, 23 Feb 2025 14:49:32 +0800 (CST)
Date: Sun, 23 Feb 2025 14:49:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx28-sps1: Fix GPIO LEDs description
Message-ID: <Z7rE+kwcEvL1LS5b@dragon>
References: <20250203173020.39830-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203173020.39830-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgDXDtT6xLpnBAiLCQ--.21546S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryrCrWrXrWfJr45Gr4rKrg_yoW3ZrbEkr
	WUJr1kuw4UZa129a43AF1Skayjkw4DCry3JrW3GwnIga1Ik3Z0qan2qr45AF1UCrZIvry7
	CFy5Z3s8J34S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8d9N3UUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgn8ZWe6kuGqOAAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_224946_489057_97DBBD43 
X-CRM114-Status: UNSURE (   9.07  )
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

On Mon, Feb 03, 2025 at 02:30:20PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to leds-gpio.yaml, the LED nodes should not contain
> unit addresses. Remove them.
> 
> Also, 'default-trigger' is not a valid property. Change it to
> 'linux,default-trigger'.
> 
> These changes fix the following dt-schema warnings: 
> 
> led@1: Unevaluated properties are not allowed ('reg' was unexpected)
> led@2: Unevaluated properties are not allowed ('reg' was unexpected)
> led@3: Unevaluated properties are not allowed ('default-trigger', 'reg' were unexpected)
> leds: '#address-cells', '#size-cells' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


