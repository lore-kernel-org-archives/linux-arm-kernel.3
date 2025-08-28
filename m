Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB7EC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CMmV0KmKElMRDG9hxC3TUSIMhPG5BSmmsupIpN8YTw=; b=po6eB+qODyTuMgqQDD3N6QMlW2
	Qs3DEz0jbL5zZrUUSiR6/tKbhoG2e47n8XEvPOZuv72Sxw7+VH2vJxn48Qk+3pOXs3cavYWAD7fQk
	/1bRDCF7xd67thmDmUYo0akioLzQsURPchlsU6HivMuqMqQFehjRPvgWQCz1RYopVJ7TTLpnQw1EX
	BHxWpzgxkCuyR1N/0VTRNeznbeVhSgIJM1CDrO5OBq4sm21bdA9EqXT1nuJrO1BWs8CWZ8P7QCbCE
	ewLV5Ib4GmY4waABWsTYbVFQR0HqTW0oImCIpzPr1625+znAAM5LBLeTcWfGRoptlxg2517i2XFZc
	5uhfRqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbT4-00000001TBZ-2Gka;
	Thu, 28 Aug 2025 12:11:03 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYCD-00000000pjW-23kr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=5CMmV0KmKElMRDG9hxC3TUSIMhPG5BSmmsupIpN8Y
	Tw=; b=DNgrO/pMnhJEEjmzaX8baCZ5m7hOvV0tBYL2JXqRYUxXre96uWr9St/gb
	Bff6r1oQqg9kFk7qYcpIBDvWHh5T7D7u8jM1jOEWdgYNaBtkUKGhrRtTPu7s+fT2
	PzTWkIKFMxJIxig0bI4kY0Nj9pwY3Ppqj9+KwKiclRV467yHuiZ4E2EqdEEXMlur
	w6rnV1JQ75MwXqyopk7AtCo41ueSG2xChezbKMJuBS3WaNxBbeO7NwUzb0kPgaTg
	tSGI+tx9pV6s/7OjdYB9NL+zFZWBeUzdOB4qlEp59aG0ndV5DRUatRntartVND1Y
	UFbsrhNve73yPkCelkaKOpOLOMxnw==
Received: (qmail 930434 invoked from network); 28 Aug 2025 10:41:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Aug 2025 10:41:18 +0200
X-UD-Smtp-Session: l3s3148p1@2eVw3mg92r8gAwDPXw2iAG43AYdOknD3
Date: Thu, 28 Aug 2025 10:41:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
Message-ID: <aLAWLZBenSWWqqkK@shikoro>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_014126_383002_81F1FB31 
X-CRM114-Status: GOOD (  11.21  )
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

On Sun, Aug 10, 2025 at 03:21:21PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series adds thermal support for the Renesas RZ/G3S SoC.
> 
> Series is organized as follows:
> - patches 1-2/4:	add thermal support for RZ/G3S
> - patches 3-4/5:	add device tree support
> 
> Merge strategy, if any:
> - patches 1-2/4 can go through the thermal tree
> - patches 3-4/4 can go through the Renesas tree

Series applies fine; I can read the temp (36°) which increases
reasonably over time (40°).

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


