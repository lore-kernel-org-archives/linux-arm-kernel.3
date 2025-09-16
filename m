Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B07CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWCpQ7e6e5cWUCkciMXT4EsynaoCqfnEnjJlGuCHERs=; b=F5sX8AwKTU0p7BzdKPr4HeaEFl
	A2nz+FEbgTKi2LQjELFhwGCxm3ZtQtPQAq6iRXkRwCW4PxcJrp5RlaGSXzLKMb8edB9mobHn++UbJ
	TVcHgHbX/jnEZ6V1pcxuYcbMZX76VNtDqJVNmXonD/JJm1oYqRB9EUpHXrJJXPRUcnfzGjFaYe1ub
	WWgW4MfPVk+ZqUk3/8E717eYOgtAQj8nsz6Oo9d6/93YBBI6KhbGU4aTnExGd3h3oLxpcwWYzefJA
	ytyaGtNXm+oDSg4x9RXO6y/GjqmSkfsoD9fpUAGAcmiGFbTYPKAMvDmO2pqBa/6I+CBMqOlbm1xos
	OtCgb7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWpL-000000089dZ-2aFM;
	Tue, 16 Sep 2025 14:38:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWpI-000000089cj-2QI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:38:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D046FEC;
	Tue, 16 Sep 2025 07:38:27 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22BEE3F673;
	Tue, 16 Sep 2025 07:38:33 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:38:31 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>,
	Chao Gao <chao.gao@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>
Subject: Re: [RFC PATCH 0/1] Arm Live Firmware activation support
Message-ID: <20250916-energetic-debonair-mongrel-dfcafb@sudeepholla>
References: <20250625142722.1911172-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625142722.1911172-1-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_073836_660200_01C0B94C 
X-CRM114-Status: GOOD (  21.44  )
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

On Wed, Jun 25, 2025 at 03:27:21PM +0100, Andre Przywara wrote:
> Hi,
> 
> (please feel free to add people interested on this from the x86 side
> as you see fit)
> 
> this is a proposal for a driver for the Arm Live Firmware Activation (LFA)
> specification[1]. LFA provides an interface to allow "activating" firmware
> updates without a reboot.
> In contrast to Intel's TDX [2] approach (which seems only concerned about
> some confidential computing related firmware blob), and even OCP's
> "impactless" updates[3], the Arm approach just lists a number of
> "activatable" firmware images, and does not limit their scope. In
> particular those updates can (and will) be for firmware bits used by the
> application processors (which OCP seems to rule out), including runtime
> secure firmware (TF-A/BL31), confidential compute firmware, and
> potentially even UEFI runtime firmware.
> Initially we have the whole chain demoing the Arm Confidential Computing
> firmware (RMM) update, which is conceptually the same as Intel's TDX
> proposal.
> 
> So our design approach is to create a directory under /sys/firmware, and
> just list all images there, as directories named by their GUID.
> Then the properties of each image can be queried and the activation
> triggered by the sysfs files inside each directory. For details see the
> commit message of the patch.
> This is admittedly a somewhat raw interface, though even in that form
> it's good enough for testing. Eventually I would expect some fwupd
> plugin to wrap this nicely for any admins or end users.
> 
> The purpose of this RFC is to get some feedback on the feasibility of
> this interface, and to understand how this would relate to the other two
> approaches (TDX + OCP "impactless" updates).
> 

Thanks for the details and I agree we need opinions from x86 community
if possible but definitely from cloud/hyperscale community using these
user interfaces ? While x86 and Arm may provide its own user interface,
are hyperscale community happy with that ? I briefly read the unified
(arch agnostic) requirements specification [3] but will there be a
requirement to have a unified user interface from the OS ?

We don't want to define something Arm specific to just abandon it quickly
if and when hyperscale community comes back with such a request for unified
user interface.

I am not against having Arm specific interface, just getting clarification
in terms of requirements even before diving into technical review of the
patch here.

Anyone from hyperscale community ? Please provide directions here.

-- 
Regards,
Sudeep

