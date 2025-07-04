Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB652C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uy8XZzJ02bR6/cLFIl85KAvGOLEgWg6DWUi/tNsEDR0=; b=X0QJtt+7v3jDlpGDuGDAz6w26T
	GlX/OT7rxykwHi+ssbymWSrmlTYF+z05Vxg65fWW8bAAv2djD09IzT4W10YCGdPvmSL+gj/3z6iAt
	ZkSlO6t2ITFREFcxDaUSYcNiJ0GYO88NWdXdnnIznDkZmT06wm8eWGTilpka02WwS5XJYJtMdOCsg
	xQeq6AS507FHJvzBHFzCILuthIuVE1Yb4j/6ApW6tZQUHThLXaLJ2VRshP+ILks92YJKyXYxS4NyK
	iRqopv2R5hhO2FMcoQ6chFnTYQn1qakzQdUvej2QX/7mp6EsxqLhKhRkA+xlB3ifwytsUJcoliip+
	9iCmRl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXU5D-0000000Curc-49ou;
	Fri, 04 Jul 2025 00:15:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTys-0000000CuTq-1HED
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 00:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751587720;
	bh=Uy8XZzJ02bR6/cLFIl85KAvGOLEgWg6DWUi/tNsEDR0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VbNWFjfnAw6JAM00tL8QlNCUSMyQC4wsOMYG87a0BS/RcqCNry9MKPqrdlXpqZ+w5
	 ryflkTuHIbD8GKeViQ9QLUcwRDEv4o+t3/79+1g6DY0bwzskpW2lgQ4kcPAjeaWOKl
	 CKrFj9Wemd4fasKclY4tOG6JsAy1L1l9PeplYcbTgLN5rc4JcK5VcEs+ol6GEoCZtE
	 G6x16Lk5bo9qmGgklOo4J268zklnj9D9g0z3lgnT30lk2cRW/IPsJXSV0uUmVaNK3S
	 eiqE/yJKPWKOU345NOar29/amv8Z2CKCpu8hPtUwrPVDV9CHehDbsgiyWFF6/iCW6F
	 PrUOLpB+kVgoA==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1B7496A680;
	Fri,  4 Jul 2025 08:08:40 +0800 (AWST)
Message-ID: <94e0c5bfe1239e7590cef427cbba405077d56d01.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/5] ARM: dts: aspeed: Remove eMMC from
 ast2600-facebook-netbmc-common.dtsi
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Tao Ren <taoren@meta.com>
Date: Fri, 04 Jul 2025 09:38:39 +0930
In-Reply-To: <20250702050421.13729-3-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
	 <20250702050421.13729-3-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_170842_532297_71FCD598 
X-CRM114-Status: UNSURE (   5.36  )
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

On Tue, 2025-07-01 at 22:04 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Remove eMMC device entries from ast2600-facebook-netbmc-common.dtsi
> because eMMC will be removed from future Meta/Facebook AST2600 network
> OpenBMC platforms.

Please squash this patch with the subsequent two patches so you don't
break Fuji and Elbert across a bisect.

Andrew

