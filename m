Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F4F01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51bKZp8HGwWRddd1tNSHXaubft5ibHLxsbZndwLhhBE=; b=a6IlM6YAuCrKfLpOfinRmnjTjR
	2LJqQzatMMq22NhN67GqnUcP9g7XSo7iyoIci5fKWavZdvRZL/wfMPlYp55H5yEe1JO9HF9nqWWRy
	/5aqIHz4ITuOHkVPSYpE7hKrNR87mfNK9Dx3IDS8ZHkX1nexKgHpVf2zhut8/xQtc9EexyebLeOI3
	jXSx6YGtrf8ZxPPLL9UO9K/DatVkkmKscea5BBNdk2l2KYEv3Mu7ZN7rBAzVWhhe8n8Z2l23WXnO/
	m1WsCXohx7ZwF6zK1QrU+wqrU4C9Mx/JScGfzHjf/UVAfiHHWghzaSGLq956w4J7zQm59gkeVl45D
	JBeTmp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ0y-00000003BOP-0m83;
	Fri, 06 Mar 2026 07:54:28 +0000
Received: from 15.511.mail-out.ovh.net ([188.165.38.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ0t-00000003BLY-25za
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 07:54:26 +0000
Received: from ex.mail.ovh.net (unknown [10.108.42.185])
	by mo511.mail-out.ovh.net (Postfix) with SMTP id 4fRzFM6XDqz9tg2;
	Fri,  6 Mar 2026 07:54:15 +0000 (UTC)
Message-ID: <439033a9-6f4b-478d-9317-f16167d138b8@aliel.fr>
Date: Fri, 6 Mar 2026 08:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix memory layout
 for 8GB RAM
To: Nick Xie <nick@khadas.com>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<khilman@baylibre.com>, <neil.armstrong@linaro.org>
References: <20260306031014.2421875-1-nick@khadas.com>
Content-Language: en-US
From: Ronald Claveau <ronald.claveau@aliel.fr>
In-Reply-To: <20260306031014.2421875-1-nick@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [92.91.227.71]
X-ClientProxiedBy: CAS7.indiv.local (172.16.1.7) To DAG11EX2.indiv.local
 (172.16.2.112)
DKIM-Signature: v=1; a=rsa-sha256; d=aliel.fr; s=ovhex24454-selector1;
 c=relaxed/relaxed; t=1772783655; h=from:to:subject:date;
 bh=51bKZp8HGwWRddd1tNSHXaubft5ibHLxsbZndwLhhBE=;
 b=lw2O4qJ5j7aJ3hE4MaFONiW2cYTLYJlv4989G5cYp2+YsZDj7lbPYzzPPRDzLbQBckbkG6JymkbZ1FVc5L9Sa43jOqM34X9n8iiA87lJ7K6olKwXeQ9M0pZc2gnrLeZKVhck8qB7xQQ1qOMvSyldpWONraTjK+6ghHH5/Hy1LJKenLcO5nTbtW9VhQ63vqZywMdmL7zqdP5Daalub1295OVdXjiPBpbp8SaDd7lusC5AG6FQc3CJbl2JAR+hfR25jl4CuZeakKS2eEkQXD9mhrroyjY0ll4GqYZlyztZDb2JWw8m+ln+GnIfThGfhkTazznhCfsQKs+ByPDctAvJXw==
x-ovh-tracer-id: 9811091791627160995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO47OSnav7wHMO6VHKQJYw5sS6E1e0dYLi3aOM6XwWvW+BSO5iAnSyXpDTvn1oG6KJjf4G2oPkJMUwvkq2sKBzmJS+e508dKIWeUZ61hmeH//FXxRIrm6M8y6Um7Hs+J92kq7PB6I88a08R607cdwV1iGBxKfjwv7MEHzwXWKMQeZ2Fva5/DJ5huPnlMsK+1reqtqT9vWQDSAbOXap04ilYp6tzIaFU9FOLlHOZRflY8zux8lbJwgB+Pc/OJakQZarkL/VVoZLBhVbJ6zS0A/YDb2Q1H+zCC9hhoj9H4FtnVb5YFUvfqbLmq0Qg6LtNthW5djX3NRKQrYgnp8e5mz/t98llNdJdNLHyfrZeTUTzVloxKRxbh61lfS5YMf7zu7oqT2/k0LUi4W9SqVCujxGP2UhsKcwWbu/8jKSEWcDvNHjZCqVdM1jQJZWv4+yfey0yAQSGC4cf+BaVdCvYf3ccJ8P7VfoPuD4yJ2cWyW+lih46CAp3DP7hBNuZ8/bmYzOISl//Y4TpKNIvqNpYdMXXTy9ubuUJdftZZDnLcjQPmKmay2PzMus2ThE0xHtzMty7KJEFdbmEDrQActRMrH+kv3Y0LjyMqCW/+X555lpEvfNn89Na9xSHNsqi60fBkEbryrv8YQ0XXscrXS55KmFMDOKBemrknUs/Lm2b1naLg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_235424_720894_541A66D3 
X-CRM114-Status: GOOD (  15.07  )
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

On 3/6/26 4:10 AM, Nick Xie wrote:
> The Khadas VIM4 features 8GB of LPDDR4X RAM. The previous memory node
> mapped a single incorrect region. This caused the kernel to map MMIO
> and secure firmware (ATF/TrustZone) memory holes as standard RAM,
> leading to an Asynchronous SError Interrupt during early boot
> (paging_init) when the kernel attempted to clear those pages.
> 
> Fix this by splitting the 8GB memory layout into three separate
> regions to properly avoid the memory holes (e.g., 0xe0000000 -
> 0xffffffff):
> - 3.5GB @ 0x000000000
> - 3.5GB @ 0x100000000
> - 1.0GB @ 0x200000000
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 25b478e106451..106eab2b4c2e2 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -17,7 +17,9 @@ aliases {
>  
>  	memory@0 {
>  		device_type = "memory";
> -		reg = <0x0 0x0 0x2 0x0>; /* 8 GB */
> +		reg = <0x00000000 0x00000000 0x00000000 0xE0000000
> +			0x00000001 0x00000000 0x00000000 0xE0000000
> +			0x00000002 0x00000000 0x00000000 0x40000000>;
>  	};
>  

I suggest to remove the leading zeroes here.

>  	reserved-memory {


