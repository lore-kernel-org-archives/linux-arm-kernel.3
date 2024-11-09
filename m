Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E3D5E37A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j6N2GfwM0DWuezOn15oAIWbQPAkiq52COZeaHaZpXY=; b=j6SoAHYrs1SjfBYy9URjFNETVY
	eDLUQheRwuYrJVvrpymOUjHssjzrIZmdrUuMzNJxjEHgaT1UYVHNjvR07ikWunPe5EWYiHba0tT8y
	7g4VHbXmLkYct2bbjk3RafNsWEYdpg5YrOqdx12soH9Na0II7SNlr3QocSNipnkjaKykjlloKt4GA
	3prShgDMAbY7RY/i/QJTyjFUN+Qbje95+LsrsipUdCvrKabgxN0lxazMrNMIBCUdX0JyKx3+MY+pZ
	Cln93elccUeItQeSPA0CYMq7/alLmFLcgELbigSWnb1s3KaSoFcI46gKSWEWPUAVOUYCC0ubChTW/
	+JOl3f4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pPw-0000000Dk5V-0ch8;
	Sat, 09 Nov 2024 17:38:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pOA-0000000Djwf-0vje
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 17:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5j6N2GfwM0DWuezOn15oAIWbQPAkiq52COZeaHaZpXY=; b=vwQyx+gO1Ctrky2nufryxOGbT5
	8ejaygT8tjwhbbBOF/WGpsYVMC+ogN7C1iptHjs1PGJrab1xVqXhEfoXrlSaayiUO0QPkDFG2Y3Mc
	TYqYHfZVbFTuIMl0BOURW5qX3jA8eAxIeo+2JwnAGE9mfnzlkqU0/vJca40wN9IY5tfo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t9pO2-00Cipg-HA; Sat, 09 Nov 2024 18:36:38 +0100
Date: Sat, 9 Nov 2024 18:36:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] dt-bindings: ata: ahci-platform: add missing
 iommus property
Message-ID: <be981cc0-58ec-44f2-9874-286960cf0e56@lunn.ch>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109094623.37518-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_093646_281896_0F23723E 
X-CRM114-Status: UNSURE (   9.27  )
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

On Sat, Nov 09, 2024 at 10:46:21AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> fix dtbs_check errors in following files:
> 
> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-db.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: sata@540000:
> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: sata@540000:
>   Unevaluated properties are not allowed ('iommus' was unexpected)
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

