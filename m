Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33558EDF148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nshzxh9y6WqEB4WRbDhitJymaUOLK/yf767h/KWPrU8=; b=BDfW/q67Xkw03DLx+iJpmX5fxn
	2bV2eeecZBRdh7IBjguUQ2vAAkngdSiijrxRaHi6HE1apW6WzQ6Padou7XVlApMk0j6kVdpy8WXk3
	BkdEdICGahLQbo30PDWFjlWTMQgGHe/qkG+RVNBhkSJd3A39+DrlkUiZynBOukltDrlaZgC+8mtTZ
	2CyEfl9QzdXd4trA5CEhpNaKV3SJaNzwfvatXpr6aRNrkyYQ3kkc20nOcsT6TAxBmcyJvho4WiEKD
	S9VKF56MX66gbwFr9Zp8jCzsGtZ7mI1d+FjdmeUsMUXctRFm0XHdcnY3d3vCNkOQahCxdtLATi3nh
	djw+w+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqUG-00000003JtN-1ZNd;
	Fri, 13 Feb 2026 10:33:24 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqUC-00000003JrR-3x6K;
	Fri, 13 Feb 2026 10:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1770978772;
	bh=nshzxh9y6WqEB4WRbDhitJymaUOLK/yf767h/KWPrU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ocWTGaDg9TLhmRn+O0719X89zgf3zeb9FEQgbTNtPWtPr6BP7H25kZEpGCE924fvg
	 cAO5Tuuf7T9g09e+IHBC02oLRYkcMh4TCKunDaQIFPWF7TnfshOWwrPsp4cxV1KR9O
	 ffnbQAHZXhx8xI3EhdzrNJN0fOepBroY9aag+XUM=
X-QQ-mid: zesmtpgz8t1770978767t2c3fd337
X-QQ-Originating-IP: TBATnZT9oxdxKnfXfChj4fGGtd3Cu+T1Z4H/cOr6yy4=
Received: from [127.0.0.1] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Feb 2026 18:32:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4695454215096613574
Message-ID: <B5000B8F1001C1D8+040b217f-8ee1-4f96-95ec-e44d140b589d@airkyi.com>
Date: Fri, 13 Feb 2026 18:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add node name for
 RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OFWsfmE1GYcu9RcZm1zNdEiv/fV17XjKtVbokAv7tVfDInpMR9idsTrR
	yDDRmNIj8kWnh7O7NwBg+DJKTv9mRKJ6M8hVBxow0z52BqFJJe/UGx6o6a7W57Fb2/FOrmE
	mI6VAllmfwUbVIqT7EoBEQksnU8lePKtaSI9VZbuYBsYpGqzxNzHKEz5d8q5maoKYqtKOnG
	kCcHrw8kgkaDy18eEQ54GLuvhLZNmDPrL2SJ5fHUoni0KWOPio41O/MjoswG3jvb6MdSzPO
	tYfCARXp+6sz4B9198buqARMcGY5jHqPu5duhzyBxxYVgo6zT3b/xfytQWuo9tkA9Qaxt7j
	oDzZ/f2dPW/+yrtlVNV1DZZMLs8wns4XsABawaxA7LE1l5NGdxU2MVrLmWF8cX+El9EEMet
	EQKIMWiimtFKFfJ5X0HaxnuDWoUKVOgyOSanrWphAxWtwVAIYh/TX5dg2mmZrMkAC6luDVW
	BtOm1KNthwA9CXrZNSgLZlmrIrlZob8Mz2G/4eTbn9yP2rPQc6KXzmkcoUYtqK9mDEQbaEQ
	YUIPd/ABj93LxMfZeJUTW6gqBISwE/1pZ5DxZr5rUxhfBd3IjMKH5vs32xQ3gcI5W/mUvk6
	DAb1wavSuachR9tg7Em45R0jGMgVGcCaNxoHh43SeI01MsN0NJvx9VXKMaV7LEHmcVwZw2y
	mZT9U7y/TmnemqN23dHRMe4y/39Rr28EggcW6SnDcDwXKhkIS2z5+aNdWeoyiagpwICcyBt
	CqydGY+SRibeePFDvL6rmeMnkrdDUmGuk+ZHs5GZhVZgi4DUhn3mAUtE9MbVi/O5gGhWWdt
	LimOwjXUZLd57xVx5+mUVjxDckh7nYgne8jIn1FqY0BGQ2ByTgZErNBeNFT0TQDTjqhgWrl
	fcsasZRo1Wg0PE+aVkXD4oV8roG/SyjZfWgFyCKPr48fy3i87lV71eX+5O/hL31eGpgF5gE
	3BpYPdvPwTV5md4jhU7YO0c+VoB55kTSFhzbGGeIYTmmologxLlFgjQeFomdWPQj8msU=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_023321_452625_6A94C4D7 
X-CRM114-Status: GOOD (  14.26  )
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

Hello Shawn,

On 2/13/2026 10:35 AM, Shawn Lin wrote:
> Thus the board dts files could add property for these nodes.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
You should also add pmdomain driver.

I've encountered a similar issue before. 
Finley told me to use the new PMIC, and that would solve the problem. 
Maybe you're using the same old PMIC as I did :)


> 
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 7fe9593..4fb8888 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -907,7 +907,7 @@
>  				#size-cells = <0>;
>  				#power-domain-cells = <0>;
>  
> -				power-domain@RK3588_PD_RKVDEC0 {
> +				pd_rkvdec0: power-domain@RK3588_PD_RKVDEC0 {
>  					reg = <RK3588_PD_RKVDEC0>;
>  					clocks = <&cru HCLK_RKVDEC0>,
>  						 <&cru HCLK_VDPU_ROOT>,
> @@ -917,7 +917,7 @@
>  					pm_qos = <&qos_rkvdec0>;
>  					#power-domain-cells = <0>;
>  				};
> -				power-domain@RK3588_PD_RKVDEC1 {
> +				pd_rkvdec1: power-domain@RK3588_PD_RKVDEC1 {
>  					reg = <RK3588_PD_RKVDEC1>;
>  					clocks = <&cru HCLK_RKVDEC1>,
>  						 <&cru HCLK_VDPU_ROOT>,
> @@ -926,7 +926,7 @@
>  					pm_qos = <&qos_rkvdec1>;
>  					#power-domain-cells = <0>;
>  				};
> -				power-domain@RK3588_PD_VENC0 {
> +				pd_venc0: power-domain@RK3588_PD_VENC0 {
>  					reg = <RK3588_PD_VENC0>;
>  					clocks = <&cru HCLK_RKVENC0>,
>  						 <&cru ACLK_RKVENC0>;
> @@ -937,7 +937,7 @@
>  					#size-cells = <0>;
>  					#power-domain-cells = <0>;
>  
> -					power-domain@RK3588_PD_VENC1 {
> +				pd_venc1: power-domain@RK3588_PD_VENC1 {
>  						reg = <RK3588_PD_VENC1>;
>  						clocks = <&cru HCLK_RKVENC1>,
>  							 <&cru HCLK_RKVENC0>,

-- 
Best, 
Chaoyi



