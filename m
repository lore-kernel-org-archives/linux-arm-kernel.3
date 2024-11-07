Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C19FD29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmnixL3RcmDVMH9diB+WJ+i2th3M/oRNlctOBDcUDeI=; b=DS4byu6wK6TLCHTECDaKv7KVyQ
	4El8K/SeAVzr4MLYRT14kp3F44yf/wLNYgD21UFLNo7R7SS84HMJe0X7Fhl57jl92uSa5J7hnxyVx
	W0422dS6I9EOvMW+AMoJIHtXZ6ZJc+4oQEPiSJNNkjDV3iyS5stehFKW27KSGojOpWDedQUJIGKZU
	NjS+Q8bNq/qjl4CqZB6qdeut+vQX6PyC7MGyJWkvYWMbFXmOevtXoLg+xsB/4qFuGgrI9ygiiJFDs
	URZa54tL+k/bNyNN3yqmiToXEHeAlYu3IlwEYY0QfzCRBuwlOnOGedawBzP09L3O8Lv+cdnbosJHL
	0Pgj0Xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rU9-00000005J6C-3N39;
	Thu, 07 Nov 2024 01:38:57 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rSP-00000005IoM-49gk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730943424; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fmnixL3RcmDVMH9diB+WJ+i2th3M/oRNlctOBDcUDeI=;
	b=LxBTzkexj0f1JdIZRDeanqaHFDTbBfRqOrMVYeSzXZ+89sS9joXQodiqQ7llKF799Q8pEcYxdai0Dxaur3r/86m9rY7XrAH9x00Mmw6bAhXa7n672XqJUdd5eEEpmPq7RSQwwPN6Z4ocMtarNlFBq0baMhaFn1G/JZSPotBaf/E=
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WItbwvQ_1730943421 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 09:37:02 +0800
Message-ID: <9f70dc40-2199-44c6-ac68-4d09074f9a72@linux.alibaba.com>
Date: Thu, 7 Nov 2024 09:37:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: sprd: sp9860g-1h10: fix
 factory-internal-resistance-micro-ohms property
To: Stanislav Jakubek <stano.jakubek@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1730918663.git.stano.jakubek@gmail.com>
 <30d7ad167400764b6fe37f63276c07d3e30d931d.1730918663.git.stano.jakubek@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <30d7ad167400764b6fe37f63276c07d3e30d931d.1730918663.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_173710_400430_A0B4A407 
X-CRM114-Status: GOOD (  13.74  )
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



On 2024/11/7 03:05, Stanislav Jakubek wrote:
> As per DT bindings, this property was missing the "factory-" prefix.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

Thanks. LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
> Changes in V2:
> - new patch
> 
> I thought about squashing this with the 1st patch, but I wanted to keep
> Baolin's R-b, so I kept it separate.
> 
>   arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> index cd8b1069e387..94af7700f3e2 100644
> --- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> +++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> @@ -72,7 +72,7 @@ bat: battery {
>   		charge-full-design-microamp-hours = <1900000>;
>   		charge-term-current-microamp = <120000>;
>   		constant-charge-voltage-max-microvolt = <4350000>;
> -		internal-resistance-micro-ohms = <250000>;
> +		factory-internal-resistance-micro-ohms = <250000>;
>   		ocv-capacity-celsius = <20>;
>   		ocv-capacity-table-0 = <4185000 100>, <4113000 95>, <4066000 90>,
>   			<4022000 85>, <3983000 80>, <3949000 75>,

