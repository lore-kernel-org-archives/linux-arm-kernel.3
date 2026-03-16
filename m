Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16FAF46437
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1+qBE8p8UUUcKcpyJxbZCBomz3WIgiahqtILq6E/Eg=; b=4Q9eZfOk+9kjV5z1e7XR7Ity4L
	NMidy2//yZ/wgBnx8naCmcC5xUihZDi219iTBGNwgmkWbeknl9dW24NJGlJuA90cqcW3UMt5dEUXx
	DBuqf+UvZcd93Ldx37eK4KKr5g67ZTzCw31ELYWkVhmncJkfMj+JD3DpMU/12ly2cIJq6VI434Ye4
	efiAGfBATUctmM3fhTt/IWrJZSOppgc7SNJJ2tu9SWPq+IxfmtC4SsxLMtTwkUo/bh+0nd2ramz1u
	DJm6T81In8czOjsbfLx6fSw0H5IV5AIAu+iLUOCk+G+THLRP3OEWllXyv7o+8K7B9q7qt6s4HZmBA
	2Eeg7g9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Lc-00000003e7Z-34hz;
	Mon, 16 Mar 2026 09:34:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24LZ-00000003e73-2Fan;
	Mon, 16 Mar 2026 09:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773653685;
	bh=huznZbedhmfKAQ7o1PThsloEGLLlgDE3FaFdxbHkFzM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KVh9wOn6flNT06ymoubOrhTAc4HQuH2n0xoQOqvRKKGz3l4L4JyXkaQyt/I5gJGHy
	 q1gH4+D44ARcUdx6BB4s2Ls6kxck50Z4lBz9HtwSXt7zl71FDLdy1iLtPgAOjnt8Yw
	 md1peYXCFL5bjCSoTdqA8Ije8wf5cFEZtFrXLqht0jfh0bJyRe/dTl/x77D/M0u1hM
	 qAWf/3Ia48qQkh8e5rxXn1+bcrvjsGDLvM71CwedhfosOI4DErzMw0JRln+49FSkVb
	 gNqx+5UnbTE01bR3Y6zenuTDqRj6Y601tfI731khfggd6ltvBTxXfqMGuzhOPg/1PW
	 4Jkb8AyypdR+w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1986E17E0EF1;
	Mon, 16 Mar 2026 10:34:44 +0100 (CET)
Message-ID: <538cb0a5-046d-4ec1-bd4c-d5a01dae7b06@collabora.com>
Date: Mon, 16 Mar 2026 10:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
To: Rob Herring <robh@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <4089450.ElGaqSPkdT@workhorse> <yq14imrwp3z.fsf@ca-mkp.ca.oracle.com>
 <5973984.DvuYhMxLoT@workhorse>
 <CAL_JsqKGxrNuaTb9+n3ZYjAdY=UHC6z-neXK-aieTXeROCN5og@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKGxrNuaTb9+n3ZYjAdY=UHC6z-neXK-aieTXeROCN5og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_023449_807305_FBC7243A 
X-CRM114-Status: GOOD (  17.19  )
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

Il 10/03/26 19:21, Rob Herring ha scritto:
> On Mon, Mar 9, 2026 at 5:04 AM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
>>
>> On Saturday, 7 March 2026 19:01:17 Central European Standard Time Martin K. Petersen wrote:
>>>
>>> Nicolas,
>>>
>>>>> "ufs" is redundant as all the clocks are for UFS. Same comment on prior
>>>>> patch.
>>>>
>>>> Is this naming a big enough concern to block this series with two
>>>> explicit acks on this patch that fixes a wholly broken and useless
>>>> binding?
>>>
>>> It is if it comes from one of the DT maintainers.
>>>
>>>> I am trying to put out this dumpster fire of a downstream turd that
>>>> made its way into mainline as the review process has been completely
>>>> subverted, and is only getting worse with each passing month
>>>
>>> This has to stop. Please read Documentation/process/code-of-conduct.rst.
> 
> I have little doubt that that is an accurate description of
> downstream. And if properties are getting added without bindings, then
> that is certainly a problem that should be complained about.
> 
>>>
>>>
>>
>> I apologise for my tone, it's my frustration getting the better of me.
>>
>> I'll be handing off this series to someone else, so you won't have to
>> deal with me anymore.
>>
>> I do ask however that you don't apply patches from MediaTek blindly;
>> if there's code to read an OF property, and that OF property is not
>> in the binding, then the patch should be rejected, even if there's an
>> Ack from the MediaTek maintainer.
> 
> There's functionality to find undocumented compatibles in kernel code
> (make dt_compatible_check), but not properties. Sounds like I need to
> add that.

Rob: yes please, that would help a lot in general, not just with this UFS driver.

Cheers,
Angelo

> 
> Rob



