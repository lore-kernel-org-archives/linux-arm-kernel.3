Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBBCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/cOzwznWze0e2caIIrIR9+B7xob1y98dBFdXYzq38Y=; b=utwQvqA/Zw003Y+Z0Hfdc7j6du
	oAmQtxkmUkndOEoAeeZ7Vs4hVVaE417AMYc0cAMYBiE7eN6Pr/sK8fL061ZpQer2R+ujJsrRjiGak
	WMCTu6gBcJzCCiS7esU9rAbAh8foj3STy/c2xZUh6wZihs5qX+vikIjCbhmAdY17sXjEcaWy2Foso
	8tIvu5i+95Rqh1tnEM/rz8l9vC2O9Jk+hH2PdhyyBzTOlBmu0Ri3ndgyrXFzESrAYVs/bytFWI2Zg
	npiL8o6xRVHc4YUnxxVvYGwNibO+uZ0+B+i82NKsCx4ZWMGwsveHSdhAPWiBih7x5py2LTZz1YJXP
	+MslrjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCit-00000006IcU-0Hhn;
	Sun, 24 Aug 2025 15:33:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCgH-00000006ITK-10Ko;
	Sun, 24 Aug 2025 15:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15E845C53E7;
	Sun, 24 Aug 2025 15:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FA4C4CEEB;
	Sun, 24 Aug 2025 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756049451;
	bh=ELLwqf337+Rd50ax2qN36UfLgzngTVAA0cqVt1cHHyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HIg7lPy3Sgx8WOylmQSBMhEjLKRNW7fydmaIE3ZvCCmlsEHrLxejsws4nqDSfn2HY
	 Ymh6+xtYDx9K7b0OgLWsrXjjJa/zVe9kWDsBCb3VLbQzZKaS2TR5r80S+OmiT5tI2D
	 S0YeBDT50nkosDRlJ5uFwjuImOKOW4JrAN0l9ysax8fKgNSMYzij1hTROpiC23XPLq
	 L408tHOYgMkiJTgahdacgK+llPRyEcQJ8mwSUX+P7uoV/43iS1ge34HnnUkiSgA16t
	 kS1pFQ2ghgeFqdOZ5SKDOmMNedlDgf/F5U87w5xjEYrM8VhQdCjwgrxS/en3buO++r
	 ZX5vwrf+OGawQ==
Message-ID: <8e6b19e1-e1fc-40fd-bf5c-e36180aefd19@kernel.org>
Date: Sun, 24 Aug 2025 17:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/22] dt-bindings: usb: Add Apple dwc3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-2-172beda182b8@kernel.org>
 <20250822-banana-ferret-of-opposition-0bcfad@kuoka>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250822-banana-ferret-of-opposition-0bcfad@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_083053_330306_57370FFA 
X-CRM114-Status: UNSURE (   8.09  )
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

On 22.08.25 09:24, Krzysztof Kozlowski wrote:
> On Thu, Aug 21, 2025 at 03:38:54PM +0000, Sven Peter wrote:
>> +
>> +  The common content of the node is defined in snps,dwc3.yaml.
> 
> Drop sentence, redundant. Schema tells that.

Ok, will drop it.

> 
> ...
> 

[..]

>> +
>> +unevaluatedProperties: false
> 
> This goes after required.

Ack, moved after required.



Thanks,


Sven


