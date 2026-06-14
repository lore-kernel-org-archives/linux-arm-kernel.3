Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A204DCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cwZEmaxV262lOCKH7K7Tt4ZA+Bva0faoaNw+ZyMjHM=; b=NYJu2V58lq7Ef7u+T98x1wZFhs
	H5Y0UOXpto8rgQZmjQ8S9K3HFl+a7RsU2ThOtjxusvwD7+CzSIkZIu3nS1fCMGENeD3Rr6TeC4JBJ
	ZAQ//0XTtFHv235ZYBVvEMuv7dR8KC0N5YGaQuudOgXI+pJ260EeVRrca0AlICJgWneBce8XG2YuJ
	MSAZckjSMlpkHdQheeYVUMODUlBH+A9ooNT9GWDvM0VSsQyiq3gTgC/6e7Gqc0OJbi5nQQJTeJn/G
	hFr+ueyVgglRjSSG/pa7Z7Xzbw0++2SRgx7vsIhrsBihBnHUNyYutd9+X0EE16XcfjGjCcGLmSBkn
	+E1tHbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrcN-0000000DHXJ-2Vq0;
	Sun, 14 Jun 2026 20:39:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrcJ-0000000DHWL-2YbU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 20:39:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65F6E1A391E;
	Sun, 14 Jun 2026 20:39:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26D5A60014;
	Sun, 14 Jun 2026 20:39:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85C9B106C86AA;
	Sun, 14 Jun 2026 22:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781469574;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=/cwZEmaxV262lOCKH7K7Tt4ZA+Bva0faoaNw+ZyMjHM=;
	b=HpU+LKD5So7GqO2NxkdY4wTVz5kQaBS/m21yAwQydCbgAAtiMC/qimPpw8cJXCnOMR9Ywj
	74hIiPP2c8dRHoWwvlZXvkPqzHYmIlaEeYRvrn4Ffe27Xwe3WMuIs/Qt6rd5k505FsPxLV
	HAmT0o94QSEgP1grjj6tng8PjMlsDQgYMLl6I5zfb/B9h2np8UX18F9/GcUBuk47ZKlYfZ
	8S1gU6y9vrkJygopAolqgSpPVKXgQZz1YBP38NJqIZknYjPjHQcb+GerpyHbYwVIwjm9J4
	TxHgJ9Vq5W8he24goCA3uAjKURpmJKb9c2sxSpmc6FJ5l8Q+0Meo/b2QtpA02g==
Date: Sun, 14 Jun 2026 22:39:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
	aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
	romain.sioen@microchip.com, tytso@mit.edu,
	cristian.birsan@microchip.com, adrian.hunter@intel.com,
	npitre@baylibre.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v7 0/5] Add microchip sama7d65 SoC I3C support
Message-ID: <178146955570.340851.8125558640090329050.b4-ty@b4>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_133939_775666_E18FA71C 
X-CRM114-Status: UNSURE (   8.71  )
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

On Mon, 25 May 2026 14:54:00 +0530, Manikandan Muralidharan wrote:
> Add support for microchip sama7d65 SoC I3C master only IP which is
> based on mipi-i3c-hci from synopsys implementing version 1.0
> specification. The platform specific changes are integrated in the
> mipi-i3c-hci driver using existing quirks.
> 
> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
> mixed bus mode (I2C and I3C target devices on same i3c bus).
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
      https://git.kernel.org/i3c/c/9092105b87af
[3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required quirk
      https://git.kernel.org/i3c/c/efaa912ab0f1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

