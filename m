Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F011C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eg5/u6HzX0Cp+nICWQL7K//s1nQYj6V4b9sPm0RHqc=; b=uXhMxiMToGlhSoj4a1356BSsG9
	voqSJ1Bfadn4II7kuXa+f3xmkuVJ6YcchFepo1ZjucDglz96YqhYyx7qN4vhAj35d50kY/nY+Vu4p
	oZwVnS9gOppIh7Irs+hOy3LI+0FZ8TQ4l49CveWE/zSee6HJOEEgwgUXweOMgN8+a/aiAF78dCMnL
	tY+2aiUu+jqPgzHiPDiUzL2g7zY5JgmWgMp2I8+n8+SaVSyj2D1UC1Z3qR8dmP8mkeRkjXeQSOWkm
	+BLFjqQnm4f9JO4wFEw37cLhwQOj/NaOXFFdLtQ3ePKB/1H+iEfDFyeMxUBXdcpBCNdhxEh/yhXam
	1CPiSDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eDO-0000000BPeO-1nHP;
	Wed, 23 Apr 2025 17:48:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dRS-0000000BCcd-1AoF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9eg5/u6HzX0Cp+nICWQL7K//s1nQYj6V4b9sPm0RHqc=; b=HTgGcYUYQrh/dviTjPqiP+NehA
	j9fzKjHgaPNTBMwNKS+qS5WEXTole8ST55pYhA+OG/elfkf+SOkH46lYaUW1+ymoVsNRt7m+PCjN3
	fFDnjgFQ9nuHL5oKa+aHDDUnP1XDpoJg565TXYNMX0onQw2zzfYR2KVgbvQ1V4jIQsJM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7dRI-00AMTD-Pu; Wed, 23 Apr 2025 18:59:12 +0200
Date: Wed, 23 Apr 2025 18:59:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaoto-A1
 board
Message-ID: <de5ecf8c-2dcb-4228-8cb0-daea4767639f@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-5-46ee4c855e0a@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-01-sun55i-emac0-v1-5-46ee4c855e0a@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_095922_317446_731E6937 
X-CRM114-Status: UNSURE (   6.37  )
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

> +&emac0 {
> +	phy-mode = "rgmii";
> +	phy-handle = <&ext_rgmii_phy>;
> +
> +	allwinner,tx-delay-ps = <100>;
> +	allwinner,rx-delay-ps = <300>;

Same issue here.

     Andrew

