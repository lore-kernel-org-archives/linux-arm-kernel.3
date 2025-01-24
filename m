Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4264C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67Jqb8E5y2wMq+CtYW7x2oADzGlvHt47MmkZxhhINtQ=; b=FXquZr8EmigsKK+vO9MUR6RMlq
	f04Ow4oEZSQG7In9wBHVCN50qS0NP77Rv+2CuJslQ7oVPE07DJ3kHn1i7WyUTRsfL6PXlqBAuHCB/
	vHGpz0OdTs7frObtN2NyMPK/MDsWSUDnNzMx6P+BLmB8YvPqUPylN/yZ4KBn0O4geBCTbcECo3cTo
	neHa5MWW42km33r2IYk7keIo8Kh0fnUWf+MkB+nKoseoU8ZdNrEXXd4R8mQS7ESoHSonZstbjwYlt
	XkdDmC4m0U8+Tnlj1ruS26Jt77rAWKwfC/MXrj5ckim0OUMLuWsaqkqeDMbz1vFAW9H8wGLpSwP8y
	ljO99VuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGqQ-0000000ES66-1OOx;
	Fri, 24 Jan 2025 10:23:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGoF-0000000ERwa-23eF;
	Fri, 24 Jan 2025 10:21:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00B4BA4134C;
	Fri, 24 Jan 2025 10:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B10C4CED2;
	Fri, 24 Jan 2025 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737714065;
	bh=1rxi/IQFlqsCoGaYN4R4JXonbt8cWgjyvBPnXzr8SOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9B89+1HAsf6XleKtnR0iRfZeUjw82iVnl2pDygJDF/EbvlmUJG5n2gdLbIlZPAET
	 PYjnl+1k1X9jNR+/mC9b+3CGhXWb3ptRjjZApW1F/KNbZ7J8pCXsbRN3DvVDtKmldm
	 QxjjIb9zfEU21WNePhsnAsANpXS9/K7luGGE7G0OTqaApBVwVBYkVSsusMctfOimPh
	 PsD+0DzTPfcelGqZeG4VRKw+HkM784WmpVT7g+BEJ3VR7XoTswYwITGRiJdetmYfgu
	 XmCOD+plmtdyCzuYmYcvMgBQgFRJ9lak0n1MD/QjImM3bRXgdSZnTzD8W5/QDa1Iju
	 z/uqPD1EpEv+Q==
Date: Fri, 24 Jan 2025 11:21:00 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Quentin Schulz <foss+kernel@0leil.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
Message-ID: <Z5NpjAUFK_cMIWLj@ryzen>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <6dd64754-fe72-4288-9724-b3cdaf193b3b@cherry.de>
 <Z5EY6uMmDCgfOzGO@ryzen>
 <3324197.aV6nBDHxoP@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3324197.aV6nBDHxoP@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_022107_659729_262BA7AF 
X-CRM114-Status: GOOD (  34.34  )
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

On Thu, Jan 23, 2025 at 03:13:01PM +0100, Heiko Stübner wrote:
> Am Mittwoch, 22. Januar 2025, 17:12:26 CET schrieb Niklas Cassel:
> > On Wed, Jan 22, 2025 at 04:38:16PM +0100, Quentin Schulz wrote:
> > > So essentially, if SPL_ATF_NO_PLATFORM_PARAM is selected (the default for
> > > RK356x, RK3588, forced on on RK3308, enabled for the majority of RK3399
> > > boards, enabled for all RK3328 boards) the DT won't be passed to TF-A so no
> > > issue in terms of size on that side.
> > > If it is not selected, for TF-A < 2.4 (released 20201117, 4 years ago), a
> > > DTB bigger than 64KiB will crash TF-A.
> > > If it is not selected, for TF-A >= 2.4, a DTB bigger than 128KiB will result
> > > in TF-A not being able to read the DTB (for Rockchip, that means not being
> > > able to derive the UART settings (controller and baudrate) to use, and will
> > > use the compile-time default instead).
> > 
> > Not everyone is using binary blobs from Rockchip.
> > On my rock5b (rk3588), I'm building the bootloader using buildroot,
> > which is using upstream TrustedFirmware-A (v2.12).
> > 
> > 
> > > In short, I don't know where to go with that additional piece of
> > > information, but this is a bit bigger than simply moving things around and
> > > adding compile-time tests for overlay application.
> > 
> > This is significant information indeed.
> 
> I guess the question is, can this hurt existing devices?
> 
> As Quentin mentioned, this only affects DTs that get handed over from
> U-Boot to TF-A (and maybe OP-TEE).
> 
> So the whole range of things loading their DT from extlinux.conf or
> whatever are not really affected.
> 
> 
> DTs U-Boot can hand over are 2 types,
> (1) built from within u-boot and
> (2) stored somewhere centrally (SPI flash).
> 
> 
> Case (1) is again not affected, as U-Boot (and other bootloaders) may
> very well sync the DTS files, but generally not the build-system, so if
> U-Boot (or any other bootloader) creates DTBs with symbols is completely
> their own choice.
> 
> 
> And for case (2) I see the manufacturer being responsible. Having the DT
> in central storage makes it somewhat part of a "bios"-level in the hirarchy
> and the general guarantee is that new software _will work_ with older DTs,
> but the other way around is more a nice to have (old SW with new DTB).
> 
> So if some manufacturer has a centrally located DTB this does not matter
> until they upgrade, and when that happens I do expect testing to happen
> at the manufacturers side, before rolling out a "bios update"

Personally, I'm all for letting the kernel build the DTBs with symbols.

(I have a patch that I keep rebasing on my tree only for that purpose.
Sure, I could modify my build scripts to build the DTB separately,
but with this patch, I do not need to do anything since the kernel
builds the DTBs already.)

Other platforms, e.g. TI already build many boards with symbols:
https://github.com/torvalds/linux/blob/v6.13/arch/arm64/boot/dts/ti/Makefile#L242-L261


You seems to have been against enabling symbols before:
https://lore.kernel.org/linux-rockchip/171941553475.921128.9467465539299233735.b4-ty@sntech.de/
https://lore.kernel.org/linux-rockchip/1952472.6tgchFWduM@diego/

But if you have changed you mind, and you are no longer concerned about
doing so, then in my own self-interest I'm all for it :)


Kind regards,
Niklas

