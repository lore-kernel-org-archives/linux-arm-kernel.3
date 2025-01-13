Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A6DE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlNt/0Cqt2d3UPJ5gsjHpqsFBRbtTJaqyRFUZhvkf/Y=; b=NQUXtxxXVIUGi3COq/fd6qHU4z
	DgFipMya99VTKd8NVlqICYp17yR8i6Zbi54jQn1shh4+CWQskTeArNbKqX/NTFWDYlUPvZRRoYH87
	RkTC8o7JflfCRl7NGJ/LrS20fD2vl1l5B9X3kfMC06k8qFZH1K8ID5PX3MjRm1dLpIst335DvCrX3
	SMXmeH6r9VuF8rCOqxs8/JMrqn9djjmGfMYxjoNBET1IkIS7HDq2GR97w/ZLetsVtYQrJlDgzNqQ1
	B20GG3djek8NaufrPdDt0xBuGjacW3c/OW+RVPEscGzZxFd/+duT2Gt0zyr1d0780o/FRTdnU+0Ja
	RLWW0KQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIkf-00000004wwT-1KnT;
	Mon, 13 Jan 2025 11:37:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIjQ-00000004wn1-0ZyI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18851A40EF4;
	Mon, 13 Jan 2025 11:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0E6C4CED6;
	Mon, 13 Jan 2025 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736768143;
	bh=oGFhBInv1GRa5ya9fSnahpEiZAFr7o5nMSpPLDknsZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tsp631Gxk8S3AFpH0igeU/jzV8q9yMMX4lqYNaAbGg99uBKEnlRBi50n7rxNrnxYI
	 qPwb3PTyIidtSrGG+RKCjvhgMNfPEFUtV8G9n2Ow+0NR6AngkHCPCgyxYR7SZWYZfk
	 d1XNbEks3CGoX9ss6dN8gXeSkk/5c4ZbtjQI5fE1C/OrEqHe154Bz+B+UdzdWUqrMi
	 +ZA3h0bkII2+K6UTGyhFX74kOtdhJDll//ddo24KKVnjK0RhTN74/kqgxTjlDBLcAG
	 xwNHxGRK2UfFGFxg1exUXR4X94NfaKvt1UicesbFnYs5mGlvoR5ivTEN9gKaGehIJ4
	 hQXIopJdWbq1w==
Message-ID: <eb85b7db-cd17-4dc0-8b0f-73bbf6ac8e37@kernel.org>
Date: Mon, 13 Jan 2025 12:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95 compatible
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
 <20250104-imx9-machine-v1-1-18a78e41456b@nxp.com>
 <4666f8e9-d19e-45bd-be9c-a7f111168d66@kernel.org>
 <PAXPR04MB845922D5BCAA88C26C0149B488102@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <8d2746ba-47d2-429b-9df0-9448a4516ef1@kernel.org>
 <20250109024058.GA31833@localhost.localdomain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250109024058.GA31833@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_033544_326088_CAEE40CF 
X-CRM114-Status: GOOD (  13.53  )
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

On 09/01/2025 03:40, Peng Fan wrote:
> On Mon, Jan 06, 2025 at 07:12:29AM +0100, Krzysztof Kozlowski wrote:
>> On 06/01/2025 03:51, Peng Fan wrote:
>>>> Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Update i.MX95
>>>> compatible
>>>>
>>>> On 04/01/2025 13:13, Peng Fan (OSS) wrote:
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> i.MX95 features a System Controller and SCMI Spec 3.2 compatible
>>>>> firmware System Manager(SM) runs on the controller.
>>>>> Add "fsl,imx-sm" compatible string as fallback for "fsl,imx95" to
>>>>> indicate it is compatible with i.MX System Manager.
>>>>
>>>> I see little value in generic compatible like that. All these are
>>>> aarch64 so why not adding that compatible?
>>>>
>>>> How this generic compatible would be used?
>>>>
>>>> And by what exactly?
>>>
>>> There will be more i.MX9 chips with System Manager. I would
>>> not expand the list here each time to support a new SoC.
>>>
>>> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/pinctrl/pinctrl-scmi.c#L508
>>> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/pinctrl/freescale/pinctrl-imx-scmi.c#L290
>>
>> Problem is that compatible is way too generic to be used by Linux drivers.
> 
> Is "fsl,imx9-sm" feasible here?

It is better, but I am still not happy with the generic meaning of it.
You claim now that certain SoCs will be compatible with imx9-sm, so with
some sort of "sm". What is the meaning of sm in terms of ABI and
interfaces? What do you exactly define here? And what happens if some
other feature will require one more compatible and then one more?

You will have:
compatible = "fsl,imx95-19x19-evk", "fsl,imx95", "fsl,imx9-sm",
"fsl,imx9-foo", "fsl,imx9-bar", "fsl,imx9-whatnot";

You add compatible for some unspecified interface called "System
Manager" just to solve Linux driver issue.

Best regards,
Krzysztof

