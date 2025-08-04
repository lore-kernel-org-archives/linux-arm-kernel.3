Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31280C88CB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXrgcxVB8E6KWlHJZycaqftp0I4FDINATHV+czG4vq8=; b=diyHz0jAgzkobZvOjm1AuGLO9j
	E75vwUfL68Gjc0gmh8Ey6wTLkicLb73KsF1eiNXfO6/d5z4FQUoT8yNndUrPKvRLU+3mH3agUlkhL
	E92vcYsRYFTx0+soFaZSKQE9nY08YbA3wS4HpwfV5DhS6qAH/fBcMbAEGbbRLK2RBxsx96R46wRQL
	8TS79A4fynjzP2efojZ/Pd9JJGxdfK5bgLTvmys3x3mDysRxsY6MWwC0UR+HjeEwA+OG8WJUJJCz9
	63BmG2H2BMVQm8MRGibExJ2/2UvELgdneU51H0zPTa3LssG+aNyOni3mej3qDFLbYOoOGxC3zSPGX
	YdUqVoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSq-0000000A4tJ-0J53;
	Mon, 04 Aug 2025 09:26:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirEX-0000000A3Xw-25eW;
	Mon, 04 Aug 2025 09:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754298712;
	bh=YnsMfdLjcDCgGeySl/UQPr+JHC4sH1YnSBxgawRw09Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gZcp4SPHYouq9Etf4mL7vq3VQgp8dS+SPag7yPgZmr2wQLaHT8qIoLRYzVpSBMWKf
	 T+CwwbHNtpn1U5Ua2rIt4LzHpcg4gbelmhmTmif0lNmHPxPS6R3Eu0J3H3XphS4kno
	 r04/FfzhBOgECelzSDfKAHhvaU80k+3j10qK8EH6Tojd3BX1ZoIU5IjUf72KQ9bfl6
	 TZSmqSHBe2dSEhmI+g4fnmL3oZ/GS5uF0SOuknTXfwLg76zW2pSWQHr6XMpVMUxLnT
	 fIYOx0jRzBsqmXTLhYFiYdXm+UAIJbfKzhL0+PLzWZlMCbKkzP1bDaSAH1o56qHrpJ
	 Hw1q46HbFdE7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E8EB17E048E;
	Mon,  4 Aug 2025 11:11:51 +0200 (CEST)
Message-ID: <b6311035-9699-4f59-a3fd-8e1114ba9e0d@collabora.com>
Date: Mon, 4 Aug 2025 11:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
To: =?UTF-8?B?SHVheXUgWm9uZyAo57q15Y2O5a6HKQ==?= <Huayu.Zong@mediatek.com>,
 =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-2-huayu.zong@mediatek.com>
 <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
 <054c15233e27eec29bb88f7839f99b9ccce9691b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <054c15233e27eec29bb88f7839f99b9ccce9691b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_021153_690699_49D6351C 
X-CRM114-Status: GOOD (  10.80  )
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

Il 04/08/25 11:10, Huayu Zong (纵华宇) ha scritto:
> On Mon, 2025-08-04 at 10:27 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 29/07/25 04:31, Huayu Zong ha scritto:
>>> Add the compatible for mt8189 SCP to the binding.
>>>
>>> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
>>
>> Is MT8189's SCP really single-core?
>>
>> All of the new SoCs have two SCP cores - it's a bit strange to see
>> that 8189 has
>> only one... hence, please triple check and confirm.
>>
>> Cheers,
>> Angelo
>>
> 
> yes. On the 8189 platform, the architecture design of SCP is a single
> core.
> 

By hardware, or because the firmware uses only one core?

I'm asking again because this happened multiple times - with MT8195 and MT8188.

If this is by hardware:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



