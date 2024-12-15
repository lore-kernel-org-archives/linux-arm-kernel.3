Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A379E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 12:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYzYVD/OSfGziuQGyJ7afMAz2DeeMgDhzQQ9VxJFP9Q=; b=BQ1Feo8387YDC/Zs92dYQPsxlO
	UKvgQnmVjG6/c+5EoD78KABAUSV1AdLY7OzawtVT4pV8YemgaJhPYqO5fmp7cju/6ThCe/a5YI1HR
	BI397WlmrW565gyGs81KVBI0HGCTrWLJUPrdrLXX66tqXuizaC3d67BFzdrdmDko6UI7HoBTOwDM8
	557Wqr9X14d2+dQ2HKlWLAgvIQ1PQAlKX3kOlxXp4g32NHv73ZiaaXk5hvxwrvcC+7GpIjjAv4oYx
	BCso9TVE56usIzGbWAE3ontVDhF93j9irYCiYTCoqvCn0AJQf8ugJP89piFASTamG42pg1AS1ehIa
	HgS+ynMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMnt5-00000007tro-2Axk;
	Sun, 15 Dec 2024 12:38:19 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMnrt-00000007teY-1jCD;
	Sun, 15 Dec 2024 12:37:08 +0000
X-QQ-mid: bizesmtpip2t1734266185tpv9laj
X-QQ-Originating-IP: d332b3DxG987l6GYDxOOcjJsWdVTx4kwpSobtBpnukQ=
Received: from [IPV6:240f:10b:7440:1:1cfd:4ff6 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 15 Dec 2024 20:36:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14878551336961208358
Message-ID: <6EFDC4E74A617E25+ed534e8a-fef0-4f09-a24b-a536b7f2f13b@radxa.com>
Date: Sun, 15 Dec 2024 21:36:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on
 Radxa E25
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241215083805.1461902-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20241215083805.1461902-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OTgEduJtQQndkcU1R+o3g675042xghib6DTX9Nu/sCqWU057Wim/pbvU
	ODnDKpfAUZACiWp3w4hOsDPtdWUzwgOpo1rNkI4rQu4/lI+GJpPYod13T85XzKHOTyruyIx
	hsmCcGvnyKxVbH2uFmhj50W7xNf61ER+x/SKWJ4if+ze6LKj4HttsgWY4BqbqQEtrONFtg4
	65PPnE15HU0UI7ILVLUWjZt5ah195RrJigU7iSq+ttzh9CFhYL83j4Rqi7IhZHoYUo0tzUH
	RvGfO0GnbE9se/6K9NRdqf9jaqkWpZ2mOVIy2Jy96E5d38ozmClUr3SEmFuKCQYk61FFHeT
	+tkq8vA4fiSWzCVRvB8ZaNnOwdUaz13/j99yXzUgoiUYZxG3lr4/0FzHlSfgikRmmUZ5Al/
	oM9APjxGq28094dl+SiqibDMC+IZDlcJA3hFnFApSGggCRu/jrF1+zuNvkHYT0cNgEtPJ/o
	u/8LAW9KhBrWaD4FI49IFBIASZ/Eld+3JY35cJyvxM5brb0McFIoT0n7e+tiQlVXHUZT4yA
	yC1nsCdVPgnt+yb3QOOERj9uBG7ZtughNgazn+0wVp1fONSTe8rWh7Oa2ud6mLrg8NAw3r3
	NcEju7kGq9cc2e5nPc0+gRO8EaFbUyPrNzXz8+TiMJ2xsNHwN0KSjU0amfyA+NfK9ZzRPYN
	cuCglVgEr3r7VUqbzpiUz0ahpJRHKVd4uRlUBrlmbe6YEOSdtqJp1e0ow580xgiLZRsfyGI
	iCz9UxDSeJfqAV8qPlPBCqdzyGSSVpHY6RJwQVxfM1flhJol3iFXjXPKyhg6zcxXxKme7qT
	4G5M99s4D0hJgm2a7fybVlQcWU9dz20cHpv52n2DMcBNpBib0TAP3nu95hMvMirvvQj3jzM
	jMErT79KjEpw93DTxutd2EUxTrx8lZCPSP+nFMXgDKEAjBvQXgCWNUnVjG8itjnadEaoo1Q
	6HHI=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_043706_075232_12D4473A 
X-CRM114-Status: GOOD (  11.55  )
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

Could you check Product Brief P.4?

  https://dl.radxa.com/cm3i/e25/radxa_e25_product_brief.pdf

There is "USB3.0 OTG Switch".

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 12/15/24 17:38, Chukun Pan wrote:
> The Radxa E25 board has only one USB3.0 Type A connector,
> changing it to host mode is more appropriate.
> 
> Cc: FUKAUMI Naoki <naoki@radxa.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts b/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
> index 98cfa3abb809..90a3cb54fd47 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts
> @@ -218,6 +218,7 @@ &usb_host0_ohci {
>   };
>   
>   &usb_host0_xhci {
> +	dr_mode = "host";
>   	status = "okay";
>   };
>   



