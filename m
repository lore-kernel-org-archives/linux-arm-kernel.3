Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346AEC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fQjQyKampcGVbQAmuUr0Em07LtfcNck2J9uJo+WzMo=; b=KludrJ2ReDzOnzDrQC0kYCZX5Z
	PzjRIaxrsSK66jz/TLJxIVa2iLmWwYeSERsQinkcNzSAvcGmVSRmQTltj2SOXrlL8ubDyoxf68eGs
	K2gzWyeDWDloPA1MCIkrBAA2kIvi+aCZodLcQ8zGo8ABZBUP3Ljh1qttZfdJdpdZba6flBPzwBmPN
	IT7mdMAC1/2TGo0pmwQ5dEAKyyu4Gon+ozDYIdndlSQcgsHVqbbcB9xditgTxP6TaGn4ZwKA72AIU
	1klFDxPGS4f213NuCrIdcVPIzjIS3Gfdl9dPsj2smuzbA9DUBr+Owm6TrW1ktalbufmRkKOTbMT0Y
	1fSZyDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Za2-0000000EihJ-180O;
	Fri, 18 Sep 2026 14:28:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Za0-0000000EifX-0Yry
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:28:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0954F1C00;
	Fri, 18 Sep 2026 07:28:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40A5E3F86C;
	Fri, 18 Sep 2026 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789741719; bh=hv+0y+A4oUAo0uo5dyEK8zc0I6j3cla+Yg8qcL1PnSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8a3wVZdwqL44ccM5tzVyzAt6HGTdGjCOHTcGWkUshTyRY821N3vwcMkh+DlOz6c9
	 lG8BomnxIG+cwehaFLU6kvsosZLvlz086w3863jNSI+B4QAbBRUncc7xB2gm4LelS4
	 FxFEnDCQ/hg51yrBq3fkgRcFl6GwV6IODLnftLGE=
Date: Fri, 18 Sep 2026 15:28:31 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <aq1KjzpIGuSpsPWx@J2N7QTR9R3>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-3-andre.przywara@arm.com>
 <20260717-bipedal-courageous-alpaca-4fb54d@sudeepholla>
 <84f0862c-5333-4d53-b882-79b8e4c362ed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f0862c-5333-4d53-b882-79b8e4c362ed@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_072844_240920_6418EADA 
X-CRM114-Status: GOOD (  24.05  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 11:13:19AM +0200, Andre Przywara wrote:
> On 7/17/26 11:03, Sudeep Holla wrote:
> > On Mon, Jul 06, 2026 at 03:44:42PM +0200, Andre Przywara wrote:

> > > +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
> > > +static const struct fw_image_uuid {
> > > +	const char *name;
> > > +	const char *uuid;
> > > +} fw_images_uuids[] = {
> > > +	{
> > > +		.name = "TF-A BL31 runtime",
> > 
> > This doesn't make any sense to me. Why do you want kernel to assign
> > some random name base on UUID. Userspace is well place to deal with
> > UUID and give it any fancy name it wants.
> 
> Well, the whole interface is quite usable without any accompanying user
> space tools, so just from the shell, but then identifying  firmware
> components by their GUID becomes a major pain and leaves users completely
> clueless.
> And while we indeed will never be able to fully catch up with all the
> firmwares out there, especially not with vendor specific ones, there are
> some standard firmware components that I think warrant some name.
> TF-A BL31 above (and TF-RMM) are good examples: these GUID is already in the
> mainline repository, and since BL31 is also an LFA agent, it's quite likely
> we encounter this component. Even when vendors typically use downstream TF-A
> ports, those GUIDs would stay the same.
> So yes, it's more opportunistic than complete, but I think it would help to
> identify at least those well-known firmwares. Anything not named then would
> use the GUID, and can indeed be resolved by (a yet-to-be-written) userspace
> component.

Sudeep is right; this is not a good idea.

Remove the table and just expose the UUID of the image. Users can map
that to a string in userspace if they need/want, and that'll work
regardless of the vintage of kernel they're using.

I appreciate it might seem helpful to expose a name where we know it,
but overall it creates more problems, including (but not limited to)
compatibility issues, needless busywork to add entries (and arguments
about what is approriate to add), political issues when some project
naming changes, etc.

I am not going to Ack this with the name present, and I suspect neither
will Sudeep.

Mark.

