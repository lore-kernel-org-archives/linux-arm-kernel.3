Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4A5C44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 00:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgACCFKq2MK0Ux+A6DgXlsBhoMpXNtQXtj6PSE1bTeo=; b=LjQ2pJntBFZSme5IwOo2trZmoZ
	+HumMN/eJpYvzLn1T2rLIs3lVGfxkmKZQS3HeXU29L5orNxFvEf36ba4sKYVWX3tVkfEROoBajwk/
	b0BcLAyP+M2N8oKd8A9lwH1raA7H0mI/O+w/glwCwyEm9PM2K5ln2NeY3NjX2d1IVjp3q0O+2sxBA
	oBywovNABKDt+fQsI9kAeWrEVy8hLEQKDKAtbsAEV7PrEpHIatS1IW25Q90mQfi8pNSIi63S+e+90
	ctrhztwwWKbdJIaQMzWH/Z+cQNV2ij0t0znosENZFujwZXGNgIbB4v2/3Z0UUWYzzYvZG7yMdVcne
	y6PkzsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhjb-0000000D0wU-3CAW;
	Thu, 23 Jul 2026 00:56:23 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhjZ-0000000D0w7-1y7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 00:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784768171;
	bh=mgACCFKq2MK0Ux+A6DgXlsBhoMpXNtQXtj6PSE1bTeo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KB86zf9d2WLK0LIcEJVmon6M9h3+R9wt5qyRbJsDN3s3UOE3j0omLV8x7wUMCcSzE
	 /A9iNxgcqW8ddJf5sz6NrpO3ZXaNlEkh6rYy/wBegtezNxfcKRa5ldg/SqFC1sk2ws
	 hi15HF+D8qN1jKbKM1CudigiTnrLXkN+gCQ1++kuXeHJ4ZynOb36Ko4Bn9P0WaqQwY
	 yd9Rpw5gTYbafvXpQRpTj9a3ygpt6jVhGbp94DZEQqceT2GWFcYAtKGLkwviKpOWHx
	 yQq2fRqmmdlcG/agN4xWkF1+p4L1LRWsD6CtlRCtVhe/iHHl0QH5ysCVAJ26nPAQeE
	 fu3Jmi5RO73sQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8EA60662E1;
	Thu, 23 Jul 2026 08:56:10 +0800 (AWST)
Message-ID: <71d33890fe1940b7e4f8f275233d4fe9d8791da7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT"	 <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 23 Jul 2026 10:26:09 +0930
In-Reply-To: <c85229c4-2c9c-4231-b294-e8012c3fead6@163.com>
References: <20260627052708.172918-1-haiyuewa@163.com>
	 <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
	 <c85229c4-2c9c-4231-b294-e8012c3fead6@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_175621_811405_5D5EBB61 
X-CRM114-Status: GOOD (  10.75  )
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

On Wed, 2026-07-22 at 21:07 +0800, Haiyue Wang wrote:
>=20
>=20
> On 7/22/2026 8:55 PM, Andrew Jeffery wrote:
> > On Sat, 2026-06-27 at 13:27 +0800, Haiyue Wang wrote:
> > > As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatibl=
e
> > > string") does, change the AST2600 DTS file to use kcs ast2600 compati=
ble
> > > string.
> >=20
> > Is there some other motivation? It's been a while, why now?
> >=20
>=20
> Just happened to see 'ast2500' when adding other nodes in DTS. Nothing=
=20
> special.
>=20

Okay. I prefer to leave it as is until we have a functional concern
that motivates changing it.

Andrew

