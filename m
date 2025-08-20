Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71062CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOX/fYfqTliDVyWs9MpkqZbki9d0Za52F0IBiYzNolc=; b=laEUbpULSNJ3MJ17PTSxMv3YXK
	835LfjSc+mbWXDMxnvSoMK91ORlv2ar74Vq3n/9zMMtAbTK7qqpw9HjzALnqNV5ibNGc9xTsW4CKX
	/BIgyzLBKwYoDHEezyjBEEE/YIGptcCGGiHBABMR+727ooPf8tJmcWsE+NQVkajXst5zaBuGiWoTb
	6VTvsv59CgC/j4qOz3DMgfR62cSRYzziJN9JlPhml0gWZNFFWu8mvMzg2mRrMolMV6XQcV95kckmF
	rj+wCmCdscc6kb6EMrKrrO60jUAA9PHWuzdN5t9qVj9xNZYFtYKtG5RHJiTNjMrWXIW//9BATSjZw
	/zEhM3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYQu-0000000CA80-10dF;
	Wed, 20 Aug 2025 02:20:12 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYOG-0000000C9wb-1xkC;
	Wed, 20 Aug 2025 02:17:30 +0000
X-QQ-mid: zesmtpip3t1755656213t5f3e686c
X-QQ-Originating-IP: Ak+PhEWaVg7vGtjuhuEht2sFkVHdkBKroE3obuaqw14=
Received: from [IPV6:240f:10b:7440:1:74a0:7bf7 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Aug 2025 10:16:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 737961017978575348
Message-ID: <1D03D9D55EB70125+5dd53657-8d25-44b8-9098-d50ed83422b2@radxa.com>
Date: Wed, 20 Aug 2025 11:16:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: update pinctrl names for
 Radxa E52C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <ABB74D9D1E3774F3+5a8c0d7d-fb7f-47c0-8308-e2b69f0628c1@radxa.com>
 <20250819150038.874297-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250819150038.874297-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Obs4Jap+oQoElEGq0Lc5JCw+Xektz5mLbP5RVRl29pHgLbh1bR4O+EAw
	xU974t2idpKBM+kVij2aqJ/iWYAMBjYxPeN3V2KLggL2w6O2XlwlTcddob/stHHSCEXq5bh
	2wN4zpH1H6P3o6fITDklD+nvaKOVgkN8YxpgeZBLE0a1+NzHwg/gkNEwm61Ps2xiDRgJjqb
	qLfeIU3P/2tpdDrcosS1w0xSRJ+8nN4hXcflwwYZ++gWIGpDuAha54+ap2cl03MJ1dcsA8p
	rxoCnwelsNGFQilUTUf/+ca/RliHQcfaOgp+oiAhrNI+3FYO93f4KmCV3d/aPnozgeJVTeu
	V5CH4lInD2sooD8SOiJ1ANmNVG9x6e/+ZjtLgy7ZaTv6FXnyf35kooFzWi1QXO5QmiOrgiN
	PL/+v690/6Gt0f0v9Py22m1D5MBx1JiEPcipnkompcC9jsbBwNHk3B8jDJ7zqI7MaeoMImh
	luETTpH0rKjLrdLhcyFIjYjxFZe7Y1/x4KRwzgWKC4Z5TqY8avChRaaNhBYPyNOZu8p8yho
	CutfioZntOrOPnwMZ8cRi1LVCv3R63N5El0WUq43Zq/QQ0HgAsvzo+SIe7TGX6Iwn3mq6Ei
	XWhCF6QoBFb6qNQek4Wj3KxeoxChMV77kfk9sooMfafgNwGxnDpxS3SItmziTmR+wFCNrUs
	ewIHMmMPzETGW0f1X7FlQn8HwLCnlAAEJ3xuhBRi/IsLkqSonW0xtfHib7imOa7OZqvpqM4
	LWzHthfKuMx9QYwpjANiuPGqbn5pzIeQh5BYD5nPT3nukVTPWeFBAiWvldzHTO3r4I+VH6x
	VjERtqJDBkt7zLbGfaeSwnrxFeebE+cLaaL9LQQtsaLKqLT+R+daZGuGdA/a0dqvIJQIjJ2
	QxwYl7lvrWGi2gwOW+7JYUJQ9QxKS+f5/QrWVkR8z8hIozMlH2IT76tu5PfZBmi1dXTUuVm
	dXedPW6PMK/gWLSk3LxFUAYYibmDz6ruwwmVpyCbQGWfqxU0ThM01PBwLuOCn1vlH/FRM+K
	A84NmXUjTz6AgGfEjxEHXnzmldcFg=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_191728_905055_427F0589 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Chukun,

On 8/20/25 00:00, Chukun Pan wrote:
> Hi,
> 
>> "The name of a node should be somewhat generic".
>>
>>    https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst?plain=1#L193
> 
> Usually we use the name on the schematic. For example, the patch for e24c:

I don't mind using names that match the schematic, as long as the device 
tree maintainer doesn't object.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> https://lore.kernel.org/lkml/20250727144409.327740-4-jonas@kwiboo.se/
> 
> ```
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio0_a0_user>;
> ```
> 
> If this is incorrect, I will abandon the pinctrl changes for
> the user key and power LED.
> 
>>> -		vcc_5v0_pwren_h: regulator-5v0-1 {
>>> -		usb_otg_pwren_h: regulator-5v0-0 {
> 
> But I don't think the above is correct.
> 
>>    https://lore.kernel.org/all/20241216113052.15696-1-naoki@radxa.com/T/#u
>>
>> (I don't understand why this only applies to me...)
> 
> I don't know this. I thought the nodenames of pinctrl and regulator
> were a bit weird, so I changed the pinctrl's.
> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 
> 
> 


