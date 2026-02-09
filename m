Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C31E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIb3LMlJ3ZAFCFQ8njzw9kDZpKj6O5d2TrHrGyskL2M=; b=ikgjlMuCzJ/BblY2a9UzHsgD5j
	7OWw7FiGG8Mj9s8lu26v/PenrX+6NTwIFbL+gTAG1Ki6vU9ZckIC/Neztm0UpXCZSXJ+nuhp3niz8
	6TZ66OXym9zmEMF5Ayh/cveJ8NaZXFEwfjHY7/+KuWIMlubQqxakZhMaD5Wgc7ylU8AqqR//kHrej
	+TW/Vt55PBgiuyO0dEw5RZ9T8vKAiTqyUXV/Yx2GU5TwADthULa+32EI8fxe3tYMTpBAonwyWGyIU
	UBr+NzoSRxzVHzseWapSnFf0WVtMDm7XxqyL+yymG9dw2ILBDC62OB+WldUDLUOJzUa5/kZePbslz
	KKzebM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVTj-0000000FoC6-0Onu;
	Mon, 09 Feb 2026 17:55:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVTg-0000000FoBa-38Vy;
	Mon, 09 Feb 2026 17:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 541E141AF0;
	Mon,  9 Feb 2026 17:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A6FC116C6;
	Mon,  9 Feb 2026 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770659715;
	bh=EnTNUJHmSxT2WRAs+oWYX8bdwlK9D+48BwdN8Orgt7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zgj/maFW5QBdpanoskzhhOvikPz/Ns+ctuK+nd23tjE39S637yYBNIdYcQV1xLoEs
	 MAvtPqQJ96P2MTGMIooSvlQ/HM7RAEIF6Ebj4eVEON3Qcz6FblOPFj9VpqMP6aVRq7
	 1vHRNgEMLU+ttI8tLmoN9NC0AvbxXOfpWP7QTQtbtZ8SHlt5hcnvvKCGmOwxj/eNeL
	 dk3FN6gNnj5XhTov798gmAT7dFgVNNx4CmaRUbCAQYA8dZF/zEebnM0aEt6UkXwQX1
	 Isq8XWO/xVJxHsvlX+nERQP1BkQ8deSp40wNxcUcreLYay7zzYt4yRtGd/VRzOvIDW
	 gZMmZjvQdNfLg==
Date: Mon, 9 Feb 2026 11:55:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yanteng Si <siyanteng@cqsoftware.com.cn>, devicetree@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Yao Zi <ziyao@disroot.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, spacemit@lists.linux.dev,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	linux-arm-kernel@lists.infradead.org,
	Zhi Li <lizhi2@eswincomputing.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Longbin Li <looong.bin@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH net-next v4 1/3] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <177065971340.1488943.5040519418733629528.robh@kernel.org>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <20260130022705.1059214-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130022705.1059214-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_095516_804530_2C196ED1 
X-CRM114-Status: GOOD (  10.15  )
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


On Fri, 30 Jan 2026 10:27:02 +0800, Inochi Amaoto wrote:
> The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> MAC (version 5.40a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


