Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D5ECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W54prHP8fGytU1rOS8+Hf3AtDU1mG+ds5OTzQlLpjTM=; b=0MCWvSTFZnJ92qPqgpm/G1gjYc
	vkYm9zQZT4j2xncDBUgjORpvF2SuXjtBSp3rLru0ZvPHajLdxYvcFQv7GLLLqwXb+Jx8SzB9aa9y9
	lo3DfWa4ufCQbfI6uBNdKnpKTZ8wAyoseDfZhrB+akXysX+ZhYCDnvecAzKJD0ixiI6E8Q2TTVMxE
	nRvMDACjHXosGZM45Te8pR2x3cpIDsRcOv0/BVumkOYsnRfXiIuRDlUD38sEVih9hJOFiAXNxCkXW
	vMlhaqNrp2HJcsoKh6uZ3fiLsHke4HTHHHV7L2B1MTYEwUy0GSUZvR2RuUD8kssIDdGWKTRcWL35m
	NfTOWEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnzV-0000000A91f-2TZG;
	Thu, 11 Jun 2026 22:35:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnzU-0000000A91X-2OgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 22:35:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7F08443FA;
	Thu, 11 Jun 2026 22:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473061F000E9;
	Thu, 11 Jun 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781217311;
	bh=W54prHP8fGytU1rOS8+Hf3AtDU1mG+ds5OTzQlLpjTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k52kniZdWL8UQldjmDCHEjGM3FHMz71eXjKAszKy960u1J3nV5NgKEsgfje41M9bK
	 8ClaXzadch4CC5Xgbv5PKN+kSjRS3iCIWcxGynb3xd1vYoOknYBAuWgJwhHWGg+ltM
	 nQRpjCJCABcXuAHowippgIYll3CALI4z1i4egD+o0+NN8NphBG7R06OgacmIA0K0uQ
	 gIqR9hSuYEUqR/WUhzJO60KL/FkRe7+LBiQZQI2cFo6dAQkRk6iKghkjAXqd+oF4he
	 Sd0P1WnLXTDB/UQFI2RVjNjWPuhIRWMVTXT3cYBeAj3UnvdhFCBF0H+uzxXhZ7PUAF
	 elv+LRBUt/SCg==
Message-ID: <985d6f4a-bc8e-4c41-9d88-e845210d22ed@kernel.org>
Date: Thu, 11 Jun 2026 17:35:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] arm64: dts: intel: keembay: Always use decimal
 interrupts
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Paul J . Murphy" <paul.j.murphy@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <abff7cc5aa2e66524a90523e07e11a42bd3e9e58.1781103222.git.geert+renesas@glider.be>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <abff7cc5aa2e66524a90523e07e11a42bd3e9e58.1781103222.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/10/26 23:55, Geert Uytterhoeven wrote:
> Replace the sole hexadecimal interrupt number by a decimal number, for
> consistency with all other interrupt numbers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/intel/keembay-soc.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/keembay-soc.dtsi b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
> index ae00e9e54e82cbb9..b6323ebe7a5f46bd 100644
> --- a/arch/arm64/boot/dts/intel/keembay-soc.dtsi
> +++ b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
> @@ -71,7 +71,7 @@ timer {
>   
>   	pmu {
>   		compatible = "arm,cortex-a53-pmu";
> -		interrupts = <GIC_PPI 0x7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>   	};
>   
>   	soc {


Applied!

Thanks,
Dinh

