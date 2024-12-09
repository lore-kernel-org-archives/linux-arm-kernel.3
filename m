Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856FEE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSQa61tbPwqUeRkPuD+XeddE/YYm1t+0527lCAZDVbQ=; b=cU7C7SiJD9WA1BoANZY1aNuFXS
	qp1GScYvLOSoVzPxbCKYeN0oyWPTJWCcwARWtT5GK+KYNP63Aj/hK/EHkvAbOGNRuaQA3ko/xz+st
	4E2sViQTdnBLgVSHPPN+tx4nZ6MueQCvwt7tf+dlHdVds3VfXeTaybaU99g0iwxF0hoOHTVE5BJJd
	fOlFmHfdAZkytqsuJyEfzKa2bxVvqIDEofHSZbGHbUwcSS0xSSc8YcnbAM+t9PDTiYD4DLvVfP6SG
	2PfGFyF66dSHJprTsn3/HaFOne/Fr/guf0q+z7PqY9n7eV+hKgkG2Z4BpeMf5KNN6sINENWdJ4kZg
	UEkYKojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdQC-00000007qwO-45GF;
	Mon, 09 Dec 2024 13:03:32 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd1l-00000007jsh-29Bx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HSQa61tbPwqUeRkPuD+XeddE/YYm1t+0527lCAZDVbQ=;
	b=PkXEga3Kr1UJDtXcvvImu3rh8lbk6jQ3qSI+Nv8pWYbSjyWijbWI1zNS2b6FXw
	SaUc/oBI2Yd9+GHRQBr0E3brsRRZLTwlc0DCgx74rVHm+MruRW7Gdgy1jnCnZ7lL
	zFdaDfhnDnmaTxVUspnF27OpyAyHJyk9z3Tfef3zewdno=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXEPCL5FZnDnZzBA--.46129S3;
	Mon, 09 Dec 2024 20:37:33 +0800 (CST)
Date: Mon, 9 Dec 2024 20:37:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: abelvesa@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, shengjiu.wang@gmail.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as
 SPDIF IPG clock
Message-ID: <Z1bkixjbyFhH3ZgL@dragon>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
 <20241119015805.3840606-4-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119015805.3840606-4-shengjiu.wang@nxp.com>
X-CM-TRANSID: M88vCgDXEPCL5FZnDnZzBA--.46129S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW5XF15XFy5Ar4ruw4DArb_yoW8JFWfpF
	yfCr43Jw1vgF1rC3sIqr1Sq3s5Gw43GFs3uF45XryUt3y3uryIqF4Sgrsagw1xXr4fuw43
	tF12qr1UJ3WrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz7KsUUUUU=
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEROwZWdW4JcK1gABsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043817_871160_932A4377 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Nov 19, 2024 at 09:58:05AM +0800, Shengjiu Wang wrote:
> IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which
> missed the clock gate part.
> 
> IMX93_CLK_SPDIF_IPG is the correct clock.
> 
> Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Abel,

I guess it would be the best for you to apply the whole series through
clock tree?  In that case:

Acked-by: Shawn Guo <shawnguo@kernel.org>

Thanks,
Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> index 688488de8cd2..56766fdb0b1e 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
>  				reg-names = "ram", "regs", "rxfifo", "txfifo";
>  				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> +				clocks = <&clk IMX93_CLK_SPDIF_IPG>,
>  					 <&clk IMX93_CLK_SPDIF_GATE>,
>  					 <&clk IMX93_CLK_DUMMY>,
>  					 <&clk IMX93_CLK_AUD_XCVR_GATE>;
> -- 
> 2.34.1
> 


