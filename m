Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7F2D49797
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrJqE01AWclLd3PUTDi+dVDFY4JwZrn85wC2ORTZCc8=; b=eG7ILZhoT+1Gfh3aLhXDTtZ/Qx
	ly/NmVci7bmgmjW9ZDcXVKGh1j1KFdPw8sUZO92/gx8vnUEJJzKcQMfCfCF0YL3rBUFtAClbqt/Bm
	KbH6+dq9iJ1IHV+JH8wELL1j/TjdLzOEa2cKePt82cqk67nGkYo6qtbg7lDDfE1NagkFPIjE5pZhJ
	sz2cCztkKBH9UBDTx6BWkU0BAEyJMUei60VK1OXOy5+vc/5Il94mezDwD4QzOiscUB7FfyqGAFAp7
	eFpHcvsFb4xlL1KrYOCzkWfyhjqhzUZ6e22nZ/M2gPn4ldoujaq0mvugzMM1+23F/1+hihEpQAX9S
	S9kVFETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPCn-00000008sMF-3LjH;
	Tue, 03 Dec 2024 09:28:29 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPBm-00000008s68-3s8G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:27:28 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id B607072C90D;
	Tue,  3 Dec 2024 12:27:21 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id A808736D0178;
	Tue,  3 Dec 2024 12:27:21 +0300 (MSK)
Date: Tue, 3 Dec 2024 12:27:21 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, oliver.upton@linux.dev,
	mark.rutland@arm.com
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <20241203092721.j473dthkbq6wzez7@altlinux.org>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_012727_122855_11F2EBF0 
X-CRM114-Status: GOOD (  22.35  )
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

Marc,

On Tue, Dec 03, 2024 at 01:31:19AM +0300, Vitaly Chikunov wrote:
> On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> > On Mon, 02 Dec 2024 15:59:40 +0000,
> > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > 
> > > Marc,
> > > 
> > > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > > >
> > > > What the log doesn't say is what the host is. Is it 6.13-rc1 as well?
> > > 
> > > No, host is 6.6.60.
> > 
> > Right. I wouldn't be surprised if:
> > 
> > - this v6.6 kernel doesn't hide the MPAM feature as it should (and
> >   that's proably something we should backport)
> 
> How to confirm this? Currently I cannot find any (case-insensitive)
> "MPAM" files in /sys, nor mpam string in /proc/cpuinfo, nor MPAM strings
> in `strace -v` (as it decodes some KVM ioctls) of qemu process.
> 
> > 
> > - you get a nastygram in the host log telling you that the guest has
> >   executed something it shouldn't (you'll get the encoding of the
> >   instruction)
> 
> I requested admins of the box for dmesg output since I don't have root
> access myself and nowadays dmesg is not accessible for a user.

This is what they reported:

  kvm [2502822]: Unsupported guest sys_reg access at: ffff80008003e9f0 [000000c5]
                   { Op0( 3), Op1( 0), CRn(10), CRm( 4), Op2( 4), func_read },

Thanks,

> 
> > 
> > Can you confirm these two things?
> 
> Also, I tried to reproduce on another Kunpeng box with slightly
> different HiSilicon CPU (presenting to the system as Cortex-A72) and the
> problem is not reproducible there.
> 
> While things are not resolved, is it possible to workaround the problem
> with some QEMU option, kernel command line, config option, or a patch?
> 
> Thanks,
> 
> > 
> > 	M.
> > 
> > -- 
> > Without deviation from the norm, progress is not possible.

