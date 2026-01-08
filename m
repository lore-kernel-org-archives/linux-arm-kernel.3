Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D27CD185E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKUPfb6RjX38dUPs0zWmKo6fI+2s9bZCTUhRH83gC7Y=; b=2zAGhZGSlLEvf7l6SPri+Thy/t
	sJplR2knn0AmQLKC0ttKcuIu+jG3cs3T/YIOTUFkWuGH5HU2nxydk/SesYgZmTjHf5TIsNUly1Zkb
	vJVNJ0gq/XB1wj+5N11kDfCf5Ef2QBuapswV7XGw8d/WOblzZTc5SydST5ft6eCZ6zX9n/pV1vf2q
	urCY5JlLMDCGUa6ieIYcdllAUeRfZESvchcvlwkdCXdd8//LLcPtAEiA83Tz8KkZp0ln3OVTMksIk
	8vEaycyhp9s7ar/klFY2PzTsgQqNnBFe39ARor9VTmaroQcJNNpYgm9LwcFwR/1ImUPXlVcBlUQ3K
	Ll21betg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdou2-0000000GwvZ-2o7Q;
	Thu, 08 Jan 2026 12:14:10 +0000
Received: from mail-m49224.qiye.163.com ([45.254.49.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdotx-0000000GwtP-23mQ;
	Thu, 08 Jan 2026 12:14:08 +0000
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ff5af838;
	Thu, 8 Jan 2026 20:13:52 +0800 (GMT+08:00)
Message-ID: <a2f5c2b3-2168-41b4-917f-183ab72a4499@rock-chips.com>
Date: Thu, 8 Jan 2026 20:13:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
 <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
 <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
 <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b9d870e4309d8kunm04506d9976d9ca
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoZT1YaHh1MTktNHUgZH0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UV8AvzP1G+MxRLfAXtJtmMOMR0xcdDJUv3mojtqaLqKD+Z5/M3TRVtZjk3TfzxuWQYa3jqB77SY4oVsFjc5DjUX4G2ETFwmBWpscdhdvUh8j3EUCwEdcuzXbkpI2mBU2hvzcc+HqdPGhZ1DrjbsNfaRZRdUdW6NzmEOva4rFhc4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qKUPfb6RjX38dUPs0zWmKo6fI+2s9bZCTUhRH83gC7Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_041406_103747_87573E9A 
X-CRM114-Status: GOOD (  21.85  )
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


在 2026/1/4 19:44, Linus Walleij 写道:
> On Sat, Dec 27, 2025 at 3:46 AM Ye Zhang <ye.zhang@rock-chips.com> wrote:
>
>> I understand your preference for standard bindings.  However, there is a
>> specific constraint here: the RMIO acts as a secondary layer of muxing,
>> sitting behind the primary IOMUX controller.
>>
>> The existing Rockchip pinctrl binding uses the vendor-specific
>> rockchip,pins property for the primary IOMUX configuration.  If I were
>> to use the standard pinmux property for RMIO, the node would contain
>> mixed bindings like this:
>>
>> node {
>>       /* Primary IOMUX (existing binding) */
>>       rockchip,pins = <1 RK_PB1 16 &pcfg_pull_none>;
>>       /* Secondary RMIO  */
>>       pinmux = <(RMIO_ID << 16) | (RMIO_PIN << 8) | RMIO_FUNC>;
>> };
>>
>> Since this node describes a single hardware pin configuration that
>> requires two separate hardware settings (Primary Mux + Secondary RMIO),
>> I thought keeping the secondary config as a vendor-specific property
>> (rockchip,rmio) alongside rockchip,pins would be more consistent and
>> less confusing than mixing legacy custom bindings with standard pinmux.
> I see the concern but I would say two wrongs doesn't make one right.
>
> The DT binding people will have to say what to do here, but ideally
> I would say the primary IOMUX should be modified to *also* *additionally*
> support the standard bindings and deprecating the old rockchip,pins,
> and then you can consistently use the pinmux=<>; binding in new
> trees for both pinmuxes.
>
> I understand that maybe you are only working on this other controller
> and might feel that the primary IOMUX is none of your concern,
> but someone has to stand up and take the responsibility for the system
> as a whole, if no-one else then the Rockchip SoC maintainer, else
> we get throw-over-the-wall-engineering.
Hi Linus,

We have discussed this internally, and we fully agree with your suggestion:
the driver should be modified to *additionally* support the standard
bindings, allowing us to eventually deprecate the old `rockchip,pins`.

**Regarding the RMIO support in this series:**
I am willing to implement the standard `pinmux` binding for the
**RMIO** part immediately in this v5. This ensures that the new feature
starts with the correct, standard binding.

**Regarding the primary IOMUX:**
However, the RK3506 pinctrl support is built upon the existing
`pinctrl-rockchip` driver infrastructure, which was originally designed 
around
the `rockchip,pins` property. Refactoring the driver to support the standard
`pinmux` binding (and the suggested nested node structure) is a significant
undertaking that involves core logic changes and regression risks for older
SoCs. Mandating this refactoring as a prerequisite for RK3506 support
would effectively block this SoC from being supported upstream for a 
long time.

Could we allow RK3506 to follow the existing driver's style for now to 
ensure
consistency and timely support? We agree that migrating to standard pinmux
bindings is the right direction, but we believe it should be handled as a
separate, dedicated project in the future rather than part of this 
enablement series.

Hi Heiko,
Do you agree with this?
1.        Use standard `pinmux` for RMIO in this series.
2.        Keep `rockchip,pins` for the primary IOMUX for now.
3.        Plan a future refactoring to migrate the primary IOMUX to 
standard bindings.

Best regards,
Ye Zhang

