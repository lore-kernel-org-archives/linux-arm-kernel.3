Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3441E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWQqrxFkkUH5Zguycmg1j2v02Hsc6l/EtORHqrbMoz0=; b=l6amHcqUOL4RpdOjvylwq9rntX
	GHqI82+Y2i6JetxYIiOys4zKjKQp3gWF8GrVapqkn6OS2TPN2IU3RgnDzOjd/b8q9Nzs3szk6UO3G
	a+ffdFjMLRgIcJxNfYNSI8WHq6A/3peK/UF6/VH7giyQImTaeibAp/Czo3j2C81TYEC39L3uW4lPj
	Y4El8OTLOFQEpqaShZHanTywGlEnSn5T8zJUTFKEnwe3eTVA64l/ADs4ceakdogrzvIMctu4gY6fe
	bw37BCkysd7AJZ8o0uMyI3z1iCxrsmFBHCWForP8YMcuT0FICYU3jqZ57u2IADDVAXNgVnHhaL2tE
	qBlYA1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGsv-00000006SkG-3QGG;
	Sun, 24 Nov 2024 17:59:01 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGoB-00000006RvC-1sIU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:54:08 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AC1ECC000C63;
	Sun, 24 Nov 2024 09:54:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AC1ECC000C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470846;
	bh=X3TAQyiL/eicazUT8ggxY6BOlIan+Z7dJQjY8dzqTI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=McDZUvyoovTi7Fi+K+IzQ3gS3evcFRM/9Cnq00TmMVeiXFvXie2V1ogTovy+1mjCM
	 M70gU/JzcAEGMWt69kwpvxAbwJm5SimZiGCc2BwV7LwQlbVet695P7QgDgVi1mOPZJ
	 Z/QOq5RV/oT/Qj/8wTK0R56V8RN8SarJwnoZtRS8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 4D20718041CAC6;
	Sun, 24 Nov 2024 09:54:06 -0800 (PST)
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
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/9] ARM: dts: bcm6846: Add ARM PL081 DMA block
Date: Sun, 24 Nov 2024 09:54:06 -0800
Message-ID: <20241124175406.717862-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241019-genexis-xg6846b-base-v3-6-8375a0e1f89f@linaro.org>
References: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org> <20241019-genexis-xg6846b-base-v3-6-8375a0e1f89f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095407_563436_43718F7F 
X-CRM114-Status: GOOD (  17.45  )
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

On Sat, 19 Oct 2024 22:39:35 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> The ARM PL081 DMA controller can be found in the BCM6846
> memory map, and it turns out to work.
> 
> The block may be used as DMA engine for some of the
> peripherals (maybe the EMMC controller found in the same
> group of peripherals?) but it can always be used as a
> memcpy engine, which is a generic "blitter".
> 
> I tested it with the dmatest module, and it copies
> lots of data very fast and fires hundreds of thousands
> of interrupts so it works just fine.
> 
> Add it to the BCM6846 DTSI file.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

