Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D647ED3E783
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VXsrnTknQwYgG0q+dW2WUXh4qi4Duu2B3YQcyshynw=; b=IJAAJxNuLLpb77uWbt+2dSdYYc
	dPBlqTd0U13HKMKCJoGW3VHv9GOwHyaM4CCdS4z2WpCf4Pctq+Efpay+SQZ2ui2uUzmIvlTsSgLBU
	Oyz2k3eglR5BpJ7JOTNjlmLwO1lNnisTkoZqCv9h/zG0naaWTp8CgDCpX6Gipn0MHieq1P4VCORWP
	51bNE4m0DkMu+Th65gDPQMwOSM0vYucC3dR19Swlly/FcqXN/Xmuuti77YgduUyGUBvDHENPESg3A
	onWI2yKbn9A0NzodN3Y4vFsuFmwE68xWXkm7oJpILCX07CCPBgCH4ff3khyoTXqKfDC6u3PAbTCXR
	bfLeUt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVIl-0000000G3OG-01aD;
	Thu, 11 Dec 2025 01:17:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVIi-0000000G3Nt-2zUg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D3843D54;
	Thu, 11 Dec 2025 01:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB15C4CEF1;
	Thu, 11 Dec 2025 01:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765415819;
	bh=IXErxpec2/rYIHa+WHFVA4kiKDgjEUjWx3xpLhR8yXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kwehB/QENBmQeDcAnODFLPBAAeJ1J56jMt7gIDFkm6cMzTupcMLBGvEE7vAgzhQAn
	 XJyTCc4dlgioyK8m2yEq/uLLqR0HvZtEW2C4UgWgVVQaxjtMfcFjcTFHX0FyPURUtm
	 gxiJrFj0n6j27uX527wohW0ryxA4RXBR0/rzvxB3c2NkzVJ4zTzQsOvOg5Typ5yOBo
	 ScJdA/vvD7QruisH7HWd3a2UaGVNxwDo1mFA74022ABsUEiWnjYzWRi4iDR7qAFNRM
	 +keXNPzr1ElGPafu5uzW7JlOEk0cmqBgL0bofp3NgfeL86r4BGD/3ynP2C+q244MB4
	 ZEabEPJqXNJDg==
Message-ID: <a252e741-aab3-4fec-ae8f-38634d071d77@kernel.org>
Date: Thu, 11 Dec 2025 02:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
 justin.jiang@nxp.com
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-1-afd6cd01c299@nxp.com>
 <4b29cc46-28a1-45f1-b24e-548513178884@kernel.org>
 <aTkTz-5QoB8BuLs7@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aTkTz-5QoB8BuLs7@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_171700_801444_85763AC2 
X-CRM114-Status: GOOD (  19.35  )
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

On 10/12/2025 07:31, Yanan Yang wrote:
> On Fri, Dec 05, 2025 at 09:21:55AM +0100, Krzysztof Kozlowski wrote:
>> On 05/12/2025 09:03, Yanan.Yang wrote:
>>> Add DT compatible string for NXP FRDM-IMX91S board
>>>
>>> The FRDM i.MX 91S development board is an low-cost and compact
>>> development board featuring the i.MX 91 applications processor.
>>>
>>> Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
>>
>> Are you sure your Latin name contains '.' character? Or you just copied
>> login?
>>
>>> ---
>>>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>>> index 68a2d5fecc43..82f28be401b8 100644
>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>>> @@ -1412,6 +1412,7 @@ properties:
>>>          items:
>>>            - enum:
>>>                - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
>>> +              - fsl,imx91-11x11-frdm-s    # FRDM-IMX91S Board
>>
>> Anyway, this was sent, or something almost the same.
>>
>> Align internally before posting duplicates or at least explain why this
>> is not a duplicate It is not the job of the community to coordinate how
>> NXP employees should work. Srsly, it's NXP's job.
>>
> Hi Krzysztof,
> Thank you for your review and for pointing this out.
> 
> This patch set is not a duplicate of the FRDM-IMX91 series. It introduces
> support for a new board: FRDM-IMX91S. While FRDM-IMX91S is similar to
> FRDM-IMX91, there are hardware differences that require a separate DTS:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> These differences were described in the cover letter and commit message,
> but I can make them more explicit if needed.

I cannot find anything about it in commit msg. Look, you wrote:

"Add DT compatible string for NXP FRDM-IMX91S board

The FRDM i.MX 91S development board is an low-cost and compact
development board featuring the i.MX 91 applications processor."

so where is it? About cover letter, I usually do not read them, some
maintainers skip entirely.

Best regards,
Krzysztof

