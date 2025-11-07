Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF0CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtSkddwD/WDmFGCg39eRmShA6VwhT8kIPIGtzp3ms2Y=; b=40BZWQMMfMu4nP4EBotQ3OfYsH
	KExIZ2hofp0kESVuafP4lCp3Kkn+48Lqzgi7fv+LRBel7ooSNxcJFRsNlzJTUp0dx6nVPElVXW37N
	JBK3F9qtCgf4oGymUliG+gW/nv/iFJrCkg525n7VUHK8hL9uqPrOl8LgRNPSHT8GeXITQ0Xz1+Yaw
	Anhx7Fe+e+UdXzZqGDFiKdh7VDwdfnEk5E65xfqjaztXIhQ3FVPA5pxqmMTpHf9kj2Dve4rf1K27M
	ROCTy3BDhqmPJwHtyET/vN+LuXq2+zJ1lxep1M6xX+lx7iVaHUfOscr0h1EngVMZhTmNBtJEckFQ2
	t2IMq4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLk2-0000000HLWU-3GcD;
	Fri, 07 Nov 2025 12:38:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLk0-0000000HLTv-2YBB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XtSkddwD/WDmFGCg39eRmShA6VwhT8kIPIGtzp3ms2Y=; b=ybgPoOga61pdrRlKUv7LHd1QNE
	JH3d8zQ8ENjCCEKgv03vWO+HTMT1Bi+0T70rXtdkBQA/bcvx1CqOGA/HEI1WHmSkS+CZHxLY7AS0L
	nl/Nqt+Hjj+qz/KGhJhbGeDQhA31vJnWuVW6sBIC8mpOrkxURH3UPUXD7FJElKdSU+NCrSheEsVhy
	Vk0DAh9qd0CpSng84SvkaV715UlH1TM/3WmEHEh/TK1xE995eXi655tByWsCVZNnseJrGP6Z9NDC9
	LdLgMXzHXxqI2RcqQnYcH0f0HEsmI8TpWm7fzhERAm6l5dKHfzsugHH3rKLEnnIEH6vzHbcQ2TyKV
	PbCSnyuw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41666)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHLju-000000006XW-4Be1;
	Fri, 07 Nov 2025 12:38:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHLjs-000000007aG-4B0v;
	Fri, 07 Nov 2025 12:38:49 +0000
Date: Fri, 7 Nov 2025 12:38:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Darshan Rathod <darshanrathod475@gmail.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi/arm: Clean up coding style violations
Message-ID: <aQ3oWITFc3F6Hwhu@shell.armlinux.org.uk>
References: <20251107123435.1434-1-darshanrathod475@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107123435.1434-1-darshanrathod475@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_043856_660975_3FC5C249 
X-CRM114-Status: UNSURE (   9.24  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Nov 07, 2025 at 12:34:34PM +0000, Darshan Rathod wrote:
> Addressed checkpatch warnings by separating assignment from a conditional
> statement and documenting the empty for loop. These updates improve code
> clarity and maintain style consistency.
> 
> No functional change intended.
> 
> Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>

Up to the SCSI maintainers, but this code pre-dates many of the coding
style updates, and I believe there is a general policy not to "fix"
old code for such things. It creates noise and additional churn.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

