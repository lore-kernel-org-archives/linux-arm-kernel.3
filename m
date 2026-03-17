Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E506FED9F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c72szpMqukm1t/rX9tsvQYHruDyYulr3x/fLqwG0cE8=; b=FxrRXzqCV+RU380wrO/Yt5OjS4
	YGgQFzzo5aca/qu9ZPUuqf0+71WDo9Y8YJvdOVnOb0Jx2XJuzST6bGC4M58ls7yQ6GauWIai1KdpI
	1PMmBGCWqWd5JH4xstpGFWeprvMIplL4ylzMDA2g6/jvsJmgtGRDCm6s5y7/WmGXmTDYjG/ycYAuL
	lbKKNYAAoQIaPwO7I6gKHGy4Wh3qIN4MNnQGBLlAa90eTZe/pp2g9+MRYKYFIIT0c0VF/N4Qt80Ju
	pDBYaqOqs8bzdAduLTQlE5EeW2m8IO9UbRPfFmxCGBm35k4N8p4R/R0srIRUL63voEQpnp/3vsJ1v
	jS0fbMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YYO-00000006yON-3WEa;
	Tue, 17 Mar 2026 17:50:04 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YYM-00000006yNb-1gXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:50:03 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0DD0AC00077D;
	Tue, 17 Mar 2026 10:50:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0DD0AC00077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773769802;
	bh=vAD9sXZbLh7A6jzF5HfiEFutEBTHjRV9BHmwmHck28E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oRPb9mJJ8wNo9+VS6s2kWnkW8kI6bsAtWyouhK6CC698iefB3/DInUL3Nao6MEgkL
	 9RGE1RP86DgvLyPDHs32gd1Ouen/g2IknoT94yK/W1UFyD7tUAnmhNCyQaLPfHG29j
	 Ad49BJKIiPECDg3TA/UeAF/EvxJHnRl2bD1/BDQM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id DE044A83;
	Tue, 17 Mar 2026 10:50:01 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/7] ARM: dts: bcm63148: Add I2C block
Date: Tue, 17 Mar 2026 10:50:01 -0700
Message-ID: <20260317175001.862603-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-7-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-7-5373ef82c50c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105002_457557_091A960C 
X-CRM114-Status: GOOD (  10.50  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Feb 2026 10:30:54 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The BCM63148 has a brcmper I2C block.
> 
> The peripheral range needs to be extended to accommodate
> it. The Boot LUT is at offset + 0x10000 so extend it to
> cover at least that too, 128 KB.
> 
> INTERRUPT_ID_I2C is at (ISR_TABLE3_OFFSET + 19) = 96+19 = 115,
> convert back to SPI IRQ 115-32 = 83.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

