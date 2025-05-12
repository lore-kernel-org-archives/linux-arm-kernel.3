Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDCCC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOnx2nS8BUGOff4qxVjsY99Ec3z57H2RyW27rvY/0bw=; b=KGVNSZ7WnQZ/woGuQmc3k8UmBX
	+5V2+/6FGcWOV1uziDW/d5+5E7zJRoXs6DCq4REizL73vFCVHrfUfs4ASwfN4+f5LAKxbIybYWuiR
	q1sB2+36mrnUdENq5GGnQuKsFCT/3YkouD9q5hmcLscEFU44IMDvwvtuDADrwW7CGpOfprxcaKklp
	tgvE72tHwLvn/V3WGMxMlR5FciiYabbxUhRIVcEpRbWghVtCInnnxlfaF7QQ8g1S8aEC6FIHLKN3D
	eN2Bk3cxNs6kyTvdA1Ovs5w5AEVXNrl9e5RoXUwIOzdhnbEOh/M8jn+B2hd4waYGulUC6xm49at90
	9DxIii6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEX7f-0000000AELT-1OQC;
	Mon, 12 May 2025 17:39:27 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEX1p-0000000ADam-2kgh;
	Mon, 12 May 2025 17:33:26 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 6EBA6601D8;
	Mon, 12 May 2025 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747071203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fOnx2nS8BUGOff4qxVjsY99Ec3z57H2RyW27rvY/0bw=;
	b=kE/5vxOHk4WeXfDsBzUVJQU1s7TuLuM8EKYi/1mLuGdaNckHloGXV27dRjex99Aw/g9tCf
	5sOD403GIqwnucydRJ13DZ2OjWkkVt4yPY5+KBN9PYb5IZDHQ8v5WcKJLQ47B1i3U8Utt0
	p6Te9xqfKW9dvjVR2RoENhB4uVrdvXg=
Received: from [127.0.0.1] (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 238C6360303;
	Mon, 12 May 2025 17:33:22 +0000 (UTC)
Date: Mon, 12 May 2025 19:33:22 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Conor Dooley <conor@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_01/14=5D_dt-bindings=3A_n?=
 =?US-ASCII?Q?et=3A_mediatek=2Cnet=3A_update_for_mt7988?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250512-nibble-freemason-69e0279f2f99@spud>
References: <20250511141942.10284-1-linux@fw-web.de> <20250511141942.10284-2-linux@fw-web.de> <20250512-nibble-freemason-69e0279f2f99@spud>
Message-ID: <05760B5E-955E-4E0E-9B69-E762783CC37B@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 374a0106-a2a0-463f-a626-6a3e8e2d7734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_103325_850661_8FBD5B64 
X-CRM114-Status: GOOD (  11.25  )
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

Am 12=2E Mai 2025 18:21:45 MESZ schrieb Conor Dooley <conor@kernel=2Eorg>:
>On Sun, May 11, 2025 at 04:19:17PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Update binding for mt7988 which has 3 gmac and 2 reg items=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>  Documentation/devicetree/bindings/net/mediatek,net=2Eyaml | 9 +++++++-=
-
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml =
b/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml
>> index 9e02fd80af83=2E=2E5d249da02c3a 100644
>> --- a/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml
>> +++ b/Documentation/devicetree/bindings/net/mediatek,net=2Eyaml
>> @@ -28,7 +28,8 @@ properties:
>>        - ralink,rt5350-eth
>> =20
>>    reg:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>
>This should become an items list, with an explanation of what each of
>the reg items represents=2E

I would change to this

  reg:
    items:
      - description: Register for accessing the MACs=2E
      - description: SoC internal SRAM used for DMA operations=2E
    minItems: 1

Would this be OK this way?

>> =20
>>    clocks:
>>      minItems: 2
>> @@ -381,8 +382,12 @@ allOf:
>>              - const: xgp2
>>              - const: xgp3
>> =20
>> +        reg:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>>  patternProperties:
>> -  "^mac@[0-1]$":
>> +  "^mac@[0-2]$":
>>      type: object
>>      unevaluatedProperties: false
>>      allOf:
>> --=20
>> 2=2E43=2E0
>>=20

Hi Conor

Thank you for review=2E
regards Frank

