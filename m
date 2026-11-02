Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tQO+p1iv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw5WNuao
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=; b=tQO+p1ivsGfc8R
	GuIPb20NXMtYfQCGaUdrZnT8eXvrAo6yio/P/PkJKGI6Qw7nDKr17+ZAd+p1HbEl6tE4HEza9fBxw
	nJcXAsneOM6sinWlpomnyqc26kyQZiTBwo7/C5gZL4uGGIGYQu2pj1jKmdpZMTWqaVNjvqz2N/nhG
	z/APhn9X+Zo9XQ05Ux4tOyVMJvIlid4a4fEMJCT3eY1otXIhzBZLhwQwv34sjsxoZWRfipiLWp2j8
	ZfQzq+emy0jpVH0s+ITTm7Y8rfqqWbJ318yhssaVBipjxaJmu/BTcqDD55d7YCc1uPv+yVb3UA9h+
	Fu3En1VRZDayzn1b7ptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNynS-00000000M98-3eQQ;
	Mon, 02 Nov 2026 20:38:26 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNynP-00000000M7o-0WuG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:38:24 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-91c8fef5ce2so44349906d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793651901; x=1794256701; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
        b=rw5WNuaoRSCcD1ONeI61K7hV4fD4cc/2wXFAac+Ox+6HOFF9ZH0DKKN1LfX2YR34eS
         2HfnM9mbf3td0Rbzv5mo39lJGcVJjjqVTGKLUqD0D/xYxE7m6eMgPt/b0avGfni0Njy+
         VF/RkawSAJJI99I8n8SuChJ0ctKo4/4eAdgXa6Pzj3ENQU4D80ykAR8kmi10zdIVOmOu
         dn4USBmkAE1Ipedu2T/xr7Icm7Tmk6KoP4wSTHq/1hYLWwOYNO7Mh9fJhVmuk2Sr42wR
         /kIrtedHPb7WNngM/MMkmlE80iIqoHBsNyY/RnO3wyFONeE4AqHhdU5k04YsyPGqbnDh
         q5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651901; x=1794256701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqOfHGfqq8y0jqDTq9u5axpAxahHuV8gA44EpfAxrF0=;
        b=kHBu8j/FmiVqckdBD3U6rKYqQ5nFDLIVYfh/TMMu4Dwn+07CphCPm2LMnvNbSF1ipC
         cBeLDI8yO6Oq/ogh+2ky4xEOKxGJq3DgXKmImhdapLTdr1SLKLWHfdizrGR2TsT6HE6s
         ORdaaHH/N/rasy5RTdGWy5X3E7MwXLsf6/izc0DwOhHakDx2741l2umZ5cQ+JF4kVCo4
         H3x3jMvjASDLMUGi2fBI4O9gV1nGcWEhslPYRBsTBeEAbyXBrv44Pckrn9RHUYd20Vxr
         hp92O9FDjrunCabmzhEDRNRK6nXLYsn0YDwLsFkWsAq8Zi3VwQlexrMz2IxMP5RDIqt0
         OpAg==
X-Forwarded-Encrypted: i=1; AKwUvBxaixar6L+cm3gd+gKRX8x+D/mFx5xq7IN/Z2jGeYx0elhMT7HbvyCwmCMhXvdtOiMBznPtAONW7tjDYKRWCct/@lists.infradead.org
X-Gm-Message-State: APuU4Z9m67q/b2E9O7ZKhL3WhJoSpcCLhVttBaGhrMkW0URHFXxihBy8
	tD5ifvbix3bro26Ul9fwtYSfEmMpH/d4RiJ0ErUpzwrspfvtdY+gYfCQ
X-Gm-Gg: AYBFou3locA02U/s48HalDYTCA0SRAia8/h+SEfFvHDAad5FNijZlCm7KEMoBNZSOew
	OYDLQnjhyct1VBTaMTQcVFe6x8eWl9tO1CYC40ngTgvTVIHHH3wNI/4NQ8zgv2pn+5p5jJ3DkGk
	f0UBJOOuVZMqYkHlV+b5rhfQsxbtIqXEwAUZmVx4KkK8m9ZEnaNaQd6I0PaFS40hNEm/aBZobaU
	ItzWLAdAUc/f8+RkBmes731gCPyBwQI+INsoqBCEjarVHlCCtycAl1EY0tq7SIXoTwGDfI73fKT
	Cqi36l/WhwETUPaAmlJ5nNeaEW3DuIs0wNd1cf6zE/pyL3Y9LLv/JWGFDrVcftahlwz4cUS72FQ
	I8vjM6JHhtr5m7Uomj2PYVzxh4YQN/wXVAVxEF3y5UulWINxi3/fdoPRxwuVPeLytlDKE51PAvb
	J4tT9654H/sox7CN5KjW/0MAMrLcQEltRULkgkMAkmd6YiKlucPjJjkncEpPvE4ZZUfKhAsHAa9
	kdboUuDAHM7kqL91ZWl7WtGr9M6UtL0OJaQnZkQsZv2AINSZlglWMMqNo+PwlSL/xkKuigtIj6O
	XQcYWA1NQCpFRIqYgHnqdv8Mlg5uDyklOeeb2/alTKcf/0G40n9xn1k=
X-Received: by 2002:a05:6214:21e5:b0:91b:5d3a:f136 with SMTP id 6a1803df08f44-91ca4b8303emr172551426d6.53.1793651901295;
        Mon, 02 Nov 2026 12:38:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f26f1esm100674086d6.13.2026.11.02.12.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:38:20 -0800 (PST)
Message-ID: <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
Date: Mon, 2 Nov 2026 12:38:15 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and
 BCM2712
To: Peter Robinson <pbrobinson@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
 <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_123823_179806_C22199CC 
X-CRM114-Status: GOOD (  22.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 12:18, Peter Robinson wrote:
> On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
>>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
>>> described by a separate node covering channels 11-14, and for the
>>> BCM2712 DMA controllers. The register address of a node identifies its
>>> first channel, allowing a controller to be split across nodes.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>
>>> ---
>>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
>>>   1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> index c9b9a5490826c..31d97a10a0ea9 100644
>>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
>>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
>>>   maintainers:
>>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
>>>
>>> -description:
>>> +description: |
>>>     The BCM2835 DMA controller has 16 channels in total. Only the lower
>>>     13 channels have an associated IRQ. Some arbitrary channels are used by the
>>>     VideoCore firmware (1,3,6,7 in the current firmware version). The channels
>>>     0, 2 and 3 have special functionality and should not be used by the driver.
>>>
>>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
>>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
>>> +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
>>> +  split across several nodes, the register address identifies the first
>>> +  channel of a node.
>>
>> Uh no, a device should not be split across different nodes. This should
>> not be needed, why can't your driver handle the upper channels having
>> different capabilities?
> 
> This is the way it's done in the downstream kernel, unfortunately
> Broadcom doesn't publish the HW details so either they'd need to
> contribute the support (which they've not done since the RPi4 was
> available) or I'm not sure what the other options would be. Open to
> suggestions.

Neither here nor there, IMHO, yes it would be nice if documentation was 
published (and a customer like Raspberry Pi is probably one of the few 
that can get the needle to move there).

You have the bcm2711 and bcm2712 compatible strings which should be 
enough for you to know which channels are 40-bit capable and which are 
not, yet keep the same Device Tree node.
-- 
Florian

