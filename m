Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD143E9B269
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgenNndlhiDMgIjl77PxzhfQYBx3yM3yyo1rjB7HVX0=; b=f+pf1nfiRk8aZAAJVboVOBdbdP
	bedRUQ+RKB5Cdi+diDVsXTTQFJbfltvTjYqZBTN9F91gl4vfhk0zTf4VMuAHbWFL6Z/krNcMXC6GQ
	cGjToBPpzKsMxrOJ2gOLOFHsxbbpBLQrBUGkkab6MFBi04NXhu4vII0mnMF7lzh0LaUtqSXS5nzcC
	BtkD6wAL/+jBQxY/K/945N75NlgS6JEtTkt+xzytv2ddVIln6tl3Bh7Hu20Odvfc5mPMuY2t8e+pG
	vpxTzWULOot/sTx3vHm9hqZ2FL1nty6IFtSHEY+WPtbuLy27lLfWDJACQQbONUml1So9JhtA+1kXP
	Yd55XTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vut4I-00000002BB1-3gVH;
	Tue, 24 Feb 2026 14:07:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vut4H-00000002BAc-0q4o;
	Tue, 24 Feb 2026 14:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771942034;
	bh=GHqOMsVIhnM/qwB2gCQ7BjybcTTTqIh1JgBMM216iN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I3hbAez5JGJzQLHds0zTJby2v3l21CQAIDqMmf6UFT4QbKY2ap3g0TAqDhIvfNV3m
	 pNC4dibgW3KNhsy0MBxbK059ec/YZdJ+DkbTuMQ2SBpiS34Lsu/yKB0xEYEV/x8bdA
	 6zP0a7X+PifMQiZdNzdvgDwpyhMXZkvnCsXGFvSv3iVqlDxparBUYIzDNJGkm6F3KO
	 CWeA6rTOvRCiHKOzNzWs/zCnBet43s8f2sGGltNIlYkYuKxotkU7CoQVPM5xKrSAI+
	 m2M8szYFONBEae6oGZ1xH7WWo2trFqVNKDsHRo0bvBOgB3K0GHlXYiz6ItbCZZQhX2
	 Ouz8qDzYvZB5A==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7967017E01E7;
	Tue, 24 Feb 2026 15:07:13 +0100 (CET)
Message-ID: <0c9a158a-f70e-461c-900b-6f6485064a02@collabora.com>
Date: Tue, 24 Feb 2026 16:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
 <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
 <244b22d3be77047163b4e47c4ed33b5b1befb4b4.camel@collabora.com>
 <0874bb3d-b38d-4ea3-a5b0-2da2484cc3e5@kernel.org>
 <e73da0713587ad5380344afa686a13431d07e232.camel@collabora.com>
 <af6c6561-3d41-4967-a224-cf239335dc5b@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <af6c6561-3d41-4967-a224-cf239335dc5b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_060717_401681_03DA620F 
X-CRM114-Status: GOOD (  12.10  )
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

On 2/24/26 3:54 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 14:48, Nicolas Dufresne wrote:
>> Le mardi 24 février 2026 à 14:18 +0100, Krzysztof Kozlowski a écrit :
>>> On 24/02/2026 14:14, Nicolas Dufresne wrote:
>>>>>>  
>>>>>>    reg-names:
>>>>>> -    items:
>>>>>> +    oneOf:
>>>>>>        - const: function
>>>>>> -      - const: link
>>>>>> -      - const: cache
>>>>>> +      - items:
>>>>>> +          - const: link
>>>>>> +          - const: function
>>>>>> +          - const: cache
>>>>>
>>>>> No, ABI break without point.
>>>>
>>>> Its not released yet, otherwise both order would need to be allowed.
>>>>
>>> Also, not true.
>>>
>>> git describe --contains  c6ffb7e1fb90
>>> v6.17-rc1~90^2~3
>>
>> Ack, I thought this was part of 7.0, it would have been logical to be part of
>> 7.0-rc1 I must say. Whatever happen, backward compat will unfortunatly be
>> needed.
> 
> 
> I was here checking the binding, so the ABI. DTS maybe was in v7.0-rc1
> indeed. Anyway, the commit msg should describe the impact on users of
> this ABI, at least known users.

My bad, I only checked the DTS changes which landed in v7.0-rc1, and wrongly
assumed the binding also landed about the same time.  I think it's unlikely
there are any (external) users of this binding, but obviously we cannot be 100%
sure.

Would it be acceptable to extend the binding so that it allows both the current
and the new proposed order to coexist?

Thanks,
Cristian


