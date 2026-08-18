Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF9FC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 04:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4xs5RT8u9h6JXPgD+W9cpvSw000rGM/Suoj6WVsp9I=; b=zIb5wDVp6JtNdqHL+1vxRKGe+L
	dNkAm4EHhMGp/SCSM/hpvLl5Aii55JXZ70orqw2mCpnlwF6RJCiwqZzIL7f5Uwv3XDVP9O4cdvrDp
	E1xSh/P1JU6kXHehNQes8dHrdZMRA91EqSbR0IMJLfgCwmPgnch2t8z7FSkdnE88tj7OQieRUHZqU
	hX3LSMGIpk0zo4djIS3d0n4Y/FY/cPXwlQhVLRr+tn5PiQEixu0mp3Py/qI/zJzL6jeX3YBZYswnO
	Va/2Hcfp75JHaTcanumLopBLailEuhnqY+e7yel6AJULoWO4X+WrTAMDk5+Ng4MfHBm6nEuMmLQCv
	EUrQasZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYJC-00000008zdt-37x6;
	Wed, 19 Aug 2026 04:53:50 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYJ9-00000008zd4-36lP;
	Wed, 19 Aug 2026 04:53:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85362107AE6;
	Wed, 19 Aug 2026 06:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787115213;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=c4xs5RT8u9h6JXPgD+W9cpvSw000rGM/Suoj6WVsp9I=;
	b=jXLHRfRARDuSTChCOAmU2yG9xCI2B9rFHhA9zXkIa7RGh/vK1f3YZm/uvAIW2fhIV3VT81
	OlJFZAGXEMkDVVzzXwUlo1GQ8iVEgtohyciKVEwpiBsUxYqORK1RxLfLjOmU9d3Nd/PB4h
	XJsx97Hb+wBrLqZ6w2BSrRnUgBeUYZ4qX215ZM9bght/2DdOQF+pix4uwzX4K7VgM0+0Kv
	qNE4NGC+4VP4wYT/0I3pvxo7qGwWfNXRLhpFOXCv4yEyc1Va4IVJ8QkNhGJ7SFQ9NdJODV
	DivLj/nAEVL2NnYJ2i9RWy+dPFW/bo0ITym7lBZntOxW86lEZXkDc9nEFYlxaA==
Message-ID: <272be90b-7127-457f-90e9-7160169e2200@nabladev.com>
Date: Tue, 18 Aug 2026 17:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
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
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-2-marex@nabladev.com>
 <20260818-imperious-thankful-perch-dcaa44@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260818-imperious-thankful-perch-dcaa44@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_215348_003884_011D68CF 
X-CRM114-Status: GOOD (  10.73  )
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

On 8/18/26 10:09 AM, Krzysztof Kozlowski wrote:
> On Sun, Aug 16, 2026 at 11:37:03PM +0200, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
>>
>> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
I think I managed to fix that up in V3, thanks.

