Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E90BD5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qqF74BTATSBYtiXjLbk2uFtyKcHYUi+s3TepMTAwwE=; b=yynRtlFSGB4p4NMWe/cl1xiRRc
	2qCnwrBeOURa+FOMPpnPUEyviNOBH8zLCEukcFmii3MgftTVYRolEmRUgevDqrI/RpkqxVdo2lw4O
	Rksb6MsUJozmLpSGGSMYeev3j6PkE/xyvqpxo6VHVByfmY0OfHUDUkeat5hyPrz0aLoU+29oTkv/L
	Syp5kMyCag5VsoTiGjNaUAdVpbkYjhjwaXpeOTIc+1fQl7vCgsUIWJJJppDS6zja0hhmYtSnUUSVx
	iaCElovkDo4BvY7eEnF2iD3OhUbC3FgzXIYFantYwgRDcszu53vuPmxyzIVA7yagcS2uiRIkyLeh4
	s4Pp9mWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pLl-0000000Djg4-2W5X;
	Sat, 09 Nov 2024 17:34:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9pJz-0000000DjU1-3sb8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 17:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3qqF74BTATSBYtiXjLbk2uFtyKcHYUi+s3TepMTAwwE=; b=QcDGpvz+grwY1kL4djQ13QwxdX
	5TMc3GCCFKeT0gYO6Lcx+gUfdVNSjW7MkW1XyUqrbksrmEMEG0Gq08P6W09JWllkKuM5swdUqD/CQ
	DrRs4w/uXOq46A+yENwGJtRjV5xahetVV8dYB5rlAAJ2FGtHNCMC23jB3sZDHZG5smO4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t9pJs-00CioJ-9D; Sat, 09 Nov 2024 18:32:20 +0100
Date: Sat, 9 Nov 2024 18:32:20 +0100
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
Subject: Re: [PATCH v1 2/3] arm64: dts: marvell: drop additional phy-names
 for sata
Message-ID: <0eda1d9d-3241-4c1c-a6d2-56746410bcdc@lunn.ch>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109094623.37518-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_093227_987040_B4FA01E7 
X-CRM114-Status: UNSURE (   7.97  )
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

On Sat, Nov 09, 2024 at 10:46:20AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Commit facbe7092f8a ("arm64: dts: marvell: Drop undocumented SATA phy names")
> drops some phy-names from devicetrees but misses some. Drop them too.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

