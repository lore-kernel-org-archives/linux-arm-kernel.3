Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CEAC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b71gCC+k/ow2F9I1vD8obsXEh1cTAgN4mksV3ZSTdiU=; b=JxQdAX4SDQMW+rORs0/ALy8YMw
	SYlEt8ktjgb3KQUhM/Sbv5ezS9YwYu2H7NDCioByWnq8wtTtlRS/i/oMuYMMtg/KVUmyi9XsW64nQ
	u7ew2ZP2pNxGSYxF6yE+u7CWOucq9APl3v15fXr1k0dk59xFRAtjqdrb1NjjrLivayYuGIxr3AyDP
	ntYs9W0HiDiIcrGsUlmDS7YeSWCt94Fit+0bpTkYZB1H3H1KPYrBCVv51oUV6RE/xjqtxCL/j1kS2
	iHppdLsxsRybbxzxpwH0P+wRbSLb3bQ04l0kta6ge6wK7EOd9RdVHLY7bxuhueADlviY71j4KRgyY
	p84yxusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgar-0000000EMtk-3lrj;
	Sat, 22 Aug 2026 07:56:45 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgap-0000000EMsI-237j;
	Sat, 22 Aug 2026 07:56:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 278CE11C825;
	Sat, 22 Aug 2026 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385397;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b71gCC+k/ow2F9I1vD8obsXEh1cTAgN4mksV3ZSTdiU=;
	b=AQneZjyGLZaZJaVm3tKxA8Hhi55/aO20sgctI7Ix0juSm2LWB2+jZ66/YMu+0VRqm/mEU1
	5m/M1VcCh+OG1Qur2Fy6ybGH5ib1LboZXilQiwUD2lGItjlv2GjpgEQzN5fnnpXPh7M1U3
	jMG1MouwPZhsi6agPhLOVKDjjfcNpjKFdAu7Jrd4wo7Uop7h3GbIKQX6lJYR6fdu2NntQv
	zfUOPtHe4A0VGaFcRaBtCCHdL+NqVpaJB5K6D6U2Dz1BV5DigMs4NvuqLgun75Ezw1LOyr
	kYmyYj+NWnRK4qEZwkK/+RwnN5JjFS4hHJFIQVWaxI3iOsArgrPDyP2EukwmJQ==
Message-ID: <745a30e5-3fc3-406c-9263-1c1c8ca9135c@nabladev.com>
Date: Sat, 22 Aug 2026 07:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] arm64: dts: st: Add ucpd node on stm32mp251
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pankaj Dev <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Thomas Bourgoin <thomas.bourgoin@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-8-c5e27cbc0795@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-8-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_005643_708503_C9F51570 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
> Describe UCPD bindings and nvmem cells to access trim values.
> This provides the PD and CC USB-C cable signaling functions.
> 
> Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Co-developed-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 51 ++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 9dc7a05fce99..be54dd56713b 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi

[...]

> @@ -1818,10 +1839,40 @@ part-number-otp@24 {
>   				reg = <0x24 0x4>;
>   			};
>   
> +			ucpd_trim_3a_cc1: trim_3a_cc1@1bd,1 {
> +				reg = <0x1bd 0x1>;
> +				bits = <1 4>;
> +			};
> +
> +			ucpd_trim_3a_cc2: trim_3a_cc2@1bf,1 {
> +				reg = <0x1bf 0x1>;
> +				bits = <1 4>;
> +			};

These two fuse fields ^ do not seem to match STM32MP25xx documentation ?

RM0457 Rev 5
Table 876. UCPD software trim data
Page 5013

                Non-volatile memory location
Name                 Address       Bits
3A0_CC1[3:0]       0x5400 01E8     11:8
3A0_CC2[3:0]       0x5400 01E8     11:8
^^^^^^^                   ^^^^     ^^^^

>   			package-otp@1e8 {
>   				reg = <0x1e8 0x1>;
>   				bits = <0 3>;
>   			};
[...]

