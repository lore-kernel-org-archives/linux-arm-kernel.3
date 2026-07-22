Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73007C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEo3cAwztk9OWvKbynD/A3a+NoqgXRz66n8QzFJBxdU=; b=Qe22IiiaNcDmZnukceqCkCVhWW
	4p4GMgVBu9dtyvYMRFn7L5YqprM5aFd++Rb3veheZobkC5et4RNHlkBv/jhb3BAdVdABiMnU/ML6B
	PPA7FjcxCG1rlAMnbS7He0dnTjGVgPLOHjk0jqCZj9azM5Q5CmdhU9Ycvtfifj0gAPSgiHnbRY4kC
	+Fp/c2rUMb8wXmxwBEf/jIiwlTQVdjmWq4kCXgBLW57t0fU8GA7R28ON2HzgSmDSdldKq+YVsuvLB
	NtmpJJzjecHnMzDo6SrMAIzoyK/e9Xos0Iv/t6ZOdSDouv/TYgKlI+00z1b+6IfzCFaF0mI1+ihTY
	y1gsxCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVji-0000000BhwX-2DsP;
	Wed, 22 Jul 2026 12:07:42 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVjf-0000000Bhvd-3Krf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784722057;
	bh=qEo3cAwztk9OWvKbynD/A3a+NoqgXRz66n8QzFJBxdU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D/OhMC7s+fcNqNNul2lHX/zlar+PF4e+66S0kXD/J7seotqOU2O0XHqCZUtC99A1f
	 3geW6mwhMP3OTAYMc/oBKgZAxFYejK1q9bv3LQx8V7PMqu0XXG5DOBKxqEPCk30sDE
	 Pj47ToMpmrDMwPtYI6FgYA9zESC4cKw8mUw/Ynpchw/ubEO6I2mREqTtQmMFUBt/O+
	 2WSHAbXhk6pIBoeXleasBzpgT0BhrI2xxsb/c5oHNEtvn0687Ii7Y/bfTYN3mOpnVC
	 8E7UPmM1qAJ71Wg99WwJ2DEDHCuEG8e943Ss3uKUSnOpHJtWQyJlhDNqWQZOcnJ51k
	 HfluMi642WSQw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4BDFD662E1;
	Wed, 22 Jul 2026 20:07:37 +0800 (AWST)
Message-ID: <a6170c549dd8fe3851854de44c2bd43dd0ec1f95.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt
 resistor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Mike Hsieh <mike.quanta.115@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, Mik Lin
	 <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>
Date: Wed, 22 Jul 2026 21:37:37 +0930
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-1-cccf959c9b78@gmail.com>
References: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
	 <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-1-cccf959c9b78@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_050740_025174_E3175AAD 
X-CRM114-Status: UNSURE (   7.82  )
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

On Thu, 2026-06-18 at 15:41 +0800, Mike Hsieh wrote:
> Correct the shunt-resistor-micro-ohms values for the four TI LM5066i
> hot-swap controllers on the PDB. This ensures accurate current and
> power sensor readings from the hardware monitors.
>=20
> Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++=
----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)

I've applied this one.

Thanks,

Andrew

