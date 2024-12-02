Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9710ED78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiCaU9VCsrHrARnis/Mwz30VnwpZh24c7z+5gmG2wQQ=; b=k91QUbWhL39yIHiDREbVpLWSRz
	CfJm33jpwEDCDZd64/Cca4QXHXqzMTBvIqaANz9DAyCUkcncLxvglNXVEQM+mglKsaRRRGE9UTcuH
	7RNJyX+x1EWaZHuSbnPRQGuMU/EUsotp/S9XI6qajm5TcSF48xV3m7KqiQ/BBo96A9vikgDwqny7K
	aF+okD1VFse9h0aaX9uUF+I0MS3lVRrWRccvhhKkpYcWw7zk6/KTsU1cFKSTqq1wE2qbqTsDYF+bM
	4S2EP9/A8axnRQlEcyREa6tSKMjqYRpPbgHWqsa5PDjChMU5V8qHryHpTOZGn426U4UBB9vOJwtgW
	iDNC0t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7Rj-00000006Qmy-1m59;
	Mon, 02 Dec 2024 14:30:43 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7Qj-00000006QYb-1S2i;
	Mon, 02 Dec 2024 14:29:42 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 8DD39410AF;
	Mon,  2 Dec 2024 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733149777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiCaU9VCsrHrARnis/Mwz30VnwpZh24c7z+5gmG2wQQ=;
	b=QNXhE5p2F5VZToy6Ij+oy/Pp3T8prS8YPnb39rnbgMQTfHrkEdYgKmF3fYbXPBDvAVVYlt
	8u8W19vzGs4HCYBBtY6JGFOzCRGWZve3fZewwFh+w3C4JYjEUinvrQi9DNOtM112D8cLFN
	xhshK1jH+y/vfWzcWDmK+fX0lHHuftg=
Received: from [127.0.0.1] (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id DC85A1005FD;
	Mon,  2 Dec 2024 14:29:36 +0000 (UTC)
Date: Mon, 02 Dec 2024 15:29:36 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_11/18=5D_arm64=3A_dts=3A_media?=
 =?US-ASCII?Q?tek=3A_mt7988=3A_add_chosen_node_on_bpi-r4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <0fb58a4a-7bad-4623-99c8-67f5763558bb@kernel.org>
References: <20241202122602.30734-1-linux@fw-web.de> <20241202122602.30734-12-linux@fw-web.de> <0fb58a4a-7bad-4623-99c8-67f5763558bb@kernel.org>
Message-ID: <D92CAF3C-F6B7-46DC-BF83-A71907E2D7EA@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: dfd265df-7f00-4998-b30b-86ed5c96f812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_062941_539571_90137104 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Am 2=2E Dezember 2024 14:46:24 MEZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On 02/12/2024 13:25, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add chosen node on Bananapi R4 board with stdout and default bootargs=
=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>  arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts=
 b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> index 9037f35857a9=2E=2E1c2a806f6f6c 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> @@ -9,6 +9,11 @@ / {
>>  	model =3D "Banana Pi BPI-R4";
>>  	chassis-type =3D "embedded";
>> =20
>> +	chosen {
>> +		stdout-path =3D &serial0;
>> +		bootargs =3D "console=3DttyS0,115200n1";
>
>Drop or merge into stdout path=2E

Have you an example to pass speed setting to stdout-path? As it is only a =
phandle it is not clear to me how to merge these 2=2E=2E=2E

>Best regards,
>Krzysztof


regards Frank

