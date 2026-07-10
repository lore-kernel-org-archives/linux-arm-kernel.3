Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E78C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVSlTfeD5BHl+GRA9mEIc/4kG/WjY5gCS/LshAAC+Q4=; b=Azo9ah6Nik23rKdimv6bXDS3qI
	1DPPtjEXiSjMs15ak0KQRzmBRKDniQaKmVLW1l0xx+hw9KjYeCb+cbyYe8CUHW1i9QZnaxEDuoaTO
	3ckDEo7Q/fJkFtUM+LAymOdH9FBFuI7qH2SyvHRe1Bz5Ku8RkN68hfzjKKuyc8QqufivTNVyEf2lc
	xfx+UtQoy5pjy0TVNqUv+M/HzPtoFYqFTNGrQvPJTIRhHteXHLACCzEE0/UcJjxNlW2iZz6waKspd
	SP+qb8qgNQWwvfIyjHeP/pU0wcTZIPb1Ydwg4nypISDX9FLb8FW7EwMZ2gF/j/D08lDClcy/jgIJR
	KWwOjxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi74l-00000004VuH-26Ca;
	Fri, 10 Jul 2026 08:59:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi74j-00000004VuB-24a9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:59:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 192E041697;
	Fri, 10 Jul 2026 08:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8721F000E9;
	Fri, 10 Jul 2026 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783673953;
	bh=CVSlTfeD5BHl+GRA9mEIc/4kG/WjY5gCS/LshAAC+Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IKhLW3fT6orMnTU1cwoiIfWK4bgn1LdEED5oWv50CCfHaVe8qgo6eYDeGHu2BctBl
	 IJsGA9DzhqEpXt5Wjeql5EAtBZzfkBMPykg71PinzYNhaiLtzRJsA87tra5b3Cyg4R
	 Q+/eeF+UJCHFkQXYvozwBac7xayvBSF202VvsriDRYTTZ4tjeIVzFUUrcI7lY9TKUn
	 bYRZHekZ/vchzYYCskcm3GsW4LmNEmsSDNlrrx4jxqKHm4Vf9d2mXeLFI6P7yCB+Hy
	 IRf1jv45MJCjXXX4cas8jHZ+lTBJ2H+Eq3lSEX6tIcCYjXik+w8F2NgCWz21P++Gha
	 BqK/EUaeJMFIg==
Date: Fri, 10 Jul 2026 09:59:04 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
	Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	David Lechner <dlechner@baylibre.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Message-ID: <20260710-romantic-dashing-gecko-e31a98@sudeepholla>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
 <77110e77-941d-4173-b2f5-6f3cf4858339@amd.com>
 <20260710-lemon-pogona-of-wind-b3a003@sudeepholla>
 <5f5e8341-dbcc-4467-976e-35d007ae148e@amd.com>
 <20260710-macho-pristine-tanuki-b0d3ce@sudeepholla>
 <6f823bad-014c-4ac3-9e75-9edcdf28f7b8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f823bad-014c-4ac3-9e75-9edcdf28f7b8@amd.com>
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

On Fri, Jul 10, 2026 at 10:46:15AM +0200, Michal Simek wrote:
> 
> 
> On 7/10/26 10:38, Sudeep Holla wrote:
> > On Fri, Jul 10, 2026 at 09:42:09AM +0200, Michal Simek wrote:
> > > 
> > > 
> > > On 7/10/26 09:35, Sudeep Holla wrote:
> > > > On Fri, Jul 10, 2026 at 09:03:32AM +0200, Michal Simek wrote:
> > > > > 
> > > > > 
> > > > > On 7/9/26 17:56, Cristian Marussi wrote:
> > > > > > On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > > > > > > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> > > > > > > SCMI server from different architectures than ARM that's why remove
> > > > > > > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > > > > > > rename folder to reflect it.
> > > > > > 
> > > > > > While I understand dropping the dependency on ARM (I always wanted to do
> > > > > > that and test if it worked at all on some otehr archs with QEMU), I am
> > > > > > not sure about the whole renaming party ? why is needed just for
> > > > > > cosmetic reasons ? it is at the end an arm originated protocol so I dont
> > > > > > see it as a being wrong to be named as such even though used by other
> > > > > > archs...I have not really strong opinion on this...
> > > > > 
> > > > > I have been in CC on U-Boot RPMI patches which got to my attention because
> > > > > I don't want to have another interface for MB-V(riscv-) running in
> > > > > programmable logic and have another server in the system doing the same
> > > > > thing.
> > > > > 
> > > > 
> > > > Ah that's interesting. I wasn't aware of that. I still agree with the move
> > > > in principle, but how does that align with these:
> > > > 
> > > > drivers/clk/clk-rpmi.c
> > > > drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> > > > include/linux/mailbox/riscv-rpmi-message.h
> > > > drivers/mailbox/riscv-sbi-mpxy-mbox.c(Should be fine as it is just transport)
> > > 
> > > I am having separate discussion on u-boot mailing list about RPMI and it's
> > > usage on non riscv architectures because one raised argument was that it is
> > > community driver spec compare to SCMI which is owned by ARM. But IMHO only
> > > for riscv.
> > > 
> > 
> > IIRC in LPC 2024, we did discuss opening up SCMI so that RISCV could use it as
> > is instead of copying quite a lot from SCMI for RPMI in some closed groups.
> > 
> > Here is the summary we got from couple of RISC-V vendors at the time:
> > "
> > RPMI is comparable to Arm SCMI, but it includes RISC-V-specific services such
> > as HART State Management, CPPC, Management Mode, and RAS Agent. The SBI MPXY
> > extension enables secure and non-secure system partitions to exchange RPMI
> > messages, allows an M-mode RPMI transport to be shared with S-mode, and lets
> > hypervisors virtualize RPMI for guests or VMs.
> > 
> > RPMI development is already well advanced, with much of the client-driver work
> > implemented in OpenSBI. Supervisor software can access selected RPMI services
> > through SBI MPXY. A permissively licensed reference implementation, librpmi,
> > is also available for platform vendors.
> > 
> > RPMI was created after evaluating Arm SCMI, mainly to support RISC-V-specific
> > requirements.
> > "
> > 
> > I didn't pursue it any further following some of these followup discussions
> > post LPC 2024.
> 
> interesting. It looks like that they even didn't try to ARM about it.
> 
> > 
> > > > 
> > > > Now I feel we need some alignment before making $subject move.
> > > > 
> > > > > Based on that we had discussed about it with Vincent and Souvik (we missed
> > > > > you there) about using SCMI on non ARM platform and both of them didn't see
> > > > > the concern to be marked as ARM only protocol.
> > > > > Truth is that some of protocols have ARM in description, file names, etc but
> > > > > some of them not. That's why I think it is good time to sync it up and
> > > > > enable
> > > > > running this protocol on other SOCs.
> > > > > 
> > > > > > ... my concern really is ... wont this full scale rename simply generate
> > > > > > a lot of un-needed churn for future fixes and/or backporting ?
> > > > > I don't think it is going to be a big problem because it is just git mv
> > > > > which git is able to gracefully handle.
> > > > > 
> > > > 
> > > > Otherwise it may end up being unnecessary churn though I completely agree
> > > > with the git/backporting aspects. Just don't want to churn things up until
> > > > we have some plan and further changes/users of this move.
> > > 
> > > As I wrote above AMD/Xilinx platform with SCMI server where ARM RPU/APUs
> > > (with multiple VMs) and Microblaze-V in programmable logic acting as
> > > separate agents is going to be the first user. And for being able to run
> > > SCMI on Linux running on Microblaze-V I need enable SCMI on non ARM
> > > architecture.
> > > 
> > 
> > Ah OK, if the plan is to just use SCMI as is and having "ARM/arm" name is
> > a blocker, then sure we can get that done. Hope you are aware of and already
> > considered some of the RISC-V specifics listed above and ruled out any of
> > those as concerns to use SCMI on RISC-V platforms.
> 
> I know that we can't maintain SCMI and RPMI servers running on the same chip
> doing the same things. We don't have space for it and make no sense to
> duplicate testing on it too.
> 

That is very valid and compelling reason to re-use and agree with your
assessment. If you can make it work, go for it 😉.

-- 
Regards,
Sudeep

