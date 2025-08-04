Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC621C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 02:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0fmX2jpwV/gvmwq7SFAn/6INWSi5gMMueD8SBA981g=; b=TAc4m1hPn8/ZELcaC5+/VVjkmE
	ioQRxRn47nOVosxeqnNPoZOQmcawNY5nNpdaCZIfH8KtRyqCb5PO0+2WdAi7+5/VeegaSPZhL7vk+
	PQQxx0WvAN6ckQl6dC3OxdWecQfnw7vZS2ibNN09iY4bzobtFe83UUVTt1GN2TxgjROceu2Y5vC7x
	8t2eeZAli5U6iTfSkRb6oVJNp+ljvVkIzYIZm3caGNgdmVWR3meTv+iUo6yu6qp/9ItLJG6vAmRG/
	AkMCR1EV5ysROcoyBKuzGRwYYbU+MDTar2BQVRJFxLdhgyNlu47DZxHlFqHtr4+xviqj4TXByb5IW
	MIR9umWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uikYQ-00000009Tdb-2QmS;
	Mon, 04 Aug 2025 02:03:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uik9w-00000009RZn-3rUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 01:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754271513;
	bh=K0fmX2jpwV/gvmwq7SFAn/6INWSi5gMMueD8SBA981g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IoCV9S6HbSiiB7Te0cgkRtVTIjvsS7DCtdWqbWirzzDtD9Iic3sT/pwyTHnauvshR
	 Bijw02uFdbBL9sDjji/iyVbfexp5n1r9EzLdfYwN3ofVi5zeXNknYPBXPxUKoYsMcQ
	 rehrpPgqkK3P63R0kOGrYecXI93nHTA0y0RY0MP/4eUeG98CPuaB+KsJeOm6oOaYgg
	 lE3Lg0bTnSLPnRFmmE+GCzf4y24t0nX9/FkOd9rQQIYkkBmFrgbuHXcTiENtxamUUZ
	 NJgv3eqNxqKR6SkTgh0VBdSFtMD/TCJlUSeLqk4tuHwl2QpDU5sPdOqcHq+x2mEbeG
	 gpi5U6yV2zbxQ==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CD4BD67B49;
	Mon,  4 Aug 2025 09:38:31 +0800 (AWST)
Message-ID: <1afcfa0244bb2ad184fac49145fe6856b257c5af.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/6] ASpeed FSI DT clean-ups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Eddie
	James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org
Date: Mon, 04 Aug 2025 11:08:30 +0930
In-Reply-To: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_183841_310355_51B48BA0 
X-CRM114-Status: GOOD (  12.43  )
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

Hi Rob,

On Thu, 2025-07-31 at 17:12 -0500, Rob Herring (Arm) wrote:
> There's a whole bunch of FSI related DT warnings on ASpeed platforms.
> This series fixes most of them except some related to SBEFIFO.
>=20
> The remaining SBEFIFO warnings are from some deprecated properties noted=
=20
> with 'remove when userspace is fixed'. Not sure if they can be removed=
=20
> now or soon. If not, perhaps the deprecated properties need to be=20
> properly documented.
>=20
> All the patches here are independent, so DTS changes can go via ASpeed=
=20
> tree and FSI bindings via FSI tree (or ack if you want me to take the
> bindings instead).
>=20
> Rob
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Drop "no-gpio-delays"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Drop "fsi-master" compat=
ibles
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Add missing "ibm,spi-fsi=
" compatibles

Thanks for this. I've applied patches 1-3 to the BMC tree. I'll leave
the binding changes for you to take as indicated by Eddie in his
response on patch 1.

Andrew

