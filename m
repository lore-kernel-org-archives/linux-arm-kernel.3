Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D24CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGDirhKHdHCR34OVq4FZGxleB+ZNO+CkzijlksSRSas=; b=dg41hBf+74k9VIphI2+Vf1s/14
	gWFzk+Wd/xF/YhiSof8OL4Y+PmPq8BO5g+QKzegvnhRcZh7GNp/6EEsHiM16JS6piaKyqIN5qA5Kt
	YdK7SPGfpxKcyKBAG6TNoYHnuundosbEsdGo3TSoYBpuctf3Z/GfgOaEHLZ0JQbigOe63zHDQqdxL
	iy9Onvk28dtjcrKbnuM5wUhjD6zG6XLrDmXHiq6cDwxllqmh2wa1mUf8HZTep8uk+yAKoHiznhcUb
	R6onNs3C6zN2J8PzP2hqIJcJNqDnNeg6AIixCYfg47CP79eMSx5RwKz2EVDb1Ewe/qGRIbp6ielT2
	hqD+Sfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27jM-0000000HQvA-0Wxb;
	Thu, 03 Sep 2026 13:43:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27jK-0000000HQuu-3qDr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15BE140293;
	Thu,  3 Sep 2026 13:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82161F000E9;
	Thu,  3 Sep 2026 13:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788443030;
	bh=IGDirhKHdHCR34OVq4FZGxleB+ZNO+CkzijlksSRSas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2qho6lRQbEXGxiqQhil6jU/R8uxfZrLra4274kToRHY/TRnIJuISRdBEobrDFAC5
	 H4+3wKMkA0Gu0xjZ6vvgauYk1m7sFEGHrqSLJnxDwNLXBJtdYQQK/A4sFdj42rljAp
	 RcPXi4P0vTB2KFM+GRwy8lbR9+1f6hvJG9tergYjnNhj1SGiQ69mJMBG2na/+tzAMw
	 tivytXsAEHL1W8k/33AphmmM95eNnqvGFVviydpv1dF1R99llop6bMK7gD3fJrmiH9
	 X5aiQ/Ql8JbEl0NJyhweMoikFEPspBYGsZYKNjN/FHA7Zm2FGK9gnFn2PlOShcW9br
	 pzuXUBzr8eYUQ==
Date: Thu, 3 Sep 2026 14:43:46 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 7/9] firmware: arm_scmi: Add ACPI PCC transport
Message-ID: <20260903-hairy-hospitable-sambar-7a3ea0@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-7-cb6b88b4ebb3@kernel.org>
 <20260824131709.00006712@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824131709.00006712@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 01:17:09PM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:33:02 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Introduce a new SCMI transport that uses ACPI PCCT (PCC) subspaces via
> > the Linux PCC mailbox layer. Parse ACPI _DSD data to map protocol
> > associations to PCC transport UIDs. Support common and
> > protocol-exclusive A2P channels, plus optional common or
> > protocol-exclusive P2A channels for notifications.
> > 
> > Key points:
> > - new CONFIG_ARM_SCMI_TRANSPORT_PCC option
> > - integration with SCMI core via scmi_desc and transport ops
> > - response and notification fetch from PCC shared memory
> > - ACPI device matching and registration via the ACPI transport macro
> > 
> > This enables SCMI to be exercised over PCC on ACPI platforms.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Hi Sudeep
> 
> This is quite dense and ACPI parsing code is always 'interesting'
> Anyhow some comments inline
> 

Indeed quite dense to even parse the comments. It could be my brain which
is still recovering from the flu, but I can't respond to them inline. I
think I have taken most of the suggestions(saying most as I might have
missed unintentionally). I might have gone overboard with some macros to
eliminate random magic offsets. I will post v4 soon.

Thanks again for all the review comments. I am still debating if I need
to break this into 2 patches(technically yes, motivationally not yet 😄)

-- 
Regards,
Sudeep

