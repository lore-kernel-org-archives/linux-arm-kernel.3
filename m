Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D96CC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQu2082//gPU290pxdRRy926EyxDVgpmL3flACSXtlI=; b=KLhrt2z/pKljXyP4eFod2QgCGb
	S4qWGZnkOysaOD8CByFCQ8xHP+kHAbkarb6d/i0adj6s1TZZ7cq/rZxFFz+SYdqgFOasSuQEDUFCv
	IRE9hQB1TCimgB0T+kXbxsarkBj0sGhqua0aPp3izDjzFCTRAyv/gwvgHYPDJuM7i7ichCFx/lFbA
	560ESvtyLprva7KqgQsJGdB1fc3VYVSFR5fJ+pusM0oi0+h/GT7JHNS1HjNZcMVLGfh2fLGy9ypLI
	2nnKSzByfQ/bfup5U0lPMxeCFtHgJiq++EvVdf50++Y2uZaA4iCbd84npLQjDPse/708bW0FT1O3t
	1AqE8v6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneHA-00000007bJc-2PfR;
	Thu, 27 Feb 2025 13:50:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tne54-00000007Yia-0mVY;
	Thu, 27 Feb 2025 13:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iQu2082//gPU290pxdRRy926EyxDVgpmL3flACSXtlI=; b=Z5AnLMX512TdofIv8P0FEi7upk
	WfrSa5FsVMlOGD0enN7fyIZqg2ig1i2IskNE4c1WFVlkLNH65YmauKm9yA2/bw/T4jZT8ra8zog2k
	JYEGNYg3dbRbHZq7aMbANwkIYlPVdPorm0iS/1+vn8sPNgMJY5FYK3+2Kbt8nSWh8NkE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tne4a-000bSx-NT; Thu, 27 Feb 2025 14:37:08 +0100
Date: Thu, 27 Feb 2025 14:37:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Rob Herring <robh@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Wu <david.wu@rock-chips.com>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: Add support for rk3562 dwmac
Message-ID: <5fd4bc39-bf2c-42d5-bbd0-2787b2839833@lunn.ch>
References: <20250227110652.2342729-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227110652.2342729-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_053738_218588_09E86BD9 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, Feb 27, 2025 at 07:06:50PM +0800, Kever Yang wrote:
> Add a rockchip,rk3562-gmac compatible for supporting the 2 gmac
> devices on the rk3562.
> rk3562 only has 4 clocks availabl for gmac module.

available

	Andrew

