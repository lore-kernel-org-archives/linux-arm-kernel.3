Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E147CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCxsKgZxhNgnJkvj/KGRREoRR8EGeTXpZ8jT6eg79s4=; b=RttwAH0t49FboTRfGiWw0h6+rD
	D6VSwXShEYXHsCvE8Vb0/ggCIzh5TYdW2ZFbWqXFxb+qwQlluyIGAiEgYinOkRjeLA/Ls3Exu9cD2
	lQFh5lPm/DyKzHrg5UpxwPmcnngv1LDq14q1SZt7LWOExTImovb/pRDZjOakA2NOoTTDGG+T/J4nI
	ApCm3jDGdhExNSdxlQiIhrRkQ+dkjgkDnrJ3l/xiwsUiBxXjOOuejPFrzQIuEPTEfM+Mr5dczHY2g
	zNl17+gkFUnmyzEIMPvHy1HodW7i1Cr9KgmW5hW4aRjn5gk3ul/aIuv2YARTsXlDt3Wd7bhutCxFY
	Bif/d8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhrY-0000000EDOT-0QaU;
	Wed, 05 Nov 2025 18:04:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhrU-0000000EDNz-3erO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 18:04:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E7D404E4153C;
	Wed,  5 Nov 2025 18:03:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A597E60693;
	Wed,  5 Nov 2025 18:03:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B833410B510C2;
	Wed,  5 Nov 2025 19:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762365835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FCxsKgZxhNgnJkvj/KGRREoRR8EGeTXpZ8jT6eg79s4=;
	b=vVMTH8ohHbUDKCAY5bjisKQTkA5E7XO7aW5dd5QnefShbzI9TBfbfer0ecT2S47DQwHrk5
	ocCj35krYsCkye6YFFj6xLJ+WP1uNrYBY0Fe0lBr7p8+AF0Ai1lkzetCQFaV2UOuKI3TKM
	n90TQy49xvU3plCaFhv4lmVSFeI0EOyUpv0wqv2HkAGFLiwmTVw+dG9C6XpBg/PxhE5h34
	/2w62xT5eU9HLv3N4Iy4hdHByhGz6phq74ak7WZI2a8AkNBcPqoqF1NyYe2FpvCRePQGHa
	hkZl8u3GOYy2zs/p8h2JCbNB6dHcXA0M+PbQZn6aBzZ9gsfEyNRhfqCKOWWWMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 19:03:50 +0100
Message-Id: <DE0YJPERKME9.2CYGFAPULFMZV@bootlin.com>
Cc: "Abel Vesa" <abelvesa@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, "Laurentiu Palcu"
 <laurentiu.palcu@oss.nxp.com>
X-Mailer: aerc 0.20.1
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
 <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
In-Reply-To: <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_100401_067320_8B5F5447 
X-CRM114-Status: GOOD (  26.02  )
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

Hi Marek,

On Tue Nov 4, 2025 at 12:08 AM CET, Marek Vasut wrote:
> On 11/3/25 4:55 PM, Luca Ceresoli wrote:
>
> Hello Luca,
>
>> On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
>>> The DT binding for this bridge describe register offsets for the LDB,
>>> parse the register offsets from DT instead of hard-coding them in the
>>> driver. No functional change.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>
>> I was initially a bit skeptical because normally register offsets are
>> derived from the compatible string, not from device tree. But then I
>> realized this is about the LDB which has its two registers in the
>> MEDIA_BLK. This means all in all this looks somewhat like an integration
>> aspect (the LDB component uses two resources of the MEDIA_CLK component)
>> and your patch mekse sense.
>>
>> So my only remark is that the above may be in the commit message, to mak=
e
>> the "why" clear from the beginning. It took a bit of research for me to
>> find out.
>
> Actually, the LDB was always meant to parse the 'reg' offsets out of the
> DT, it then went somewhat ... wrong ... and we ended up with hard-coded
> reg<->compatible mapping. It was never intended to be that way. That is
> all there is to it, there isn't any deeper reason behind it.
>
> What would you add into the commit message ?

The above paragraph is a good draft of what I woudl add.

>> [0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76f=
cecfda919@oss.nxp.com/
>>
>>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *p=
dev)
>>>   	fsl_ldb->dev =3D &pdev->dev;
>>>   	fsl_ldb->bridge.of_node =3D dev->of_node;
>>>
>>> +	/* No "reg-names" property likely means single-register LDB */
>>
>> Uh? If it is "likely" it means we are not sure this code is not introduc=
ing
>> regressions, and that would be bad.
>
> I can drop the 'likely' part.

If you are sure it's not "likely" but "sure", then OK. However it all
depends on the bindings, which leads to the below question.

>>> +	idx =3D of_property_match_string(dev->of_node, "reg-names", "ldb");
>>> +	if (idx < 0) {
>>> +		fsl_ldb->single_ctrl_reg =3D true;
>>> +		idx =3D 0;
>>> +	}
>>
>>  From the bindings I understand that having two 'reg' values and no
>> 'reg-names' at all is legal. Your patch implies differently. Who's right
>> here?
> I think if you have two two reg values, you should have reg-names , so
> the binding should be updated ?

If the bindings are unclear or ambiguous (or wrong) then they should be
fixed in the first place. With bad bindings we can either have a bad but
compliant implementation or a good but non-compliant implementation.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

