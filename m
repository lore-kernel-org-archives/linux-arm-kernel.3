Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3495E87821
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vGLMHKvFscghPzyWbOi+twGebsxyAmPI6wzOy1CPNA=; b=KWgu4rzzZ+he64uPOImjM6Ujiv
	SeLYAHgnjZFBskZepolJh/QaK8wgN2lLYntw6EVO+CTXMUNsrQEp+dAWdIfli/0ZUsTMJE/ER0e7K
	c+/r+AfZDaDwsPm2oGVV6Omu08+VOcu+loijkaI4dM/+4yBWEyV66JI1pi/GPJevRtzAxIpM3Jgt0
	3T06TOsMcA/B+GpX7CEt6ytqea8ela+OpVP9cdU2XA2cq6wAQeI274uCKA8sTFBVPcH1bU1l2MLaV
	iFCUWgSjhtipsC1QNz8VKyTZcE1Zax/haglCBHs8DbqlKkoxkvEEB9Zkz7qrzu3t/AaCC+3GdpUX3
	WpXgVvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFGP-00000006aEE-0Jei;
	Tue, 03 Feb 2026 12:12:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFGM-00000006aDk-0lBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 12:12:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CAB0150C;
	Tue,  3 Feb 2026 04:11:59 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00BE63F632;
	Tue,  3 Feb 2026 04:12:03 -0800 (PST)
Date: Tue, 3 Feb 2026 12:11:57 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Debbie Horsfall <debbie.horsfall@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <aYHmDTboOtkgac00@pluto>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
 <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
 <20260130-light-piquant-termite-fcbec4@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-light-piquant-termite-fcbec4@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_041210_371693_DB243140 
X-CRM114-Status: GOOD (  24.27  )
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

On Fri, Jan 30, 2026 at 12:34:31PM +0000, Sudeep Holla wrote:
> 
> +Cristian(in case I am talking no sense)
> 
> On Fri, Jan 30, 2026 at 11:31:25AM +0100, Andre Przywara wrote:
> > 
> > So do you need just one "tx", but "rx" plus "rx_reply"? Which isn't valid in
> > the current binding?
> > If that's the case, then we would need a patch to relax the binding and
> > allowing this combination as well.
> > Looking into the kernel code it looks like the SCMI driver doesn't use
> > mbox-names, but explicitly expects assignments depending on the number of
> > mboxes? Somewhat confusing ...

Hi,

so the mbox-names are NOT mandatory, since the SCMI stack initially did
NOT identify mboxes by names and such decision pre-dates me so I am not
sure about the why...

...anyway, when unidirectional mailboxes hw came along, in order to add
clarity, WHILE maintaining backward compatibility, mbox-names were added
only as optional and the stack really does NOT use them; the only thing
that matters is the number and order of mboxes AND shmem areas: only the
combination described in the mboxes binding description are allowed and
accepted in order to manage both the case of unidirectional and
bidirectional mailboxes while surviving backward compatibility.

> > 
> 
> It is generally transmitted via tx, and tx_reply is necessary when the
> platform has unidirectional channels. tx_reply is used to determine when the
> synchronization commands have completed, without requiring polling of the
> shared memory. rx_reply is necessary only if the platform firmware expects
> it and doesn't poll the shared memory for OSPM/agent acknowledgement.

In SCMI you have generally A2P (Agent-to-Platform) bidirectional channels
to send commands and receive related replies using one dedicated shmem and,
optionally, a distinct dedicated unidirectional channel P2A, with a
distinct dedicated shmem, for receiving notifications and/or delayed
responses sent asynchronously by the platform.

These two channels, A2P and P2A, maps in the SCMI stack (for historical
reasons) respectively to TX and RX naming.

If the underlying transport is based on birectional mailboxes you can
happily have 2 mboxes "tx", "rx" with 2 dedicated mbox areas.

Instead if your mailboxes are unidirectional like MHUv3, you will need
effectively 2 mboxes to represent the 2 parts of the A2P birectional
channel AND one mailbox to represent the P2A unidirectional channel,
exactly like you do.

So, if you want to add the optional mbox-names would be:

	firmware {
	    scmi {
	         compatible = "arm,scmi";
		 mbox-names = "tx", "tx_reply", "rx";
		 mboxes = <&mbox_db_tx 0 0 0 &mbox_db_rx 0 0 0 &mbox_db_rx 0 0 2>
                 shmem = <&scmi_shmem_tx &scmi_shmem_rx>;


...since the first 2 mboxes effectively represents the 2 unidirectional
sides of the A2P channel, with first being the cmd-request direction and
the second being the cmd-reply direction, while the third mbox is just the
P2A unidrectional channel...

....so it is fine, even though admittedly fuorviating, that the tx_reply
is attached to a db_rx block, since it is exactly what represents: the
reply to a previously sent command.

Anyway, being the names optional, the only thing that really matters in all
of the above is that the numbers of mboxes and shmems matches:

	 3 mbox / 2 shmem => SCMI TX and RX over 3 mailbox unidirectional channels 

The additional optional rx_reply mboxes was added to represent P2A
channels that have an completion interrupt.

All of this madness was the best way I could find to address the problem
of supporting such new unidirectional mailboxes in the SCMI while NOT
breaking backward compatibility in the absence of mandatory naming from
the start.

Hope to have shed a light, beside having annoyed you all with all of the
above flood of words :P

Thanks,
Cristian


