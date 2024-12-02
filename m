Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F311E69E85
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHPvkOem4VaVW0AE4Dt/YoeQQMrZt/gFJPXE7rL/cFE=; b=JdHxRQYk2+zERLGkn0m/dl4QHz
	4niT2PJovlnvdBXoKI7UEjcKXSeSqcmWbw+K3EUw4gBOcyDJBgR+RKN/UKCO2Qd+1bjpvHsmBoZ5x
	x259VExQoKg98L79WtsiZDDlQAbDgDtwTJdMvw92ahqMPm5t/EhCUCqyxDmyaMAjoPOuR1+yFxVpk
	LwcxkcDvGt+QLXP2iBPnNgKbGfdmy0ohNC69IKmH4Wft6mu7kJ9IaHN0aV/HcyYVA5akhzlqYVr64
	8fUAlhxCZj8FoGe9tt6mrLrj1MxNGNET8+pe0ZLYIdGbJOFZEUprNWJvqZ8OaiLDjwYQGgjCuxl2e
	Qk/pu9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBFZ-00000007AzZ-1yZN;
	Mon, 02 Dec 2024 18:34:25 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBEY-00000007AmC-20UX;
	Mon, 02 Dec 2024 18:33:23 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733164399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qHPvkOem4VaVW0AE4Dt/YoeQQMrZt/gFJPXE7rL/cFE=;
	b=IIAJLXtj9bchvOfkoZlqx6PZMyEfYABMekDNw/5duAKp9mvYOnVJH/MoZI9he/IIjRZaxF
	Si6D9du4z0mlAw777O1JDmlf/Jdmzga2wqATb0H8TFpdLn1xp1yukDdro1NTpGJEA6rvdc
	boFP9qJnfgD/ARjBWzZm6D6cRZEIunL2gX9CgrJXSPFiGgZdhXOQvwezmm0vtPQcnK9vdl
	6sMSLzqQ/SU6s59QuMmLZhwQlI/7nTbFv0809vdQM7OmYSZ7PXXcrPGZfrX9aFiWP3UKZa
	w57EuTxZsmAUeW5r/L1WfZLnEo5yDvUp3pwbPPaZAeyGKcDRVoqdJbB8nu/bnA==
Date: Mon, 02 Dec 2024 19:33:18 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH] arm64: dts: rockchip: Describe why is HWRNG disabled in
 RK356x base dtsi
In-Reply-To: <D61DMK8O9JCR.1C62A5UGI51BT@cknow.org>
References: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
 <D61DMK8O9JCR.1C62A5UGI51BT@cknow.org>
Message-ID: <a6eaa2ca428abe2bedf10cc8c213513b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_103322_662307_0ABDFA9D 
X-CRM114-Status: GOOD (  14.52  )
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

Hello Diederik,

On 2024-12-02 18:05, Diederik de Haas wrote:
> I'd have swapped 'is' and 'HWRNG' in the subject, but otherwise ...

Ah, I'd actually write it as "Describe why the HWRNG is disabled
in the RK356x base SoC dtsi", but that's way too long for a patch
summary, so I went with something shorter that also makes it sound
more like a question than a statement. :)

> On Mon Dec 2, 2024 at 3:44 PM CET, Dragan Simic wrote:
>> Despite the presence of the hardware random number generator (HWRNG) 
>> in the
>> different Rockchip RK356x SoC variants, it remains disabled for the 
>> RK3566
>> SoC because testing showed [1] that it produces unacceptably low 
>> quality of
>> random data, for some yet unknown reason.  The HWRNG is enabled for 
>> the RK3568
>> SoC, on which the testing showed good quality of the generated random 
>> data.
>> 
>> To avoid possible confusion in the future, [2] let's have this 
>> described
>> briefly in the RK356x base SoC dtsi.
>> 
>> [1] 
>> https://lore.kernel.org/linux-rockchip/cover.1720969799.git.daniel@makrotopia.org/T/#u
>> [2] 
>> https://lore.kernel.org/linux-rockchip/20241201234613.52322-1-pbrobinson@gmail.com/T/#u
>> 
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
>> index 62be06f3b863..ab8f42c0a843 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
>> @@ -1032,6 +1032,11 @@ sdhci: mmc@fe310000 {
>>  		status = "disabled";
>>  	};
>> 
>> +	/*
>> +	 * Testing showed that the HWRNG found in RK3566 produces 
>> unacceptably
>> +	 * low quality of random data, so the HWRNG isn't enabled for all 
>> RK356x
>> +	 * SoC variants despite its presence.
>> +	 */
>>  	rng: rng@fe388000 {
>>  		compatible = "rockchip,rk3568-rng";
>>  		reg = <0x0 0xfe388000 0x0 0x4000>;
> 
> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
> 
> Thanks for this :-)

Thanks. :)

