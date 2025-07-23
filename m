Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHWFl4dMeHm4hV615rq3V80Z10qCPpLObYVROYilUEs=; b=SZYjaAr3eUpqTkAxjh2Gr4xw9N
	jAgd39OCfoqrIxWtPb1Z3PDygG0JR2l13cnBYUkU1kCwHG2om44gEWwspjAYn2WdAMsWyE4q1qjnw
	mLmxgJKBMZLwYR2PLIHcnGZEjKEEXK4mZ6SgPHVNbUy6NPHSPxjrwgTgyC33NNDWPWPxLF09at3pM
	UFnuYrNffOx5MxXzvS4A/Cru7fVM7/ne9fUD+ma5BL8TodXndROSDW7R6TljDDjd+Gm1cd/2qybMo
	CcRigtY12y+mwKSe2/ucKpCXd6i3wTWYOZxu1z2zNrvPjK8WN0JcIDjhWL+apCgpA8hIfhKU/RI1z
	VQc614CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueagb-00000005Eni-10kJ;
	Wed, 23 Jul 2025 14:43:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZox-000000056Er-1eDQ;
	Wed, 23 Jul 2025 13:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE24BA5284A;
	Wed, 23 Jul 2025 13:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44745C4CEE7;
	Wed, 23 Jul 2025 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278466;
	bh=Ot/UdzeQO5DarxCrrxun4QJevXgk61ADtTLiX9hMKWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROmbDO1nOW0cPCfvJhA900URnUlCLj90ozJ8F7CM30IeqieCaoF/AL2a/Djfp7dUi
	 H0L0gF0Ic8iw4wkct5db4uyGj5Cr/rNvxcA0KPKbjRuZNZFXBxsQQsVZQdlO2o8DqA
	 YLpURgK3MvDmZAgCFAKPUvcnzk6+7nIFHN+s/tWuAOaYEm5//s3NwQKXlSgiDJKNE8
	 arA7CThehzYsm69bja20t9VMvSTdbDk3/G8DiyzCh9ezn07QiY9fa8UZtZ0mlUh28/
	 RbhvGxrwcpQxJvMEQckPzhEF4fQYG67yAAzwtGANP5yJDNpxMSSzJJYFYjpVxCx6B8
	 8qYrTxRu5rzqg==
Date: Wed, 23 Jul 2025 08:47:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>, Yao Zi <ziyao@disroot.org>,
	Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: serial: snps-dw-apb-uart: Allow use
 of a power-domain
Message-ID: <175327846490.2145535.759049072094464087.robh@kernel.org>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-5-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-5-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_064747_501824_5C2C161C 
X-CRM114-Status: GOOD (  15.07  )
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


On Wed, 23 Jul 2025 08:56:46 +0000, Jonas Karlman wrote:
> The UART controllers in most Rockchip SoCs are part of power domains
> that are always powered on. These always powered on power domains have
> typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the UART controllers
> power domain of Rockchip SoCs.
> 
> On Rockchip RK3528 the UART controllers are spread out among the
> described PD_RKVENC, PD_VO and PD_VPU power domains. However, one UART
> controller belong to an undescribed always powered on power domain.
> 
> Add support to describe an optional power-domains for the UART
> controllers.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: New patch
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


