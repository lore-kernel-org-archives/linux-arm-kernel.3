Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA57D1D468
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RMxX8fLudzgzeaK8Hxa/jVqGVI3C6mJxtJKkvtOXWM=; b=aXf/wF4k7yrrwdfqwu4nD01dk3
	f+QZqp0ilPTjV+I8x0t+7EDAyIQ9NieEMkeLedsv9Bzn7JBNxJnTuzqeECXxBeJUF74oJvO9v1eCz
	cLf97P+whf9q84ZxOKHMRmxnSr/1Z/qrXMhjlxyjzobAmjm1v6QxvakIcH/OKUaRmgU4kdiexSe1S
	gwjzLSchent93MLGqBGSt88+bvZEQrrJLnom6seH+6JOdZtIjJEQtsdN0qeNcFXIgtnGUWv24V0zc
	wXHotyhD3SNr6rZdU+wgDmi8GnKVLquO0bcaCsKBSyPuuQU7MBtRQPq5/29ohJqtNfpPXUqYZBZPs
	QjMrCR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNX-0000000HPsP-3tp5;
	Thu, 08 Jan 2026 14:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNW-0000000HPs7-1Rnx;
	Thu, 08 Jan 2026 14:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5RMxX8fLudzgzeaK8Hxa/jVqGVI3C6mJxtJKkvtOXWM=; b=KJqPDJKmVz+M4zQgH4OFMgVB3y
	6RvmJkHl/98lQmG2DNq9J2/+8j9t5nWg5L7QyCuVoSQhsWvxKwbZuaOPI+HFuuwzxHU/E+unCvLaH
	MRWw7SZ7+w7JNsH86/905vD1S4WppfzwMQN8jfRsUYAyn2NejqVDj3wizGaklc1V9b0mdnzd8KPUy
	FyQQY+WDqIn+JBX4/2oqjwbiPWarxVITP2EtAcGEZymOyq1fjrB3WQj3W3t6/acd4EANOgYPH9og1
	plPooqMX3HjiRLcP/b96vvoQWJvF8fa8BsTlDTpM7LGQnbyyTWz29Q1MXymvLc5jOYOKBaLdVEwAr
	VROE9p9Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrNT-0000000DQlJ-0ao5;
	Thu, 08 Jan 2026 14:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5RMxX8fLudzgzeaK8Hxa/jVqGVI3C6mJxtJKkvtOXWM=; b=sfgH9SDDp9NHn9HDL2Qa5RRGQb
	aPYiNW/CMH3y50KuXB+F2eWH7m7hdmM0w52cPzR7Q1QsnMLcmcVPA7ahlWtSmWQUj+blZ58Vyb7si
	sqBUI5kxMY7in/N15dSdqgbEKH6i+xi3qVaSVfTxcHlkOsdfrXYghOf4y73nwWWFlNrU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdrNE-001xse-J5; Thu, 08 Jan 2026 15:52:28 +0100
Date: Thu, 8 Jan 2026 15:52:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
	robh@kernel.org, conor+dt@kernel.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, matthias.bgg@gmail.com,
	atenart@kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: crypto: inside-secure,safexcel: Mandate
 only ring IRQs
Message-ID: <c65c2f98-7530-470c-b288-d135fd621005@lunn.ch>
References: <20260108110223.20008-1-angelogioacchino.delregno@collabora.com>
 <20260108110223.20008-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108110223.20008-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_145243_259911_D3FB9BAE 
X-CRM114-Status: GOOD (  11.90  )
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

On Thu, Jan 08, 2026 at 12:02:20PM +0100, AngeloGioacchino Del Regno wrote:
> Not all IP implementations of EIP97 and EIP197 have the EIP and
> MEM interrupts hooked up to the SoC, and those are not required
> for functionality as status for both can be polled (and anyway
> there's even no real need to poll, but that's another story).
> 
> As an example of this, the MediaTek MT7968A and MT7986B SoCs do
> not have those two interrupts hooked up to their irq controlller.
> 
> For this reason, make the EIP and MEM interrupt optional.

It seems like the order of these patches is the wrong way around. You
should first add the device specific compatibles, and then update the
constrains based on those compatibles, so that the marvell variants
continue to require 6 interrupts, but the mediatek versions only
require 4.

	Andrew

