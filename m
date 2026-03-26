Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B104B109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hidLBtwhQbxPBXbheN85pSsa8RQxYeW+MLrk6uzD3ac=; b=vF2YDC/nT7B1kaBOeA0s9fFfg6
	QyjaNCdspnN7mMhuTPUGAZNBKkvOPuIpYSgsbev8636byGoqqadLmW0CgB/RN8P8i5Z3t0+a0uUQG
	7W7ljRTjHEJI6mAzakqsUN4gudQeNobS/CDglWka2q+mmMWkJ1zhKvzEMcpns/W+js78M9/P5JS76
	zIC+0iJxvLrYtSWslkvAU9k7vinufQdzGHd7/cKP1h1GIZkRiaXhQdGiA+D92UVxPn43mhiukuqGN
	D8buweERSlPPyh5Af4KUT1fjiyfblFv3rl46ZxIZR4S4jBxhj06FvBcVo411bpSix5/EeHsQjd9Uk
	llqMTDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dv7-00000004mWF-3JHc;
	Thu, 26 Mar 2026 06:10:17 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dv3-00000004mV7-1mze
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774505411;
	bh=hidLBtwhQbxPBXbheN85pSsa8RQxYeW+MLrk6uzD3ac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KMhiSzgs0FiJF1ZY/gHkQ+gt0zCunXJNaCStpNJfIiNdsSrkcKNb5QW4c5Grx5QBE
	 ENlC2WhRG/AQG+nVfFt3lXtpRvLKPI2NNgQ9qbL7UR3SevefGE6eu+AJjhD3bpI9W5
	 NdlWFj4g10N/XCODybZzWndp94Kxey7+q8n6iayvQknF3uu7P7Hjm8WxrydLnQOWuE
	 9qrSj5odCfF9zbpupYHRX27hyo26d3auWuZsCYSgmwTzB+6twIozI8Lilaw0jUie/B
	 O8QIOOAqxm2R99ITRmwjfSZaBV37z6Vl0/kSbm27JvCsd+Gkm6Pc+aJAldaXi+ik7J
	 VM5DHsKt4rviQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D19B36597C;
	Thu, 26 Mar 2026 14:10:10 +0800 (AWST)
Message-ID: <e24ec25ff7d731cf6ca094028b1336dacd01ac9c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/8] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org, Amithash
 Prasasd <amithash@meta.com>, Kevin Tung	 <Kevin.Tung@quantatw.com>, Ken
 Chen <Ken.Chen@quantatw.com>, Leo Yang	 <Leo-Yang@quantatw.com>, Jackson
 Liu <Jackson.Liu@quantatw.com>, Daniel Hsu	 <Daniel-Hsu@quantatw.com>
Date: Thu, 26 Mar 2026 16:40:10 +1030
In-Reply-To: <CABh9gBe2BcgnONwx=cmcOAsT15HgVGjxSChgFMvckTAW_8JfMQ@mail.gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
	 <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com>
	 <391b9b912492c07fd1fd7a737b7f49382d361fe2.camel@codeconstruct.com.au>
	 <CABh9gBe2BcgnONwx=cmcOAsT15HgVGjxSChgFMvckTAW_8JfMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_231014_455730_F41C47D9 
X-CRM114-Status: GOOD (  17.22  )
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

On Mon, 2026-03-09 at 11:34 -0700, Kevin Tung wrote:
> > Broadly, it feels a lot like you're revising platform designs, then
> > trying to make the one devicetree fit the current design, and are not
> > explicitly communicating that this is what you're doing.
> >=20
> > If that _is_ what you're doing, then we can come up with much better
> > schemes to handle it that aren't a constant stream of compatibility
> > breaks.
> >=20
> > I need you to engage with this concern.
> >=20
> Thanks for your feedback. I realize there may be a lack of knowledge
> on my side regarding the best practices here.
> Could you kindly guide me on how we might implement a better approach
> that avoids a constant stream of compatibility breaks?
> I=E2=80=99d like to ensure we handle this correctly and align with the
> expected workflow.

Sure, see the reply I just sent here:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

>=20
> > From inspection, I only find patches 1, 4 and 7 of this series to be
> > something I'd consider applying without further discussion.
> >=20
> Got it. Should I split patches 1, 4, and 7 into a separate series?
> This would keep the current series shorter by excluding items that
> don=E2=80=99t require further discussion.
>=20

I am okay with that, so long as it makes sense in the context of the
discussion linked above.

Andrew

