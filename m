Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4099C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXpZtq+duYw8Ga6sy20MCkY0YEpeKd2cv2ExbMjZY+M=; b=MIgnI2ef95NEgh4Es3RbS5D14D
	B71XXYS68EldHlPv3OqK9hXr6NVXhP4QKhrEgerQxldUA4XOojsX3dpIZn1IesHbqYShhSbqv2WSS
	AyuntOBcfQSfebz5r6uwQ0M9yadbbQXmdef/AN3aIdTrGo4IJXbDM4qa1wvb1BIAv8y6g0XEeReJs
	y3DcZnKmjEQo2j/SR2BOdbTkbsNBm3+Q4hs3kGTCli2fqzo9MJGny13v6qYeBfsIvEnBvq6EvvaUu
	Fm7zIEtMKsEWuwGmLDUaRZ6zKUnW4j4j4fd6zB0e/ZW6hVo/+CYpWaSEt6LmMTZBSwHcodQZ140Xl
	Hede1nWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2c7-00000001BVk-3vfV;
	Fri, 30 May 2025 16:29:47 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Kx-000000017jj-3N37;
	Fri, 30 May 2025 16:12:05 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 8CDB410087D;
	Fri, 30 May 2025 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1748621519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FXpZtq+duYw8Ga6sy20MCkY0YEpeKd2cv2ExbMjZY+M=;
	b=er40mdaiLOUvmyVyf76eknKyl/pvXGbzBX7kZ9adIUywsTU0M4OjaKuiAZm0ePve2h8i4Q
	63/CHlvoWvLJpSG+B+iGhoxbHTOvcgyeXcengqxPOFGp3X3YwDWAXgrgVhyVOARp2GmvlB
	qUanoQM/pect+XWh1w9ZXgL2y/LbKgM=
Received: from [IPv6:::1] (unknown [IPv6:2a01:599:211:5368:40c2:8021:ae8a:bf1c])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 4CBF940112;
	Fri, 30 May 2025 16:11:58 +0000 (UTC)
Date: Fri, 30 May 2025 18:11:58 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Conor Dooley <conor@kernel.org>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [RFC v1] dt-bindings: interconnect: add mt7988-cci compatible
User-Agent: K-9 Mail for Android
In-Reply-To: <20250530-naturist-swept-973a1f8f4b08@spud>
References: <20250528135251.6492-1-linux@fw-web.de> <20250530-naturist-swept-973a1f8f4b08@spud>
Message-ID: <C75720B1-AD09-4A48-98FD-7FD8116934F7@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: f6b9ed74-8c20-42fa-80f7-3ad1dd003abb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_091204_003891_8AEFDE62 
X-CRM114-Status: GOOD (  12.80  )
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

Hi

Thank you for review=2E

Am 30=2E Mai 2025 17:57:20 MESZ schrieb Conor Dooley <conor@kernel=2Eorg>:
>On Wed, May 28, 2025 at 03:52:49PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallbac=
k
>> which is taken by driver=2E
>
>What's RFC about the patch?

We have merge window,but maybe this rule is
net(-next) only=2E And i was unsure if enum for
new compatible is right or if i should use 2
const=2E

>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>  =2E=2E=2E/bindings/interconnect/mediatek,cci=2Eyaml          | 12 ++++=
+++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cc=
i=2Eyaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci=2Eya=
ml
>> index 58611ba2a0f4=2E=2E2c6785c588e9 100644
>> --- a/Documentation/devicetree/bindings/interconnect/mediatek,cci=2Eyam=
l
>> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci=2Eyam=
l
>> @@ -17,9 +17,15 @@ description: |
>> =20
>>  properties:
>>    compatible:
>> -    enum:
>> -      - mediatek,mt8183-cci
>> -      - mediatek,mt8186-cci
>> +    oneOf:
>> +      - items:
>
>This "- items:" is redundant=2E

Ok,i try without it=2E

>> +          - enum:
>> +              - mediatek,mt8183-cci
>> +              - mediatek,mt8186-cci
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt7988-cci
>> +          - const: mediatek,mt8183-cci
>> =20
>>    clocks:
>>      items:
>> --=20
>> 2=2E43=2E0
>>=20


regards Frank

