Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E99BD59F6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFosc+cw1JPqHKsMcuTlSvGAgqaFhSr0nt/t0Ffi6wQ=; b=OWukjAP76IDU9ZcVN6uP211AoU
	/NSsdQUIoOkzybj4jVCCTt7mAbmjE4kAG0XPNz/vzuLsG+ceXcdDgb6kCRESyrmsiFsQr3D0thF9E
	vcso5yaKEDBZ6qe6ixXL/rU3MofFBTV3rNIMa8Huq4lWegJ1DRKl0Wtsio7IGbaAl5GAYK9cTdf8P
	NL5+CXaWCHqHXRdswviRKSy5M7tY28RN9khf4HZvuHaMNQV+oNxABx9x2mn7PF9MqOqnF+MIkWkkO
	7BYp12RZqBmVOKqgJV7tGwGg7k3oUzS/GY20c4p7VqnYSGlg6Jw+F7ecqDs4PB40PK6hTWDk074S0
	MVBH0Dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lmJ-00000004WZ8-25aJ;
	Wed, 06 Nov 2024 19:33:19 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lfd-00000004VSY-2pj6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730921179; x=1731525979; i=wahrenst@gmx.net;
	bh=EFosc+cw1JPqHKsMcuTlSvGAgqaFhSr0nt/t0Ffi6wQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nVzSq430rcPCnysBaAqrTy/xvqNCSs/N4flSm8wUYcItD+eQ7oqZovrGjw+sjQ3a
	 roUnmcg8/y6RNQWhFbRbDli99w+J/pLZXCNOADUJcLbNeXvUIP8WruyG9j5PV/095
	 HBjaCaokX7vVf4Hr2D3IC+w6FOOsx0zK3QLWnqJUlQJ7b8i4Lamcvll9vsIAe6+mh
	 CdFQfvjnlCfyIQABFnMkICFzQmB/qRJvZZkPY1vMcZat9T/kQNlO3rOluWAWSaIE5
	 yRwxnDH+5d98Yg9nP5S9lA1hznYKao10IIjPR8dkcYArRak5EYdHRfMpLpa/YCfsg
	 IOiyGX/62D8YHfJzfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McYCl-1tgSzX41dt-00nOU2; Wed, 06
 Nov 2024 20:26:19 +0100
Message-ID: <335a558f-f537-4a8e-86dc-9f76324eb206@gmx.net>
Date: Wed, 6 Nov 2024 20:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241022133040.686562-1-lukma@denx.de>
 <20241022133040.686562-4-lukma@denx.de> <20241031094236.17ed927d@wsk>
 <20241106115752.30397dbf@wsk>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241106115752.30397dbf@wsk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aNTWWsgjPtdtKsN51CZVNMv+vVvk1wlQaApmIrbXGFGv8TpJGgp
 DRI/I20NxQawmmy8S0zekV9MweAUkhzQghbsJUk1ZEiu1+E2yDTzyr13IukcGXQBlVlIUHt
 p6EWMv0ZkHPkcs5mK1xczxzWHxsi7bPLzcKOblRQY9EF4YJQNHxqRRdl79ccFEtZCF53GNz
 WvGCz/aXVzpL3VKJXxF8w==
UI-OutboundReport: notjunk:1;M01:P0:6Yt3NNZzIq4=;3yV956ASsWUbSuhsEta/eezA++q
 t2LLBPbYFnBlYoHDTzv4QqQJgtpN5AqqGnZzcrnpcl8uzGqL7b2mUl2sFV0MGGdD1H0zQguhA
 SkQiZAfPDf2ArV6y+J8ajzEdubxb5s8AlcI7CkL+PDQBLLs3bja9JdDckfI7Y0MAncY71kGhX
 eudwb1r8y2l2/4zotx1FKAeC5c9QN4w5jVl08bDgc1wbihyM+zaZVebpDOcGXX+tE989MOYZP
 LMT/Rx7+mO1uU8QM59ouy3lkIqbd/1j9pT6ihnnMjDwYXhJNdqmUVkc6NmL5roXKZKfYmxAoM
 9FxrAkkPD0e2Ymb0UGHFTqak9wJ64qIG/6e/XEm511VQ34m/E5CoQKULNBC504Tby5ezW+aA/
 aadQS+UNXXFVk6SwOSA6IsAHHb2Y+48one+aq8EtpOEzY2oJzY1Xqt9NwZqgLXHJCsgWXLCxJ
 r33RYA72OCfSxf918TYGWg38G+SBR7rtIqyDKZY/AQL/q/P01BX964WD/1+LzRVK14aHLuoQV
 6Y43issqWvkjSqig8ZEPPjjOwc2THR519BJGHZrJkUNJRGgpwmgkN6Y7byKbVWy4EOuFJ8sfN
 AhAUXRwSB089hY2i844i6UIMs2E6sEG3vG0Bn9tJx9/Bf+NVoIIQ5QgsD6rJBcZ6TPu3lzIqT
 Y6iQptnfepKup8M5whJyA0b17BGjFJwekInZR/IQ94IP0iPHd2lDboiA4wom73LdtaPWarM9c
 rhvnY/4VDlSEiFNCLvjKtG143Stm3Mjilr8sr9X3I5hhZB4Es0Y4jiAO4hxtXAHYMqxYOMUIt
 /se+GwDYEOLF+ifr2cZaV4fMJMXUjmUkPcZAlQgHCJMCKneVKde3V/dSOWZ9o2KlfkWPfF1IB
 iwWNz8ZAQDsIP5Y6g7weTouBu3uRojnmp/zQdLrprzX8+2OFhctYtbacJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_112626_146279_667A0BD5 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Lukasz,

Am 06.11.24 um 11:57 schrieb Lukasz Majewski:
> On Thu, 31 Oct 2024 09:42:36 +0100
> Lukasz Majewski <lukma@denx.de> wrote:
>
>> Dear Community,
>>
>>> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
>>> some extend similar to already upstreamed XEA devices, hence are
>>> using common imx28-lwe.dtsi file.
>>>
>>> New, imx28-btt3.dtsi has been added to embrace common DTS
>>> properties for different HW revisions for this device.
>>>
>>> As a result - changes introduced in imx28-btt3-[012].dts are
>>> minimal.
>>>
>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>>
>>> ---
>>> Changes for v2:
>>> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match
>>> current linux kernel naming convention
>>> - Remove 'wlf,wm8974' from compatible for codec@1a
>>>
>>> Changes for v3:
>>> - Keep alphabethical order for Makefile entries
>>>
>>> Changes for v4:
>>> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
>>>
>>> Changes for v5:
>>> - Combine patch, which adds btt3-[012] with one adding board entry
>>> to fsl.yaml
>>>
>>> Changes for v6:
>>> - Make the patch series for adding entry in fsl.yaml and btt3
>>>
>>> Changes for v7:
>>> - Use "panel" property as suggested by the community
>>> - Use panel-timing to specify the display parameters
>>> - Update subject line with correct tags
>>>
>>> Changes for v8:
>>> - Use GPIO_ACTIVE_HIGH instead of '0'
>>> - Add the comment regarding mac address specification
>>> - Remove superfluous comment
>>> - Change wifi-en-pin node name
>>>
>>> Changes for v9:
>>> - Remove not used 'pm-ignore-notify'
>>> - Add display names for 'panel-dpi' compatible to avoid Schema
>>> warnings
>>>
>>> Changes for v10:
>>> - Drop new line with panel-timing definitions
>>> - Add new lines with 'sound' node
>>> - Change 'codec' to 'audio-codec'
>>> - Change order of properties for saif1 node
>> Are there any more comments regarding this patch?
> Gentle ping on this patch set.
I do not see a reason to ping on this series as long Rob's comment from
Oct 22th is not addressed.

Please reply to him if something is not clear.

Best regards

