Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E97ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKnFYHvPIy6MTzO2MIhkn1M2uICE2klZ9uK2bnBrUU8=; b=jBBbBMo45QenoI4Ahi4a8/4w/w
	AlNUTPHH2TQnbImDyW4MTYLbTKpuiJ++3+gN8HRZyTOZQXHbRRfHfFicIdOi+BEU/CvFkXQNrhRqk
	74OWqurgJp+EwUDK12Fg3bRrrKdLg4a1g9lXNFoGrjp54g0cODt9JX+BBkd5/KdJpi3WqSnM41ueE
	BZ6uvK9kqYW/P6tKcPS9OGXv3U0aYA4vSpMiKQWeG5iOwcoyNisUBiBpWRrSakrqNvZRvIWcw6F5i
	Db9xRPwry5W/HrBKAH06NmLXFCo3yKVhTMjQbPohKGHZ1DYllKA1TQz4aNofGt409UGtwZps8Hrlp
	mQKjNgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG6n-0000000CtMK-1JYl;
	Wed, 10 Sep 2025 08:23:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG6k-0000000CtJ1-3MQp;
	Wed, 10 Sep 2025 08:23:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9C284C8EC7D;
	Wed, 10 Sep 2025 08:22:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61037606D4;
	Wed, 10 Sep 2025 08:23:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD834102F2927;
	Wed, 10 Sep 2025 10:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757492591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cKnFYHvPIy6MTzO2MIhkn1M2uICE2klZ9uK2bnBrUU8=;
	b=AE4DwmbhjS04E41pbmWk0ixKoT83FA1TLAobsy2E27OdKuwv1DM2Igfa4Uea5LfOmIEJpc
	a8XqZei0tDi5rNhdIF07TI1NLYRHNVnNnU6ScOgdDsUW4SKxw5HmtAzoplDuskuj09V1U+
	9xElE1HiJ7sY6itHkbZqeLmt+zwU8EPaUlI73mdGkGjRRFbsL4pPEv3HYjz8qJ6q0rWeQR
	IbpBGffcrzKXj6zQ12ACJ5kIttYNhaX4v97aLI3F8WY29K1TfMWs6Ogon+whjcaFsIVXol
	ZRlGcJghi1FWzhUTwQdS2m7Mf7UJDoefYcyCEYcnRfwPZlKBgQv7pszz/fQhOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Alexander Dahl <ada@thorsis.com>
Cc: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>, 
 Li Bin <bin.li@microchip.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Thomas Fourier <fourier.thomas@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250904091441.351805-1-ada@thorsis.com>
References: <20250904091441.351805-1-ada@thorsis.com>
Subject: Re: [PATCH] mtd: nand: raw: atmel: Fix pulse read timing for
 certain flash chips
Message-Id: <175749258044.456366.13668613524637231004.b4-ty@bootlin.com>
Date: Wed, 10 Sep 2025 10:23:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_012315_037458_047B09E3 
X-CRM114-Status: UNSURE (   6.42  )
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

On Thu, 04 Sep 2025 11:14:41 +0200, Alexander Dahl wrote:
> Prevent PMECC errors when reading from AMD/Spansion S34ML02G1 flash on
> SAM9X60 SoC, after switching to ONFI timing mode 3.
> 
> >From reading the S34ML02G1 and the SAM9X60 datasheets again, it seems
> like we have to wait tREA after rising RE# before sampling the data.
> Thus pulse must be at least tREA.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: raw: atmel: Fix pulse read timing for certain flash chips
      (no commit info)

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


