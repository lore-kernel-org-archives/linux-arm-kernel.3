Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F8CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 05:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/aNFcuI5ER/zUmHNbZkEITb8B+mXfHQs+aVMjxDIgQ=; b=2gy63mFy9yGin9E9mt0RtSPADE
	mm5J7NZrSmxNdDy+12Dkdd5Naer558agP9C+BDok0nCV7Rv7hv7v7I9EBpsqc0uqL6yoOBrpS+MwP
	bcV3nZDZ/CbvRBDIZlRuLoXqO/Q+U+d4lP3W6+eyo50W2KfAuAJFqMkDdYpWbwmni7hSvsCzeaNPe
	yGafhUjQPf9I5q2MeY744Z1OtPC/PBq5WP14+17U6BoCdrSzdWeJrkotQkTFc+/EWpNfm+Sl9wSwE
	7ff91iUV9rFbG+M7nU8KVuFEpCzZD0+De3uzxNQ8zYX7SlOOgVROFHQ1/YtxZySHeaVZtIBiE6XEv
	jUhN6kCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfj1-0000000459u-1T2C;
	Wed, 03 Sep 2025 05:08:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfgH-00000004479-2e87
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 05:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756875911;
	bh=z/aNFcuI5ER/zUmHNbZkEITb8B+mXfHQs+aVMjxDIgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TFWlqiIuq/EgRqWg5UZI7aD6HRJWbNSWozu+PymRFHSv2k6UeOld6m0jYPcxjava0
	 Vugz8yzOCBq02zTe/CBiKirpQyvEce/jcBYOO24thW8g/Dly1TIVEUXM2RqY6JHy0y
	 EKKRfbTP67sSiWeSptiKYQFGu7qTMz1ve1+9LKY4lnx0K4HjcPG+c24cRag9nM9FBC
	 g4djJ97GqjQm3aYAFwVlN42Owr329lTtiWBGHQXg9dJDoXHmfyo4+SwbxR07FLtbjf
	 g2guGt2m4+Rg7dpn+eFMvcpn98t3W6Ki/oo39zxVt0+LCFmVZhAqecTXmacPRl31Vt
	 k9fwlk2bwV7Ew==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 45A266E02C;
	Wed,  3 Sep 2025 13:05:03 +0800 (AWST)
Message-ID: <9e3d52078b0ad9da6015229d6f39cb013a4cffbd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v11 0/3] ARM: dts: Add support for Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com, Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 03 Sep 2025 14:35:02 +0930
In-Reply-To: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
References: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_220513_856049_8A43F196 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Leo,

On Wed, 2025-08-13 at 18:04 +0800, Leo Wang wrote:
> This series adds initial support for the Meta Clemente BMC based on
> the
> ASPEED AST2600 SoC.
>=20
> Patch 1 documents the compatible string.
> Patch 2 Add pinctrl nodes for NCSI3 and NCSI4.
> Patch 3 adds the device tree for the board.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
> Changes in v11:
> - Rebased on bmc/aspeed/dt as requested.
> - Link to v10:
> https://lore.kernel.org/r/20250801-add-support-for-meta-clemente-bmc-v10-=
0-c1c27082583d@fii-foxconn.com

I've applied v11, after tidying up some whitespace and the subject of
patch 2/3.

Thanks,

Andrew

