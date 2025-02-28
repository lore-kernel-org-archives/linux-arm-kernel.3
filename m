Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3A6C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ucsm+bbY0iHDwArWhMGfjmc7Qal2QL4m0iCEN37L9vI=; b=uzXFX11D9T9l14VTHpUrC6keoQ
	ePPqSO/BNsmlPjqjJ13S+GXqaDMIZgrR+T+fUQW+FAaDtPlPTovgQYoOjJ1Uy9jjzJuNlFNqNOT+K
	g088OD7Vg9ePKQfNNOukJu1Yiac2NfLkj16OxBjqMAVaNvY8oK/3LtmcOJGe94nU2vbdBQmjpGro8
	Jx2sRRRlGM/aXuBfmmODokHjcGEfC2rCU3JHQ6hUJYmvPSM9dLgrY/l4HUxZkT0JFGAQPwVnyNwTS
	c/efbj5ENZfgGOfTNjr1Nv297z2m0giq2xQY5Y8UQY0WAR85x98HB7Mjj42eO0lPLTgtcmU8Z4MYe
	bPjOrqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnz6S-0000000Aq9B-2Zw8;
	Fri, 28 Feb 2025 12:04:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyOj-0000000AjLH-3Q1I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:19:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2FCD1063;
	Fri, 28 Feb 2025 03:19:24 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 779D23F673;
	Fri, 28 Feb 2025 03:19:08 -0800 (PST)
Date: Fri, 28 Feb 2025 11:19:05 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Set dma_mask for ffa devices
Message-ID: <Z8Gbqa3AK_fd6ytl@bogus>
References: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
 <Z4osWNCUfufciZNG@bogus>
 <20250228082745.rc2u5jiqnq7h737l@vireshk-i7>
 <Z8GAEDVIUiooPjf_@bogus>
 <CAKohpomoY8uhqDMeUAa594Eh8Oh53hTSsjkAcJU7Z70asvzcSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKohpomoY8uhqDMeUAa594Eh8Oh53hTSsjkAcJU7Z70asvzcSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_031917_899478_6E790FFC 
X-CRM114-Status: GOOD (  13.89  )
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

On Fri, Feb 28, 2025 at 04:37:24PM +0530, Viresh Kumar wrote:
> On Fri, 28 Feb 2025 at 14:51, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > Sorry I forgot to respond. I kept this out for now as we need to resolve
> > the DT bindings.
> >
> > If you think it can be used/needed irrespective of how we resolve that
> > issue ? If so, I can queue this.
> 
> Yes, this has nothing to do with the DT bindings and reserved-mem thing.
> 
> We can anyways map memory on need basis at runtime and this is required
> for that to work. The reserved-mem thing only allows us to map everything in
> advance.
> 

Understood, will apply this soon.

-- 
Regards,
Sudeep

