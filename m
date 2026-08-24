Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BBC61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyJOErG3s8GlSEmj+9LyhK1ZcgZmzhmpH3gk6EXWH0U=; b=S9ZYuvfLMln39XTcQg2DvBm3iz
	PS8HWeqs3AZiQGVs/ttycgMShJgELJhY23BUbsT7M7YERRqw7zlGwtSrcscn9VrYKwqH8N1nEqoMg
	gSC80sKumSK7MlxT4MaZcT8PKB3ibYa8G13R7CfIwrCV5YzpSnr8N8C+84yEfwqjs8ZrdvlHRRNo3
	cwv+stxBXAkgYqwqrnJYELBAM0mL80qHg51dTAvkd2jNsr8ausU84/OSyopyQEi7Q9rzvm7v5Q50o
	63MohSPBcVGFrQS6FqgsAgUIwUC8HI6lnCCjTMb1apPzSrNNCN+yriIA8YgifpjVV73Zu3lfDJXKY
	fpFn76Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynl5-00000000WUG-19Xs;
	Tue, 25 Aug 2026 09:47:55 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynl3-00000000WTM-00Ot;
	Tue, 25 Aug 2026 09:47:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8CBE11CC55;
	Tue, 25 Aug 2026 11:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787651264;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GyJOErG3s8GlSEmj+9LyhK1ZcgZmzhmpH3gk6EXWH0U=;
	b=KSLTrG1dU4maTkSkUQiq2JibZnDH/0QxNj8Uu69yr7yFNL4d5RS85XbpkaSOGORSrbB7rg
	wOPKHZkS64J8shLg8G/ufZydU4//HEJp0Kt9vap6n9etisepHzTlFDblvKElq430UTzZqk
	Vi7YAEuXvt1jVGUOQvzOoFWkW7kkYIbJuwqkmIedLc8e9VQUCddojhbbEB/t6EOUwYinTN
	0yvZqM3k/S7cNt43oSs2g/khqoPq3hZ10EVTO2WuSbDNvotgPu8Pc7mPLg9D1d3EVegRR+
	s5AaFfBhNxFuhpX301hvH8gOeWkmWbN41hzQoMrcsO16i7S+dZ7iDNtYamoJkA==
Message-ID: <68145a72-d543-4e94-af27-cba6b620c13d@nabladev.com>
Date: Mon, 24 Aug 2026 16:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: st: Add USB nodes on stm32mp251
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-10-marex@nabladev.com>
 <a6c55491-7cbe-4856-bb45-b7f5872966fc@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <a6c55491-7cbe-4856-bb45-b7f5872966fc@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_024753_221185_7A6A320B 
X-CRM114-Status: UNSURE (   5.05  )
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

On 8/24/26 3:19 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>> +			usb2_phy2: phy@2800 {
>> +				compatible = "st,stm32mp25-usb2phy2";
>> +				reg = <0x2800 0xc>;
> 
> Hello Marek,
> 
> Similar to stm32mp231: should update size ?
> 
> 				reg = <0x2800 0x10>;
Fixed in V4, thanks !

