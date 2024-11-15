Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2005AD6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQVrSQrEcZnZw6KaG7MZZMUuyoYz1yX7s6k9IqCHCr8=; b=TBhH/kM/6MOnRTd6u2B2jbJo2f
	oPSmNSbSWFuW5+FbDsdlgfMAj+kyFCnK/RCO4Kyil/h8t/eKRZ4RljdjSyXjiP2vVfpKlE7lzGH/z
	hLX0nljQEKmer05nGHbJNauF4xkrWbvjy49LImXWQSO0Zwl0t1u2fknfrMEEV6m0i9NDakso2nM3/
	GpRBxc5EgjmCF+1KFTXC3u8bwhL7GR6cHCRR9CmSB4y2tER5gNGDOlWEWQLyn0F0mXoOerEerfxNC
	nRU+9ir6XO4I5rXRwVJvm1JqdBVyzAP4nxzjRN3YDuH1irFH6F+KLhedo+RlP697LRtwtNdmgvwiG
	8IipNysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsmp-00000002DgL-3QCa;
	Fri, 15 Nov 2024 09:38:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBslu-00000002DYW-01lD;
	Fri, 15 Nov 2024 09:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731663464;
	bh=+xNK8TNGFAMAR16Vqo8z38gow29xtTPT2/t8VQXloz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XljWqPfu5ux7IXHlV8basHYOCWkP/L5ylGzWWvnlYIOAFXmfkQpP/Gjvsz/K1bACV
	 0PnWq/jKHRnG6YwL7azT8CI3L2wz1CJnjckxvP2Z0pDeelEp3xAaLhWY5Ha165Zg/5
	 MvqjokjTF9slJsHbqJsayXjFmEqo2TxgclbxCuv+j9Ir5kyuXNQUbc84vNZq+e0cad
	 YFVxIAis5FTGauXaWXnsYbWJFamR9yGmaGTUbQSzg//OZs2N6V9Xy4OKGcTRkb/ogF
	 77aFgOkWSeloZN7gNBnU7XCVxhiWoQtzAXshmnyXwZOU5DSj96dDCJkUxP9vPquyB/
	 P0WPmuQsbM53g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B81A917E35D8;
	Fri, 15 Nov 2024 10:37:43 +0100 (CET)
Message-ID: <191cf67b-8a47-4dd7-a96f-640bf8155d9c@collabora.com>
Date: Fri, 15 Nov 2024 10:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/4] Using i2c-hid-of-elan driver instead of
 i2c-hid-of driver
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_013746_208834_8278E505 
X-CRM114-Status: GOOD (  18.51  )
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

Il 05/11/24 04:08, Hsin-Te Yuan ha scritto:
> After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
> i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
> proper post-reset delay on OF platform.  From the commit message of that
> commit, not to decribe poset-reset delay in device tree is intended.
> Instead, describing the delay in platform data and changing to use
> specialized driver is more preferable solution.
> 
> Also workaround the race condition of pinctrl used by touchscreen and
> trackpad in this series to avoid merge conflict.
> 
> Adding other second source touchscreen used by some mt8183 devices in
> this series since this should be based on the workaround of pinctrl
> issue.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

The switch to i2c-hid-of-elan is okay, but the pinctrl hack is not necessary
anymore, as it does get resolved with the hwprober from Chen-Yu

https://lore.kernel.org/all/20241106093335.1582205-1-wenst@chromium.org/

Please redo the second source TS addition based on that series instead.

Thanks,
Angelo

> ---
> Changes in v2:
> - Add second source touchscreen patches since they should based on the
>    first patch of this series.
> - Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org
> 
> ---
> Hsin-Te Yuan (4):
>        arm64: dts: mediatek: mt8183: Fix race condition of pinctrl
>        arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver
>        arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
>        arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts |  2 --
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts  |  3 ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts   | 12 +++---------
>   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   | 11 ++---------
>   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   | 11 ++---------
>   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   | 11 ++---------
>   .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  3 ---
>   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi      |  3 ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts   |  3 ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts  |  3 ---
>   .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi |  3 ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 10 +++-------
>   12 files changed, 12 insertions(+), 63 deletions(-)
> ---
> base-commit: eca631b8fe808748d7585059c4307005ca5c5820
> change-id: 20241018-post-reset-ac66b0351613
> 
> Best regards,



