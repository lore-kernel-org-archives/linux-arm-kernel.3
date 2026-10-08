Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C43CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA4a4/0qY83QQNCueloKQP2TPYFXj/uUC4YZjubeRHI=; b=ycDLljTyQd4nWAvtnOa6y/Nnt3
	0Npke9zbH4C/ByFRy29V7GzKrKtVEec1EM8es8mVgzmG48H1K/eBRuKjVOc+nhlFuVf/18ocdF6cI
	9bS0ZYybkVnsRvETFW3srlMqPtKKRtnaWWZUsXaeW0vehPMwKQxT8vglgkGMwpe/FQS+XbCDsjs/J
	x9wGWj7PL9mteoHnYN5fEcdmWtxpMGjzI+A1SMy3CgbA5hhU50taCS9jjlj5+sCq95LWm0xT//rTq
	/yTSkpfRE6DDh9rqYyGjlYfzBinHHoHoxmLK7iZfUSabcO4rPbqH/IbFUgL52ydOusUHTS7CPTekg
	V8cJ+83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmXd-00000004HBr-2XFG;
	Thu, 08 Oct 2026 11:44:05 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmXb-00000004HB1-1YQR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:44:04 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 69B1C240101
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 13:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791459837;
	bh=QA4a4/0qY83QQNCueloKQP2TPYFXj/uUC4YZjubeRHI=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=cphJCRxPquv5vT62es7asTSu3dFCCXplZYii8lZ1hCkMRsOjSLW87+8ufdG+M/0Te
	 U77+zlgHzBFXs7bzLELYs5Hp/k/QjycwA8tSEovzyqs2Byf8Uwsc4XxZ9ZPLM8IHK1
	 1Kz+qiNz476D8JBmGKgMrEgT6f5cueC9F5nM7Qfcpl/rCmrZ100V53qNPo6OK+mWwV
	 uhKb3ln48oZabYtOmktnob0Fwc76oNKZLtbqfyBhNp7eUVQ5WrfjwA+s3m51fWfD85
	 lBh1u5mx2ynlyO4J1jZYQWGzPM8O8YrKRcyUyQBC2D4JymDlHvQLc0vrxBvFdjuQt+
	 sqQjdTruvD2pw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j0p6h1JRTz6ty0;
	Thu,  8 Oct 2026 13:43:55 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 08 Oct 2026 11:43:56 +0000
From: mateusz.nowicki@posteo.net
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: st: mark main supplies always-on on
 stm32mp257f-dk
In-Reply-To: <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
References: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
 <aaedc962-63ab-431b-8b27-b4ac9c11d16e@foss.st.com>
Message-ID: <1baaa8cb024104ee6d201d55467f6718@posteo.net>
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_044403_562517_9C3FEDE7 
X-CRM114-Status: UNSURE (   9.82  )
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

Hi Patrick,

On 07.10.2026 11:22, Patrick DELAUNAY wrote:
> For STMicroelectronics boards, the STPMIC always-on regulator are
> managed on SCMI server side in OP-TEE.
>=20
> So no need to manage this constraint in Linux device tree.
>=20
> This always-on=C2=A0 regulator are exposed only for information or to be
> used are supply for some IP.

Thanks, that makes sense. OP-TEE keeps these rails on no matter what
Linux asks for, and the board keeps running fine.

The part I found confusing is what Linux reports. Since nothing in
Linux uses these regulators, the regulator core turns them off about
30 seconds after boot:

    [   31.713597] v1v8: disabling
    [   31.716454] v3v3: disabling

The SCMI call succeeds, so from then on regulator_summary shows
vddcore, v1v8 and v3v3 with a use count of 0, as if they were off.
In reality they are still powered.

With regulator-always-on, what Linux shows matches the hardware.
Would you still prefer to keep it out of the board DT? If so, I'm
happy to drop the patch.

Thanks,
Mateusz

