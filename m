Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616B7E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxgBWjuYmojyu8CjIwh/7H5dBQqIE2Y6hGC0M/x9S4E=; b=CrlewFV8nvBKIo2su8yFDt7KBF
	K8oWjqaKpaaW48LWgLk40gf8vgBrv4EzTlf3kvY4McnMNffuUEDNuOlM59ipjileysBrCeHhWNW9g
	38Qul/FZBLG7Dh0GgKmdfzrtBREh/cThxBbAEUjdhaVOQYxCOv/1JkUfLEJDyi8nw+Z/l85C1zuLm
	RPzor+dyOBqv34t9PRRU+e7EhEUxfN2e2UTqquinwV7u5BU8sYMybReNPK/ylHYo8HgMPrUwQ5HbX
	gmNl4Wm/xoi/1FLblORJ22nBU2C68oBd0kHnrjPn8g2RQH0SS6qxxiPkaGaJan2aYK1bpdrbcx4Qr
	aYz9j20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGq9-00000006SDs-3qsZ;
	Sun, 24 Nov 2024 17:56:09 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFGnw-00000006RsY-1VDz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 17:53:53 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 80920C001500;
	Sun, 24 Nov 2024 09:53:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 80920C001500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1732470831;
	bh=pO37iYz1GHmNlpK2h9/Rk6Yf6YEcoAXM+LLc0flzDH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dUXF/ejpboIuqs01VIuFnERnEQ5wR1ToHIXHRQ3TeZP6oSKI7oC3SJCQEQRa+f3zQ
	 /Yr0lhjYoM6oq+cRpWYgFjqDelawTfobyqLeMrvTLwGo5p76HqTaAAQhLYlbGle7dd
	 jN1RWHc/19NNvzkbp+IiSsfHdC61sOyIAZcqOy5U=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1A4CD18041CAC6;
	Sun, 24 Nov 2024 09:53:51 -0800 (PST)
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
Subject: Re: [PATCH v3 3/9] ARM: dts: bcm6846: Add GPIO blocks
Date: Sun, 24 Nov 2024 09:53:50 -0800
Message-ID: <20241124175350.717568-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241019-genexis-xg6846b-base-v3-3-8375a0e1f89f@linaro.org>
References: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org> <20241019-genexis-xg6846b-base-v3-3-8375a0e1f89f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_095352_471107_09EF781D 
X-CRM114-Status: GOOD (  11.41  )
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

On Sat, 19 Oct 2024 22:39:32 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> The BCM6846 has the same simplistic GPIOs as some other
> Broadcom SoCs: plain memory-mapped registers with up to
> 8 blocks of 32 GPIOs each totalling 256 GPIOs.
> 
> Users of the SoC can selectively enable the GPIO blocks
> actually used with a certain design.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

