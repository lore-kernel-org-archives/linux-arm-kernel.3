Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DBBECD6F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 02:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCi3YGgnLoVE1W2HsrMQ/FCP0zR7jFK/2gBDx58+5Yw=; b=JuamB3o5ftx2TNEs73tcXZ+i/s
	9XpaJIQvRJztN4HsZV8EnsUiRfAWbEZ+nvJiLlhuGkHL9Mznt+xGOJois3QrsWZJ5mVx+629Yni2V
	9djEzXAATh/vuJKeCoQ8knwWgQliGa5lDPeCvI3In6E7Wc+h5VorfRyttaiwoJTsGZ6Af4y7j5QM0
	3akFtVT2RJJ3fopK/m+Mat4trUK1pxcKB9Q8aN/2CFsNal6dkr5xuTtVhLNcMIJ8C93N5j53m2HG0
	98lULQeMDOBV4C7afthFklsTRKfL+kbeHPhk9UiHf6w2h4xNYd6PvQRtiocR+YEDezoePEV3MPYoO
	WkfAON0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqj8K-00000002s2U-2NpP;
	Fri, 13 Feb 2026 02:42:16 +0000
Received: from mail-m49228.qiye.163.com ([45.254.49.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqj8H-00000002s1o-1Vbu;
	Fri, 13 Feb 2026 02:42:14 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 340a00380;
	Fri, 13 Feb 2026 10:42:10 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add domain-supply for
 pd_rkvdec0/1 and pd_venc0/1
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <1770950113-19802-2-git-send-email-shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <ea9df274-278d-f344-f66d-8821388e6690@rock-chips.com>
Date: Fri, 13 Feb 2026 10:42:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1770950113-19802-2-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c54e094bd09cckunmb048d5ac255a59
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5IQ1ZIHUkdT0MdTxlCQx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=K2OM3Si9wBqCmq8bANg7KqcJFis8rf/sua0SZoVww4sK+Cjw6sLX6w6TdhTLyLeyNfgId8yvo2FVhai1YSB+i4lCUhyrbnowQO5uX479Da0rdFtPUsmJyRwxs77nDpyJXv4+LV+pyQSi9MtxyMswdhR0CMr/0kqY2PdAK/4ycgI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sCi3YGgnLoVE1W2HsrMQ/FCP0zR7jFK/2gBDx58+5Yw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_184213_560504_D068D032 
X-CRM114-Status: GOOD (  21.00  )
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

在 2026/02/13 星期五 10:35, Shawn Lin 写道:
> The power domains pd_rkvdec0/1 and pd_venc0/1 depend on two voltage supplies,
> vdd_vdenc_s0 and vdd_vdenc_mem_s0. These supplies might be missing or cause probe
> deferral. Since the Rockchip power domain management code currently supports managing
> only one power supply, and both supplies belong to the same PMIC (making it highly
> unlikely for one to be available while the other is not), a practical solution is
> implemented.
> 
> Both supplies are configured with the boot-on and always-on properties. Only one
> of them is assigned as the domain-supply for pd_rkvdec0/1 and pd_venc0/1. This allows
> the power domain code to perform a nominal enable operation on this single supply,
> thereby successfully acquiring a reference to both supplies (as they are from the same
> PMIC). The system then relies on their boot-on and always-on flags to maintain the
> correct state.
> 
> Crucially, this approach handles cases like probe deferral correctly:
> if the PMIC is not yet ready, enabling the power domain will be deferred until the
> necessary supplies become available.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts  | 16 ++++++++++++++++
>   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts | 17 +++++++++++++++++
>   2 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> index c9d284c..09bc7b6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> @@ -568,6 +568,22 @@
>   	domain-supply = <&vdd_gpu_s0>;
>   };
>   
> +&pd_rkvdec0 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
> +&pd_rkvdec1 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
> +&pd_venc0 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
> +&pd_venc1 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
>   &pinctrl {
>   	audio {
>   		hp_detect: headphone-detect {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> index f820505..25d80b6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> @@ -381,6 +381,22 @@
>   	domain-supply = <&vdd_gpu_s0>;
>   };
>   
> +&pd_rkvdec0 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
> +&pd_rkvdec1 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
> +&pd_venc0 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
> +&pd_venc1 {
> +	domain-supply = <&vdd_vdenc_s0>;
> +};
> +
>   &pinctrl {
>   	audio {
>   		hp_detect: headphone-detect {
> @@ -580,6 +596,7 @@
>   			vdd_gpu_mem_s0: dcdc-reg5 {
>   				regulator-name = "vdd_gpu_mem_s0";
>   				regulator-boot-on;
> +				regulator-always-on;

Oops, I sent the wrong version. Should remove the this line change.
Will fix it if v2 needed.

>   				regulator-min-microvolt = <675000>;
>   				regulator-max-microvolt = <950000>;
>   				regulator-ramp-delay = <12500>;
> 

