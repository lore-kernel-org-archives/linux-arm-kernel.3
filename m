Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D13F43688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C01nZGKZyIaa7csqsvNxvkSuHY3Pn6VMi8l+UBrhhLk=; b=bpC48rbmte+PYSuGMUCemFkHMN
	VN/ofJxWmeeSGGMrzGLIeWgfcDLrYNOk3hmXpLb18yht+65R3iyif1OPRodoUOlBKPqQhBPb3E9mF
	3vv3QdVSW96QxGVtsMdYK57Gx4LGFU6TutddT82kUl0kE6xevbDjsZyPDtRaiuxxpoZsfbhGl8vcU
	LE15bQRZosq1v7ehyEFN/wPEO7kbosE72LOEMa+lJLyy9pLNU+dySDfQQvK7uvknlpK3Ex+bjZQnm
	LrqjKmmhpI6rx0x07tH5qk2q2P976eN0K/7D1/hsOXB8vX27MROO7KnUz4SMa0/76idJsKA69lf0p
	aTJjOCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfoc-00000003r7k-45QI;
	Fri, 17 Apr 2026 09:48:46 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfoZ-00000003r77-2Fkz;
	Fri, 17 Apr 2026 09:48:45 +0000
Message-ID: <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776419318;
	bh=0nWAAGLG7q2uT/TlmR1EGTiiCf+Y0ePWlooqpsPH4dU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=qO1ANvm7IkGSuZGGrgUgsmWkCxKepAALBzh4WHE9CWnDddZKEFT8TGrQoimPCTBGD
	 Nc2EMIkbsu9W4OwWwSduacU8oLHtE9KD56zgBp1Y7ecBps2Qxd7Fsq4XgEMfnTJ7x7
	 jlhritS/NmanhX4xVs1OTlFFPiYPYx8aZ3dIQ+7I=
Date: Fri, 17 Apr 2026 11:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_024844_041130_CD3F4506 
X-CRM114-Status: GOOD (  11.35  )
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

Hello Jian,

On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the clock measure device to the T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed62..cec2ea74850d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>  				status = "disabled";
>  			};
>  
> +			clock-measurer@48000 {
> +				compatible = "amlogic,t7-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +

Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
Thank you.

>  			sd_emmc_a: mmc@88000 {
>  				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>  				reg = <0x0 0x88000 0x0 0x800>;
> 


-- 
Best regards,
Ronald

