Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FD5EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yhiqCB96GTqqa0h+fYnytE0lAq+2YDH+/Rk+pdxEpo=; b=UDefTmoauM1S/NhPDr2y4/hU64
	46AX4/zFanidU5Y5gSSW0BUsE4vL7r3Y3VWj5PZ5uCBunWDG2u1Z4UtLTfGHXOcrzIszyS92Jj+a0
	uOjXxg+yja+EU81Ioy+7IiWy6ezd7nFManUL0wePyWOTGEGxz676wbEKkSJliUby2JQIEU4MCW89u
	fGhUVcH1YQTyZd7BCWz6i51Imu54uCHxsegLmBfqi7Xfqr9U03j58uZAenpVjU74KH3GCvqC3tzIB
	n6v/zpPzKnZgNasDioRthZtbTOz2mdHr7kF7bo60oNJPF8fF/c+lDLmSn495HHAgn/NU8SQ36kN0J
	fhR+u1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxquz-00000000KiV-1Z9o;
	Wed, 04 Mar 2026 18:25:57 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxquw-00000000Ki0-1DCB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:25:55 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C071D240103
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 19:25:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772648748; bh=8yhiqCB96GTqqa0h+fYnytE0lAq+2YDH+/Rk+pdxEpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=bfMBbmSKox3AyKDidM55DRPG8nfBJSMhQx3nwkQwS/iD0HPW37FcxZY2GTMksGFHZ
	 Iq+/4kg4blKc8mv1Sq3MUX7V5tAIeJTpbJ0TztsMSquGTqjBNRXKV3Yn3AFXewq9+h
	 M/2qpa8CVAldmvl2AH4zBH0ez3NsHs00YTkac7dKHgJQDLfbL5Fpnkt2UzRD+VjFT/
	 Q32owKzgcvjCkdaW4taccfDDifY0pNiZJkgZNl4aCQxD0xiVU4jntyFo7NplJ4HmI1
	 ffQMfG8l6q3u2vJvIxjV4VNQDgHmpCIl8KCxTrYpIlVOKa+Ej62W8CoV3RGWZ7enwb
	 +t14hinm3Ja4A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fR1Lz08XBz9rxD;
	Wed,  4 Mar 2026 19:25:46 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-rockchip@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: rockchip: Fix the trackpad supply on
 rk3288-veyron-jerry
In-Reply-To: <20260304164448.1024410-1-festevam@gmail.com>
References: <20260304164448.1024410-1-festevam@gmail.com>
Date: Wed, 04 Mar 2026 18:25:48 +0000
Message-ID: <87a4wnmoye.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_102554_514458_F32CEA2A 
X-CRM114-Status: GOOD (  17.12  )
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

Fabio Estevam <festevam@gmail.com> writes:

> According to hid-over-i2c.yaml, the correct name for the 3.3V supply
> is 'vdd-supply'.
>
> Fix it accordingly.
>
> This fixes the following dt-schema warning:
>
> 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
> index 6894763979f0..0bf03b1ff2ab 100644
> --- a/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
> +++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
> @@ -488,7 +488,7 @@ trackpad@2c {
>  		interrupts = <RK_PA3 IRQ_TYPE_EDGE_FALLING>;
>  		reg = <0x2c>;
>  		hid-descr-addr = <0x0020>;
> -		vcc-supply = <&vcc33_io>;
> +		vdd-supply = <&vcc33_io>;
>  		wakeup-source;
>  	};
>  };

Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>

