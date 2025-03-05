Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00865C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sazXo0j8u8UYXyOl1oOD05+MKK9ViROFc169W0yHfQ=; b=x8Tul13RAUpLSGdCbtWnxqv78p
	qah8Ye7kywBKz8VFTk15wV6CbsWD5MdEazjmeK2Hdkea7eKRQ94NNT8sNDv4bp8gEQPEC+WAw9JjO
	Slgp/NaBmMYPbO5Rj5hAgP05YP5Hb9DtFSae+E8uL5+DPQpIxCA2TjPubDL8Wv00i/jgANHuGOiHP
	Og2+d0GD9oQ0Og0Z52le04Fe6SLy37WTqZyoB2AeEAUE9x4KZPU2IUs9YeETaDqcKwjH1WkdlTelk
	s+gqfJ0Ez3276vJDb5pmAOf56iRCC3Rk2NiX1NnVOpm09UQXpaNaiv8T5bHbQlIYaIuRjKP4mFQiG
	SzGCgB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppLZ-00000008HDd-19p5;
	Wed, 05 Mar 2025 14:03:41 +0000
Received: from mail-m1973195.qiye.163.com ([220.197.31.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoBn-000000084i5-1Lpb;
	Wed, 05 Mar 2025 12:49:33 +0000
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id d09bf36e;
	Wed, 5 Mar 2025 20:49:18 +0800 (GMT+08:00)
Message-ID: <f96f7559-0b07-4c7f-a8e7-64dbfa58bee8@rock-chips.com>
Date: Wed, 5 Mar 2025 20:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Enable ufshc on RK3576 evb1 board
To: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <1741148307-137177-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <1741148307-137177-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUhPVh1DTE5JTU9PHUMeQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
X-HM-Tid: 0a95665a734003afkunmd09bf36e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mj46MTo*HTJNDD8ZMylLOCoy
	ETEKCVZVSlVKTE9KSkxDQk5CQ0hIVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUxPSzcG
DKIM-Signature: a=rsa-sha256;
	b=Z8vTH8nB1udbnV/pIWQuDaWLsFnPO3Pqj8rZADQ0MiDIh7uw6YyXOsKVhTjRuSL7rCjDwTDvN0KffHT3/zyLSU1ud3pRlXQQgvC8L/yoni/Ei0xAI/hgLNT7SotofpS/Y2XOW+yYXb71Ot0pmlJ4bNgdh4QGhqNyuMmalAEtbkM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7sazXo0j8u8UYXyOl1oOD05+MKK9ViROFc169W0yHfQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_044931_870908_6C1FE8BB 
X-CRM114-Status: GOOD (  10.85  )
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


On 2025/3/5 12:18, Shawn Lin wrote:
> RK3576 evb1 board supports UFS, so enable it.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
>
>   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> index 782ca00..5412c60 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> @@ -711,6 +711,10 @@
>   	status = "okay";
>   };
>   
> +&ufshc {
> +	status = "okay";
> +};

This node suppose to after the uart0.


Thanks,
- Kever
> +
>   &uart0 {
>   	status = "okay";
>   };

