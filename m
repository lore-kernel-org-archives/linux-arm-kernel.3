Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7658EEC1EAD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvN0dK9YPTZR37dmblW/CZHdfZ6AVyfoh9CzpLsB8A8=; b=I+zvv+DDDpvkK792n0/37hhJqj
	sDmWqz2XP/emOXG/VyaGYXUm+GwBS8Mh/qGYWMQP406Ej2sjrYpdN/VE9/EHZyvfK+e6ILinqVY9+
	sUVabluXfQDMVpJtJh+rsDZ5Wib/SXOBk68Fqh8jffVFpqxw1qHAEPK+GbwWRLDhIUir1yCyHDpnD
	ppdhYmQXiENYFZbQTq8OTXRC+PZZAP1y0pTveqrgmKFdwfYgawWt/N/5Ks9GgvEQMQ+CB4KTPsTro
	RN3kf1jT8XExRYe8pXS/OAEZ/u+GD88O5L5BIHRxjDmgPsSrCNgcvHjggWYrF9VinXfggjszY/HXu
	L3rsdRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyMy-00000009s6S-1oes;
	Thu, 05 Feb 2026 12:22:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyMw-00000009s67-02TS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 12:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C3A9405C0;
	Thu,  5 Feb 2026 12:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DECC19423;
	Thu,  5 Feb 2026 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770294116;
	bh=VEFqDyWByreSKcWhQPFzxYfUI9+flyLzR/sbfbE5cLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmN8RPHbhOadUZn3ms2KlCtIRsVfvFZX/FwrO2nuwv5S0JpevKISrBgWRkbMHe1io
	 KQyR4ouAsqhTD6kd0A2qPb56ENiPTXpND0obsMSBLUXgoo47cblcTxxID7I5cEc1vr
	 124PIaG6ARtvJyo4qZNlP94fbA4TDScPry5QRpvLRNL4svfYPXYqM/3HZc2n5d7nFC
	 CSaCBcXGd2d6SPJSYfTTi6A+C6lzpC+Rx15GlDK9D+lu9E3CTbV3/IPNo56ya4ft4E
	 dZ926gKZ1bdGcup9e80MYT5twVdP3cCukLI+4GYfu+0jDJnxkvZQ4WbY6ubtJYWGtP
	 NoIjrtLUmQJVA==
Date: Thu, 5 Feb 2026 12:21:51 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Debbie Horsfall <debbie.horsfall@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <20260205-wooden-cheerful-barracuda-0de1d2@sudeepholla>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
 <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
 <20260130-light-piquant-termite-fcbec4@sudeepholla>
 <aYHmDTboOtkgac00@pluto>
 <20260205-intelligent-intrepid-robin-df42bd@sudeepholla>
 <445035bb-71be-4751-a014-9ca67b1c0cb4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <445035bb-71be-4751-a014-9ca67b1c0cb4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_042158_078558_8CC315BB 
X-CRM114-Status: GOOD (  21.42  )
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

On Thu, Feb 05, 2026 at 12:24:58PM +0100, Andre Przywara wrote:
> 
> 
> On 2/5/26 12:08, Sudeep Holla wrote:
> > On Tue, Feb 03, 2026 at 12:11:57PM +0000, Cristian Marussi wrote:
> > > 
> > > All of this madness was the best way I could find to address the problem
> > > of supporting such new unidirectional mailboxes in the SCMI while NOT
> > > breaking backward compatibility in the absence of mandatory naming from
> > > the start.
> > > 
> > 
> > You can attribute this to my expecting an overly ideal scenario with
> > bidirectional mailbox channels across all platforms using SCMI. At the time, I
> > did not anticipate the range of configurations that rely on unidirectional
> > channels.
> 
> Would it make sense then to add mbox-names parsing to the code, to
> accommodate new users? There is precedence in some drivers for introducing
> xyz-names for clearer and unambiguous resolution, while still falling back
> to some legacy, fixed associations in case the names property doesn't exist.
> 

Yes, we can do that; however, my concern is that if RX and TX are swapped, the
names would at least make this apparent. How should we handle shared memory
(shmem), which does not have names? I may be overthinking this the current
logic that checks the number of cells (mboxes and shmem) is likely sufficient,
and we can infer an ordering from that but I would still prefer to avoid
adding unnecessary complexity/mess.

-- 
Regards,
Sudeep

