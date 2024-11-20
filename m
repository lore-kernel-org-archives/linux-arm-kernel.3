Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA792D6E2DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmSLOnJ9YiAUDPzDcM8gNFFVE7Xl+R4ypqzuFT8RiAc=; b=yJ3YT/v2QqtrdEnE+fGHGE0nnb
	8s+/D4qamnGw0gTw3x5Aq5zqJZzMchR3RCIS5SulfGYsXyXfw8kLCktrjl3NB2CvpYoKDOtKrySco
	ugM+cZxfJh14tdJMK73s8g5JltlQ1rKSqs7HONtPAWVzW/xzIzSAb1GDQzHyOjxvy7EZ5F93zCmQG
	YzhTzOiWS+YgY8VxZh9siPupZpuNTJWW5y8PLVELX6yfHM/qj6oIrNa7XQeP2nQkHOQpd1iuR3fzG
	BsIjugzFQvtxyzkWiJbDwYOEVYKfe1CESgDBIecIQRc314nMGtd+04FuWTDpe1QLS79usLKnUI2M0
	XW+d8QAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgfk-0000000Equo-3LpR;
	Wed, 20 Nov 2024 09:06:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgen-0000000Eqml-2ubG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4245D5C5742;
	Wed, 20 Nov 2024 09:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AF6C4CECD;
	Wed, 20 Nov 2024 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093552;
	bh=WO8hLANsPSWfDRTdCVZPGdNfpBAAEwfxq1h8xg7OMPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shP2YrDa5nyalGUXibhQWcwYsUUNXbIj4uyAddSvqI5tmNh5dCNMhtiD/aGVjDFHU
	 YM/VgyV1Gh3MJKOWEyXgKw+p/xPIpDctrAEO4ZxmR0XSLmX40tWuhDV4Y6jRFOr95M
	 TZ2yas7y5h04TMGAdjLnxRGHPtKIncbiezxSDI/AuFiLPLhdTK0Bh0Lvfxo+RWTiaY
	 DUajAqUNQtIvsjTlwVKFxmVlGyE43h8D6FSWbUQGhzQqIkldyPQR1/o6Tpds1Ay3XW
	 5LsRiDQ4PWxBmfJ/A/44Ft/GF9ZCOoMwm58G2wEQtfTMuhIV1SxeVIz+cDvJc38m3I
	 vVH/iGeUNsztw==
Date: Wed, 20 Nov 2024 10:05:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 00/15] Add support for SAMA7D65
Message-ID: <qfdr5ef6dc4v46x5bhuz4smyxfwreudmaou557s6be6ipejbyv@g62lm3syt2rf>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <uskwi3uzowtbm6o4y2blcnktacvymasf53ppzxg5su4shvt6e6@bpuejjtwuczw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <uskwi3uzowtbm6o4y2blcnktacvymasf53ppzxg5su4shvt6e6@bpuejjtwuczw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_010553_774179_E1789251 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 20, 2024 at 10:01:08AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 19, 2024 at 09:40:06AM -0700, Ryan.Wanner@microchip.com wrote:
> > From: Ryan Wanner <Ryan.Wanner@microchip.com>
> > 
> > This series adds support for the SAMA7D65 SoC.
> > 
> > There have been patches in this series that have been tagged as
> > Reviewed-by or Acked-by, I will link these threads below.
> > 
> > 1) https://lore.kernel.org/lkml/20240829-sama7d65-core-dt-v1-1-e5d882886f59@microchip.com/
> > 2) https://lore.kernel.org/lkml/20240829-sama7d65-sck-v1-1-3e7b19e3cbf9@microchip.com/
> > 3) https://lore.kernel.org/lkml/20240829-sama7d65-next-v1-1-53d4e50b550d@microchip.com/
> > 4) https://lore.kernel.org/lkml/1da0abbb-94e5-42fd-a2d2-71d5d7d253fb@microchip.com/
> 
> Merging everything into one thread makes it more difficult for
> maintainers to apply patches. Some maintainers don't like cherry
> picking.

https://lore.kernel.org/lkml/4962c133-50e7-4d3f-998a-b8d853ab1425@kernel.org/

I asked to put bindings with its users. Primary user is the driver and
this is explained in submitting bindings patches document.

Best regards,
Krzysztof


