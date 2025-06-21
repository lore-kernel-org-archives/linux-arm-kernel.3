Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD582C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOYzEFryhpWMDpLqFIhYynTTjYVsx1UHxgnT1pXFT10=; b=fBnRoisQXK8x7LGSYr3rmSFrPc
	4tlYPIbSH36M2V5Rq8+cAOpCRD5omCODfWRKQmZeLAxWsOkzkg/QMeVRAwNCo3WQN9JhHUmI2/j2N
	q9QpX7AfH3Mg3BDzcadi4E/mEsCl2zW3xnrztXuuOeeNe0VbemPUJBdAj2wfTIX1fCRrudXYuhTnz
	Zsl2Ob2WXB/6sBDdX3epBlO1pcZB7krmHvQh/Os0CU6VWs8aetX8APSkN1TMGnRyXMugqyohX39gd
	RqfiM5I4BfTHEVcTAx+KzAKJc1O34YrrLxVVMZGOXDiPvDLYY2nKX6NbNmUodYTJDgGZaaBu35aJM
	21zsnpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT3Eh-000000009lo-0Gs3;
	Sat, 21 Jun 2025 18:46:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT3CQ-000000009Rb-1lMa;
	Sat, 21 Jun 2025 18:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LOYzEFryhpWMDpLqFIhYynTTjYVsx1UHxgnT1pXFT10=; b=ZexhGV+Kmh5Mh87IfQxPw/qKeM
	+fdXdNKlpnNTm+8i0q+LJtC6zav6fJzLkR68ACvxRSodcWNdpVNvEW9MFpy70j066xUowmgXVxnsQ
	ZSSwlsozJKOtQQe4ZKbfXwCrR/8krp5IuANlkAHt7neAoy9ZnhVOOsuskxoYuv0XCH0acBk+O95vh
	aeJrv1AiXyAEtfMep6gkvtRT3oUQyQaRH507J4hzMZ/zAR3zvXZNPzNJNBO46zT84re2SYzZn63I4
	dTOnFN6/qg2r6dvxdaP+Fe+jzRvFsIFg6uiv9FW9qYyP4NsnBkPMSnPj6coiSnUeMWP4F3fq2OCLG
	OmE4qMyQ==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uT3CH-0002NJ-1N; Sat, 21 Jun 2025 20:44:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, ziyao@disroot.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] rockchip: Add GPU support for RK3528
Date: Sat, 21 Jun 2025 20:44:12 +0200
Message-ID: <2333578.IobQ9Gjlxr@phil>
In-Reply-To: <20250621090026.23293-1-amadeus@jmu.edu.cn>
References: <175045054807.1572438.8910024255365917623.b4-ty@sntech.de>
 <20250621090026.23293-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_114422_480828_4DF3D869 
X-CRM114-Status: UNSURE (   9.66  )
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

Am Samstag, 21. Juni 2025, 11:00:26 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Chukun Pan:
> Hi,
>=20
> > Applied, thanks!
> >
> > [2/3] arm64: dts: rockchip: Add GPU node for RK3528
> >       commit: 6b88b8a640fa5d2169e0ce47b88dc30727fc1105
> > [3/3] arm64: dts: rockchip: Enable GPU on Radxa E20C
> >       commit: 669080eb7f7c4720aa4e640a49f7490cd928cfcc
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/=
commit/?id=3D6b88b8a640fa5d2169e0ce47b88dc30727fc1105
>=20
> Should the gpu_opp_table node be above the pinctrl node?

yes it should. "o" before "p" :-) .

As tht commit was just from yesterday, I've amended it to move the
table to its correct position now.

Thanks for catching that.
Heiko



