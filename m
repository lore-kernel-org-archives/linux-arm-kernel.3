Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002F8F557F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSOsWCES9W400K0DQi/6SJEy1dKAGZTU1QAGa5aaQjE=; b=K/5UkiBeZL8/Hdkn1En563pC0N
	VoAQvSuGRcvTBM6yYk3MRQqtQ5oxBTc3l4t0ZOMFjlqsxsTZNGbVl93VyWAmaRAhmeftp9O6KAs57
	ciDInjc72vHYbiW3i/cMJBCAHPdSJiP5Lohfej8nwnX4GJGj80UglzPLy8Yrkdg/GR3BrDdjHMew5
	wZp+kA+7C2z5kMpg2m5lhZo1z/g5iCK7yQNlFOdVYNUo9UteEROXlCs5nExUp6FwFaTj99L7jXea4
	mRYGE6LUrmGya/PhMjpEvES1TK90R3bwcpeuI9eTskCEf8GnD04dx21YJgVWtr44acU+nOzZBNbT/
	L8drkBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEktY-00000006fox-1YZe;
	Mon, 20 Apr 2026 09:26:20 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEktV-00000006fnt-2syE;
	Mon, 20 Apr 2026 09:26:19 +0000
Message-ID: <491eb101-0b4c-42e8-abe5-55ce6a50ea36@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776677173;
	bh=oiwQ/JNg7RdhRLU0hLjyT7kxMO4nyPSt86GjWiTFxkA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=MyCqpUsGeKdkAwkQQ35XlGPy+eBYAaIbH/NY2/CJ95Yy/oeco6w20eW6edgX6d1q+
	 An7FFMlzPHBZOEn/Ut0SiukmVPjLn60IPilL6mxxmD6Uh5GyKyEuONB2+xpcoqynxT
	 NvFyBx10UPE8STGpV3dvkHADfag7cuvuMT7lRvwE=
Date: Mon, 20 Apr 2026 11:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: Enable
 Bluetooth
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-add-bluetooth-t7-vim4-v2-0-9a57098fd055@aliel.fr>
 <20260416-add-bluetooth-t7-vim4-v2-3-9a57098fd055@aliel.fr>
 <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Content-Language: en-US
In-Reply-To: <c9c3227f-2a46-47b5-963f-e784184f7f31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_022618_023361_1B253B13 
X-CRM114-Status: UNSURE (   6.58  )
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

On 4/20/26 10:47 AM, Neil Armstrong wrote:
>> Enable UART C on the Khadas VIM4 board and attach the BCM43438
>>   compatible Bluetooth controller to it. The node configures the RTS/CTS
>> hardware flow control, the associated pinmux, the power supplies
>> (vddao_3v3
>> and vddao_1v8), the 32 kHz LPO clock shared with the wifi32k fixed
>> clock, and the GPIO lines used for host wakeup, device wakeup and
>> shutdown.
>>
>> Remove clocks and clock-names for UART A, as they are defined in DTSI.
> 
> This should be a separate patch.

Thanks for your feedback.
I will then add the remove redundant clocks before that one.

-- 
Best regards,
Ronald

