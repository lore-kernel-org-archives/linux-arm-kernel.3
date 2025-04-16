Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F9CC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp9rOD25RXguEAHoeSU9OVeZEEl5lBTpFq9oWJbz6T4=; b=0agQe+PsIztnzEum7vTar/xHrg
	vYsYjub9Fc9tBqBOys7wfhmzMA2WoXiNIhPKBeB4aMeICnB+BNrKrBaOxdr7Peag4D5LZlE2ESd2+
	iSHjgTcZSMnN1QfTkuIKL91n4Es2810R3Hy7KT96UwY4+W7CW3OpZ2su9XdHOqOSHBcEfxpooutcp
	GMmNww4v0RLDTRyCi16n7nkzsuebV2rjzK1yzIKOm2UZAW6YdnTEJYnW7Pj4U23aTMUOZ0Bj16eHT
	PiEEAylM+hYUBdcihG3TZDJ09ADJFETogaqM7S5rRbW7IrhLAPG1CgNYIY2w9fcfBuzlwmjQoARqH
	jVARcOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u553F-0000000A927-2pOU;
	Wed, 16 Apr 2025 15:51:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53uj-00000009vIb-3ue3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:38:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8FA143992;
	Wed, 16 Apr 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744814334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wp9rOD25RXguEAHoeSU9OVeZEEl5lBTpFq9oWJbz6T4=;
	b=bWZurPw4ObLFXQWshYgyR4EdyznxKElKhO4BdMzLhSebx/HZKsy1KEr5Fe7OQuHFuJv7c2
	SHQOUN7mxmaQ9Ai6V0JKsjZbfTVkeMHuzT78A0+LF/zGa5F1KtESX28NYgFST7wzzRf1My
	Rt1+0jlKrNCGPZLEEbU5M0VpKIsQeg1gkk0t9wBWIaU8RAjtrGgUIFHpcgmgyePFZN+sJK
	7ydJazwJbCsFq6LeKo3teCUB1UiTWic9zwEbkgSBKT2Gl/uUstVps0JQUE3Omt+xz6BMJp
	t2f2cyFpcxQwTSFcwBRvPK2IexYS/Q5WdQ9I5JZ1lyuKmT5zOdRLFdsdk/WhkA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jason Cooper
 <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
In-Reply-To: <20250416132151.3b0448d0@canb.auug.org.au>
References: <20250416132151.3b0448d0@canb.auug.org.au>
Date: Wed, 16 Apr 2025 16:38:52 +0200
Message-ID: <87a58ggohv.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemfegutgemvggvkedtmeejfehfsgemieelkeejmegsieehvdemieguvgeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeefuggtmegvvgektdemjeeffhgsmeeileekjeemsgeihedvmeeiuggvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgto
 hhmpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjrghsohhnsehlrghkvggurggvmhhonhdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_073858_100886_5B1C38BF 
X-CRM114-Status: GOOD (  10.56  )
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

Hi Stephen,

> Hi all,
>
> The following commit is also in the mvebu tree as a different commit
> (but the same patch):
>
>   73989a38268d ("ARM: orion/gpio:: Convert generic irqchip locking to gua=
rd()")
>
> This is commit
>
>   5b49e7ff76b7 ("ARM: orion/gpio:: Convert generic irqchip locking to gua=
rd()")
>
> in the mvebu tree.


Thank you for the notice. I will remove the commit from my branch now. I
didn't realize it had already been merged.

Thanks,

Gregpry

>
> --=20
> Cheers,
> Stephen Rothwell

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

