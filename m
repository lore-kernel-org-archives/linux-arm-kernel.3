Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKOwHKDVPXVA4K4NLTQnzRyUV+R2Qo8xdwTq19z0PqU=; b=e1iFCn80kQ6+RJdZY2IjYFUQIV
	EZL+HgM+brKr7vJ+BgaEqJqsGTirdqJ0051moa7b4X5oZIJsBHvziUSV5Uo4UsFSSpF8Nx0/xWqKp
	blltqHndBdmBYyxCXD+v5ntWZu8uOkYrcDa4kaop8xQa5oMv6NEzSbSvPD9b9yi4bL4RtGlw+j3vt
	BYI/ImAhp7kZ4LwXttBrgqFUdfXI/lAZy3oWXyxj7K1qFkMbYCYLQE5n6Jz0MiuTZ6mxq11MXIBvB
	jrajVPkWEDO/yLZ3sj7z2SEmtQxx/Z0Mo5pbcBs0qSG6WG5kpEmgslSGNDA0hH0IjuoX8Bfeksjy/
	ceZnJICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6ZR-00000001sus-1bGr;
	Mon, 17 Mar 2025 09:15:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Wy-00000001sRN-3rHw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FC015C06E4;
	Mon, 17 Mar 2025 09:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED64C4CEE3;
	Mon, 17 Mar 2025 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742202788;
	bh=egUbHhdw/VIJUm8LAkutH+qWohBTh+J4+/zQg3hloi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjKN/zG7AcRdgZCTvQmGNJS/2vUNCY0+Vj973da/zf3skngITlJdC8hKBNeJ2k+TX
	 zzhTEyI04kRxaWNf9LjC0c37o6ZztkmkjIQR+xXdmsTbx99+HC8OdE2vHc5lQODm0g
	 zZs3js/JJAVI6s4zJairySxrmVYks36twqWF9hCzjyviyXzFpJ9Ql4bjlMYM1lp1NS
	 cmvAh5KTGD8vTn/lCAhbgw/0lX+6OkG+MKHJzK7EsvK8DfR8d3UDuyDLwgp64Zd2Hp
	 tNwzcvIjhmguyrmtYXZSBKebeW44t0TMzlu0yLSAb4WXImdFY+tSUXf8VX1ofmtNrH
	 9ER51BCV754Tg==
Date: Mon, 17 Mar 2025 10:13:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ARM: dts: aspeed-g6: Add AST2600 LPC PCC support
Message-ID: <20250317-chital-of-unusual-force-a4b7b7@krzk-bin>
References: <20250314112113.953238-1-kevin_chen@aspeedtech.com>
 <20250314112113.953238-3-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314112113.953238-3-kevin_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_021309_079388_89CAFBEB 
X-CRM114-Status: GOOD (  13.58  )
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

On Fri, Mar 14, 2025 at 07:21:12PM +0800, Kevin Chen wrote:
> The AST2600 has PCC controller in LPC, placed in LPC node.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 8ed715bd53aa..f238337e02da 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -626,6 +626,14 @@ lpc_snoop: lpc-snoop@80 {
>  					status = "disabled";
>  				};
>  
> +				lpc_pcc: lpc-pcc@0 {
> +					compatible = "aspeed,ast2600-lpc-pcc";
> +					reg = <0x0 0x140>;
> +					interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
> +					pcc-ports = <0x80>;

So this is 0x80 for entire SoC, then it is implied by compatible, no?

> +					status = "disabled";

Where is any DTS user of this device?

Best regards,
Krzysztof


