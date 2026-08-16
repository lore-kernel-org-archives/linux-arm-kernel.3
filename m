Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF6C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4smyzpnVln00Im8G3tqsTx+iL97HQk+6mnv4RbTj6I=; b=shRcxB0d+LHdwcJYUE4AfAeqdQ
	o3kujmGtYI+SxvQwGpo6CQCuuKtQrmwjLU0kWLKJHJoimTYrynWFCu/0g2D/SUfiTPdSmr0H+/tyz
	FR3ZvrARChd3NV5cyVjF+YiXXqqd5+BJ9XOxbs5by+qRtVMcEx5MHkdQQtbeq3WmDXvvllnDC15X4
	3/4Q5XkS6ksrF57sVcJ9XwmgEAB/NwjnxZHnPiAt47WdvDu1YYZmpVSHOAFAmExQmV3dhyx2pBgd3
	bhTUM2JSwGWJAS1rv5jlc/sMP7m8pR7lZVY2jxLBzm9/8mN6F5WQGUrkjTirXsq/X0bXuMg3olP3R
	OTADqALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXug-00000004dkg-28q8;
	Sun, 16 Aug 2026 10:16:22 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXud-00000004dju-2Y83
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 10:16:21 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 2A13B1D0008F;
	Sun, 16 Aug 2026 06:16:13 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 16 Aug 2026 06:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786875372;
	 x=1786961772; bh=b4smyzpnVln00Im8G3tqsTx+iL97HQk+6mnv4RbTj6I=; b=
	lCvMZagGuEbNR/pjLbY/lYJgAoSSuJD90l9XdVjDVbA4JrSdCYHTvNSgVjjjBthq
	npjE7yQZu88aiGKs2h6RqLU3LLS1Fvsiol8/nidzwAd4qE0WzkWMpEaXhjLDTOBM
	tzJqLR4Y5U9rkdqkgeCh83IyYp4/vQ7/u45Uc1Ow48QbkdrcxuclpD1fiNmgJtZp
	ZfWnWC5eU1TQzcaRef+gQRKN3pnEJRus9kYCzc8msYduB6VnDI0q3im161D2GrOo
	etjoKArKau+h1JaPtZJRax7M/CwXQt2WC/QXvuiLaVaoOjpkJoYq28eSlJx4hnzw
	cZurPSMwCS+9QLxLfrbKZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786875372; x=
	1786961772; bh=b4smyzpnVln00Im8G3tqsTx+iL97HQk+6mnv4RbTj6I=; b=R
	f4U8ORWp2dAW9Bn1uYvpAqFTk7uTRYUk2KiZ38MjenySEW7SiDqBCxqyz2bXel1W
	ZCxZwC9uUY9x5OtrzD6tuUhJm/EXPT6+6jJuxeeIa7vGPU3XlwpFJdLeHwaj9iAr
	z8yo+W5ajtZQrCqyHecOrRz2pwp6diDN3Pw9zIJsSwhT8wRC7nxJL3hI3QA6WFaV
	lAivheT2iJpxRJ0Seqr6C4DRnaNGP/Emdia+bVb2h3rUrktwJiHb7FYH04LKSM3W
	h0bKQhL0nvpbOfV29ZPRDOdrgZM2R97CKxNXxIok0k2xmizVZDuAnqvFx8+1CVDY
	aOeUA92N8V2WiI/iSq5uw==
X-ME-Sender: <xms:5I2BakGZTAXNWjrzycq7mZ9wwWaqgKsLPBVKMKQkXUdebdDtf6HORw>
    <xme:5I2BaoJ6yJSxH02xUFyU3aQjQ8PuczWuZRNfyFtH8FLm4-NzSmYWQ26Z8hdyCBKe3
    kzZ4YFucEfczaUKTx0hin-2EAvXJAXkSMoivPxlyWLNc5OzNrO1EMbg>
X-ME-Proxy-Cause: dmFkZTEs37CV2sWl7vX8/MegoKYc/3F3SO7iK024eehlfkxnjLOIzrchvdj35/2XKwD7Lk
    J3pGIB98Ce9AagWK555Ct7V0OFXbkAK26dRWlmT24K6vy8vX5eM1smu7suKy1ziuCsukpz
    sMjy2DSHACuS95Ph4PT50bw6TBPPxqFukyp09USb8TGMFjz2eHS1KsmvosZYlUdmZhFYq5
    YFL5fyB7+bTuKNQQoLVjQUBs/SyoN/3PLWIxAP/UqQXbc64Tueq7axmshph8xYscM16Hx2
    PuwyloXggPppH/1Coaug6n3DI07sNLfuRNjO6t8yeXdVrmcenckc5tQquySgpw0KoW4uIA
    1yEZPxbKpT5f/jjrcLyXnOV0clMZslMDcbuTQQlwVWJ8LmiXVr6cSuiO4BgF3Z/Xsm6FbL
    UWrpvMOKQlYA3V6C0LTRxNVXedBWThJHiHG/tYYO/fOfC91IaCc+fqn/yQroxRs8bWz6wY
    gRDzAEdgG6NRkqhVHJ/ySfVb8BGEirJAsL4a0dDet8nq7aU4GaKJfga+uqWvXxbYCAM0ze
    ebdnrWJBMYEB7Sw5KQppxJG4qQF7zG3f57KIcyeslc4uOTGlyFL6CUnj+yVBjQ10bgdAhp
    aJsisRXxgiOHTu6e4YgkXHDPgjZq/zAD3c+NXTEbKrIM26+XAbmbhH6Ek8Rw
X-ME-Proxy: <xmx:542Bar2zOFRnMf9EB9lfOMFOnsH9kpqnpD_ezDwPJ6gLBfIWkLJfuw>
    <xmx:542Bagn1Scux6Cx5B4BUmihaouK99Yj1gc5_gDQtogjdyuiB9icAKA>
    <xmx:542Bap512UurWCJVSEFlsAM5VH0MJU9vFZB7J-Y5NLQj_pNqVytc2A>
    <xmx:542BajlUlSrFdF_NxjcINq8N21HWeG-_GP5iVMBT9LbP9iw-c8LuYQ>
    <xmx:7I2BapqXhY6V7-Os9jSV7Pvfso387fTJF0d404u6lihDSxT46Sws1yYN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6A40232A006F; Sun, 16 Aug 2026 06:16:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AwnWr737caCF
Date: Sun, 16 Aug 2026 12:15:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <b14ee6f2-1b90-4254-822c-ad352646005e@app.fastmail.com>
In-Reply-To: <aoGHINU1DWOHXgYC@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
 <aoGHINU1DWOHXgYC@willie-the-truck>
Subject: Re: [PATCH 00/12] arm64: Remove unused big-endian support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_031620_231775_886387D4 
X-CRM114-Status: GOOD (  20.92  )
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

On Sun, Aug 16, 2026, at 11:47, Will Deacon wrote:
> On Tue, Aug 11, 2026 at 05:11:47PM +0200, Arnd Bergmann wrote:
>> On Tue, Aug 11, 2026, at 16:01, Will Deacon wrote:
>>
>> My suggestions there was to possibly remove arm32 big-endian mode at
>> the same time as on arm64, but that does feel a little rushed if
>> ixp4xx only has one release of supporting both, and removing be8
>> but leaving be32 for a little while longer is probably not worth it.
>
> Yeah, maybe give it another LTS on the arm32 side? I think arm64 going
> first is ok, though.

Right, one more LTS for 32-bit is probably good. We'll see how the
OpenWRT/ixp4xx conversion goes for users.

My feeling so far is that running ixp4xx in LE mode is probably fine
(there may still be driver bugs), but flashing a running system
from one mode to the other is a bit risky and BE32 mode makes this
more confusing the BE8.

>> > I've broken this down into fairly coarse chunks, as it seemed a lot
>> > easier to manage than one giant patch (even with the Kconfig being
>> > effectively disabled already) and not all of it is just mindless
>> > deletion. Despite that, I'm anticipating the whole thing going via the
>> > arm64 tree.
>> 
>> I would have done even larger patches, this does already feel fairly
>> fine-grained to me ;-). I had a look at the individual patches to make
>> sure this all makes sense, and I found nothing wrong here.
>
> If it was just a sed script or similar, I think I'd would've done a giant
> patch, but some of it is surprisingly error-prone (e.g. when you have a
> file with a load of '#ifdef CPU_BIG_ENDIAN' and then an '#ifndef
> CPU_BIG_ENDIAN' hiding in the middle of it all).

Yes, definitely, I've found out the hard way during other feature
removal before.

scripts/unifdef.c should be able to help with this, but I never
remember that this is a thing.

     Arnd

