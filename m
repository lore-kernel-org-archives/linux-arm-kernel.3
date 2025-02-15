Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5693C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8C/EHcQAqOvSpwM5U643rAVRGulrXyiTRXhtDcWCxY=; b=hcuRM5qqNLhtsJ
	uJAQAiS+PUkvD6yvZoJKH26HJBvWDXTVRnYLnZTNpOiST0xHpSrTufU/sOrqbhF5NLhicEmrl2Siy
	pvFii7mhrhQvJNdS/QndGWkNEP4qbkV7qRiR/lDciu7t1vX0XcxYmAHM9eNsLsb7njfRT78shKsu2
	ppcufC9gKCFMIvetO77bQKa11gtkxAhMaghlmKBOnyk9Nr4xLafQoubM44PrKxUs1vRtGhdCxxqDn
	t3lnKf0o9RBjkQRS1SYDQyLbVzIVAmKMopwygQCXEKPh8Cbae/8Tm6TTzsjllBGABFaQAt5TlGmVQ
	6ZlRC/8sEz9TqQKdgSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6dM-0000000Ghrs-3tgp;
	Sat, 15 Feb 2025 01:06:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6Za-0000000GgkO-170y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 01:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 346C25C5E75;
	Sat, 15 Feb 2025 01:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4BAC4CED1;
	Sat, 15 Feb 2025 01:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739581341;
	bh=jD3vIxzSn+E0GmRd+AprFuB8a1MmVN+5PvIZoSzEfLg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oj+dSu/LHsTOrcdYE0u2sUF91jmDKv3gaxWBll+AXbZQIueh9QuhVeoEZqnvJ1AuC
	 t4nc4o4grG2t98aXp5NnXh4GwVKxowATLKe9OF5gF0nXvMtq8kJazoUGn2O9SRoogU
	 fd5jcNAJRuQoh1BuzqnfpatXzglUMRpWnLCMJewUpS54fhUt4uRK3kKge7NxY6t1LB
	 7xw44hHdyh9ejbdafHeNbjIq6kLv7Ei5LbZpn6OzX2DnLVir0MZRemRgeWh1mbRETs
	 KP1tZyDKFsMiDluUZ3TKA4gdDV6ycFLqM+wf6DtePN8xPYzyY/jc+krFTumbf+OxpT
	 vT/I4U6879chw==
Date: Fri, 14 Feb 2025 17:02:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: parvathi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
Message-ID: <20250214170219.22730c3b@kernel.org>
In-Reply-To: <20250214054702.1073139-1-parvathi@couthit.com>
References: <20250214054702.1073139-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_170222_349644_F6CE4501 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
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
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, m-karicheri2@ti.com, basharath@couthit.com, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 14 Feb 2025 11:16:52 +0530 parvathi wrote:
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).

Every individual patch must build cleanly with W=1.
Otherwise doing git bisections is a miserable experience.
-- 
pw-bot: cr

