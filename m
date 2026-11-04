Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BC606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lj8c8H/v;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvTm5R0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HM1X62uqqSW8+dQdfDbaF9vMh4Xi6tzQU0GrJjMKdtg=; b=lj8c8H/v07NxxhvCGO2pDCRzCv
	DnGiFkWIUSeqaexgf5gYCOo+H6P7Cd7RPtG5gw+DCqOm7hQQ7V4cRdHRmFUkRWKS1N3yG0LtjqemP
	Qna5q93e96zRAGdmCbbvKgjrxD7uHFxd62EmoDxcwONBmmdb+IXTxTMvB1OxHLgu2Bqjn6NTEPTC+
	dufWHwo4DGBnqEDQPHLCvrm0dqUR0E+RaAIIKubkjIwfB+hH01NibKxhsDVHnuwJlL+5JITZxifma
	ILXDG44Wq6GS8zuFO8ZPZ12wDxgCg+SiiRwG9CjVFRW6s+neoAtV51KZFymh/npOnpFBzv5tt2d39
	ABhVL79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeT7-000000069OB-0SP9;
	Wed, 04 Nov 2026 17:08:13 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeT1-000000069MY-2NIE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793812088; x=1825348088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ft8VhpNUkwAoJ7C9+JE583msFXwVNKOM2x9mwVzGgq4=;
  b=YvTm5R0snyRyUa0/zKz4x+hZp2SuKFh8UigZycDNenL1viGBmk7/xcDp
   1Fy9MqEozFP3l35dAyyEs/b/dM/uRIIqYAxr818fwWqpoiR6wXxvNnYOj
   Q4abgHHjJ5BfeT7PY3SK7P9CKWrG3/DqB5O1NhqrinUOK/Y2Ro6yTLJLH
   DQm19zHT03jFc5vVCzKxtgeX/y9m5Oqnz/qVNpy+6AUZO24m8yA/nyM1i
   bEHJcUL5wZJ4ZRwKcoQ5eSSjSCty99/b7A9pMYH6rbIZE6l9zv46OuECM
   TYgoKGXhwGsdNUspYq8DbR82bgAIH/EwaahCvpO4O6vxaeLTP4Mi5z/Ek
   g==;
X-CSE-ConnectionGUID: m5Y/af1uTCGa1bTp2cdIbA==
X-CSE-MsgGUID: vU7wv57nRkiPagS0ZeJy7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2483179"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2483179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:08:07 -0800
X-CSE-ConnectionGUID: hp/hoIyeSCK3mj/fpTGilw==
X-CSE-MsgGUID: npWrMFopRXuq3g6GQJvZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6781883"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:08:03 -0800
Date: Wed, 4 Nov 2026 19:08:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <autmcaraWcXIoRfZ@ashevche-desk.local>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090807_619050_90464763 
X-CRM114-Status: GOOD (  55.85  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 05:28:18PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Wed, Nov 4, 2026 at 3:41 PM Thierry Reding <thierry.reding@kernel.org> wrote:
> > On Wed, Nov 04, 2026 at 03:11:09PM +0100, Arnd Bergmann wrote:
> > > On Wed, Nov 4, 2026, at 13:42, Thierry Reding wrote:
> > > > On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote:
> > > >> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> > > >>
> > > >> Where is the ACPI binding documentation for this driver, and who is
> > > >> responsible for reviewing it?
> > > >
> > > > Sorry for the late reply, this fell through the cracks.
> > > >
> > > > Admittedly there's not much of a formal process here at all. Anything
> > > > I've received up to now seemed to be fairly straightforward support
> > > > extensions like this where the ACPI tables basically provide the same
> > > > information as the DT via standard resources like register ranges.
> > > >
> > > > I suppose for anything beyond this, we'll want better documentation and
> > > > broader review.
> > > >
> > > > Is there anything in particular that you're looking for? Should I guide
> > > > people internally to always Cc linux-acpi for anything that concerns
> > > > ACPI?
> > >
> > > I don't know, I'm also still learning about how this is done, I
> > > was hoping that there was already an established way.
> >
> > Yeah, me too. Maybe Rafael and Len can provide some guidance here.
> 
> I cannot speak for Len, and he has not been actively involved in the
> maintenance of ACPI support in the kernel for several years.
> 
> As far as I'm concerned, the code maintained by me is mostly located
> in drivers/acpi/ (as per the relevant MAINTAINERS entries) and it is
> mostly generic code related to ACPI support.  I generally don't
> maintain device drivers using ACPI support except for the ones under
> drivers/acpi/ which mostly bind to devices representing interfaces
> defined in the ACPI specification (which is kind of a special case).
> 
> But there is more.  There is ACPI support code in other places (like
> for instance gpiolib-acpi maintained by Andy and Mika, or platform-x86
> drivers maintained by Ilpo) and there are experienced kernel
> developers in the ARM ecosystem with quite a bit of ACPI-related
> knowledge (Hans, Jonathan, Sudeep, Lorenzo - all CCed) who can be
> reached out to for guidance (and arguably they have more experience
> with ARM platforms than I do).
> 
> > I don't know how ACPI on more traditional platforms works, but I imagine
> > that it's a lot of the same anyway, except perhaps that people have more
> > experience with the spec and today might be doing a good job already.
> 
> If you have any specific questions, I think I should be able to answer
> at least some of them, but I'm afraid I cannot give you general
> guidance on how to do ACPI support in device drivers that would be
> universally useful.  Different drivers have different needs.
> 
> There are things in ACPI that are not present in DT and vice versa.
> It also depends on what bus types we're talking about (platform vs PCI
> vs USB etc).

And don't forget the big player(s) such as Microsoft that from time to time
creates an "extension" to the ACPI (in means of additional tables or how some
of the existing data should be interpreted if it's not clear from the ACPI
specification). For instance, above mentioned USB ACPI support for some cases
heavily relies on the MS "extensions". Or earlycon support for ACPI is based
on MS defined SPCR table. And so on...

> > > Having a review done by the ACPI maintainers would definitely
> 
> So as per the above, who exactly do you mean by "ACPI maintainers"?
> If you mean "the people maintaining the code in drivers/acpi/", that's
> just me and quite frankly, I'm not sure if my review, specifically,
> would be super-useful for driver development (the fact that my review
> bandwidth is almost completely saturated nowadays aside).
> 
> My recommendation would be to ask other people within the ARM
> ecosystem who have more experience with ACPI for help.
> 
> > > help from my point of view, but I'm not sure whether they are
> > > set up for that, in case there are a lot of new drivers.
> 
> I am not and had I been trying to do it, it wouldn't have scaled anyway.
> 
> > I think platform maintainers need to be a first line of defense here
> > since they sit at the intersection of a lot of this. At least that's the
> > case for me. Also, I'm eager to learn how to do this right, but I'm
> > often at a loss of where to start. The spec is a bit daunting, and then
> > there's various extensions, too. Maybe the AI genies can help me ramp
> > up.
> 
> My advice would be to reach out to people within your ecosystem in the
> first place.
> 
> > > I assume there is a knowledge gap in both subsystem maintainers
> > > regarding ACPI (certainly this is the case for me for drivers/bus,
> > > drivers/firmware, drivers/soc, etc) and ACPI maintainers regarding
> > > many of the subsystems that we support with DT.
> >
> > Agreed. I've seen some patches where the ACPI support was as simple as
> > just adding an ID table entry and the rest was all standard, but I think
> > once we move beyond standard resources things might get a bit more
> > complicated. I imagine that ACPI may not even have specs for certain
> > aspects that we currently handle in DT...
> 
> That certainly is true, but the ACPI specification is under active
> development and pieces that are missing can be added to it.  There is
> a process for that in place and ARM people take part in it.


On top of the above in Linux we also developed some "extensions", for instance
how I²C muxes are described, or how some multi-functional devices are being
enumerated. These specifics we usually document under
Documentation/firmware-guide/acpi/ (see i2c-muxes.rst for the mentioned case).

-- 
With Best Regards,
Andy Shevchenko



