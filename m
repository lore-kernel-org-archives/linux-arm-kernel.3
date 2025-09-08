Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA28CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzIuQPf8yRRh32wjvtWMh26ibdLGHtiKlRRwUvAoFVc=; b=wFgn6KRbBfGSjUbWFdUktS1td0
	wcLLymkrf+Hu9wVjW11gs4KsoEnTESmdkFb3OKcoqB9ikbiK32HKhNC75umwW5Usk0mowkZiH+3TG
	LtMLt+E/HjX2qqFQaH96ij2p5fI3wHeG8TJGxDKhBW9YZtfRghYRJnpuuL8GXKF8ZxaQbblVbrINg
	CL4VPyu3cNFOTdwVUmUnflYk4/Dkt4lGOxLdxX9eEKM8m59rBK/alzIZmp4D121vA/p3bLuXRv+D2
	akUsbSHIMZOh+VrVdtSxbS151B6ziaOUu4yMDtZkEp0/9dqWdwgyZfgyXAHXykCuwTORiRaO9yIK5
	oni6FmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXjP-0000000Fs5Q-2UqY;
	Mon, 08 Sep 2025 09:00:11 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWrA-0000000FZ1o-1lM4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:04:10 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C0F33A0816;
	Mon,  8 Sep 2025 10:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=vzIuQPf8yRRh32wjvtWM
	h26ibdLGHtiKlRRwUvAoFVc=; b=TqFocPWlS658xcLrcQJpe7WV2ehoQ9oQtujh
	OCoMl2FGVlYkymW9It5Qh1K4vJlXOIw3XLFuH2QcZNhUI0Dh/Md/RiKZEtMEJW1C
	EoVqVkZBP+jCellOs65tUJtS57AkdURAizQSbZ8vHxnvYCEcw8x6C8mDOJ3g24E1
	+GBENT/uV2Akmu1N5ey/FVaBKaIp/z4yjUz1hc1CNDaWTnAINq3nVr835bOatwt7
	HmqQXbSh6hlAncgwnRY3cPGJMZ8k5rX965LlIrB2s70Iv6MUEeNQkZDlk81kR+iK
	gT9i/OsjHW3frrPDi8ehwq3cbHBsJJIS16IpbBJBNImR7odNSwxgaS48d8qVNG4O
	vT9D/SKL3ypputiUpjuQsc1mHyDZ48HnK0cPgFuH4ea24PFaMeFp+TtKBtLpOwS3
	2aS1oCJ1j1CR0bX0pAQDnBfzuNE21LxoAyjlc4Fe/UQ41KA/y995xkMvA5oZaC9C
	Vj3EonVM13eqWLAZcoRwTOigLQwdJbYMSmoneZ2c1AB31rd5B8k3KugRCHGDa9jg
	TG8pmbmAH6Q3QT08MZbmVgFK2KwayLRfrizy8bYKWNsgIswWZN1pAWMYrN0i6QPM
	0B+GJstOyg07SagmOlxwB4n3CnuCWQsBATIuHp2KtMCuzgvreLUw00bo1QNXpGWW
	jTh7V+A=
Message-ID: <0b94d62d-6cbb-411b-8bb6-6f23023c5001@prolan.hu>
Date: Mon, 8 Sep 2025 10:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: imx6-savageboard: Replace license text
 comment with SPDX identifier
To: Milo Kim <woogyom.kim@gmail.com>, Milo Kim <milo.kim.w@mediatek.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
References: <20250709-savage-dts-lic-v2-1-07e0f827bd18@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250709-savage-dts-lic-v2-1-07e0f827bd18@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010408_924538_D7C17418 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi,

On 2025. 07. 09. 9:30, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Milo Kim <woogyom.kim@gmail.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Milo, what do you think?

Bence


