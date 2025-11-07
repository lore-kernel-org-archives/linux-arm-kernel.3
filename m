Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F8BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OWbRuGTNMcNDmD86tAeEHECcLnJ+86wxa52d94my2I=; b=d2wwwxgb8ucrk5nxIBCQfKkSKG
	EsrCtAj4fY90zEo4dTr9aIdslFYojnHgG0CKTA9cTWBGyFqpmd031lVvXbjaQiATKx6lj1Sq8j7mH
	bCp3JZmalrRLKH1tYpl0I1toFrAx7+4a9qF4exrg1/t+ue2weIQ6iOtecoMEWUFT1tlisNJF/5fXl
	5/PmqjD3qAovcWHv0hBAmH4kiSfzvMZDrU/Rtdb/DOGIfDaD0MHWmDhJjQtDyhQTQEv3TwbfrlMbs
	A10poAKTC4AGD8cCwYHG9Z1HLXgr2yMQuvJhmIiN2x/H2rEViOgJMtJTBMaxei0MTvQ+GbnDSmjjn
	3S9/+OHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIM8-0000000GvSD-25ue;
	Fri, 07 Nov 2025 09:02:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIM6-0000000GvRf-07oX;
	Fri, 07 Nov 2025 09:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762506118;
	bh=wS/nXim/NyVIVfyxDtGH5DaHltReoroPyVmp5wGin44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kw71YCFcDM3FboAdapJIUMulgckTgvjlgS6m9B403bjyEHLIVrgdDONNohVsuDfnN
	 1lKfOM6hqOcfoAAAAzyejkj1w5Zvev1UyMvWfe9/Fc8sWLfKy56KufeKaArh2DPm9u
	 m27oguRnwFFKer90nU5xVG+QJ6owens5BJJpO5wctUiEfG41BItEL3AubVU/3/lK2N
	 ZaFmDoddsAf+ENDCOYRresyBfzR0PGlePvL0M9dpF5PRNqDJRNy/Gb+Kec22+AkdA3
	 PRxB77za/RqtaAtIV799lB5K/1tlEIVydS9xxbKe49JLu7Cjl2bElzZGe31Hyts4cK
	 yKuVxnfN9zkUg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E21617E090D;
	Fri,  7 Nov 2025 10:01:57 +0100 (CET)
Message-ID: <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
Date: Fri, 7 Nov 2025 10:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org,
 igor.belwon@mentallysanemainliners.org
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251106161149.GU8064@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251106161149.GU8064@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_010202_252945_634C1077 
X-CRM114-Status: GOOD (  13.74  )
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

Il 06/11/25 17:11, Lee Jones ha scritto:
> On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:
> 
>> Changes in v11:
>>   - Removed unnecessary #address-cells in all mt6316 bindings
>>
>> Changes in v10:
>>   - Added "struct" prefix to structs kerneldoc
>>   - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
>>   - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
>>   - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
>>   - Some rewording of comments as suggested, addition of more comments
>>   - Refactored IRQ domain handling due to deprecation of function
>>     irq_domain_add_tree() to use the new irq_domain_create_tree()
>>   - Fixed to use generic_handle_domain_irq_safe() to avoid races
>>   - Added support for two interrupt cells in translation
>>   - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
>>   - Added support for handling PMICs without IRQ Group register for
>>     upcoming MT6685 implementation
> 
> The MFD part looks okay.
> 
> Let me know when you have all the Acks and the set is ready to be merged.
> 


Lee, the regulators part was picked by Mark, so I guess you can take the MFD part
through your tree.

I'm not sure if you can also take patch [7/9] (auxadc binding), but it would be
great if you could, because there is an auxadc example in the mfd binding that
needs that commit in order to succeed the binding check.

Cheers,
Angelo

