Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ADDCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa9oNoSzTGRM/4TlGTfgyZDcNivBbEygiqUU5x1fhxY=; b=wGfDtvwI908oSLl2MSKmE35GIk
	sUDzs75oeKOWIDV6DsubE0/od4vGp16PqXIAwyddVDeycPXizyi6j4Fz17HWWSMsvCnXjUKmRo+SN
	0OgKqXMF9AYVx6HPNp3xYIuNQAZp47oJt2z1aUia/UpHy16GxREur4Om+YjPgyS95TGtxLFyls94D
	U4D29KQ+GPl/Ike5g/0fNkcvfjRXJqFZMfMR5IW4G0F9DNhqty0lPWd6ay9nzXtYqHc6RoVT9BSHN
	xyh/JRiaySztkzy2KuI8fSNuXcGfiiPVNdTiXIQi71G6oVFVAkUKheHZWtijxbN4ue7SxBPZABlhu
	re9bUwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8hL-0000000GSNx-0hFO;
	Tue, 21 Oct 2025 09:30:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8hI-0000000GSMr-0EEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:30:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E99C1007;
	Tue, 21 Oct 2025 02:30:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A00D3F66E;
	Tue, 21 Oct 2025 02:30:26 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:30:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC transport
Message-ID: <20251021-heron-of-majestic-recreation-ac04cd@sudeepholla>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
 <20251020183731.000023fa@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020183731.000023fa@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_023028_154700_F8C1FE2C 
X-CRM114-Status: GOOD (  13.11  )
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

On Mon, Oct 20, 2025 at 06:37:31PM +0100, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 14:23:50 +0100
> Sudeep Holla <sudeep.holla@arm.com> wrote:
> 
> > Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> > the Linux PCC mailbox layer. The driver parses ACPI _DSD data to map
> > protocols to PCC subspace UIDs, supports shared TX/RX channels, and
> > optionally sets up a P2A channel for notifications.
> > 
> > Key points:
> > - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> > - integration with SCMI core via scmi_desc and transport ops
> > - response/notification fetch from PCC shared memory header/payload
> > - ACPI device matching and registration via the ACPI transport macro
> > 
> > This enables SCMI to be exercised over PCC on ACPI platforms.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Hi Sudeep,
> 
> Just a very quick look in what is definitely a drive by style review
> A few things below.
> 

Thanks for the quick look though, you have found quite a few things to
fix 😄.

-- 
Regards,
Sudeep

