Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009A3C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewtaf/n/usdJ+GRJDxLAOz4V63fe/JKprJj8bOO8Fow=; b=QtBHaG4HrB57XEKCjgQde5NU04
	qCMXB6wG5aDJYm3fPwuqCwbCsNc4gML67YmMWPpuIcZ8pGdz0Gk+tg9gH0ViMMp9XkrFDfdd+klNt
	5tNkOaSRCTA3HZLlr6YfacfXxObERKy0pOTqp72ufD6myvYMZ9AvE7VB4R/6Mvqm6j6RB1wAO59c2
	tKRCc+x2z4GCDnRjXT10kHw/qk3JgvoyPKhBCnmvBwBLw2nG/qPVcu09S3rUqeDJZ812ih+YcwNRH
	smGtU+w7tRvVv40D1hBoBxjOvfEe7osNP5PQ1Ut/exaZFUfkchINZoNJVsGwejwFeOfBYXkcxoh+A
	b522DJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRAF-0000000B2TL-4Aui;
	Wed, 22 Jul 2026 07:14:48 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRAD-0000000B2SU-1pz2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784704483;
	bh=ewtaf/n/usdJ+GRJDxLAOz4V63fe/JKprJj8bOO8Fow=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RvkCfaYViCH3L6gzmFbVpfXLjgDELs2eDRVHsSpSfXKUF47+Zv+8CFOuZrRoy0bC2
	 ojr/OGWJvRfMwzsFy/d14vWmJLDclEtnhMvRH0y+9QlZzhNsicmHBNCbXlb6avBhgo
	 ufrdcraDoB3zolpnXWIrLalF9ddivcoEUnTXshF8gNA/ibMA83z4oJsQsK/y6/JgoL
	 0fiEhg6FWWyVaiM9AT9ezNmTzsPpLuLAMqBfCBjoqz+mljfbkuVnZcFR4P5gIR4LVd
	 PG3IxwqRcqgrrKeXMtDos1+cKpfy/PCUie8ZXDdVfrKcpT1eyS5trl/iXQnvlH5Aal
	 KkN1a8eIrYZnQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ABE2E65B37;
	Wed, 22 Jul 2026 15:14:42 +0800 (AWST)
Message-ID: <27318e19dee124898b95a10f9cad28f456835da4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: bletchley: Add second source
 devices
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Date: Wed, 22 Jul 2026 16:44:41 +0930
In-Reply-To: <20260714120816.1504058-1-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_001445_669676_DDDEAD3B 
X-CRM114-Status: UNSURE (   8.42  )
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

Hi Cosmo,

On Tue, 2026-07-14 at 20:08 +0800, Cosmo Chou wrote:
> Add second source RTC (ISL1208) and LED controllers (PCA9532) for the
> Bletchley platform.
>=20
> Cosmo Chou (2):
> =C2=A0 ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
> =C2=A0 ARM: dts: aspeed: bletchley: Add second source PCA9532 LED control=
lers
>=20
> =C2=A0.../aspeed/aspeed-bmc-facebook-bletchley.dts=C2=A0 | 294 ++++++++++=
++++++++
> =C2=A01 file changed, 294 insertions(+)

A quick inspection of both patches suggests the nodes aren't ordered by
ascending address. Can you please style-check your work?

We now have scripts/dtc/dt-check-style. I would appreciate further
patches for bletchley cleaning up the rest of the issues it identifies
in strict mode.

Andrew

