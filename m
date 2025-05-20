Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AE3C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWgu5lBfL5XpJjjET0WzNaYSrku+BoCHnp93wZOvIz8=; b=m3+Rt8UhlqZt+bdAhl1xNjfx+F
	Q8LkpQEnjQtLKqVEkyNwkuMWVurISo0pvJCzCY8vbIhEpSWT/+sc+E/aLOQh/WkNSX0HucyPI3Jct
	TOkWOx0EWboVYgX30koGufCcyRKAbZ5r7N3WQtMZ9EbJo2GPyFUfmbIysEO0LOShEd7GWhy5OOZKO
	aWOBhBnEUP7YOsTxVGG6LZVsc0ae2uvWIt/EN37kaRkD0wwFqc1mOBQBRdNB77kWoH4xZ4Lp58DQI
	ayxYMmZTWo2UlpRgBK0zxSfWrjA/xRCyCcHArmGwJO0XchPqyQtHoPnkC57IKzBWUtkUmrKByHfl7
	VDBJKIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLal-0000000CkDe-10NZ;
	Tue, 20 May 2025 11:57:07 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLXY-0000000CjKl-3lKT;
	Tue, 20 May 2025 11:53:50 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id E4B4B61625;
	Tue, 20 May 2025 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747742023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWgu5lBfL5XpJjjET0WzNaYSrku+BoCHnp93wZOvIz8=;
	b=jhZ6H4dmH4PqaBbiMtuQINMyJgIfDAivcHRGi8Lw23Mjc4lMh8E5D0hNQqcQC5EmT8afWX
	Mo5cQ5OWOrIJBTK/GhIQXhYxJynUIKDOhuf6ZGuA7+PujHyTbiBhnLIXs60lGNFn3rhk7U
	7mcN+CQ8DR158tEYKD9Cs8l4GWzftLk=
Received: from [IPv6:::1] (unknown [IPv6:2a01:599:a12:a881:7bc8:fcdc:bd77:c992])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 91EC9801A1;
	Tue, 20 May 2025 11:53:41 +0000 (UTC)
Date: Tue, 20 May 2025 13:53:43 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 06/14] arm64: dts: mediatek: mt7988: add cci node
User-Agent: K-9 Mail for Android
In-Reply-To: <7a563716-a7c6-446d-b66d-bc71c6207ef6@collabora.com>
References: <20250516180147.10416-1-linux@fw-web.de> <20250516180147.10416-8-linux@fw-web.de> <7a563716-a7c6-446d-b66d-bc71c6207ef6@collabora.com>
Message-ID: <4BEF26F3-957D-4BB4-BF7B-69DCFCC513DC@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 2d52479b-b83b-47c9-978a-066fc5c63c1d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_045349_095900_CDA6D2FB 
X-CRM114-Status: GOOD (  11.16  )
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

Am 20=2E Mai 2025 13:27:23 MESZ schrieb AngeloGioacchino Del Regno <angelog=
ioacchino=2Edelregno@collabora=2Ecom>:
>Il 16/05/25 20:01, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add cci devicetree node for cpu frequency scaling=2E
>>=20
>> Signed-off-by: Daniel Golle <daniel@makrotopia=2Eorg>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi | 33 ++++++++++++++++++++=
+++
>>   1 file changed, 33 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi b/arch/arm64/b=
oot/dts/mediatek/mt7988a=2Edtsi
>> index ab6fc09940b8=2E=2E64466acb0e71 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi
>> @@ -12,6 +12,35 @@ / {
>>   	#address-cells =3D <2>;
>>   	#size-cells =3D <2>;
>>   +	cci: cci {
>> +		compatible =3D "mediatek,mt8183-cci";
>
>While you can keep the mediatek,mt8183-cci fallback, this needs its own c=
ompatible
>as "mediatek,mt7988-cci", therefore, I had to drop this patch from the on=
es that I
>picked=2E
>
>Please add the new compatible both here and in the binding=2E

Ok,but you have to drop last one too (add proc-supply) else there are buil=
d-errors=2E

>Cheers,
>Angelo
>


regards Frank

