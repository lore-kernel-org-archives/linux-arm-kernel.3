Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2EBC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKND0p5YppS4+zZvJmzMa34e+T50T2pnOg9z7xqAScY=; b=qYNN8F5PNzXZrUTHJcUrTLUr/r
	3kbFj1KXwStMlhJ9rAb8z90Bj8MstOEKjWzw7xdgyLaXbgdXA+PQ2RUAliRDWu9GTXvZX6tW1spc5
	/sZWcu5B6i7fTY0ZBRGr0OuYGjtl27UVS3t+gdVUAzJT8+P4uHm5SH8KhK4owSX7WV13awQ+OSuYj
	4+BXqxrGLvHh46uHRms6XL6DDoxGvtrG5eabsjgamoOgG2iyyB94P7WxE/iHSMYD5Fb6P3W/6PtJ7
	wkc4uj2ds9c4TPA8CcIbYQWhK4klkWrpST5wN9iI6wqYF4jeXH+620Re+LS0jmZXOdS9ZTfsRc9xn
	KIfHu4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy32-000000061yn-1xPo;
	Fri, 28 Aug 2026 14:59:16 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy2x-000000061wk-1w27;
	Fri, 28 Aug 2026 14:59:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 729A011C674;
	Fri, 28 Aug 2026 16:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929145;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VKND0p5YppS4+zZvJmzMa34e+T50T2pnOg9z7xqAScY=;
	b=QHzKZYCq1jlckwEadOVIKhWg8c2QJv+notleTgKcrA9jjL0H/e2uvBAQwiMmrRFOWPMtz9
	Jc9iUPbZWUM0sjFJwusTIkf9kEtNNOcedeymZQr89pNdpUUl16og8K6F/a1zq8aiMRZ7kT
	//s+0QsaLvkiRsVJ9QHCGMVs0HlxPVFBLs65OmnmBfqFD2bod4A0TSx8WhSHvIRLsadGQU
	Taw8jMUz3IYEmdZtMXnh74DpBZnDukhVnvKDwO2bxDtJd7StKVUs4yKoTcpJGxoIlgrhSn
	6nXcP6dKNBU7gAxcf0POkiZRUs5Qq09NHmNZBwsbENVD+lhOQszAThEx3QDB+w==
Message-ID: <a61dcd6d-0c64-4d69-a565-7aa06cc4bf75@nabladev.com>
Date: Fri, 28 Aug 2026 15:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] dt-bindings: usb: generic-ehci: Document
 access-controllers property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-4-marex@nabladev.com>
 <20260828-puzzling-shapeless-gaur-f0d737@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260828-puzzling-shapeless-gaur-f0d737@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_075911_645916_8FBC5811 
X-CRM114-Status: UNSURE (   9.46  )
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

On 8/28/26 11:13 AM, Krzysztof Kozlowski wrote:
> On Sat, Aug 22, 2026 at 09:46:36AM +0200, Marek Vasut wrote:
>> Document the access-controllers for EHCI USB controllers in case
>> access checks need to be performed to use them.
> 
> Please mention in the commit msg which compatible/device from this
> schema actually uses such access controllers. I see your work is for
> STM, but there is no STM compatible in generic-ehci/ohci.

Let me also add required: access-controllers for the STM32MP23xx and 
25xx while at it.

> Also, please send USB patches separately from DTS and other subsystems,
> because Greg takes entire set.
All right.

