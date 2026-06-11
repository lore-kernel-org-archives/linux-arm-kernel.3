Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy3HEPhYZD7bIlmZpQj2exwmeWCZxbjTt4XXdiBMCvw=; b=hKE7+z5FIgVR8V0ff8UTOn/xjI
	/jk6x46boDIMG/8ekEinYBTv0t7GvgDYgUUEI6KmYaLp7L1M48pP4zZobcNxokI2zfIMBV34yL+tE
	xnyGouqaDLLo7N/35d0exj+SV7CV67dJ/ma0rMlZ4aU7V8qd6ZKI6ISjbQnVsuEEjnBnUlpkylGEh
	jMLVerTt4Iqu/0QhF5TzKa6ZPbuBEgF9uQ/ZOShe3X1x9mv2N3i29fg+4afTC9o4McCqBwOmBRPxB
	Un6j7Hm0wKS7I92hS9Pn5sVRxej/4NLoYdKmquVwn+5IJhRSaoz56DaXmJ0uKt2gr7nwgTJipVjNC
	Lub6OoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiU3-00000009mLt-1Dap;
	Thu, 11 Jun 2026 16:42:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiU2-00000009mLl-0dkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:42:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45AD6600AF;
	Thu, 11 Jun 2026 16:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D104A1F00893;
	Thu, 11 Jun 2026 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781196141;
	bh=sy3HEPhYZD7bIlmZpQj2exwmeWCZxbjTt4XXdiBMCvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DK41nXFWpbBA5b/YjFCBpAsWZ7RKjzpM4n1YymbqWSHskDYdtdaqNMUdb96bIdrwk
	 pZfqo7AxONa2HGv5StoFWjSZN8hcy0CTcDt8B34i+Gx50ZH9vbJDyVeh19BwfrSbVK
	 lzTnsyShyBLjblGLMSoqZ5uh5N16OFPXKsQu0DqWYxqvmg+7sZTm5D0+Zkj0vnr8/O
	 grzW+p+Za0InJZRBdvk64lCx8jCy6mUzz7tI1LD9seZFvrG38gviha2xj5gFhhwJ0I
	 53XZBMGe2OM+XXRHlsZmooLO74H6pzF6MBJh2E232LARjxoSGvYrLJmuMJefPx80SB
	 Y4zoePvXDEd7Q==
Date: Thu, 11 Jun 2026 17:42:11 +0100
From: Lee Jones <lee@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
Message-ID: <20260611164211.GD1212816@google.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
 <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
 <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
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

/* Sashiko Automation: Reviewed (0 Findings) */

On Thu, 04 Jun 2026, Shivendra Pratap wrote:

> 
> 
> On 25-05-2026 15:04, Shivendra Pratap wrote:
> > 
> > 
> > On 22-05-2026 14:38, Bartosz Golaszewski wrote:
> > > On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
> > > > 
> > > > On Thu, 21 May 2026, Bartosz Golaszewski wrote:
> > > > 
> > > > > On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
> > > > > > 
> > > > > > > 
> > > > > > > I suggested it because of its flexibility. The alternative I had in
> > > > > > > mind is something like a new field in mfd_cell:
> > > > > > > 
> > > > > > >      const char *cell_node_name;
> > > > > > > 
> > > > > > > Which - if set - would tell MFD to look up an fwnode
> > > > > > > that's a child of
> > > > > > > the parent device's node by name - as it may not have a compatible.
> > > > > > 
> > > > > > Remind me why the chlid device can't look-up its own fwnode?
> > > > > > 
> > > > > 
> > > > > Oh sure it can, but should it? I'm not sure it's logically sound to
> > > > > have the child device reach into the parent, look up the fwnode and
> > > > > then assign it to itself after it's already attached to the driver.
> > > > > This should be done at the subsystem level before the device is
> > > > > registered.
> > > > 
> > > > Leaf drivers reach back into the parent all the time.
> > > > 
> > > 
> > > But drivers don't generally assign firmware nodes to devices they are
> > > already bound to. This is racy as in probe() the device is already
> > > visible to the system. There's no synchronization of device property
> > > access - properties are assumed to be read-only for a registered
> > > device.
> > 
> > thanks Bart/Lee. Any pointers to take this from here?
> 
> Hi Lee,
> 
> To take this patchset forward, it would be helpful to get your views on
> fwnode based addition in mfd-core. Maybe, a member like "*named_fwnode" in
> mfd-core and then a lookup logic, or any alternatives?

Can you please make your best pick and resubmit the set please?

I'll comment on a fresh set with fresh eyes.

-- 
Lee Jones

