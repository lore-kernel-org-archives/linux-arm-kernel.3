Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684B5C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbzqCiZt3Yer2/JpapDCEvzPUQewz2zyXItEveGU7ZA=; b=l5GoahoD51vOMNl/YxuZ/SMDtg
	DnAYLVdhIF967Is/aqffNBI+28dVcKbgxeRK8IP598BqnX8g+3faFC4hmaoKGnF9VXv142LTZoqT3
	83RPQrGxG3wpRjPuwn5UCafSityWxPoIM8IsrTUf1XjkDShc2YHF8OToeJ06dAT7e4mkyjsJs83l4
	qJQBvcRfmOHNiwr3TEKQDW3YS/e0UUZXv18zuDXqxteoK0ZMYK34DLgxVWTk05Wk69yNnfVefIjbK
	3cL5+3uXfjFId2EcbC5B8HdcS00YRW5NLl4AcDx+BIok72y1dtZb5EonrOJ7vKwpDo0+epzOTz1gb
	rEWdfarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpwg-00000007p4W-1OKd;
	Mon, 19 May 2025 02:09:38 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpud-00000007oxX-3WWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 02:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747620442;
	bh=QbzqCiZt3Yer2/JpapDCEvzPUQewz2zyXItEveGU7ZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JV2XVY1kKzq/n8Pp1dogVB2cLiExutn9gW+bHLc5lswCsqYkXIlnxvVTh98T2ng5o
	 ptMDwLGXWaSJ9w+eDlVdfiE6GY3oXTgYxzVzePpJVpVDe4BuSdCl1rTW3uvff53n3P
	 WqqdMZ5Xoe6dwA8T9CNFzf+pbzeeyyGIjdSDgr4lnVSe+cfC6YNfHRuOvwa9qMBkJ7
	 yBwDFt3JyMETjxFWRGi7fl0UBKCkT5lJMwevkrDPX9WfJxPIGsiXPuPpiKm397AYBO
	 sIm3014VSdNJJaqE7u7T5vXploRmdOEQynqvXkwJ80BtjSNDYJhLCcmSNZm6Oqedo4
	 M7MdBgwEBv9dA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 10052640A1;
	Mon, 19 May 2025 10:07:19 +0800 (AWST)
Message-ID: <59519ffdc57a9c34dcbf0348d1f09058dc12fd97.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] arm: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 19 May 2025 11:37:19 +0930
In-Reply-To: <20250508055612.2613605-1-delphine_cc_chiu@wiwynn.com>
References: <20250508055612.2613605-1-delphine_cc_chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_190732_402037_13739392 
X-CRM114-Status: UNSURE (   7.42  )
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

On Thu, 2025-05-08 at 13:56 +0800, Delphine CC Chiu wrote:
> From: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>
>=20
> Add gpio line name to support multiplexed console
>=20
> Signed-off-by: Marshall Zhan <marshall.zhan.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
> ---
> =C2=A0.../aspeed/aspeed-bmc-facebook-yosemite4.dts=C2=A0 | 41 +++++++++++=
++++++++
> =C2=A01 file changed, 41 insertions(+)

Please run your change through checkpatch, fix all the issues reported,
and send the result as v2.

Andrew

