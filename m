Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5A7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyaxou+85fD5CRHoMBs6T9/ZLdEfWSGeQPqjUeW0l9k=; b=1bbaMJlstPJuRWjDRcdu2vkZYM
	yeqn2V2RhyOtgllxlQJWHr0JOtnQrpIKFzOu6KMXKFTRNdNv7Udq7SgP84lE60s2KgroQ0hGf8/Dk
	mbUcCyrPwusYwZTsscjq632cstVmc+QpQNEJzFf6BZePGGD++0IiPt8B5XUX/WW5SDNTU2egNFMpP
	XM6Th/HGeVOmjovVJO87XFG8gJGiOdzeGOMEXbyP9nDfWb5Xbb8X7cnl3e5hIK4MsYCQE4xJDqXRy
	mhtT4aGz6XHJ23KT29vL8Z+wy3TY1qK27GeBiQCBgCTRrOUuJzgASRgzwld4RESHNptdFhbZ6P8S3
	5WORlDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s5E-0000000DLeZ-1rUm;
	Thu, 24 Apr 2025 08:37:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qwq-0000000DAQJ-35ex;
	Thu, 24 Apr 2025 07:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745479479;
	bh=TrAcmBN6lYfQHtdSnYmDwJwiksUZsL1Y2yFtmp2AxNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d4mBnTPCkhGkmkL6MG3tORhqckVQKeUum9QYt2CKbeafi2L/P/jEo/DTXD9opnqWM
	 AnB+FFRQWvSOZHILTx5opYylQi9sfFLBTlZzfeaSRoEbmgXJSFsZah/DPd/IONQFfz
	 q4c+bZom/5KruvlWgx6dXzvvHYogQ2SvZsQS+8IK9ZkurBhsaPgZ6wPUP6tw5c3DE4
	 Ub3524o9344Ifs3Y/gSH1lpxliW8KWn2XkmeQlpen2Bggc+7RpjGf4GnskWSMAi0O8
	 SNywYTdhxXNJciyr/JiFd/4IieZNALuoJjN2omWk4YnDpwlC4dggywnJUbO5ByLaJO
	 NzVT6ZbMKXoLg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86B0C17E0808;
	Thu, 24 Apr 2025 09:24:38 +0200 (CEST)
Message-ID: <eb350c96-379a-46db-8a54-e1b9c71be431@collabora.com>
Date: Thu, 24 Apr 2025 09:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
 <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002440_929554_B65E4943 
X-CRM114-Status: GOOD (  26.27  )
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

Il 23/04/25 22:48, Nícolas F. R. A. Prado ha scritto:
> On Mon, Mar 31, 2025 at 11:25:52AM +0200, Louis-Alexis Eyraud wrote:
>> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
>> one but has two ports: one is routed to the M.2 slot, the other is on
>> the RPi header who does support full OTG.
>> Since Mediatek Genio 700-EVK USB support was added, dual role mode
>> property is set to otg for ssusb2. This config prevents the M.2
>> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
>> as an USB device to be properly detected at startup, so configure for
>> the ssusb2 dr_mode property as host instead.
>>
>> Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>> I've tested this patch on Mediatek Genio 510-EVK board with a kernel
>> based on linux-next (tag: next-20250331).
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
>> index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
>> @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
>>   };
>>   
>>   &ssusb2 {
>> -	dr_mode = "otg";
>> +	/*
>> +	 * the ssusb2 controller is one but we got two ports : one is routed
>> +	 * to the M.2 slot, the other is on the RPi header who does support
>> +	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
>> +	 * USB line goes obviously dead if switching to gadget mode.
>> +	 */
>> +	dr_mode = "host";
> 
> Hi,
> 
> while I agree with this change, now that this controller is fixed to host mode,
> the connector child node here which is supposed to probe with driver
> usb-conn-gpio, which would monitor the ID and VBUS lines and change the USB role
> as needed, will fail to probe with:
> 
>    platform 112a1000.usb:connector: deferred probe pending: usb-conn-gpio: failed to get role switch
> 
> as indeed there no longer is a role switch registered.
> 
> For that reason, I believe as part of this commit you should also disable the
> connector. Since role switching is no longer supported by this controller,
> there's no sense in even trying to probe this driver.
> 
> Thanks,
> Nícolas

Can we instead go for role-switch-default-mode = "host", with a big comment
in the devicetree saying that the controller is shared between BT and the other
port? :-)

Cheers,
Angelo

