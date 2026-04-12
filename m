Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFFDE937F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKNymydwkQ9LKmJcNQgFQ3eYoYUA3j/F+SLFUPNOSN4=; b=dG+NwoSjhrNWHkufKC6SuuESoY
	IosTMuV+LKCSpju5AgEEDmj+uuKOvjotNYG1o8Rajca1xk5MG1nvtnkzzdeJloPOSTGwI6BDd5udj
	1qBCLYbejJgNrPoQE3IosOMxzmC/aLQL2/Aj3+XAyekqOkjPdHYaXWhdXYryOeTbCrMudhq7kXOPC
	75sJhYInnyFvVIlyXTaikrOccxUBYw3SeW/NO00FS43XoybDfOWh1qaEBtsBk/d5QCnmmhFY7y2SB
	AOx2JO625g+USwFSwdppzkEYv94LDzM+3fnTUZjageP1vm9MXZ2AzZj2nBBxxi6SFDTJFmorMPJnG
	ZSNygT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBzo3-0000000EbEf-2zBm;
	Sun, 12 Apr 2026 18:45:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBzo1-0000000EbEE-2NHE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 18:45:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A480331A;
	Sun, 12 Apr 2026 11:45:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB803F641;
	Sun, 12 Apr 2026 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776019508; bh=JycCwi4It/RmDM1Aoh26Y5e1GASVK7xVPWR4xn0eZE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NuAHMdQReW1JUpva8C4r1cbQXqIATk01UJq9WTHm/C+iuZ3Mc2tYrPl53dDN7MHsJ
	 NyhRMK27pEDOucPgnKebroKJAcy7wKvcI2p0/2CR/D59wu0/peakhyP7jV6X0if6M1
	 QFeOL1S2bifnTia3nbbEASql4Nu2bNQlsdWiHQvI=
Date: Sun, 12 Apr 2026 19:44:58 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Message-ID: <advoKvOSGpOEN_qX@pluto>
References: <cover.1775205358.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_114513_651036_F3222783 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, Apr 03, 2026 at 10:41:28AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,

Hi Geert,

thanks for this, first of all.

I was a bit off the keyboard so the delay in my answer.

I will get back at this SCMI/Clocks/Quirks matters in the next few weeks
targeting next rc1-ish...

In a nutshell I was thinking to proceed roughly as follows:

 - respinning a V3 of my original Clock Rates series WITH the addtion
   of your previous fixes series on top (or merged into) BUT DROPPING
   from my original series the patch that triggered a lot of FW panics
   in the wild due to out of spec FWs. (Harden Clock protocol initialization)

 - spinning another NEW series on top of this 'Miscellaneous improvement'
   series of yours, since I want to add, on top of this rework of yours, the
   capability for the Quirk framework to match the same quirk definition
   (static key) against multiple vendors/subvendors/impl....since, as you may
   have noticed :P, I broke a number of boards recently with just one fix
   kernel side BUT all of these issues can be really quirked using some
   common identical quirk snippet to match against all the needed vendors
   (rockchip/nxp/renesas as of now)
   
   ...I have some ugly working hack with which I am experimenting on this
   quirk matching evolution...

   On top of all of this I would then reapply the FW-breaking fix AND all
   the quirks we determine as needed (possibly N matching M vendoes) and
   test as much as possible pushing into for-next...

Then we'll see what Sudeep thinks about all of this, of course.

Thoughts ? Any feedback welcome.

Thanks,
Cristian


