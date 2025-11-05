Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972CACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9crPKRB59IanVqzslNmNq1RKeIwTteojVe4iwV0zGu0=; b=urk8YAaAbutIovmtqwrtjhfOEM
	P5Xk7zpnXM8x2lLVFqCjuvWmSNT+xJNqBGnSZK8ckq41kQ7JgU158Lcrj7epGSkbYw2tWvmVxz6td
	4PimVEadKfBKXVAmqu7tDp8hnNbWCdyfGDFW4/NjI+CgPTVYAuUNXHZvcjEEH7rfAMP6nDra13Q2F
	zAMjKDkVIOZ76xrHc8y7lLDR/C5pWbwZC46WCRQTFqM4BaSF3hXGNLPz2AN+Dr97T2pka2f3RfpeQ
	ch9OWN4Zu5OQn7vQ7oyCCVp/7qPTStjBQ6w8kLKdL37byDQ8VGq7Zy7uBe+d84hAY7857XOz3gTCF
	m6tXb8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZrI-0000000DNte-1ZxD;
	Wed, 05 Nov 2025 09:31:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZrG-0000000DNt4-1kmW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:31:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 404E4447A6;
	Wed,  5 Nov 2025 09:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFAFC116B1;
	Wed,  5 Nov 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762335073;
	bh=/1quHRth7L4XkYnHL1XHj+8BCMcoW5MGEeKrzUKwfhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJfvml5fEdgBIeHYD7vaMyrMbHdEsmpIMoe5nBjM3r0/2wSEkRf258TN+4PQUyztk
	 U2xCS0NX+zWzqTICSVStcVmmkEGLTuHXPSKj+2+hM3UDsQvNWR8q3ObZVWFwsowyM0
	 cyGC4PTFUHt7ognM7kXaU5QOgl997IJemKvi+aGX9cCHvVAcbUCNfOjh3mg1fQI11y
	 noVVmiJylnGcUm3DdFMO4ArsPu5tpIXrFzqlLDJMqE5Epa0hvi5KePo7/CuFpvOTyQ
	 8ZGS4SrWARoCPyhMY4bJ4und9bh5S1KBOJkk4gGg/huAwI9EGFAeseNY3NzPFYPE3N
	 EYyIMiJuB1ajA==
Date: Wed, 5 Nov 2025 15:01:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, PCI <linux-pci@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>
Subject: Re: PCIe link training and pwrctrl sequence
Message-ID: <rz6ajnl7l25hfl2u7lloywtw7sq7smhb63hg76wjslyuwyjb7a@fhuafuino5kv>
References: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
 <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
 <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
 <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
 <CAGb2v65acHoO5025ZN7DhX0xVQf6JyHmUK3CB9UhnmTDDHq6vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65acHoO5025ZN7DhX0xVQf6JyHmUK3CB9UhnmTDDHq6vg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013114_496219_E20C2A5C 
X-CRM114-Status: GOOD (  37.93  )
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

On Wed, Oct 22, 2025 at 12:39:41AM +0800, Chen-Yu Tsai wrote:
> (recipient list trimmed down and added PCI & pwrctrl maintainers and lists)
> 
> On Tue, Oct 21, 2025 at 8:54 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Tue, Oct 21, 2025 at 02:22:46PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 21, 2025 at 2:20 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > >
> > > > > And with the implementation this series proposes it would mean that
> > > > > the perst signal will go high after the first endpoint pwrctl driver
> > > > > sets it to high and only go down once the last driver sets it to low.
> > > > > The only thing I'm not sure about is the synchronization between the
> > > > > endpoints - how do we wait for all of them to be powered-up before
> > > > > calling the last gpiod_set_value()?
> > > > >
> > > >
> > > > That will be handled by the pwrctrl core. Not today, but in the coming days.
> > > >
> > >
> > > But is this the right approach or are you doing it this way *because*
> > > there's no support for enable-counted GPIOs as of yet?
> > >
> >
> > This is the right approach since as of today, pwrctrl core scans the bus, tries
> > to probe the pwrctrl driver (if one exists for the device to be scanned), powers
> > it ON, and deasserts the PERST#. If the device is a PCI bridge/switch, then the
> > devices underneath the downstream bus will only be powered ON after the further
> > rescan of the downstream bus. But the pwrctrl drivers for those devices might
> > get loaded at any time (even after the bus rescan).
> >
> > This causes several issues with the PCI core as this behavior sort of emulates
> > the PCI hot-plug (devices showing up at random times after bus scan). If the
> > upstream PCI bridge/switch is not hot-plug capable, then the devices that were
> > showing up later will fail to enumerate due to lack of resources. The failure
> > is due to PCI core limiting the resources for non hot-plug PCI bridges as it
> > doesn't expect the devices to show up later in the downstream port.
> 
> Side note:
> 
> Today I was looking into how the PCI core does slot pwrctrl, and it doesn't
> really work for some of the PCI controller drivers.
> 
> The pwrctrl stuff happens after the driver adds the host bus bridge.
> However drivers are doing link training before that. If the power is
> not on, link training will fail, and the driver errors out. It never
> has a chance to get to pwrctrl.
> 
> I wonder if some bits should be split out so they could be interleaved with
> link management on the host side. AFAICT only dwc and qcom will rescan the
> bus when an interrupt says the link is up. Other controllers might not have
> such an interrupt notification. I was looking at the MediaTek gen3 driver
> specifically.
> 

This is a known issue. With the initial design of the pwrctrl framework, we
thought that the pwrctrl devices should be created without controller
intervention. But it is proving to be wrong as some controllers expect the
devices to show up before the PHY initialization, as yours.

We are working on a series (almost complete, just needs cleanup) that moves the
pwrctrl creation to a new exported API and allows the controller drivers to call
the API from whereever they want based on the requirement. This series also
fixes the above mentioned hotplug/PERST# issues by scanning all the PCIe nodes
in one shot and creating pwrctrl devices and making use all of them gets probed
(just the pwrctrl drivers, not PCIe client drivers) before deasserting PERST#
and then scanning the bus. This would require all the pwrctrl drivers to be
loaded before probing the controller driver (otherwise, probe deferral will
happen), but that's a valid dependency.

This will allow the PCI core to find all the devices during the initial bus
scan and will fix the resource allocation issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

