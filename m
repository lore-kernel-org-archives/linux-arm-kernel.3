Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73AACA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhYDHBRCLKp0rQmygAJEr46pIhbWJXwTrDFc0/JepzA=; b=iea4LKfuemlmxETQrddHIGIc8P
	RoTLM9c4hOHuTLkryncVAxgZhHtlxtPBMvnnFri9iGl34gpMRbSkCk+ZXWdZeb6LPcXRwwU+u3tCc
	xBz/rfb7Oz0VV3C6JwX/IYEB0nuq7OvM2bOoOvrAPy56CRej2QvZo7ZxYlxmhG5xaU1V5E91gIsoc
	DrUe/AT3RfwybaIlx5MIjoiwxYeOBg59xkcZ2uj/ZF8eoQAjlpHErvpJmqAe1RbAMcIJi95GNwLt/
	FpBuMGO4MYtqsXfzXW2uuv73I6ihOZNY/A+RBt7OrlYA1HDaiB6pKJqiPTDgZKcHWVYeEwr644WYM
	zBTVCVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqClk-00000006Iri-1DDZ;
	Sun, 24 Aug 2025 15:36:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCj7-00000006If9-0rc9;
	Sun, 24 Aug 2025 15:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59D9A5C55A4;
	Sun, 24 Aug 2025 15:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC7BC4CEEB;
	Sun, 24 Aug 2025 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756049627;
	bh=oQzQEC/j+B5UVSDuvC80FiJ+MKY+IFlYoW/dIszqcuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HSnUMQ4tlsLUIC9Waj7DTcg0C+4Q5PkV2X/ONEbyFx2fbKxd/S3t4gW3/5YBlJ6M2
	 UaiOBj+2tBwtGm2siDG6q0+wzYRi3f3ljnCA6Ug/37/MUj3lx04md6wZrKTgskj8JN
	 2O3YacNREIgXwcqlJKRKDMipgyBFG/eMHKD7C52ICZxZ8rnP5elIAr9uFNxDWfHHlD
	 oGLqLFzninpwNUMcMkW16ZlHBmO2mOCihjqPZUbNShr1voctFsQ8WbBjhAc/s9+eUO
	 qfcKyYqC5XAq1miXvOvqzDlxverCrf9L0Qc1AOU1RdfVhqbfQd6mlU1MvgKTY/80CN
	 HhLAeT1kmlVsw==
Message-ID: <96409a43-b3f7-4b9e-a1e8-fd0ac6503cd9@kernel.org>
Date: Sun, 24 Aug 2025 17:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/22] dt-bindings: phy: Add Apple Type-C PHY
To: Rob Herring <robh@kernel.org>, Janne Grunau <j@jannau.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org>
 <20250821163320.GE1270980@robin.jannau.net>
 <CAL_JsqL=y2OT4YrzT8z0O0T2hpM5X1k2pFEb8XjBRPoNMdO5kw@mail.gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <CAL_JsqL=y2OT4YrzT8z0O0T2hpM5X1k2pFEb8XjBRPoNMdO5kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_083349_289392_A68940B2 
X-CRM114-Status: GOOD (  12.62  )
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

On 22.08.25 01:00, Rob Herring wrote:
> On Thu, Aug 21, 2025 at 11:33 AM Janne Grunau <j@jannau.net> wrote:
>>
>> On Thu, Aug 21, 2025 at 03:38:55PM +0000, Sven Peter wrote:

[...]

>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - apple,t6000-atcphy
>>> +      - apple,t6000-atcphy-dp-only # PHY hardwired to DP-to-HDMI converter on M2 Pro MacBook
>>
>> The comment is misleading, "t6000-atcphy-dp-only" would be for M1
>> Pro/Max Macbooks. M2 Pro/Max Macbooks use the same design so the
>> corresponding "apple,t6020-atcphy-dp-only" compatible is missing.
>> I'm not sure this is the correct design though as the HW block is
>> identical to "apple,t6000-atcphy".
>> I think it might be better to have either the DRM KMS driver or a
>> custom DP->HDMI drm_bridge switch the mode to DP-only.
>> Or atcphy could initialize itself to DP-only based on the available
>> ports.
> 
> Doesn't sound like this should be a different compatible. There's a
> 'phy-mode' property or you can define the mode in the 'phys' cells for
> the DP controller.

Okay, makes sense. I'll drop the compatible.

I've only found "intel,phy-mode" inside bindings/phy but we can figure 
this out later once we actually get to upstreaming what's required for 
DisplayPort and mostly focus on USB3 for this series.


Thanks


Sven



