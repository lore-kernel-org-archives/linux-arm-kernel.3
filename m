Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A512AD40CE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 23:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xVg8S5A3dEOoVAga7+s67CM1EOce2OgL3F1GFpjD6c=; b=2iges7POYJ0+agECxXs75nIGdK
	J/I69z03+uQQ6a/Pg4m+dVoTEE9575v/55VbYh1o9aBeJOTF+XBTc9ZBtEeZZT/coJhxDpnhZYhw0
	0DGQRfTU+nqpsCw5RMp3CxyV2XCEov2BlSeYj4ffr5aMqxgkxTC8cOj9lgg5dKy3ijp9dugpA9y0Q
	Dv3pCHXJH8+tBVshCEAlsf4N5DaniyRl7BbK1Tel6QwU1H1Cs17u+Be/jbZEBXxjUGljq5pTJsMSI
	m7mxNbhoBAEEgDbRUO5nMKCMm5iZFsWQ09B6T/K/Ba4jEx0L5PiPzikfqqovTw7teGc196vY3wTWK
	1IZnNmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8StH-0000000160z-3PSV;
	Tue, 05 Nov 2024 23:23:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SrQ-000000015np-1ayd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 23:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730848873;
	bh=9xVg8S5A3dEOoVAga7+s67CM1EOce2OgL3F1GFpjD6c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i2BNR8diE+bStAGqu0zYAfibKHrcVQtX9N4pflhBAUSdqW9IEM2OcclPJ48QwPlVa
	 GJPIcEHQ2ASnJHrarkOPjgskPbban8Hn+uqI1IOaTF34Pfo5YCoVfWsf+M2n/6+Yxe
	 HUa69kNuNSNjMIUOTEmvYkCVcN5Q/9vBrNM23GmsBzlOUSO+nApi1KChXTFYz2UACw
	 gBWe1Ztlchpgua51i8VwZSFqf0nNaVWpteN1aCTfocGyuikG5JnjYkFT1p4m0xtrkb
	 nhmZHYnuBrC3msnJr5cCJa0Cba3PJcLzi6usLnTXHfmaZceCbF7l2wHkSgwbwqJjl1
	 fivt5GIneEFaA==
Received: from [192.168.68.112] (ppp118-210-162-114.adl-adc-lon-bras34.tpg.internode.on.net [118.210.162.114])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 52A0D6B407;
	Wed,  6 Nov 2024 07:21:11 +0800 (AWST)
Message-ID: <9e9bf461b2ef8993bb46206b3cdf40806a528856.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: sbp1: IBM sbp1 BMC board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Naresh Solanki
	 <naresh.solanki@9elements.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jdelvare@suse.com,  sylv@sylv.io, linux-hwmon@vger.kernel.org, Joel Stanley
 <joel@jms.id.au>,  Patrick Rudolph <patrick.rudolph@9elements.com>,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org
Date: Wed, 06 Nov 2024 09:51:10 +1030
In-Reply-To: <7d9657ff-1c4a-4167-982a-9f07e7b51f77@roeck-us.net>
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
	 <20241104092220.2268805-2-naresh.solanki@9elements.com>
	 <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
	 <CABqG17j8RhFpNV+nJ=nLY8+uO_XXjbN55+Ce8op=6Dj5Z=_WOA@mail.gmail.com>
	 <7d9657ff-1c4a-4167-982a-9f07e7b51f77@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_152120_661256_E7C76C0F 
X-CRM114-Status: GOOD (  12.92  )
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

On Tue, 2024-11-05 at 07:47 -0800, Guenter Roeck wrote:
> On 11/4/24 20:10, Naresh Solanki wrote:
> [ ... ]
>=20
> > > =C2=A0From a spot check, the warnings seem legitimate. Did you send
> > > the right
> > > patches?
> > Just checked again. They are resolved. But I guess the dtbinding
> > patch
> > for the above warning are merged in hwmon-next branch & not in
> > dt/next
> >=20
>=20
> Did I apply some patches which should have been applied elsewhere ?
>=20
> If so, please let me know, and I'll drop them.

No need to drop anything for now: It was just that bindings for some
hwmon devices defined in hwmon-next are used in Naresh's devicetree
here.

Merging hwmon-next and applying his patches resolves my concerns.

Unless anyone feels otherwise, I expect we can can carry on
independently with the understanding it will be resolved in the same
way at the next rc1 (barring any other concerns with Naresh's patches).

Andrew


