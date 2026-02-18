Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C6CE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M29N4Jdr+UxrFarUDWCzs3OF2FcFK0bon6Iu/+pDcUE=; b=tDiE2MYCd5lStM/KJ0ldmOrwil
	BQyGssPJYCS4FRRPxYo+Xk6nDyOP98msEja45Eo50Kn+8gZieCXL6vojFF1NhyqYs8MU/mFrirX3n
	Y9pJx5kpYqoeM/c8xY4lb4BEWVh7NjTnW0ZA0/5x1ry3T0KKPUC+N8EPta1ZUdOeSiARV2WgL2HGl
	7NrwbZiwah5beIeZnHwFLwKKlvII5C923l0xmtDRf+G6fHrLMWuML3+OTSKiX+l0YwSYIRKqLKYG5
	Jp0+s22mDgTDSPL3QQD7kiIJyi4lYy1f0vNDa1/SWbCHBCJHA+eaKrrMqvAzd0S602Y5ywHouJYIx
	0bmO1OCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskv9-0000000A8ES-3ucL;
	Wed, 18 Feb 2026 17:01:03 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskv6-0000000A8DZ-2bNy;
	Wed, 18 Feb 2026 17:01:02 +0000
Received: from [IPV6:2a01:cb06:a05c:5374:3961:b3cf:cce7:dce0] (2a01cb06A05c53743961B3cFcCE7Dce0.ipv6.abo.wanadoo.fr [IPv6:2a01:cb06:a05c:5374:3961:b3cf:cce7:dce0])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 67E144A574;
	Wed, 18 Feb 2026 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771434055;
	bh=CfvbqxEGqLIstZIbfTF6jYSXXOfDbT5deJahXMkpfHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nTSIaoNez7Rhd3lfu8TJdVMFZGIuiQPEPuX7/ei6mCEnGgAp4iMQm20z5SMLlznrA
	 fucCSIHuetiYN4gECV9YS1IdOIFEl7xu40mrhWmbg+6dUBkN9SjZo2kRbuGnYMg1dS
	 qFnz/srKy5POt+xlMNeh9Q+08Kr44LSGQmoh1Mp4=
Message-ID: <5e0b6a3c-23e0-4c2b-9a89-6b3632ecc7f1@aliel.fr>
Date: Wed, 18 Feb 2026 18:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218102045.35633-1-linux-kernel-dev@aliel.fr>
 <6d86917f-5326-4ce2-91e3-c57534e5e8a2@kernel.org>
 <0af0667d-c140-4f6d-86cc-6be0460bf81a@aliel.fr>
 <f7e662db-63aa-49f3-842c-10a8346b70a6@kernel.org>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <f7e662db-63aa-49f3-842c-10a8346b70a6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_090101_114870_13290117 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

On 2/18/26 5:39 PM, Krzysztof Kozlowski wrote:
> On 18/02/2026 17:36, Ronald Claveau wrote:
>>>> +
>>>> +			sd_emmc_c: mmc@8c000{
>>>> +				compatible = "amlogic,meson-axg-mmc";
>>>
>>> Compatible says axg, DTS says T7, so something does not feel right.
>>>
>>
>> The SOC family is T7, but the emmc is fully compatible with this same
>> axg code.
>> I did the same as used in meson-g12-common.dtsi or meson-s4.dtsi, which
>> use the same compatible.
> 
> You still should have a dedicated front compatible (needs documenting in
> the binding) expressing full compatibility.
> 

ok, I will use something like that:

compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";

Best regards,
Ronald

