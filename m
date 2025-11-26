Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F3CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QZhzai1uw18CsGR4KdqOm55dcMMZW2qGctES0YMIT9c=; b=qvshATP5GmW/u3
	y4Jt6ungjvxG/7JhbHZkDJNmk6kpkyJnaMGvKo30P3gnxeIG5CXFfN4Tstylo/rArmUG1gwJPEqx2
	aSpv2w5m+4jiW5O6mTNc80E1eU/BaZgVP5MXr/kROVdDiFKGw9X23PwDteLZjfRK4cd7Q3FiaFmbJ
	0eZqAgOwoXm5Ndb+VFYZ1VF+40JFBRM3i7+urpTbKYPUJd5e4dUlQWQW8/9T4SXfL2O8DEFoKX+dr
	01+p5dbvW7zDjATVZr+lslvxnHERaGgRAyWcuxjyYGKMKIpe+bhVeIkbbhMFLe12GUz6gI/W+63T6
	anWx1bz/TUac82a1m00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONd0-0000000FhNK-3bP4;
	Wed, 26 Nov 2025 22:04:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONcy-0000000FhNC-1YYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A36760177;
	Wed, 26 Nov 2025 22:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E346FC4CEF7;
	Wed, 26 Nov 2025 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764194683;
	bh=7MXVz5XbnQiJ9KSKfpDXjWyTcuClQu3/RSwbYgSfr2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YshyvfpKSMWr2sZ8GR9EoUjTGOc5cNdU0AmRwfbctAyMDgvRjFT65a9zm0aECjeNj
	 N/ZOOPXmGCQO+LMVUR5uhMspQAWJnJvNlDFQwPj05tttTk8CxdLuUKup7Ihs2srvE/
	 nZi+oScmbNJxwaA6ymd1QkR/T3lJWKGHoM88Fz7ZbGLZ2lE9rKEXRhbYLgn5JajrrO
	 EidPsBzyNhf4FfEDBhWemk0u+sgAUQuCOXzmMll/HSUS59ctKOzjjHavYcV+1uT7JG
	 IerTyE7fOyL8mWO2Cnj39DAa8Nrhx+9YAe52JnpsjwQSt8bZafwxXOPpef7BGkXIEe
	 RzQvxVhda2s3Q==
Date: Wed, 26 Nov 2025 16:04:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	cassel@kernel.org
Subject: Re: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe
 driver
Message-ID: <20251126220441.GA2853437@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8170513-e08a-46ff-9fb2-310f3e9c1ba4@oss.nxp.com>
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

On Wed, Nov 26, 2025 at 03:47:46PM -0600, Ciprian Marian Costea wrote:
> On 11/26/2025 3:41 PM, Bjorn Helgaas wrote:
> > [+cc Ciprian @oss.nxp.com, see email addr question below]
> > 
> > On Fri, Nov 21, 2025 at 05:49:20PM +0100, Vincent Guittot wrote:
> > > Add a new entry for S32G PCIe driver.
> > > 
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >   MAINTAINERS | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index e64b94e6b5a9..bec5d5792a5f 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3137,6 +3137,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
> > >   F:	drivers/pinctrl/nxp/
> > >   F:	drivers/rtc/rtc-s32g.c
> > > +ARM/NXP S32G PCIE CONTROLLER DRIVER
> > > +M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> > 
> > I'd be happy to change to
> > Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > per https://lore.kernel.org/r/f38396c7-0605-4876-9ea6-0a179d6577c7@oss.nxp.com
> > 
> > I notice that most nxp.com addresses in MAINTAINERS use "@nxp.com"
> > addresses, not "@oss.nxp.com".
> > 
> > Let me know your preference.
> > 
> > Bjorn
> 
> Hello Bjorn,
> 
> I prefer "@oss.nxp.com".

Done, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=c7533471578e

