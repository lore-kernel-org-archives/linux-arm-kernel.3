Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E759606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s+Y0bhyf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oixYca/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=; b=s+Y0bhyff8Zj9c
	67tdbmAsajlHitOVSLTTWSH5Y9Pk3jOEgaCAhpalSbKQzCERy580nZeiuNaDif3hY4UQGy/BimR1n
	RZt45em44rkR+/XiWZG75ixJAdH94iybUL8zfi9nfNtrRQqa1X7eL1kQBdkKB+FABZzukxa3FT52N
	OFljJcg3h/renniBoZl1NUBmJMzYZ3B7iXSuILJhji1NZINhmVTN9yunc2NV3QYTvmcrI+w+YE222
	t5Z8PtgijC6XAaBmK8aBrqsZsp+YwYxbju47A3hZEVpyQN+ZyD/D4430wqNxc/AiJAqBIpJhtunl5
	gwD1vb+OH9rXKhOXMYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO06h-00000000WVr-38wf;
	Mon, 02 Nov 2026 22:02:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO06d-00000000WUx-0A28
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 22:02:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e946155442so31464695ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 14:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793656938; cv=none;
        d=google.com; s=arc-20260327;
        b=LLTudVRmmn1O31wAagNhsG/IyQsnM2RBKw1F1et1MoXivdYa3zf6UYTpFXN2Al58u3
         XuMpzuhYwfSFHobWHNpkTorljIwBC7TyEIioMcjVqVKSizN4UOWm+2GEOaneBACy6jvm
         pb3Oyuc8jOdrtkLd0ZUjnFDe4dXtdraqj9l7cAwFhaPb4zySmWiPYSom4kUQ7LxwxavL
         HC3FyhCetHZI4u6jpuSnh+WlWtb2jWkAf5a1yzi99NiCB28BIeJ8v7T8LJd46k7zQ7ov
         phRe1NqETV2+saQil121Nnel3bPCbexzoaNqAvKnYeiTEiHd2i2U6LkhBhrBRYz9vRbr
         kAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
        fh=gZ/MA9GNAtL2KCUohtP6fTtcNH8S08Tbo4V0yWdiQhk=;
        b=KJrmx/AhnoQFd3mdV4ZvGFe6fvmrZWW1rx0WOyHG0Rb6mAjOzhbeW4Y00bmEe8zWJT
         Huv2OYb3u+/K+f8oi7UrvOKC+1k+d+AOtho4pIHNAuvolqRPNMBI4sCNuHqfljSXvs8u
         iLLzwSptUpqgPO2uV71PJsYfv2ZYPPi7yQK0HvgHVegKO/5wEBT0pfURs8a13LhbYgCL
         A334d1NO18mjazSxefKv4DtwXMRm1ukt1IGBM84dD3IdD53g3q3Q6ewN/2aEVjko+kjp
         ySvo/NJ0gGldN82CTft9EbRv5SmYvMR4ytzlz42elP+Lg2hRA3pFmW4mylNQ+1CmGJhL
         UZyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656938; x=1794261738; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
        b=oixYca/tXI58MWh5Lb7PxbwMRs0oUcEtI/lTU9QHDg2/b3Y++TI+KPGuzsPVAklykK
         FcactbE9ZA+xzDEIggwJFwfGBFL/Hv2IfGxkrQxjbXONy7n4p4y1mUh45AyXruq8pKiz
         Z9WcJz+D+WTZk+XibzkGUHw6Y+pMeLmRIGbLwBOOXx65aEonFasFmy6MUv+KtsGCzVyg
         w7yDyfjU2G3lc68/+HQZQYTv54gNzHOG9qhL/uAg/vVEPmYfoErlc96XwhkTjzFBdx0H
         8OJrXOVmGJSQe4IaGi5Z8Q5k0h2CPTkEp6AAP4rPcwUzSgyGtZiEY/eI75aDYiGW28A4
         DA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656938; x=1794261738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtjp8uRsMeZtzljno56JPnA05zYp6kp0pecErzMaG48=;
        b=WEZGwkl9MRrsuAX+rU1//N/gfSI2AAPk/JCGdb5OySE3mij1NQ5XGUv3vTT32WxSfb
         eXBh/cww+9w0VWj28L5smvC6384I9lXNDQsb+MYJ1pdGjPHljlpoBts1t5qoO6AYZcYP
         C56OUIU0nrxXGRWGkZDgddXnlqOAw3K81byYXEsH0azfPwMsN8NKjTJ4ud1gg7jhGPMC
         USJ8P2GfLVvhQwU55yTHQQKBbHPRi2vuOylTTDpQvFdHNO5Pb0NHcZQfaOPog4rWS5b6
         5sTwEmV0I8k1yJFTZDrWuvF/Q9Jr3GQKGGEs2wonLdsKadvHIqZFi7LwjaKZnGj5z9lR
         sO+A==
X-Forwarded-Encrypted: i=1; AKwUvBzeIdtYmuC0+GOVNQ2TEC5fXvILH/Ed0oWT14uIBM8STZe44UPoNtEr3G4mtMYLcPvchkCsDkiYW/sfckUh1Uiv@lists.infradead.org
X-Gm-Message-State: APuU4Z8kqxx5AtUsY8+fs+bV9n3S6nATzMaKRMENRF8hbYavyAw+kSMO
	b3pU3jGnu6enfCXYmjeGAs1CtAqPl5dW/yVth2/IduYvHLeGXm7MATs7W4sjq3qu248O6hi8HxT
	RQ4npz7aST1PSuoU3R7Kmdt730EJa/6k=
X-Gm-Gg: AYBFou3yyP2lhqUYGNvi3eBnMQHVm2RUmjRB0iSRf6T4Um2y1O35Z8QUsLw+q4lqGJD
	S5040urw+IV7f/DyCTP/Myz3hyxZpEu/Oqm9O+ddQTjv/bZ/jiuLjV3ZxT1PuIgWzNukbe9WW/r
	3jeBQyRCzaaPbOL21wzxLHgzPT+IT4Ys+2CwWeCxFU+U5IS2Ryt1pytOHtWhrsCaOOslCrf/JnG
	Le+vILPzLkoTwM6+a3HJX5Fx0/WyCUTVcoJYPCHgB3d3LVhTqeE7f/YKnP7U+8+sOAZ1rX60JYO
	SgeiOWHKNsbqY/2T3FfmsMq1Y1IQq9yAznSPzvJKW56xG2yPmgqMD1Buxvg6BT3OMA+WA89DD2G
	mMtq7GhYp55i4+/vtvAxOAVIUA0rs3shgcPPmnrEExPBAsfrqYxKH/9mNUOTmpJ5fKt/mXi1U6Y
	1q63cgKgN8QglZ3Gj0ARtAvKr3IraIFftAOHjbBIPfwv0wZq3kmg==
X-Received: by 2002:a17:90b:5286:b0:3ad:a8bc:20cb with SMTP id
 98e67ed59e1d1-3ae8987d2d2mr9574855a91.66.1793656937652; Mon, 02 Nov 2026
 14:02:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com> <17766357.Ash8RoxBsO@diego>
In-Reply-To: <17766357.Ash8RoxBsO@diego>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Mon, 2 Nov 2026 23:02:05 +0100
X-Gm-Features: AclHuK9tCDntyLcfsDMcIMJcuLi-7mMTrptnQIWxhgk53CbLpMpuIZ3RXH4vlrk
Message-ID: <CAPSPb=uNcjWHa0SH+qvO0VC7Vku6fP6OajWR9noO52_R2HDOvw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and improvements
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_140219_085848_27A37F3F 
X-CRM114-Status: GOOD (  26.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Heiko,

On Sun, 1 Nov 2026 at 23:19, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Joachim
>
> Am Sonntag, 1. November 2026, 22:55:18 Mitteleurop=C3=A4ische Normalzeit =
schrieb Joachim Eastwood via B4 Relay:
> > This patch series contains a few fixes and miscellaneous improvements
> > for the NanoPi 6 series of boards.
> >
> > Patch 1 fixes the voltage range on the SDMMC regulator.
> > Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
> > Patch 3 adds an IIO HWMON device to monitor the input voltage.
> > Patch 4 moves a regulator that only exist R6 boards to the correct dtsi=
.
> > Patch 5-9 renames DT names to match the schematics signals/nets.
> >
> > If patch 5-9 is just considered churn I'll drop them. These are more
> > nice to have and just makes it easier to cross-reference DT and
> > schematics.
> >
> > Schematics for the boards can be found here:
> > M6: https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.P=
DF
> > R6C: https://wiki.friendlyelec.com/wiki/images/f/f7/NanoPi_R6C_2302_SCH=
.PDF
> > R6S: https://wiki.friendlyelec.com/wiki/images/2/2f/NanoPi_R6S_2208_SCH=
.PDF
> >
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> > Changes in v2:
> > - Add schematic links to cover letter to ease review
> > - Renamed rtl8211f node to gmac
> > - Add R-b tags from Shawn Lin
> > - Rebased on v7.4-rc1
> > - Link to v1: https://patch.msgid.link/20261014-nanopi-m6-improvements-=
v1-0-e713f71eb4d3@gmail.com
>
> looks like we worked at the same time :-) .
yeah, seems like that :)

> As you will have seen just now, I applied your v1, so please send any
> needed changes as follow up patches.
Sure, thanks for applying!

There wasn't a lot of changes in v2, so it will be just a small patch to
renamed the rtl8211f node to gmac in the common nanopi.dtsi file.
I will include the patch in the next version of the M6V2 board support
patch set [1]. Sashiko found some issues so a new version is coming.

[1]: https://lore.kernel.org/linux-rockchip/20261101-nanopi-m6v2-v1-0-e401e=
a64b394@gmail.com/


best regards,
Joachim Eastwood

