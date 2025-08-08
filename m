Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC43AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb9SPGhJWXTXoGf/6tPbKJmp27GLyG8PYrcUJCvekzs=; b=l32TJQx52ZHobtvjN507xvS4y6
	j7Qeimp5mnFWb7LV1d1LijOFS0qoG7E5tXuP0qI+ssDB6sKWLSvKQ1SJDGZopA2aoxqYCn8fHVNT4
	8ArpAv4PX9j4VFme1PNcJxg7GRzljnd5M843oIaiMpf4tt7Q9Itnk38M9I8jbuZ9RMBZ69JhlO50N
	wFh0f06jT+bPP+3Of20sHr7wVvqR0Sx9XcmYOeJ0g9dAQlxq2lrRIBk+M8mXpfXIEUTzXWZ2VULWn
	JhEbDENwaidz2ahIQW7zOnLcbxHePNpyNfxNtX4X92fpq6Ilda7nKCkxmg2SS89vdOvVvxzMpBKkR
	DBIa7slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPet-00000003I7b-1pm4;
	Fri, 08 Aug 2025 16:09:31 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPZu-00000003HcW-3StN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 16:04:24 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 05633C0008FB;
	Fri,  8 Aug 2025 09:04:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 05633C0008FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1754669062;
	bh=rC4NJQZYKBomAUkrkpro9lZoaI84/bdLQnD6f0Tc5Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uz7uoBRR44bYIJwTlPGgJd4aCiXrLUZZB7x3Iv5JiK3McTeFiSuwInAZwTeSkN+MY
	 hKEWNlTH5OFuUE9EMseWdxXE85PqfRlHuEnM/Es0/MJ2NLb+Px9mao+EogyhMunGxZ
	 3vGCAUOAvBadbeRpsJEQER7yzIPskyh9ZEm9hqKU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C598F1800051E;
	Fri,  8 Aug 2025 09:04:21 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Taishi Shimizu <s.taishi14142@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v2 2/2] ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP
Date: Fri,  8 Aug 2025 09:04:21 -0700
Message-ID: <20250808160421.40480-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713071826.726682-3-s.taishi14142@gmail.com>
References: <20250713071826.726682-1-s.taishi14142@gmail.com> <20250713071826.726682-3-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_090422_880484_E4896ACF 
X-CRM114-Status: GOOD (  10.75  )
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

On Sun, 13 Jul 2025 16:18:25 +0900, Taishi Shimizu <s.taishi14142@gmail.com> wrote:
> Add initial device tree support for the Buffalo WXR-1750DHP, a consumer Wi-Fi
> router based on the Broadcom BCM4708A0 SoC.
> 
> Hardware specifications:
> * Processor: Broadcom BCM4708A0 dual-core @ 800 MHz
> * RAM: DDR3 256 MB
> * Ethernet Switch: Broadcom BCM53011 integrated via SRAB
> * NAND Flash: 128 MB (8-bit ECC)
> * SPI Flash: None
> * Ports: 4 LAN Ports, 1 WAN Port
> * USB: 1x USB 3.0 Type-A port
> 
> Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

