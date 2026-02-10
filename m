Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11483EA3F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ledWZbn+TzX2T22Aa+xwzh+iAFsRkUxzf+EyA9TX7s=; b=UTdXUsR6o0Xy3DTpYwfsl8CDmz
	CeT3rAt5KhoAnnwaQi1dJr5i267WsrgT07noSxSxl5K0mnS6OcAaR3uB/efILiMSOsa4nRIrdJ3wZ
	7CfsWQxJlDTh0N6UGZntM5ZWU0yzjL/yQNXWoBpmqzAnyz/15ipSxHKRMRGXhNUDy9uxu8ULA7dM4
	LiSCIt7Hlr5v1kivD2qNWH8wqqeR6w5ZIaCdL9b7MJyf5j5FNvJTnxzzVdt+E7jhFkKj77jhPTMeI
	7sea9qT62iNvMkIyhq7k46wIXSI8wAjqUGZR/8pdifTowv928ZnuBDfcswvzgmokLnDNEyS7oX4R2
	wNrQLwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpi8b-0000000GcyP-1Y0X;
	Tue, 10 Feb 2026 07:26:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpi8Z-0000000Gcxu-06Dw;
	Tue, 10 Feb 2026 07:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770708361;
	bh=8ledWZbn+TzX2T22Aa+xwzh+iAFsRkUxzf+EyA9TX7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E+HqPabozX7gbg0tjWTuECfyirjpr0nWgXujSn25Ar2B8oaYpH00TUh9B6IaioJHK
	 eqU8tsIKfX2npYQkA6VV+LUbeg3jeX5Y2Lp6C3QlDl3gMmxV7cvzCR0up3C42CRskV
	 gL5Re3fuUEVoMqQhoTsTCvPf9mBuv6DQeL5ijfZL3TgWi4JED1isiv96UgEinTPqia
	 0vuJioL5O2vOOTjQaUd9Ej0WeZECD8LcpZ0dYoPhUwD2bORMRPCMxY/u+ouZGTzSAT
	 KCNvYAYKiXaEZf2ASacIaApc7p3K7HOa68CmC+7YlH+XFkdyIJOB7BgjpzaLc8T6Qo
	 6kclYs2fn75UA==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 179126024E;
	Tue, 10 Feb 2026 15:25:59 +0800 (AWST)
Message-ID: <feedc58438adad98f4b2a74a1499b2afa92a5eae.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/4] Add AST2700 INTC0/INTC1 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"	
 <linux-aspeed@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"	
 <linux-riscv@lists.infradead.org>, Jeremy Kerr <jk@codeconstruct.com.au>
Date: Tue, 10 Feb 2026 17:55:58 +1030
In-Reply-To: <6de719dc84324166ed60bb8ec130cf2c9ef351f5.camel@codeconstruct.com.au>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
		 <20260205-intrepid-vengeful-deer-14e2eb@quoll>
		 <TY2PPF5CB9A1BE69B07F90DFB245FAB735DF299A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
		 <d5e45c9f-f3c7-4289-8991-02bd2c5b9587@kernel.org>
	 <6de719dc84324166ed60bb8ec130cf2c9ef351f5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_232619_263299_6E594480 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Krzysztof,

On Fri, 2026-02-06 at 17:49 +1030, Andrew Jeffery wrote:
> Is it acceptable if we take the following actions:
>=20
> =C2=A0=C2=A0 1. Do some b4 magic to transplant this series back onto [1]
> =C2=A0=C2=A0 2. Send a follow up revision with a link to this discussion =
in the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cover letter

Following up my own post, I don't think we should attempt such
grafting. [1] references v4. v4 was superseded by v6 at [2], which was
merged.

Because of that merge, separating this proposal into a new series seems
warranted, but has the downside of making it difficult to compare to v4
of that earlier series.

I have gone through each of your feedback items from the earlier series
to consider recurring issues. Defining a new binding is unfortunate but
its addition side-steps an ABI break - perhaps rather than remove the
existing binding we can deprecate it, and keep the associated driver
(assuming this isn't overkill, given there are no in-tree users).
Otherwise it looks to me like the proposal has concerns covered, but
let me know if not.

Andrew

[1]: https://lore.kernel.org/all/1a2ca78746e00c2ec4bfc2953a897c48376ed36f.c=
amel@codeconstruct.com.au/
[2]: https://lore.kernel.org/all/20251030060155.2342604-1-ryan_chen@aspeedt=
ech.com/

