Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A58FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggKY+PiY/XL/TlUzVFfVrI+1Nd0wMZ3GupLpt3JkIXU=; b=xRwm+BWh8HPMRNxQ6poBITufW3
	xjmV0aTdPaRbKbN03xaETLpRcRkAY/qitXc4hCldiEt42Lh6RRyJT+wdsw0VgjTTWomC6O7DfBxuX
	4xVlbiIV05F3jKxMWJRh0C5GabjP7lSF21ERG9GSnCgtA5h8+B3UNCsRwmHxGGuW5Bl+9wU3hLG6D
	IWju8d7kONQoaucV5emoMlovc5+jo38TlvoCk7G0d63Ryd5ga3Z3sprjW2uPREPEZXDHAHBVEJieO
	VNbCFhEivKTf6r6r3z6Vta0BOk94SDwlDTSL0kAV8oFDjHlNE5H+2LQ/jQ/WNk5A0xFJmTxmmM2TQ
	RVi/6WEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5GF-00000003Hpl-05ew;
	Thu, 02 Jul 2026 00:26:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5GC-00000003HoA-08p7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1782951990;
	bh=ggKY+PiY/XL/TlUzVFfVrI+1Nd0wMZ3GupLpt3JkIXU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MKVkLHEqSw5DimCEOHwHKrc1/BWkRhGWgS5Xuz4jz5WMGFWR1Q3qEDr9EIkT0aFS/
	 tCNZJOe6YNAuZaJ2pEPzl2Az7jcdQa/+9sDSgdDBKiSuiwZjRC0SUDD8Hia5/OTPUq
	 9wxuDAcDZb0QZ5GAChaGAcBgBKksNBOb4ebOcb1EzxsoCylDdLUqLE8ZXuSs1HE17C
	 kfFJJD3CePZ864ZkvjomXdPbKrcy/Bufc9Ee/efDWB0lOaftHpiNqnrYG1fvPZxzs9
	 D5fS8nS8s1S5Ebax96vEavxOR1pKpPhV/qv8nCw66ABV0yc2K6znE/Z5Rm+NUwf7om
	 Ab8Kw0tL+Y2pA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B84EF65871;
	Thu,  2 Jul 2026 08:26:29 +0800 (AWST)
Message-ID: <906cd5f479fe4b80ea3d66c236f259bdd644bf78.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 09:56:29 +0930
In-Reply-To: <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
	 <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_172632_263405_22AF4AAE 
X-CRM114-Status: GOOD (  10.51  )
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

Hi Kyle,

On Thu, 2026-06-25 at 13:35 +0800, Kyle Hsieh wrote:
> Hi Maintainers,
>=20
> Just a gentle ping on this v8 series.
> All review comments from the previous versions have been addressed.
> Please let me know if there is anything else needed for this to be
> applied.
>=20

Sorry for the delay. Your series is in my queue of patches to review,
but it's competing with other priorities.

Thanks,

Andrew

