Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EA7C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3z+ZKdpUO5kQlo8FkUeswbz/lpix4Q0oFibsP2sfKTY=; b=vus1hriRmq/5YHvbeqlnkFiR+n
	7HQEDQaCFOItb+UGmPAtphxZe43DMxkiXlhF3tJs7DCRhnS0TFV32vtTFvjo0m+/WcWkNxDK2DQvz
	6r8xBxZGv1+ewuB3VmFHtRjg49bRllwnFEZ3C5XQK6yFXYI8LnH8o48WtyYnxSBzt/5N+d4iUwMEE
	vcKJ3+VnQPDnV594Sst10i3O4qFsZGmwzc5+urSAx5rs7TuHhdfRn5/DLnD9x9Vjdl6JOzbxM4OrH
	UCK8vIOBJwG+UNrGc+sr1wDYPhIjtMNQYVEZyJbTkkhLxearvOwWLU/NqEzxCZ0H+EclLiiXegrW4
	NkB0DNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fmn-0000000Dznk-0gCQ;
	Wed, 02 Sep 2026 07:53:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fml-0000000Dzmq-0fD7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:53:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36312600C8;
	Wed,  2 Sep 2026 07:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1D81F000E9;
	Wed,  2 Sep 2026 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335609;
	bh=3z+ZKdpUO5kQlo8FkUeswbz/lpix4Q0oFibsP2sfKTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vc0J79pmnaY4b5aSn0th0j74FJnx08yZH+uHWZ/zWUYuzcjSFhZ6ODF4i9OkLT71G
	 r3mGYa4cmciktKRptB9e1ola4+PgyT8dQ1WhlZGUVuJ3LopJjjZ7aV57zs/+fIIxXH
	 Osly1VgQbmUCiy7P5UySDJHgCccE9wqMxJFKSt0qlAZYUeNWsMuLTB2METPW+peUE2
	 Iq3h6B4VwQ3b5Q7HNHy+gMxOXl5q/CnESAr58jcR8yJubzUlBgMnsNEx0fg3C7ZUMF
	 xa5scjG9nLQttglH6BQ+BrQznSNhSb4c3dirMFlHQ965r37FqcHvylUaHdLplwadDR
	 5+dWxPYlwGE+w==
Date: Wed, 2 Sep 2026 08:53:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 2/9] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
Message-ID: <20260902-courageous-cuscus-of-advertising-ad28bf@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-2-cb6b88b4ebb3@kernel.org>
 <20260824100431.00002daf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824100431.00002daf@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 10:04:31AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:57 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Extend the SCMI transport driver helper to support ACPI-based systems.
> > Introduce an internal helper macro that accepts both OF and ACPI match
> > tables, and expose two wrappers:
> > 
> >   - DEFINE_SCMI_TRANSPORT_DRIVER(...) for DT/OF transports
> >   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) for ACPI transports
> > 
> > For ACPI, set the generated platform_driver .acpi_match_table via
> > ACPI_PTR().
> 
> ACPI_PTR() is often more trouble that it is worth because of need
> to guard the tables if they turn up in code where ACPI might not be present.
> 
> Now if someone fancied doing the work to make it work like pm_ptr()
> then that would nicer.  That one lets the compiler both see the stuff beyond
> the pointer, but also do dead code removal on it later.
> 
> Anyhow, doesn't actually matter either way here because you only use that
> with a non NULL pointer in a driver that is ACPI only.
> 
> If you really want to do it, maybe pair with of_match_ptr() but
> that one is even worse as maybe some will be having fun with SCMI and
> PRP0001.
> 

Agree with your analysis.

> Anyhow, random diversion aside, it makes no difference in practice.
> 

I just had to use it to keep build bots happy IIRC.

> > The ACPI wrapper relies on the firmware-node propagation
> > provided by the preceding change so fwnode lookups on the spawned
> > platform device see the correct firmware description.
> > 
> > Keep existing DT users unchanged while allowing transports to be probed
> > using struct acpi_device_id tables on ACPI platforms.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks!

-- 
Regards,
Sudeep

