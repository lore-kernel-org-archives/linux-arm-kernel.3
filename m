Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76224D29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7nMDuaCmHzuDu+vzqYAf2Ao4YDpMJQ1LC3DQ9Aqn/w=; b=I9n9XsAGh9KCHiQ5jHCZFDOsGl
	WX0DAucxgvp764sDci3YsHFF03Vlw+EXlY7tXmLrfGibbx2djJ0fefsKoYQMKSDn3EXaJb/pZWF6c
	MRNSTUJLs0v+0JF90C8VjNPlWUAvQ8kyvdWrkh/tYy6uwB0Kaua+LDjAMdEBs/ITTPMv6EFeTD/pm
	i+7Qan2fM4xZMsRUeUAgi83jLhxxZrvcvdyqNOOYYBWowUzl3QQGfM14eXbZaVkvdDwc5jQ0RbNaK
	ns6fsfeSShANFv2ExNAuxYeialxT6bApJA1zGo4JB1Ow+vt+TwvjJjyHtS7F2xBTB1aB1nN4EdAht
	EB4VIl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8reb-00000005LUo-3E4w;
	Thu, 07 Nov 2024 01:49:45 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rUq-00000005JMc-1L4K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730943578; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=H7nMDuaCmHzuDu+vzqYAf2Ao4YDpMJQ1LC3DQ9Aqn/w=;
	b=WiDs7RkpbR0NMiso9XQ0kae5yz+S8Cy3X20yQDz6EayLlEXQaZR1DuXP3w/A/WwK42NBBNsjsXOTP6RjAtsETQNW0g8PYRWVwdMkpk4TZeZ2FHji8YRl3B808rGM3TK6BcheguW6j7x91vJ4fdi9sARdxbsPnnL/XDMV6pnx7Zk=
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WIthrqX_1730943574 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 09:39:36 +0800
Message-ID: <ef09f0d0-c8c1-408f-85d9-31fa8de13a92@linux.alibaba.com>
Date: Thu, 7 Nov 2024 09:39:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: sprd: sc9863a: fix in-ports property
To: Stanislav Jakubek <stano.jakubek@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1730918663.git.stano.jakubek@gmail.com>
 <5318a47282b8c15a3135fd12dacedb8aa70592e2.1730918663.git.stano.jakubek@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <5318a47282b8c15a3135fd12dacedb8aa70592e2.1730918663.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_173940_560111_06230291 
X-CRM114-Status: GOOD (  12.35  )
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
> This property is called "in-ports", not "in-port", fix it.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
> Changes in V2:
> - new patch
> 
>   arch/arm64/boot/dts/sprd/sc9863a.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> index e5a2857721e2..31172ac44adc 100644
> --- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> @@ -288,7 +288,7 @@ etf_little_out: endpoint {
>   				};
>   			};
>   
> -			in-port {
> +			in-ports {
>   				port {
>   					etf_little_in: endpoint {
>   						remote-endpoint =

