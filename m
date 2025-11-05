Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472E9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oggG/SZ2ooj8j6l1y6lOnI5O4FvnswZsgA4nJ637rLA=; b=0shIs9XaNpqP+/7MGB7sA1QDjP
	ouRNUN1rPnuyC6dBN85Rbu/zAusCgUxt6jh/+VU+oXhcuUKz247Z+7Tpbfko2KgJOMWzgECE57yH8
	lT4d+ilXy0Gad+n+SQUXIVFRYnfmLIYvBBMDTvDEXJuTSCGZBTsj5VKU+AkTZM24AfpUoxSY/fHWd
	m5PEMrTWxmJ8/uBS0WSp58tGdI5C2lBQvpnzrrHSYurnqJ7+I4XUhq2haQpQeNiL7ZWrUv6+GS/Ll
	7nvBCjjOkuQy5bvXGF8FMv1f69mav3z0727EsT3kBaZ/FhnV5TZfdGIOlsQvCEFurKaLTMB2xWuIx
	1GyQFOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaAF-0000000DQWs-1GMK;
	Wed, 05 Nov 2025 09:50:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaAC-0000000DQWC-1bfb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:50:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGaA9-0004ob-Hd; Wed, 05 Nov 2025 10:50:45 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGaA8-007Am2-2x;
	Wed, 05 Nov 2025 10:50:44 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGaA8-000000005R4-3WVp;
	Wed, 05 Nov 2025 10:50:44 +0100
Message-ID: <11f764cb67967bd9be750556bfab5b2d233bdebb.camel@pengutronix.de>
Subject: Re: [PATCH] arm64: defconfig: Make RESET_GPIO driver built-in
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski	 <brgl@bgdev.pl>
Date: Wed, 05 Nov 2025 10:50:44 +0100
In-Reply-To: <5f369c52-ddb0-407a-b276-361b616ac759@kernel.org>
References: <CGME20251103140625eucas1p2909567ab24fdae587fd5e43d58f27ae8@eucas1p2.samsung.com>
	 <20251103140617.2361857-1-m.szyprowski@samsung.com>
	 <5f369c52-ddb0-407a-b276-361b616ac759@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_015048_420856_082E4EFA 
X-CRM114-Status: GOOD (  13.43  )
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

On Mo, 2025-11-03 at 15:51 +0100, Krzysztof Kozlowski wrote:
> On 03/11/2025 15:06, Marek Szyprowski wrote:
> > Commit 25d4d4604d01 ("reset: always bail out on missing RESET_GPIO
> > driver") reworked GPIO-based reset controller initialization, so now
> > RESET_GPIO driver is required to properly instantiate MMC device for
> > most of WLAN and SDIO chips. Make the driver built-in.
>=20
>=20
> Huh? I don't recall the final consensus over RESET_GPIO but I had
> impression that patch was wrong and should not be merged.
>=20
> Was the consensus to break all possible platforms? What!?!?

I was too focused on the case where no reset-gpios are specified being
handled correctly, and didn't realize that 25d4d4604d01 breaks driver
side fallback to GPIO API if reset-gpios are specified but RESET_GPIO
is disabled.

> Can't we just revert 25d4d4604d01 because apparently it was not tested
> properly?

I just sent a revert [1].

[1] https://lore.kernel.org/all/20251105093920.2345333-1-p.zabel@pengutroni=
x.de/

regards
Philipp

