Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1407C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cd4GYt7dt+rLooOE+rIxexrSys+8NzNZRAkEViR1/k=; b=Sp8NrX8yBPq1Ld2X+op1d6oVSJ
	+GIAeEqACTn1mZc9iQmW0MISlhxorf/2brne1UlPZUcFnxlu45j4ZW4Eli7U4Vvka2R0eubiQqIq2
	jaMRi3d2hAxj5zDgiaoxhLxiBziyQ40ZARFFS/PV9Y+2EYir27Ey/aeqjSFEocK5gmmaquL1zWdEj
	WfKFKt7qZBLmLubn4m+JK1ux3Q+ioYsagutuJ0raYakLruS1ZtTJkacUHgwNqD07ZHw1q92bfVUic
	9kFX8jSsYM4Ybqx4iXNxVh5ms2ZMPiEHeQ2xspPe6RdozDC1ZP0syEWOLFe71MiHr2StcLuMR0lUY
	Nflzd+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDOJ-0000000FSog-3BeM;
	Wed, 14 May 2025 14:47:27 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFD5F-0000000FPg6-1jOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 14:27:46 +0000
DKIM-Signature: a=rsa-sha256; b=suNo2YDFmgSLo4ydebgFiEaj4a8t4p6xEVC3Tf4bf94FgpmI/tTMVPLQtlIBD8vrv0QPFq9PCI/CRyPjrb9kvjBsnI18DGRVoTdLuRDJiUeYMO2M3Ab87JsKIKobP+Zh+UhUaZOl2txJvVXZPI2/Aq6xLsvenQTLP6oPwBPQTo0QrGaIS3IjD5z8Cnw+rUqvzyZOykD+qUvGQKH9rd90wguGp8uZKTdeRrnpOp+2ZRqyQWZenLWCJuGzAY6Q15WwnmLNIaOCFzXrSTj3BuPkswhc/2R7rNl9fKVI9lDtBNniE6OyydTePzY71m9xKbbIi/rqI9CIL6HsfX7n6hoZVQ==; s=purelymail1; d=purelymail.com; v=1; bh=3cd4GYt7dt+rLooOE+rIxexrSys+8NzNZRAkEViR1/k=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -502466249;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 14 May 2025 14:26:55 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 16:26:52 +0200
Message-Id: <D9VYC98LJTR0.LJXYC1H0BAKA@mentallysanemainliners.org>
Cc: "Kishon Vijay Abraham I" <kishon@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB PHY support for Exynos990 SoCs
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Vinod Koul" <vkoul@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org> <aCRXgpD0Ld2W4lHE@vaman>
In-Reply-To: <aCRXgpD0Ld2W4lHE@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_072745_520926_76A08C22 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed May 14, 2025 at 10:42 AM CEST, Vinod Koul wrote:
> On 20-04-25, 21:28, Igor Belwon wrote:
>> Hi all!
>>=20
>> This patchset adds support for the USB 2.0 PHY of the Exynos990 SoC.
>> This SoC has a combo PHY that supports highspeed, superspeed USB and
>> DisplayPort, however due to my inability to test the superspeed part of
>> the combo phy (device always enumerated as high-speed, even on the
>> vendor kernels/bootloaders) only the highspeed part is brought up.
>>=20
>> These changes have been tested and confirmed working (with the USB_ETH
>> gadget and telnet/ssh in a ramdisk) on a device from the hubble family
>> (x1s) and also a device from the canvas family (c1s).
>
> I am missing the dt patch, can you pls report the whole series if you
> would like me to review and apply this

Hi Vinod,

I've sent the DT series a while back (before resending). Usually I
propose DT changes through Krzysztof's tree. The patches are=20
unchanged (they will be resent unchanged when all usb and wdt=20
changes are merged).

Here is the patchset:
- on patchwork: https://patchwork.kernel.org/project/linux-samsung-soc/patc=
h/20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainl=
iners.org/
- on the mailing list archives: https://lore.kernel.org/all/20250217-exynos=
990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org/

Best regards
- Igor

