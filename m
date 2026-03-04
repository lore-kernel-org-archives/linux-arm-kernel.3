Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EB3EFCE47
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Efys+qdhDxW8gOWCNyG8ButQuR6xST9UMil7BTxFr0I=; b=t9g/woT1B5FPSYZFvJbNpHmrTe
	BBpiA7w7eYSb6D4j+dSARYJ6ht6JNz6/2V+KcS9oVVUw3avpxXFL1x77o5UwGe53lTZvBlqjtMqx2
	nDd4MF5fNWjCnAwwdq0FWIkjB5FmsOt7hqHyIZJAgeFer+t5GFVwFNjTNoP/48rxOOB9DW5QHh76M
	Hx9Y5wJThEUfjMfHpuoXn/qWdATntu+RZlo7bZoHV/bFKvpspViJ8ctUHCJBkg7fs7UiZWWbOOETU
	R8mlgzPSK9oBUedVNcSuX8JDnEeIm+FwY6RAPgPfDLWLq+cyBYdfK6mP8MBvLujp1uJ1yLchQa1MR
	SrfxjqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsnM-00000000Sbl-3Yr4;
	Wed, 04 Mar 2026 20:26:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsnK-00000000SbA-3sOU;
	Wed, 04 Mar 2026 20:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Efys+qdhDxW8gOWCNyG8ButQuR6xST9UMil7BTxFr0I=; b=OCG17ytgl1BIh7wKVHQ4jUE/W+
	d5UEeIn5BVPknW6046z/yb39IA1XP8V1orCGXXIlSIyrH8UoQ3OYBIHi9yy5fKgR0Sqz7BKQPjkdS
	lndwsYRNYUzucKXAOmK5neJDjzib9cMOjPVWOVPTbTxsdniFXBc+mrgPpcIbK2k6XXfoHO57AKLmw
	KFwAbkBv81HPtyiai9lPGFenEaeo0nLQFCbA62/882SgY8QsK2/9l5pTKXLnRWju+Cjgr+TR2FWOF
	FUafC9j7Ipb5YL7c644l7xIRK4Ltc3GmjU/TJ1sYieJ2QbLHaSVw/UYmUkeUWpFcUElTfISEgvlQA
	2NITJWaQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pedro Alves <pta2002@pta2002.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Wed, 04 Mar 2026 21:26:00 +0100
Message-ID: <24285215.6Emhk5qWAg@phil>
In-Reply-To: <CAAEXfUVBVMmT3i+10F3uvmGOtMMLoQK4WXM7_0G88aL5DntOuw@mail.gmail.com>
References: <20260304-radxa-r5-itx-hdmirx-v1-1-f77bf1f7ce03@pta2002.com>
 <DGU7SPZQMZR5.1506XM8RO4EHE@cknow-tech.com>
 <CAAEXfUVBVMmT3i+10F3uvmGOtMMLoQK4WXM7_0G88aL5DntOuw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_122611_000114_535466BE 
X-CRM114-Status: GOOD (  20.94  )
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

Am Mittwoch, 4. M=C3=A4rz 2026, 21:05:52 Mitteleurop=C3=A4ische Normalzeit =
schrieb Pedro Alves:
> On 04/03/2026 18:38, Diederik de Haas wrote:
> > I have a strong suspicion that it was named 'hdmirx_det' because in the
> > schema its label is 'HDMIIRX_DET_L' where the extra 'I' was probably
> > dropped as that seems to be a spelling issue and the '_L' suffix is
> > quite often dropped.
> >
> > FWIW: The label in the schematic for Rock 5B, Rock 5B+, Rock 5T and Rock
> > 5 ITX+ are all 'HDMIIRX_DET_L', yet none of them follow the convention
> > to use the label from the schematics.
>=20
> That's a good point, and the other boards all have the hdmirx_det
> naming in the downstream kernel, so I guess that would be the most
> "correct" name to use.
>=20
> > So now the 'problem' is indeed: make it consistent with the other boards
> > or keep the one where the convention was followed.
>=20
> Also a third option of changing the other boards to all match. Either
> way, I can do those changes, just let me know what would be desirable.

I really want pin-names to reflect the schematics. This makes searching
so much easier. Sometimes things slip through where that doesn't match,
but the goal would be to always move to improve things.

So at least the newly added hdmirx here should follow the schematics,
and if you are keen to bring everything in line, you could also change
the other boards. But please make sure via the schematics of those :-)


Thanks
Heiko



