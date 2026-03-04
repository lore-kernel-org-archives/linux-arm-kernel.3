Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD87EDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih8XBInDkYJdrPvgQj+yzh+6t6OHwUs1ab86hkiTbV4=; b=3wyRHfcLMiNUV+6uMfDMAM2ne2
	0vUKs5SJ04yMAiDFa8OD8jfir5b/0CNXKrP+riTBRxU6t1szHw6osTH7t8LzR1CaVxH0OMIzgVrg0
	jrOijmaLfc9hNHKOciqdoajXVdCKE1n4cIL5VbQUdaoVnhQYG7Dz7TkeQP+Vae8151k0c7D+sJ4t2
	YWLrEwnoLu6UUeEivzFXhNUUAAGTq46BqO8tMhJDEKvNerec6KOv4hnsHrpFrROYe4lvJ5sYLLRHy
	8iRXcCZZ+idf9RK4hmJJIM+DT4FcooBlWh1OfTt2kM9AgtdAh6Uc5PhTGSPc7AF2yAthqc/MGocd9
	H5x///5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcAm-0000000GJZI-3rkt;
	Wed, 04 Mar 2026 02:41:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcAk-0000000GJYv-11aO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 02:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772592063;
	bh=Ih8XBInDkYJdrPvgQj+yzh+6t6OHwUs1ab86hkiTbV4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SalvJloerZOYvex+zkrwh5UMW3MGxyhruNDEFL83KHvFNP8bYTJoq3fe1rizA3YJB
	 tms5oPmwKDAxRx2zBqjtQXszG3mgr81wHMWJhjq8O7/cNElXxH0m0vs+mNewFj770X
	 sm+famqvqJ5TG6U1ZCqUwKE1i+rpFx0pdaWjbLyTVEldTLpGyJpJuJcvJ+U02RxTfc
	 f0g0KqrpGfelQXbhMUuJB/w6fuunQ9R5AH2OuqymTxL5mZQw6cqWcq5PyfixqUczAQ
	 JBFvPK2STremjsw79QuSjFU0/iz9oJeVLrTwaJEpnfzGlfI9aRtE7E/LkwsW5Xt9wJ
	 Bjb1FsQoPR9PA==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C80C6000D;
	Wed,  4 Mar 2026 10:41:00 +0800 (AWST)
Message-ID: <391b9b912492c07fd1fd7a737b7f49382d361fe2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/8] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>, Daniel Hsu <Daniel-Hsu@quantatw.com>
Date: Wed, 04 Mar 2026 13:10:59 +1030
In-Reply-To: <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
	 <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_184114_508270_996CE83B 
X-CRM114-Status: GOOD (  10.21  )
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

On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> Add new SGPIO line names for user space monitoring and event logging.
>=20
> Also rename PADDLE_BD_IOEXP_INT to ALERT_IRQ_PMBUS_PWR2_N to match
> hardware naming. The original PADDLE_BD_IOEXP_INT is unused, so this
> change does not affect current system functionality.

Why are these two problems being solved in the one patch?

https://docs.kernel.org/process/submitting-patches.html#split-changes

Essentially, your use of "Also" is a bit of a red flag here.

However, on the specifics, why was the PADDLE_BD_IOEXP_INT hardware
naming wrong to begin with? What changed?

Broadly, it feels a lot like you're revising platform designs, then
trying to make the one devicetree fit the current design, and are not
explicitly communicating that this is what you're doing.

If that _is_ what you're doing, then we can come up with much better
schemes to handle it that aren't a constant stream of compatibility
breaks.

I need you to engage with this concern.

From inspection, I only find patches 1, 4 and 7 of this series to be
something I'd consider applying without further discussion.

Andrew

