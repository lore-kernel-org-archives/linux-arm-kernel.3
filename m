Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F6C3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q095rtrbjfxFUIdQvOiPilxc/gRxMFUqo5sTcxVnw0=; b=A7JzVlgR/MblhQ1jf8WkzXdLMc
	47W6ctWMxdBUpmeyjEloNp5ntheKQ9dWQOUtbq60HBmdJYuuvEmov2ZGhAh1Xs4ljeVeqTmOO2ALo
	VCPT827+h/F9fHWFiPSQWpCwhGAIz3WGe0mbG+vgL6pFiorJ/JQbVnhkJVON/3uL65s1MSjxcgV2I
	HHay0ngIF8SwwijxG1fjPssYSWSt6XuyuJwpuAKyRUufDN9ugtnaQjdk80/9coC2aU0lqTLXkywFN
	3H4Z7A9Emn+/F2qDNqx+a5+ctf1blnSjw+VcJwOEV3bzIk5rm4WDXptpnzaCbA118frSF2f/1Z1DM
	u6ZAcT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCY2-0000000FHMu-3fB3;
	Wed, 14 May 2025 13:53:27 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9f2-0000000Epfr-3HcN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:48:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D75E41CFB;
	Wed, 14 May 2025 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747219700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q095rtrbjfxFUIdQvOiPilxc/gRxMFUqo5sTcxVnw0=;
	b=hAX3YBY6sFjQ2wGB0hxyNvgt0bxbkTIHJxMU6iRf+bkYe72eEzDTRk+bQM5nDCj68jT2l6
	rB/beGnglyZcuPybMuacijufeikfQ5msMfoTKdrkTw32ej83ClUpZzsHwmXZLvlFZikWQX
	KCdDoTYqG/lcl1K0mqh6sr7t2tsGN5JDUxYlS67sJ/TkH8pAI6fF94D+OeaPTrKqwkHcyh
	ydDgennDsoEX3fseqejmUxQmJMN8B0XQDP1WJnGOJXEdODzNmwSPCnwpr1ClxDMqKSPzBN
	JA66v5w+pquFKF4tiNQQ0RIyF7F4TEOxbSUL0uU93I7gBICpGoBQLG9SWnCVOw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Cooper
 <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mvebu tree
In-Reply-To: <20250512130613.02c970f4@canb.auug.org.au>
References: <20250512130613.02c970f4@canb.auug.org.au>
Date: Wed, 14 May 2025 12:48:15 +0200
Message-ID: <8734d7qxhs.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeijeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtugemvgegkeejmeduhehfmegrvdduugemudgvfeehmeegvdgtrgemudgtlegtmeeivdeltgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtugemvgegkeejmeduhehfmegrvdduugemudgvfeehmeegvdgtrgemudgtlegtmeeivdeltgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehjrghsohhnsehlrghkvggurggvmhhonhdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnr
 dgthhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_034829_433798_A635F4C8 
X-CRM114-Status: UNSURE (   9.88  )
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

Hello Arnd,

> Hi all,
>
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
>
>   a3a0b8b23108 ("ARM: dts: marvell: use correct ohci/ehci node names")

I can drop this commit from my tree. Is it OK for you ?

Gregory

>
> This is commit
>
>   49683c02d8e1 ("ARM: dts: marvell: use correct ohci/ehci node names")
>
> in the arm-soc tree.
>
> --=20
> Cheers,
> Stephen Rothwell

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

