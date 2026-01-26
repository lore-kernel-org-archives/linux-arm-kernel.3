Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA1D13C1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhN3wsqjvs5Rpwd28ad1hp8NKL0RyYRISfgiz3cNFA8=; b=tonitWOQqzOBkWAQDVEVbgO83Y
	iOFxfxJt1e20nmx72qBVm7ZcBcNkFhXOx/SIX0x4qUc0LGbHncSVRxhAys41Bj8VG1b0pUvbFM0Nw
	OcPt1CtUUaxRrZ1XgxSPIzuVEIsmNldw4h4/KvqB8WqGQ7fM/fuKTfk+wOFeiXiU+YB6ZLsw86KOI
	MzUIZtjzkWb2BGGX913esXbuKENnAnt0l5Oj3ZRPOmYaduM70bLT1Ow9/HG1CdrEGx2NnnvJIcti7
	H5rU+lnkVR/m8uBgxEIb/PsJGrrI1WW7bOTmM46eAYAJshGcbWyAXWuqaBZpyGlbkwE4sMVzGDh9m
	uOC2m7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNAJ-0000000Cfe3-0KlQ;
	Mon, 26 Jan 2026 14:02:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNAG-0000000Cfde-28U0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=jhN3wsqjvs5Rpwd28ad1hp8NKL0RyYRISfgiz3cNFA8=; b=of
	68KVMdve4uzx7WkCfg4zyVbsWyimBDkLI4PCM/Of9mXKTYe5jd4KdVzcmvhkwIlPh25i2hIF+0ZLZ
	iXcuPkyRaJ2Mt0jyv+JLhEYWGYs9ASorvSrEP1CwDdlN7qJ/D+CEOVOCN5TjrZSHHtYnbQZK35/BE
	R+klxonrFv+PIgo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkNA1-004n4G-55; Mon, 26 Jan 2026 15:01:45 +0100
Date: Mon, 26 Jan 2026 15:01:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Elad Nachman <enachman@marvell.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	sebastian.hesselbarth@gmail.com, pali@kernel.org,
	mrkiko.rs@gmail.com, chris.packham@alliedtelesis.co.nz,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] arm64: dts: a7k: add COM Express boards
Message-ID: <4a43710a-b9f1-45bf-ac4b-ac7de6751d42@lunn.ch>
References: <20260125152347.2518538-1-enachman@marvell.com>
 <87sebsk6og.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sebsk6og.fsf@BLaptop.bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_060200_571970_FA49A5A5 
X-CRM114-Status: GOOD (  11.15  )
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

> I’ve already merged your previous version with this fix and even
> included it in the PR for the next release.
> 
> However, I noticed a comment from Andrew. Could you provide a fix for
> it, and I’ll try to include it i

It is not a show stopper. It can go in next cycle if needed. But i
would like to see it fixed.

   Andrew

