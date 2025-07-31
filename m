Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2390EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 02:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+TfOEWR0Nli29bN6WrEzJLsG9aHc0r+gNTRjB2A+GM=; b=KeM2IKQykwvtQH/PUq0RA9Q06R
	6icslXN4mxPPWlxRoSJNnAbJCf6rW/9by5+/f9xBjYjfCNdek+a7YTqnECPJ2Pa8pcsc/4BHHF01d
	I2r+EbpusYdME/cBVzP+Yk3yDMMRQrMe6AWLll8lG1LnuSm6uIgIjm3nhR6aAfBsCYTzo6AzworWc
	Yyork5r4ManxZz9eRn4gpYduk0Bsv7NxXcIJ6ptIQ36zWD9A7L3iVnUjrJ9VuG+quvMMR3JdZwzPe
	0Ni+nyeGtVbIXl3J1jgrXi75N8ozJoY5LBPuzsdemLzqVr1EcPerWFRDgBWSpDcGBqCNRjpG47T8P
	7sWPdnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhInx-00000002kv7-3dtB;
	Thu, 31 Jul 2025 02:14:01 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhIlU-00000002kpo-0opY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 02:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753927882;
	bh=/+TfOEWR0Nli29bN6WrEzJLsG9aHc0r+gNTRjB2A+GM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZT1KnmkfhOaJuo/p5h6IVFRznALO76XlJ+P7ddQ5Flf3pmvBxi2pO8e3vOFv6Vkvi
	 aAeCv8ORPyqaUSuNoJl5JZXACdozJcdnThpGcjeX5Vob97c2cR7gNP+/DhIX2Hm9J/
	 MucMr7u76yYSOrLlZ1al+FxuhjMQSP3Xez2lv0/84y0cxXffF+icO7Rv+V7SmWzx3T
	 6IMAX3CjnOpj3oKhk7px0mFuLwD3Qxt4bNymA+mzz1DO/fa4j/mlQwoOluBPvV3mt3
	 dojq2p5DGHhCRH8mh3w9XT87GBJgtrjWCiW/MzNVNNYeNvzmUe4sUhcK8LXOaXbETJ
	 ZbJVaPUlNdBSA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7D5B569374;
	Thu, 31 Jul 2025 10:11:20 +0800 (AWST)
Message-ID: <2de9da0e95d3e1284a29170c99f7b69baadb9518.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 0/2] Adding device tree and binding for NVIDIA
 GB200-UT3.0b
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Donald Shannon <donalds@nvidia.com>
Cc: conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	krzk+dt@kernel.org, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, 
	devicetree@vger.kernel.org
Date: Thu, 31 Jul 2025 11:41:19 +0930
In-Reply-To: <CAL_JsqJwgbWa0sPVgdxMchPfa1hR8o-=wRh4UgoK3QfDdW+S+g@mail.gmail.com>
References: <20250723222350.200094-1-donalds@nvidia.com>
	 <175341328135.3754696.5873094296930738476.robh@kernel.org>
	 <CAL_JsqJwgbWa0sPVgdxMchPfa1hR8o-=wRh4UgoK3QfDdW+S+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_191128_425884_176B6197 
X-CRM114-Status: UNSURE (   8.07  )
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

On Thu, 2025-07-24 at 22:25 -0500, Rob Herring wrote:
>=20
> All of the below warnings you are introducing...
>=20
> And yeah, all the ones above are existing, but I don't see a lot of
> progress fixing them. It seems no one adding their board cares about
> the SoC warnings given the lack of progress on aspeed stuff. Maybe new
> boards need to be rejected without some improvements...
>=20

I had an old branch with a series that reduces the warnings. I'll
rebase it and tidy it up a bit wrt more recent binding submissions.
Once it's mostly sensible I'll consider pointing people to it as
suggestions for fixing existing issues on the path to getting their own
devicetrees merged.

Andrew

