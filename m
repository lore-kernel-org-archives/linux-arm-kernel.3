Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6821CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgFDytu0jE6zFlGX1fDz906kNW4C+0Iw86IS8J1gB48=; b=TXxiNGS2AtX6TqpR3LoEUKxShQ
	MtAnvD8vONw/cxWksKadZbKGu+RMWQ4/CzG2SLjD/XzXVv48O59EB32yaj+RjnjHGHRYqMr7bTpo3
	wH1D3k9j7N79DWdfq9+G62ykOi96NBGQ9DAU8xfC2k23o/1kIzNBpXn4PEAFIGu6UyIHnaBqaVnu6
	kOk+FAOyqJuaPfZ+QfNCacE4DxmEe8FuK+BORqcwATcaR+y011k+7VoqFfsqJslxJrK56iX2zNxEw
	5j3ajViWD9h9eXJr/7KI2PeFzdGRsdditkpYm84QIUhYwpX/V0OITOggzgGopTJFsNBHRpu88LeqE
	UKjOtJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvdU-00000006SdF-25KP;
	Thu, 23 Oct 2025 13:45:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvdS-00000006ScP-05Cj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:45:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97E8F1516;
	Thu, 23 Oct 2025 06:45:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF743F63F;
	Thu, 23 Oct 2025 06:45:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:45:32 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aPoxfH_TLrsMxMVQ@pluto>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_064546_113760_DF6172D7 
X-CRM114-Status: GOOD (  14.00  )
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

On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.

Hi,

..indeed I was thinking a while ago about exposing the existing force-polling
switch but in my case it was purely a testing-scenario configuration, so a
no-no for the DT, things are different if you have to describe an HW that has
no completion IRQ also on the a2p channel...

...having said that, though, usually polling-mode is reserved to a few
selected commands in a few chosen scenarios (as you may have seen),
'carpet-polling' non-for-testing for all the commands on A2P seems a lot
inefficient and heavy...is it really a viable solution ? or these
systems use such a low rate of SCMI messages that polling after each and
every message is negligible ?

..just to understand the context...

> 
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
> 
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks,
Cristian

