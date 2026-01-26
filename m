Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAE9D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ej3BIJhsg24sgkwCf8vIwA9gnfJv0oIokrn2IkH0ojg=; b=uIEPS/Ks014A4btpIKpyw6vraS
	c8fNdAd/2JZpYOvQSnkMgQIROrhtIly5iFqGx5kJf5wrQPtCSJnxi6cMS6ZbgY6L733ttZEuVJ830
	Kci5vYIkR0/7m+/dekqnKwF8RDjtvwdXnLidC4DRwofDxBpG8VjX0PtMvbB7fewWADVCaGfkQxmUI
	uS7l1snHyrahJ2CUmzH5MtxzzwLN9M4b2qpf9zSotksG/2UWG3TGHVxPnu4u+RybUXSNqkslCKbas
	c/rWi6Yio2/Mx6p+yu3ADwTlxSzxxu9c1EfvpyLejg8HwY5E7Ky56JZ9zn7Hrgp198N0v3iBI/go0
	X31K99sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkS3B-0000000D8Ay-1ti0;
	Mon, 26 Jan 2026 19:15:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkS39-0000000D89u-0oMj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ej3BIJhsg24sgkwCf8vIwA9gnfJv0oIokrn2IkH0ojg=; b=JfhG0vAuXif3n8vb5swkcz4Wt6
	SLNbKd9/1VL5mgycgwfH0uEnArYLQCOi+pMe8nYO2Tz+Tr7voQJ58spTakvs4LWwU/0Qt6XSP83rb
	K8uKIooSZ6kErLmVvsphN9enxNtXMUh6XXolLyQ0CEbwXgwUVN9JOiuG9Z5dsjECFNxE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkS2l-004pqy-2H; Mon, 26 Jan 2026 20:14:35 +0100
Date: Mon, 26 Jan 2026 20:14:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Elad Nachman <enachman@marvell.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, pali@kernel.org,
	mrkiko.rs@gmail.com, chris.packham@alliedtelesis.co.nz,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: a7k: use phy handle
Message-ID: <92842275-a1f4-44f0-9a97-384532b4e3a0@lunn.ch>
References: <20260126113627.2769695-1-enachman@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126113627.2769695-1-enachman@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_111459_228706_934D617B 
X-CRM114-Status: GOOD (  10.69  )
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

On Mon, Jan 26, 2026 at 01:36:27PM +0200, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Documentation/devicetree/bindings/net/ethernet-controller.yaml
> 
>   phy:
>     : #/properties/phy-handle
>     deprecated: true
> 
> New dts files should not be using deprecated properties.
> 
> What should be used is:
> 
>   phy-handle:
>     : /schemas/types.yaml#/definitions/phandle
>     description:
>       Specifies a reference to a node representing a PHY device.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Elad Nachman <enachman@marvell.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

