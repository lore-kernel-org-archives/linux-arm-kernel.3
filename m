Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3AD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPWiXqpZMfAENJNIFVjNv/hwV+fs15okQoUfuDVtpHY=; b=4TLo4Sz6DF/1fTTrpfeIuX/jmn
	RKXveIU0SkrrXpJ4hfSfOhbcaOdQ3BGT+32wtM5Zrw/K50mahCBReg2olrN59TsQH3hBTgBpBx1Tc
	hboYB2qZcdIuHByrJI0kYCdQ68hATsmct1r83uODHIoFkgmbhme9An2jrTGjs4DFeUkqvbwj2QA/T
	RZgQld5SyVXGbGWz5j+qI1I5hxNPhPC1pmpRu1nM0D6zmwY/NW0ingkSDq9/Cun69tzbCIs43+1MB
	fAa9ZnYrmxZ/nr7KsADWjCXl50+vp3vBYT/s3NgF0z28fQAiuBYQCYfbgKr0qIIdEd9qm25wICaGy
	eeB2PVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo9f-00000002dwO-0GB5;
	Sun, 28 Dec 2025 10:37:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo9d-00000002dwF-3c04;
	Sun, 28 Dec 2025 10:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26CDF60055;
	Sun, 28 Dec 2025 10:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CDFC4CEFB;
	Sun, 28 Dec 2025 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766918259;
	bh=tScfBYOtRID8530p/TDWqzPjWcV81xakAQZDi50lRYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oCcBfrH7TAFB3UmZW2Zb7AyyTxMxbPiDmMXV800ieOVvpA0HN2Cb33jXzdM9qhEWj
	 Pn+F4/5OYmTmV8pmSUpxMgPh93ORjbiALRaFoEeT7aVCNQ7QZ4uOfQI9Cep6PksmJe
	 8yqpRuuoumoaVGEARXAHkAHq7xHHJ08DMtqV/8o84CoNgC9wN5LvrxOZ3IuS6JWokl
	 21a5KcICwR1h0bVWuVC2nARfL42e3tPH+27KMnTONTNH8CCaqCpt/yKyWIhSljVgYz
	 E4Vv6CR9zdOENh8Ddyrmf/hGCm0G0wGPxC9S3bKkvmYglxcyFSdf1LpluuosWt+wnO
	 Gb6lHnQJB73xQ==
Message-ID: <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
Date: Sun, 28 Dec 2025 11:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-8-ye.zhang@rock-chips.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251227114957.3287944-8-ye.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
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

On 27/12/2025 12:49, Ye Zhang wrote:
> +		/omit-if-no-ref/
> +		rm_io28_touch_key_in6: rm-io28-touch-key-in6 {
> +			rockchip,pins =
> +				<1 RK_PC3 7 &pcfg_pull_none>;
> +			rockchip,rmio-pins =
> +				<0 28 49>;
> +		};
> +
> +		/omit-if-no-ref/
> +		rm_io28_touch_key_in7: rm-io28-touch-key-in7 {
> +			rockchip,pins =
> +				<1 RK_PC3 7 &pcfg_pull_none>;
> +			rockchip,rmio-pins =
> +				<0 28 50>;
> +		};
> +
> +		/omit-if-no-ref/
> +		rm_io28_sai0_mclk: rm-io28-sai0-mclk {
> +			rockchip,pins =
> +				<1 RK_PC3 7 &pcfg_pull_none>;
> +			rockchip,rmio-pins =
> +				<0 28 51>;
> +		};
> +
> +		/omit-if-no-ref/
> +		rm_io28_sai0_sclk: rm-io28-sai0-sclk {
> +			rockchip,pins =
> +				<1 RK_PC3 7 &pcfg_pull_none>;
> +			rockchip,rmio-pins =
> +				<0 28 52>;
> +		};
> +
> +		/omit-if-no-ref/
> +		rm_io28_sai0_lrck: rm-io28-sai0-lrck {
> +			rockchip,pins =
> +				<1 RK_PC3 7 &pcfg_pull_none>;
> +			rockchip,rmio-pins =
> +				<0 28 53>;
> +		};
> +
> +		/omit-if-no-ref/
> +		rm_io28_sai0_sdi0: rm-io28-sai0-sdi0 {
> +			rockchip,pins =
> +				<1 RK_PC3 7 &pcfg_pull_none>;
> +			rockchip,rmio-pins =
> +				<0 28 54>;
> +		};

Why are you defining all pins? This is wrong, your driver has to do it,
not DTS. All these definitions when not used are just pointless.


Best regards,
Krzysztof

