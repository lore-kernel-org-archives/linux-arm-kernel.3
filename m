Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18D2CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3U7fwx8o37KuZiuzGnaDeWgNwO4CVqMdSeoPW8/HUYI=; b=QhheyKz602hDdtWFQ2WdiG1iwY
	o+pVjf+AJFMyICROgi3yYvKSvQkh7cYKg5/QZcLgTLKi1gSiM+ZNa8tAjvV1Y+6+QV4Kc5FBhXS+0
	8Gip6iyfrLJEhYxQW9vgWn0jvElRgcAvZ6EhegwB7FPAhASuo1Ei9fHfQg/xgvAJtJMlNtTEPC8t6
	tLBFEC4lvWNC/YwIRQIKWEgHWEyM7mb2eZBe7PscTDGJdIJoGoag7qgvROGuYFasPuMLOrj+f8llP
	jKHazn/R/9bPd8yhd0Si5DYk6QMOu0PYTT0RQKf3Fxykq5yTg3FqnwLSntxC+ccD0Gvi6PGbe9olB
	QOoyYwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkdg-00000002BX0-2W8t;
	Wed, 06 May 2026 22:22:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkdd-00000002BWI-3qmN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 22:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E0C440C27;
	Wed,  6 May 2026 22:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83875C2BCB0;
	Wed,  6 May 2026 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778106161;
	bh=hwqxnsO+ALySBum5tOGbNdnlNfkkmm95U+0x4x3rmDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmmjiaY0RCKWxcyRYn2cz29/lsX5fQSz/IWZDpve0Lp5yKmf/XZsTwBAdiItqQd/v
	 ytC2W+0oI2bJTUNIej5Jc16Nv+73nR7hOaLcRa6C/io0s4Gf9lfn/Zu+GltbUyfwFs
	 TIUDbWVJQkZ5ZchQJqKyK5kSM7slM0d8bOBHouiNcF0XxWczgQHo/qzF20tPEKl8MQ
	 MeHr5le2grDqsuthLd1VI/GvFceYfilCV/zERRmhRWir3hxR044MvPW711jreeywR0
	 QaeYfEweLTOjLbilLinl8omGMgd15zx90I5ka2o6rJBcVyW/VYTzd6L5z84wgV7uHI
	 RE7DF+tOVEU8w==
Date: Wed, 6 May 2026 17:22:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: linux-kernel@vger.kernel.org, chleroy@kernel.org, edumazet@google.com,
	frank.li@nxp.com, kuba@kernel.org, netdev@vger.kernel.org,
	vladimir.oltean@nxp.com, devicetree@vger.kernel.org,
	linux@armlinux.org.uk, conor+dt@kernel.org, horms@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch, xiaoning.wang@nxp.com,
	pabeni@redhat.com, krzk+dt@kernel.org,
	linuxppc-dev@lists.ozlabs.org, claudiu.manoil@nxp.com,
	f.fainelli@gmail.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 net-next 02/15] dt-bindings: net: dsa: add NETC switch
Message-ID: <177810615811.3413821.3835724819820623979.robh@kernel.org>
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-3-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430024945.3413973-3-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_152243_067071_D5B8FEDC 
X-CRM114-Status: GOOD (  11.69  )
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


On Thu, 30 Apr 2026 10:49:32 +0800, Wei Fang wrote:
> Add bindings for NETC switch. This switch is a PCIe function of NETC IP,
> it supports advanced QoS with 8 traffic classes and 4 drop resilience
> levels, and a full range of TSN standards capabilities. The switch CPU
> port connects to an internal ENETC port, which is also a PCIe function
> of NETC IP. So these two ports use a light-weight "pseudo MAC" instead
> of a back-to-back MAC, because the "pseudo MAC" provides the delineation
> between switch and ENETC, this translates to lower power (less logic and
> memory) and lower delay (as there is no serialization delay across this
> link).
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/net/dsa/nxp,netc-switch.yaml     | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


