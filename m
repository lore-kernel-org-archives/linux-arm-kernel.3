Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C31CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrpCQ53D7OxCMh2IYIqWxT+mJxUXQdsEbpSrt2VKJpo=; b=NesW/1kL9SbevLLIKVGkeFezFh
	HgZ0JsEUN6XbStZ3vXkiF0lTA51lhS2byElVKB1fnOQuFFctt4j4+pqjg/8eLIloE96TJ8klS/BPW
	CFtl3rWdBwpmgUGVJ62Bvq69mczObBYDqoOcpIkBqUptgrBIWACn/+LKlA0IRwF+88BYdKuSnZP8K
	lO1CQx+71mjpGW5R23Ir9X5pRZQLiiLyp4Zeshj/sosF+zrfXXnojaRmLR+MzW+XXqilzhH+nMCmQ
	JgSGf2LDXs2WI7O+gsx+0XTmwOEDE498ZO9wh3JIrOU+aKwmWjIjd8tjGV90M63o0Ao/xkIglo5lR
	ZTzqd9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDH1-0000000BphL-3DSo;
	Thu, 20 Mar 2025 10:37:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDDi-0000000BpIx-0j5C;
	Thu, 20 Mar 2025 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742466826;
	bh=B9Ki//9iYq86oCfYqOWVMz9KXkrveoc2XfDUrCHNllQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ldQ15eiJXcEsRMalSLnsahQv69s8e8pN3qsq9WHFWXn19xqHqaQ3fCQTdDdFoz737
	 qMRwdWerbkjoOoE40e9hXTQ3K1+Uzl65qR4VnM4E7HSyn5aDWa5yp650QohTGcWdLe
	 u8bt0u7X01Etjfy4J9PHJRNMjcMJjqhcET0tiJ+BOMm3RLKoFXm52ZiDZ28v61OdY9
	 FnHShgeoRUWg0hK1jLLhSqL0CqNbmzf+zTsOqMfjpevqI2NAbHlNmRMG1PQpPzhnPe
	 i1j/ApT8t8C5Vs5ScJMi2chBF85OW5PBtr7VvOdjuQZ0kw7d6X7zZ936PoTJddgQxL
	 YuPJig8zspprA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 011D917E0D66;
	Thu, 20 Mar 2025 11:33:45 +0100 (CET)
Message-ID: <be4af783-3b98-439b-be3d-30d6ff520d2e@collabora.com>
Date: Thu, 20 Mar 2025 11:33:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Nicolas Prado <nfraprado@collabora.com>,
 =?UTF-8?B?T2xpdmlhIFdlbiAo5rip5YCp6IuTKQ==?= <Olivia.Wen@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
 <70c10764-121b-43f5-931e-84ffd666c594@collabora.com>
 <b0872ee008c3c6a2731f949d8c2be77aa49341f7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b0872ee008c3c6a2731f949d8c2be77aa49341f7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_033350_366117_A59447E1 
X-CRM114-Status: GOOD (  12.27  )
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

Il 20/03/25 02:28, Moudy Ho (何宗原) ha scritto:
> On Wed, 2025-03-19 at 10:34 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 18/03/25 23:22, Nícolas F. R. A. Prado ha scritto:
>>> The SCP present on MT8188 does not have an L1TCM memory region, but
>>> the
>>> binding incorrectly requires one for the dual-core description of
>>> the
>>> MT8188 SCP. Remove that requirement. Also update the minimum number
>>> of
>>> reg and reg-names to 1, since as this is a multi-core SCP with no
>>> L1TCM memory, only the CFG memory region is present in the parent
>>> node.
>>>
>>> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support
>>> MT8188 dual-core SCP")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> As far as I know, the L1TCM is present on MT8188, and it's at
>> 0x1070000 len 0x8000
>> exactly like MT8195.
>>
>> Moudy, are you able to please confirm or deny that?
>>
>> Cheers,
>> Angelo
>>
>>
> 
> Hi Angelo,
> 
> Unfortunately, during the transition from MT8195 to MT8188, the SCP
> removed the L1TCM, retaining only the SRAM and config register.
> For detailed hardware changes, you can refer to Tinghan's previous
> description at the following link.
> 
> ref:
> https://lore.kernel.org/all/20220715051821.30707-3-tinghan.shen@mediatek.com/
> 
Thanks Moudy!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

