Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C584FC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 23:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qih9emrfLt51YPunmCgNu7AxAy5Azl4N5CCRC5JSHTo=; b=qzwhu1H3ESlBba2xUBo58rB2aE
	DsbV6ko8hwl2grMiOVIJfN9Vm8eEIeKKryx3wWFDlg3TADZF5EHwF9hHsrwAIbyqTHtTBppEC2nc3
	izllqObTZh0ikTyL05rMY+GoTRMQul6dqXPZ4EGRRAzq5N6nrbZajkYkheHtHTVuo290xtyJKc+bq
	iThvWxGJuqwpwbBiFP9gpqbaWoDIhPRCBASUsYV8T2ph+NAe8jyVEXCXrpQc/x+QiDMJftu+IwHvB
	Ca7NGN96JtBn7Zf3t/NpJX9J2Po39mIp3trRUTU8crzjerPttz74fawJpZy7lsyQgFx1b+4W0yW6J
	q+NcxKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3OHe-0000000F8l9-3awv;
	Fri, 11 Apr 2025 23:59:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O22-0000000F73o-3M2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:43:36 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 644CCC000357;
	Fri, 11 Apr 2025 16:43:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 644CCC000357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1744415014;
	bh=Gn0befkxpjUuQ4Y7CTytfFWl+hOl1Eyt4SuMSid/He4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmPKP+VAODshvA1naaw6yZY6lZbDiPMTkksh5p35S/BMzfjfKcKv40pWyyRckeMc7
	 Q5tIVkUyGwP040Soe+2KyhAJtnex5tG60km5zbEFv5eaCv4dQUYkpDA736LK/pV1Zk
	 nHB5ZoIo6lFoyy3cWEkMrPrCfyx7bhOenbjv5+IA=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2CFD118000530;
	Fri, 11 Apr 2025 16:43:34 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Olivia Mackall <olivia@selenic.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 09/12] ARM64: dts: bcm4908: Add BCMBCA peripherals
Date: Fri, 11 Apr 2025 16:43:33 -0700
Message-ID: <20250411234333.1023114-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-9-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-9-22130836c2ed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164334_856575_D98E952A 
X-CRM114-Status: GOOD (  13.01  )
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

On Sun, 06 Apr 2025 17:32:49 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments. ARM64 SoCs have additional
> peripherals at 0xff858000.
> 
> Add the watchdog, remaining GPIO blocks, RNG, and DMA blocks
> for the BCM4908 based on the vendor files 4908_map_part.h
> and 4908_intr.h from the "bcmopen-consumer" code drop.
> 
> This SoC has up to 320 possible GPIOs due to having 10
> registers with 32 GPIOs in each available.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

