Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12819C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++oesTzSHvDNfj0VHr9ZyFUrS3VS/twkwYBmU6NS0hY=; b=Jue/UNrYF+nqzrWoOgZLc2H1zf
	vKFVukfQSk3ZfWLQBGEv+kqyr6zo1qpkfBT+N7hoG8mTMcNxPeTKflNJDs6shedDnS493Q6gxDOXP
	IAo5+eVcTUQZDoVvCoNPjl16C4+HdsfeRP3DD+jdxgAz9WGwWhTaE+Jpa45mfyZR/fTQY/SqAP38k
	r1YZQLv9YlmCos3TkuCQ2mVBxVnXtOfQ5leOvrI+Oh03iNpOBDLhaW00rITOU0ziK+4g8mnUbfrUc
	r2mNsBqRL+r/MLZxCx9jca8yRaVMD5Ns1rsDNRqsDrneqrEHzy/9EyoQp4XeMnspvGjIH7SecJ7GK
	7gDpcqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ghL-0000000BkcZ-0Mm5;
	Fri, 04 Apr 2025 13:03:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gfb-0000000BkUK-1EAs;
	Fri, 04 Apr 2025 13:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A26E5C6297;
	Fri,  4 Apr 2025 12:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC08C4CEDD;
	Fri,  4 Apr 2025 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743771674;
	bh=zukieTYHY0jzSOeUPQlnmK/fGkj4XrPKI8i8gJlsziQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gx8JTxqJLf6DgwOHKwifg+Je7IIAWq3ErZQy+rLBkMg6iY40gu82pyshEIf0pPstr
	 +FkiZGjjm93tOkwY6ib0eeC5BfpGmF5ctdcQHJ2F/lSbH42wIxWtYmVABdid8rLWlF
	 xviHGCefw9GAtIzOb4o5ZMeMPRRZsoFpxEt0EIS4snBZ99LqZKtPRasOHo8OSskyfB
	 qDJtD2zWxvwNyh49uzlKPqCk9cl4S5xpGj2iUc25ovkup6/hNsGBq3Tf+cDZNtiMHR
	 AtnrtH7VhsxwNUPIPi/V7Bw3gXLXJmf2u2irZ91WqqNM6DQVjMw0wbnfUYGN3o7kTF
	 pBRq/bxW3elVA==
Date: Fri, 4 Apr 2025 14:01:07 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v13 10/14] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20250404130107.GB278642@google.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315154407.26304-11-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_060115_383212_9E08732B 
X-CRM114-Status: GOOD (  13.35  )
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

On Sat, 15 Mar 2025, Christian Marangi wrote:

> Add support for Airoha AN8855 Switch MFD that provide support for a DSA
> switch and a NVMEM provider. Also provide support for a virtual MDIO
> passthrough as the PHYs address for the switch are shared with the switch
> address.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS                 |   1 +

This won't apply before the others.  If I were you, I'd pull this change
out of here and add a MAINTAINERS entry as the final patch.

>  drivers/mfd/Kconfig         |  12 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/airoha-an8855.c | 429 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 443 insertions(+)
>  create mode 100644 drivers/mfd/airoha-an8855.c

-- 
Lee Jones [李琼斯]

