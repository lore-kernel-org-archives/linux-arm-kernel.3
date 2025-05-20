Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A18C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVbDrHX4p3eETAYYbC8E/B38AzMWjZPxZbviRuREGuw=; b=n/tx765cZ4w8G0AqJ8K9WgnBOH
	6A7E3uQASjNqhOCjASi3B5xt7pkzIrjX6C9PIl2TtguNuvs2tehDh8ipaDqfMLA/G5jc9IovHGIoI
	3dlEN304Ja4Y5F+XamwDV2TcZBvIN6KRk299EF7gZFv6TI7+QTe7mV+TEZXyna4pdYK9d0hJIuZaT
	b8+F2PEHIHKyn27uWZVVl0d6Gu9LTPnmVuokTKkWBO0U7sz09ARvEZiA1Te4T4W9UD5pwMZsij6Tw
	OWrimkjmIvuJlVQ2brkPLGjpXD2miP/puxa/3cdFmoOOGyOfXJfs7S5AxS9ZVL/q7T/E8bIVbe/Gc
	RzjAvPVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHAo4-0000000B76F-0xGB;
	Tue, 20 May 2025 00:26:08 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHAlt-0000000B6ds-280R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 00:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747700627;
	bh=jVbDrHX4p3eETAYYbC8E/B38AzMWjZPxZbviRuREGuw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HA7AscUCU63hu4pNCk7Z8VKwggRSY1X/g/VPH5PfBXPSY/ysZ6+TnYOGje7OE88wH
	 jIy20LQ6Gb6hzjna2EODuadUcLPwDYdpKPOM9EDz+dXCvoN2sy98vGNnxSlnbXHQjp
	 w+FSvaUEbpeVomXLiupz0jt4lRtSL9sgFtL2pdiJQzJ7j5VwBjW1BaR9b/5dy4lp8K
	 BjH+DM8fBKGKw5qPdTjHNuYZavHiiGBfmvjRL9GOJ5PO4aKQFNrdr/SHVoXHg+F8yR
	 rQNZuvPlpre4LzYKQWnIR320KkLwsmwodYltopC+jqqHA0jGMVpuY1OfXTLD/9xGQ/
	 PEFyd/Wuo0gEA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1291A640A1;
	Tue, 20 May 2025 08:23:45 +0800 (AWST)
Message-ID: <ac008c13719e2c91d7d377cd7a6151393934d854.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] arm: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>, Delphine CC Chiu
	 <delphine_cc_chiu@wiwynn.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Tue, 20 May 2025 09:53:44 +0930
In-Reply-To: <7a5f60e9-376c-440e-a369-5c8d5e10c72a@kernel.org>
References: <20250519024850.2894895-1-delphine_cc_chiu@wiwynn.com>
	 <7a5f60e9-376c-440e-a369-5c8d5e10c72a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_172353_755510_B418A98E 
X-CRM114-Status: UNSURE (   8.34  )
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

Hi Marshall,

On Mon, 2025-05-19 at 08:10 +0200, Krzysztof Kozlowski wrote:
> On 19/05/2025 04:48, Delphine CC Chiu wrote:
> > WIWYNN PROPRIETARY
> > This email (and any attachments) contains proprietary or confidential i=
nformation and is for the sole use of its intended recipient. Any unauthori=
zed review, use, copying or distribution of this email or the content of th=
is email is strictly prohibited. If you are not the intended recipient, ple=
ase notify the sender and delete this email immediately.
>=20
>=20
> We cannot test proprietary patches. Start working with the community in
> the open.

The kernel.org mailing list docs elaborate a little on Krzysztof's
point:

https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-d=
isclaimers

(It's worth reading the rest of the page too).

Cheers,

Andrew

