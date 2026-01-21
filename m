Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 22:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4erEKk/kx2Qi8GHsQ10UVtCdb2WmHG32BZt6WMNptI=; b=f1GjdfROnsS2HuY6kh0dmxh3Uv
	ccO+7cElEsVBfianve7RZcwQfam0txRrlVvXHzTO0ZU8zcfZn6rQqAgP2L/UAePyuIyNw5MNY1cvM
	dP+6EYAFDyz7golagS17HiAaH/P0AFneQYjbpnnZ2IhQYCyN2Sh42ohH2MgKv2+lVaR4nBu2KKsjr
	Sa0oV49HDM3+MaRtq/wkkuh2w27HD+u2xGmppnBOvBR5DpVOyX11KbVspdREWP/xhGEvGFNFbGuYe
	p59L/Q3cl2+9Zr1Rt47d23339AAn9CgooAwnM4q2klcx/T8whyMtK7p7uKoE6Ic3q9YPFKiNOzoJ9
	nMpddE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigwh-000000067pl-3VCf;
	Wed, 21 Jan 2026 22:45:03 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigwe-000000067oU-29YF;
	Wed, 21 Jan 2026 22:45:01 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dxK5K05kfz9tCQ;
	Wed, 21 Jan 2026 23:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769035493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4erEKk/kx2Qi8GHsQ10UVtCdb2WmHG32BZt6WMNptI=;
	b=DuI7x1B8S110FS9yoF8xVuV6H+z5vkYnTZ3oIMRcCqQSFBaSfM4onXalKS/sfmzRhRzbQE
	9B2rBwudxnufsjs9p3y1hp+LQDdlwUoUogr4aE6M16iuydbiYFJGWZBCEFdiCXVwJ7DShD
	w9EdDavzF/C8j30v50nFwCLHl5i7dxBZkE09tOCTt9JIAu3IpXedZVVgOUFgBHe5tZO4Yi
	PVEo4IpSRnJL9YOYDNIM0g7tH1l8Q/sfgRe0GQp53rF+jQscNS+rFyllZl+kKfi6tgmD8U
	wjlppTs44RxzATpA8yW/jIQQ8Q/+qovkAhBGHi1/WpgCC9Lo4+DhRUo9cfd6Jg==
Message-ID: <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
Date: Wed, 21 Jan 2026 18:38:00 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-10-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: b4aobdw146wnxrmuf1fpjp7jzwxghan6
X-MBO-RS-ID: 8813b9a2c165de6f9d5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_144500_701665_41A4E380 
X-CRM114-Status: GOOD (  16.16  )
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

On 1/21/26 2:48 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> @@ -439,6 +445,13 @@ adv7511_out: endpoint {
>>                  };
>>          };
>>
>> +       pcie_usb_clk: clk@68 {
>> +               compatible = "renesas,9fgv0841";
>> +               reg = <0x68>;
>> +               clocks = <&pcie_usb_refclk>;
>> +               #clock-cells = <1>;
>> +       };
> 
> During boot, the rs9 prints a warning:
> 
>      clk-renesas-pcie-9series 0-0068: No cache defaults, reading back from HW
> 
> which probably shouldn't be printed at the warning level?

+CC Mark . Reading the (default) register values from hardware on first 
boot is the valid/right thing to do, so this could be demoted to 
dev_dbg() . Or is there some specific usecase where this should be a 
warning ?

>> +
>>          video-receiver@70 {
>>                  compatible = "adi,adv7482";
>>                  reg = <0x70>;
> 
>> @@ -871,7 +902,19 @@ &usb2_phy0 {
>>          status = "okay";
>>   };
>>
>> +&usb3_phy0 {
>> +       clocks = <&pcie_usb_clk 6>;
>> +       status = "okay";
>> +};
> 
> This does not work, probing fails with:
> 
>      usb_phy_generic usb-phy: dummy supplies not allowed for exclusive
> requests (id=vbus)
> 
> Adding a fixed regulator that serves as vbus-supply like in commit
> fec2d8fcdedaeeb0 ("arm64: dts: freescale: imx93-phyboard-nash: Add USB
> vbus regulators") fixes that issue (and my USB3.0 FLASH driver is
> detected, yeah!), but a more accurate description would be better.
This piece of code in drivers/usb/phy/phy-generic.c [1] shouldn't fail 
the probe if "vbus-supply" property is not present in DT. If 
"vbus-supply" property is not present in DT, then 
PTR_ERR(nop->vbus_draw) == -ENODEV is true, nop->vbus_draw will be set 
to NULL, but won't encode error, so the dev_err_probe() won't trigger.

"
259         nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
260         if (PTR_ERR(nop->vbus_draw) == -ENODEV)
261                 nop->vbus_draw = NULL;
262         if (IS_ERR(nop->vbus_draw))
263                 return dev_err_probe(dev, PTR_ERR(nop->vbus_draw),
264                                      "could not get vbus regulator\n");
"

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/phy/phy-generic.c#n259

