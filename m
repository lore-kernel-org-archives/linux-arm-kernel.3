Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF16C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3PfDdHFaYgoo5q+CK9acBY6BX1CACgiqMX4CHLm94g=; b=fcV15zcmLUlWFZ1v7DK4wVDYgN
	rFYzl5T/u6x6NMpE1u8GbvzL9nnLhfBCk2lUx2pyUPvtIk7OKho7jseSE4/FXrmfJ1j6Fzkkoyng+
	7fSrTaBf+YgihakI1KLdDVw9+Vg6YDRMGHMaNYtwXqxGOiV/qtQZojKzm9XZBJHb4jcOFIEUQpJiH
	MeUPrWwYbBE1jUpeV4kSTUXNCP8birRK/bfyvfeG/Qx4R5FtX+TZfZoDCGi2bwzd6j/3nrEbYT7oD
	3+OXN3YhhWsKkvztzAzI3P0FYpeCvn5SJSay8tD/wmgAkvRROtrZc/6dq57FnJUVKcYg8OtTJBP1O
	e4ugWWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNrK-000000089sn-04Sv;
	Wed, 26 Mar 2025 10:19:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNpa-000000089gz-25pO;
	Wed, 26 Mar 2025 10:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742984272;
	bh=HpBiFIVpWXiykM13dQ/yHPEonhKPXJCHKDyxubErAAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yv5bD2lPXSKwUy1+SERNNdlr/RzEvR8PspwtvDjs+Uxv8RssIK88D0SpbEW2RQfM0
	 OiCCbAoqHOShARwed4QF+NEEG47DjoTjhP1D/RDuHg2HiPL05RycooONUTF5IDuINu
	 j8FFUR6ZiWu5Dyk1Ldkue0yY5c9liU9juyOgdYL31oXfgLFGqg7rhlqZaV2SFmdFpt
	 VKfSfdrvE7cVjrJ/FNlk9f1o1CNaS4cfJzDSgfRsikzLM7fuvkBKT12vvWt3Xzv3sf
	 BxGTPNRp9tB+7CpMWTYO4/tkw6HNAVofvlY7E2vvVULi43e5ov+vgqzut5XrZra/S7
	 +FkYBCoe3+s3Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9590417E0E8F;
	Wed, 26 Mar 2025 11:17:51 +0100 (CET)
Message-ID: <6e7ad33d-c0e3-4160-81c3-93f6c88976ae@collabora.com>
Date: Wed, 26 Mar 2025 11:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Crystal Guo <crystal.guo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-2-crystal.guo@mediatek.com>
 <20250326-courageous-cobra-of-promise-2c839e@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250326-courageous-cobra-of-promise-2c839e@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_031754_697863_A56DB1F3 
X-CRM114-Status: GOOD (  13.38  )
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

Il 26/03/25 08:56, Krzysztof Kozlowski ha scritto:
> On Wed, Mar 26, 2025 at 02:30:31PM +0800, Crystal Guo wrote:
>> A MediaTek DRAM controller interface to provide the current DDR
>> data rate.
>>
>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>> ---
>>   .../memory-controllers/mediatek,dramc.yaml    | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> 
> Where is the rest of the patchset in DT patchwork? Where is any
> changelog? Cover letter? What changed here?
> 
> I receive dozen or hundreds of emails, so if you want to make
> it difficult for me to review, I will just ignore the patch.
> 
> I mark it as changes requested.
> 

Krzysztof, I do see that devicetree cc'ed in all of the patches that Crystal
sent - including the cover letter... and the cover letter has a changelog... :-)

Was there any temporary issue with the DT patchwork or something, maybe?

I anyway had to request some changes so no worries.

Cheers,
Angelo

