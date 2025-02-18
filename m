Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26058C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMkwiryyiL9GSfIPQZSg1jtjObYICl3jtrG7WQyfZMk=; b=GgxQfLk4Em4mun
	h8aemUbaxqhLXEf8Oubs7KGK2nXfGByHodsqREMNE9ALJvwLCid5nKI3v3dP+x9/wdDzQOly/d24X
	2YDRwM/NSfzjK+xvNd3gQoK1Quws+OLmnNlTm6LRgOyJevtxhIQ2RfaXOyFh0o9iropDGGs5SQOSx
	rvOTFL8IBMATPEz1lH2LdnBj+FZFxwSGb2f5igYSvn4AcHmpg/6z5Y0eWxOM6lBnEs/itHjKUM+8h
	xXcTh4tPbJh5zts789SrxrxrGUi0j/MzsjmxHvJBJaM1BKDmSLnGx3QLzaEi+uswMClOieglyKb7w
	nsUWnqM+k5WoJuov5WSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP1W-00000008eHX-2X8l;
	Tue, 18 Feb 2025 14:56:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOlf-00000008afI-3f3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5414CA40FB2;
	Tue, 18 Feb 2025 14:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7521CC4CEE6;
	Tue, 18 Feb 2025 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739889610;
	bh=YR9rSw0eu3MHVUUgxBCbni+Nva8WP3z74sHAVNGJ4uE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nzbPVeL9NZslDcCM2y1sjYmXPxgSopR14z46QVjjrNzvbEHB5+WPnFQRRTHlKISMp
	 elixWnJEzcRwytaUb6gea/LyyTRRuwENsCzaHq2/Ekrr9ihJ3+yCEALsOdI9KCzsR2
	 PWNuVAgF693CQ3VKdYRyO6UftU9PQLPbr7eUMVk35Fv3Hg0uIc4nBL7Y+a1KP3Qxbx
	 wRFVMhux4nj1DaWDiSBdDylC2chqVu4Rt9cZQKfZ95oj+B177msOHcrtOLpLftHi4N
	 WOzUo3yt1LKjb5WFnvgnOeLuooMzEyk7JokubFm+R2BYrs6+zhsrcHEr/qzku47Wt9
	 eo2mH4SwSkZPQ==
Date: Tue, 18 Feb 2025 06:40:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
Message-ID: <20250218064008.762e9b94@kernel.org>
In-Reply-To: <1348929889.600853.1739873180072.JavaMail.zimbra@couthit.local>
References: <20250214054702.1073139-1-parvathi@couthit.com>
	<20250214170219.22730c3b@kernel.org>
	<1348929889.600853.1739873180072.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_064011_987553_4FD77320 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: nm@ti.com, Vignesh Raghavendra <vigneshr@ti.com>, praneeth@ti.com, edumazet@google.com, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh@kernel.org, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2@ti.com, basharath <basharath@couthit.com>, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan <mohan@couthit.com>, richardcochran@gmail.com, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh <pratheesh@ti.com>, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar <danishanwar@ti.com>, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 18 Feb 2025 15:36:20 +0530 (IST) Parvathi Pudi wrote:
> > On Fri, 14 Feb 2025 11:16:52 +0530 parvathi wrote:  
> >> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> >> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> >> Megabit ICSS (ICSSM).  
> > 
> > Every individual patch must build cleanly with W=1.
> > Otherwise doing git bisections is a miserable experience.
> > --  
> 
> As we mentioned in cover letter we have dependency with SOC patch.
> 
> "These patches have a dependency on an SOC patch, which we are including at the
> end of this series for reference. The SOC patch has been submitted in a separate
> thread [2] and we are awaiting for it to be merged."
> 
> SOC patch need to be applied prior applying the "net" patches. We have changed the 
> order and appended the SOC patch at the end, because SOC changes need to go into 
> linux-next but not into net-next. 
> 
> We have make sure every individual patch has compiled successfully with W=1 if we 
> apply SOC patch prior to the "net" patches.

Please resubmit after the merge window.

