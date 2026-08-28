Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E3C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWcirtnE4uDumZP9/67ZFWrDNIg5Dw/DiSxWsTPXR2M=; b=MZ7Rtd3wnWhQ1dlidnT2nwRbZ4
	5OGJhs8FZxr/HojW0WfOb3gWxxem4DiX8hjqvE11Dkpktgj/TqbAqDC3mHyncwLeEtoJzxSQq7FxL
	6WyiP4hfWo/fCvDBKB3qh9qeNQAmpHjph4Z2j3KT/+HY5UnRiCnjmItsVvFfEhkTrrVpFM8O5GN/R
	J0vkumipKxi/q9XQApPK3cAQCsRDvXYtelorfrm+1EaDM7UNnZvy9mTYMupZDX09f3l+uJPu0qaoy
	s2IJ5dH+PdyM6uioiDdGzN9tB4TNsc1Sw2GCVrcDWfyEZ8hkLChabKeoNOYssKEMSp768uLzxJhZ1
	x00ncKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy2v-000000061wA-1EEW;
	Fri, 28 Aug 2026 14:59:09 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy2s-000000061vh-3Gl9;
	Fri, 28 Aug 2026 14:59:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7485E11BF2A;
	Fri, 28 Aug 2026 16:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929140;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gWcirtnE4uDumZP9/67ZFWrDNIg5Dw/DiSxWsTPXR2M=;
	b=XqLoC7JgsFzdFUgssNqhfzVLUmYOC5RCZ1t6okz+Y21f0IuelwW9oEPd9b58KckRre8eUB
	AuN5DJ3tcANd75GqgVNeJL4pzeH6KoOVSDS8NfshPXE8ZaVnqhld/P3n65fG04uWwMzfTY
	wy/3RFFXO61FCKPSPPGcLeW0vkV3G2e3ulwLUK5qF94AltCAfYArFkgnmCVq8rvZBNDI4O
	YzH7tMwq23u7qtlLilxNHh8goVYrmaQjlsS50OFQ4Z6/VC1RRK6F6dzogjWeTC3uwdRgas
	WiF8M9GGeFb1iB4nZgCx6HVVnAKZYD2Q7oVIF3GnXtbWVhddMyyi0RX/vOKvxQ==
Message-ID: <de23791b-0464-43c4-b0bc-cf3763956dd2@nabladev.com>
Date: Fri, 28 Aug 2026 15:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
 <20260828-sepia-vulture-of-glamour-ef861f@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260828-sepia-vulture-of-glamour-ef861f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_075907_044637_64DEC0F4 
X-CRM114-Status: UNSURE (   7.92  )
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

On 8/28/26 11:11 AM, Krzysztof Kozlowski wrote:
> On Sat, Aug 22, 2026 at 09:46:34AM +0200, Marek Vasut wrote:
>> +  resets:
>> +    maxItems: 1
>> +
>> +  vdd33-supply:
>> +    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
>> +
>> +required:
>> +  - compatible
>> +  - "#clock-cells"
>> +  - "#phy-cells"
> 
> reg should be required, usually. If it is not, please explain why in the
> commit msg.
Fixed in V4, thanks !

