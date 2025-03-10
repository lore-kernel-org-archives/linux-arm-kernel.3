Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Men/YQvbniyBZCsHsLLPHLGHHkqzBckBKs8MSvuAcUg=; b=ZByI5+wC7DLK7g6VX+Cootyb+S
	m8k2pCPb4mrsQL1VPi/fHyMSvoNKvjqFdwZj7dIvaqxsLnwsMfu341WTUNrTb0HnsPbCSLUqczkIo
	+0n8jrhodzOakbAQG8FLjDL6cGpcBaYc8aAl5WywdMrL9fos2HUp/4i5zn85Ud8xkVajfP6u3/0+z
	nAwFeb6tz5LuBjtY0ETAE23HWCfPlA/xNVBvzersVW8s83+UZAyXZQQLEsRXow996TiOW8TtQD+dv
	RP3KJmSGAMHBYmUyzY/69TNTLupBlRwJlMoY8dmYpO01am55YZNEvgXko7lRcRb+YKRnj9hIDw3Xo
	tXziWqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgJK-00000003OTP-0ODL;
	Mon, 10 Mar 2025 16:49:02 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trg2T-00000003M2N-2eDC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:31:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA26D4421A;
	Mon, 10 Mar 2025 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741624293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Men/YQvbniyBZCsHsLLPHLGHHkqzBckBKs8MSvuAcUg=;
	b=ZdbJLhsMMvNtKlRd1B4Xxs/CP2OEBSFJQYi8sAu5+jOg/ppkH8n8f0wnGfsORUMbLDvZIE
	AFc2QC/dNL3f1ZcCeZjdFlZuvErFK6bCwsSvM1iLlT+9VxJv9pjpgg3ol8YyJtUJcaKRYK
	4i2KuWmOug8oPC9l1Xuj315Yr8zfggcfe3ai92c8dAOo8jvTb+shgcXHN4MOt7v7uyAHX9
	Z2JyH9WSexnJ0tcCb4JEiljRXVxC8vgtnlgJYx65e+JfvoEfJJiYEEJOnq2vZw1ok+u+oY
	fHo5GJw7SIp2R8a2GxA4RMD6pEbMoie43PLSn4PEVqyWWy6jZnGy0xRNqZrMPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Mar 2025 17:31:32 +0100
Message-Id: <D8CQAAKOZ1O5.8JVESQPJSSM8@bootlin.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and
 Concerto board
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com>
 <20250310-varsom6ul-concerto-dts-v3-1-551e60713523@bootlin.com>
 <63f8aa7d-fcd4-450f-b3a1-44886a29fc7e@kernel.org>
 <cd2f3c97-53bb-42f5-a3cd-4385bfda5dc7@kernel.org>
In-Reply-To: <cd2f3c97-53bb-42f5-a3cd-4385bfda5dc7@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_093137_988901_172CB050 
X-CRM114-Status: GOOD (  16.82  )
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

On Mon Mar 10, 2025 at 5:22 PM CET, Krzysztof Kozlowski wrote:
> On 10/03/2025 17:22, Krzysztof Kozlowski wrote:
>> On 10/03/2025 16:56, Antonin Godard wrote:
>>> Add support for the Variscite i.MX6UL VAR-SOM-MX6UL and the Variscite
>>> Concerto carrier board.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>> <form letter>
>> This is a friendly reminder during the review process.
>>=20
>> It looks like you received a tag and forgot to add it.
>>=20
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
>> of patchset, under or above your Signed-off-by tag, unless patch changed
>> significantly (e.g. new properties added to the DT bindings). Tag is
>> "received", when provided in a message replied to you on the mailing
>> list. Tools like b4 can help here. However, there's no need to repost
>> patches *only* to add the tags. The upstream maintainer will do that for
>> tags received on the version they apply.
>>=20
>> Please read:
>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/=
submitting-patches.rst#L577
>>=20
>> If a tag was not added on purpose, please state why and what changed.
>
> And now I noticed you used b4, so I really do not get how the tags can
> be missing here. :/

Sorry, that's totally my fault here, I forgot to run 'b4 trailers -u' befor=
e
sending... :/ And I don't think it's part of the prep checks?

I will send a new version with the proper trailers.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

