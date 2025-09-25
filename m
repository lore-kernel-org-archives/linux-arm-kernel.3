Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D68BCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+IOH6dQuWOD3Ie72CVJwyAHhq3krexKTz7aMeHSQgs=; b=VcT3MMLqviyvGhl4ZimLbwhXC8
	5uKrYUlixhpmSl9EQ1PCUYfpF6cHF91HhC4SOXwNpA8zOU0VAaOwQ8PwxcOTdV6gJixzosjVcI4M2
	xibLZ1bAKygiHrYTq1/5JIXnA1osH6t8TAytKNdkxw/HJCDAqpOi2ImcGKHH5IjngNi8H8Q3RjU6Q
	IOnbp73X9PVcoyDPYAKQRxbzbUoDR0EgBh2GNDqcfe5aYa6skli9s2LHeu3BETUPjB5U7F1pRdgFQ
	XGbDrqfXioZYryOltRX6xmWmlD0Nmvq8aYdA4chZwnuizrCn8xluLU4XTvjJ8e+dzNTVHawly5zWp
	/8PAP64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kEy-00000008YnG-1qYH;
	Thu, 25 Sep 2025 11:34:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kEw-00000008Ym0-1fuW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 11:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFBB760516;
	Thu, 25 Sep 2025 11:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C66BC113CF;
	Thu, 25 Sep 2025 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758800061;
	bh=ToDFatLMxcooz/Q3OYrcJoGIlf1v4yNR2bbGcNdcIJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsHBGqDMQeIX4YknUdxKSPDWqGcUvidkg+rT540MJzLhQSdpux4mJa/btTSTwxr0p
	 42LyXcB0+KTzq/K/X9BCrQaa1MPQn+CwIPIF1EN5iJVSCCwArllqj6nxYe0C4ikM5b
	 UMCNH3nznG1dlWbuoqVSgntdCF8tMRG2ORBeQHmvpOhIukEM9keS81o7gBMXFVRZ/X
	 UqRFpiN2/rBanaJtrsv92V6k1cfowhkzD0TxlZGdCPhUNQaldY/6LGMdpuKohlv+by
	 jXbzkUQIKj5LhrDFx87CgkDyYNXnaWqYRpDztgs1sPac+fuC9QOexsgYCncSRQMUwm
	 a+qdOhj0hTNqw==
Date: Thu, 25 Sep 2025 12:34:15 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 0/7] Initial Kontron SMARC-sAM67 support
Message-ID: <20250925113415.GD8757@google.com>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <DD1PD807DBY9.2FY81JFZ6EDAE@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD1PD807DBY9.2FY81JFZ6EDAE@kernel.org>
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

On Thu, 25 Sep 2025, Michael Walle wrote:

> Hi Lee,
> 
> On Fri Sep 12, 2025 at 2:07 PM CEST, Michael Walle wrote:
> > Now that the PMIC support is there, we can finally, upstream the
> > support for this board. Besides the usual device tree, this
> > patchset contains the support for the on-board house keeping MCU. It
> > make extensive reuse of the drivers for the former SMARC-sAL28
> > board. Besides different hwmon sensors, all the dt binding patches
> > will just add a board specific compatible (in addition to the old
> > sl28 compatible) to make any future board specific quirks possible.
> >
> > I'm aware that there is a patch [1] which moves the sl28cpld MFD
> > schema to a different directory. Once that patch is merged, I'll
> > repost this series. But I already want to get some early feedback.
> >
> > v2:
> >  - dropped patches which were already picked up
> >  - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
> >  - separate driver for the hwmon, add missing hwmon documentation,
> >    thanks Guenter
> >  - split the DT as suggested by the SoC maintainers
> >  - add missing copyright and license to the overlays, thanks Andrew
> >
> > Michael Walle (7):
> >   dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
> >   dt-bindings: mfd: tps6594: allow gpio-line-names
> >   arm64: dts: ti: Add support for Kontron SMARC-sAM67
> >   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
> >   dt-bindings: watchdog: add SMARC-sAM67 support
> >   hwmon: add SMARC-sAM67 support
> >   arm64: dts: ti: sa67: add on-board management controller node
> 
> Would you take these two patches
>     dt-bindings: mfd: tps6594: allow gpio-line-names
>     dt-bindings: watchdog: add SMARC-sAM67 support
> 
> through the MFD tree this cycle? If they make it in, there wouldn't
> be any more dependencies for the next cycle for the actual device
> tree.

Applied both, thanks.

-- 
Lee Jones [李琼斯]

