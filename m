Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E11CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oefRY0fFefxl28/o5QhD/a5b/i8VSWbq+FzLnhrbYsU=; b=du9pVPrXFst18VCLtJ65tIt10s
	Rfy9K2pV8COuMGtHZxRDirK/n20U1FtPA3anfyawsDRvQEWPTmpbRi0FH7II3DV0ghpYLDv/9Xs7r
	pMWarcOwkQvMq8zPbQOrmtz6k53mu2TevbEl9vUv8ixmJKzhv4wp47fAqvWPb7Uud6A8brxAPyVDX
	XxVE3gBmtRuW49eKTHnSl1+GtiBMgekxG7Blcjhz8C0APYt+sez5Jgt7RHGa6gMDK1Yslt1h1V74n
	82rP4rNCV0RdGY3fMOcRsvQERlGn+zzajv2MXOg6XCkba9VO7XjAaPD4cUNKxhLTncX2fht87Dqpb
	hBWvJcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5HJ-0000000Eskg-0lDC;
	Tue, 05 May 2026 02:12:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5HG-0000000Esk7-0mPK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 02:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 715D143EB8;
	Tue,  5 May 2026 02:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A883C2BCC4;
	Tue,  5 May 2026 02:12:45 +0000 (UTC)
Message-ID: <5cd0103e-50f0-4942-b0a5-2d9a9a722ec2@linux-m68k.org>
Date: Tue, 5 May 2026 12:12:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] m68k: stmark2: enable DACs outputs
To: Angelo Dureghello <angelo@kernel-space.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 Angelo Dureghello <adureghello@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_191250_247526_1C5A16C2 
X-CRM114-Status: GOOD (  15.61  )
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

Hi Angelo,

On 5/5/26 03:16, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>   arch/m68k/coldfire/stmark2.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
> index 30da9bcbfd63..8fdfb9415cd7 100644
> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -137,6 +137,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
>    */
>   static int __init init_stmark2(void)
>   {
> +	uint16_t val;
> +
>   	/* DSPI0, all pins as DSPI, and using CS1 */
>   	__raw_writeb(0x80, MCFGPIO_PAR_DSPIOWL);
>   	__raw_writeb(0xfc, MCFGPIO_PAR_DSPIOWH);
> @@ -149,6 +151,12 @@ static int __init init_stmark2(void)
>   	/* CAN pads */
>   	__raw_writeb(0x50, MCFGPIO_PAR_CANI2C);
>   
> +	/* Enable DAC0 and 1 */
> +	val = __raw_readw(MCF_CCM_MISCCR2);
> +	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
> +	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
> +	__raw_writew(val, MCF_CCM_MISCCR2);
> +
>   	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
>   
>   	spi_register_board_info(stmark2_board_info,

Same comment applies here with regards using mcfreadX/mcf_writeX as to the
driver itself. Uses of __raw_readX and __raw_writeX will be changed in the
very near future to use mcf_readX/mcf_writeX.

See the those patches at:
https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t

Regards
Greg



