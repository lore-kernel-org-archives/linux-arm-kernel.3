Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FF5D1489D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPSe2rlEHvzyi69dJB3VX99Hot44xCw/39GofG4V748=; b=UnSCK0QYWoBKoEkRVQa3Z4fp2L
	olf2qOX2EuAGdcnhKsBzxPCafA4A1lu0iGX6JBu7zMjPavWL4Xjor2coZJX3rD37ngR43R3MBuufk
	OWh3ONi0sxhTrMBtCTgnN7mzGnSzg9FPLtH+XdkwUO686/L34OToITCQZ3tlWyi1VHH5AqzkAn9sF
	P+BOnavSFnnP6dgmK7eRb2VGbzHpUyTSOGxJekJdoApIK3yq3UAMecBM8fAii9OwjNGDEX0Hhokbu
	FyPy+TKnCTX3/B7bfvPygXQrQfxav30p4dgOiDc5d2toAGKVV53rwXMZlIsPqBJqPudeGq909ohxu
	woGvAHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiTu-0000000FwXJ-2yAU;
	Thu, 08 Jan 2026 05:22:46 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdiTs-0000000FwWl-0fP8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 05:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767849762;
	bh=hPSe2rlEHvzyi69dJB3VX99Hot44xCw/39GofG4V748=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=R/HdhE2Q8L7sSX56r7227YzjCDQjxo4Dhg/bw3c0g4GesSdeGUC22BahmZFuMYpUY
	 +Y8MsANXUSCOj6mQAqangpaW7M1VonBWINZlo9DM0LfpObeA7jI5YSmXMhz1XD+JJX
	 XGL+hobqTpSuS7Y1zuWmaPZEy12TwR/Cj6KqE5spQqnQiM7jQu0XibvW+i4CCloVi/
	 OWxFR13Y8w9g8AZYLsMZMlVLFMKNGLDyCujZxmVi+xC9H5tnobUyKxWYlYc9iX0Dqa
	 ZScipnCTHJz/Uda+MUvBsxnlJyYwDMUUcaAfiHqAjG3eCTq6MILuGNUNPuJDOHn/Re
	 m1mUqlz/0V8Iw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5BF7C79F8C;
	Thu,  8 Jan 2026 13:22:41 +0800 (AWST)
Message-ID: <4441e66d607fe442e392b8a82c134adced03a5dc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 5/5] ARM: dts: aspeed: yosemite5: Correct power
 monitor shunt resistor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Date: Thu, 08 Jan 2026 15:52:40 +1030
In-Reply-To: <20251219-yv5_revise_dts-v3-5-ca1d5a382013@gmail.com>
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
	 <20251219-yv5_revise_dts-v3-5-ca1d5a382013@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_212244_383313_2A6EBCEB 
X-CRM114-Status: UNSURE (   7.20  )
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

Hi Kevin,

On Fri, 2025-12-19 at 16:09 +0800, Kevin Tung wrote:
> Correct the shunt resistor value in the DTS with the hardware setting
> to ensure accurate power and current measurements.

Why were the existing values wrong? Why are the new values correct? Can
you please add more information here explaining both concerns?

Andrew

