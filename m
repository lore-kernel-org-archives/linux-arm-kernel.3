Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9E1E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 02:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvF2EfYkM1Dr9mKrSNzLev817bKGqqSV9yHuWq7ruNw=; b=HYullpw1puFl87UE3DLmTyNTsR
	O1jyHIuMbcAH4SGhYifYb3fkzGTqJXupZazGvEvpJoBUCko3j/TG4Oh1+cI7c4xASmJz7Q37w6wcQ
	jarfbV57lxGgjNQOynhoiEMiMFIV7KIxrGQY3lgdwQ5CxeInn6J8kwbyQab5KUYsHHUJpf8UhIs8j
	r8ZHvSw0L1brUvXD5RuU1Wt5/CvFEQ01XFPDSqsssT9V4IFLAEhfceh976kvW1nk834sYZXRsCdW2
	A1YCi23Fn3J1Bg7LR8OqVE37p+VX0dmZtKPflyzPn84zqo/5/5Gmc76WkOsztBoC32Bek0Ilvzpj3
	wlB58C6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1KP-0000000EWUX-1hO8;
	Thu, 05 Dec 2024 02:10:53 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1JN-0000000EWKK-326x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 02:09:51 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id CEBB372C980;
	Thu,  5 Dec 2024 05:09:46 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id BFFB236D0178;
	Thu,  5 Dec 2024 05:09:46 +0300 (MSK)
Date: Thu, 5 Dec 2024 05:09:46 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <20241205020946.yf6xdieoswsrmvi5@altlinux.org>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
 <Z05cuuMMurzp1jx5@linux.dev>
 <20241203040350.4soyvaeqs75kjqoj@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20241203040350.4soyvaeqs75kjqoj@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_180949_926510_DBF17D37 
X-CRM114-Status: GOOD (  18.27  )
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

Oliver,

On Tue, Dec 03, 2024 at 07:03:50AM +0300, Vitaly Chikunov wrote:
> On Mon, Dec 02, 2024 at 05:19:54PM -0800, Oliver Upton wrote:
> > On Tue, Dec 03, 2024 at 01:31:19AM +0300, Vitaly Chikunov wrote:
> > > Marc,
> > > 
> > > On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> > > > On Mon, 02 Dec 2024 15:59:40 +0000,
> > > > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > > > 
> > > > > Marc,
> > > > > 
> > > > > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > > > > >
> > > > > > What the log doesn't say is what the host is. Is it 6.13-rc1 as well?
> > > > > 
> > > > > No, host is 6.6.60.
> > > > 
> > > > Right. I wouldn't be surprised if:
> > > > 
> > > > - this v6.6 kernel doesn't hide the MPAM feature as it should (and
> > > >   that's proably something we should backport)
> > > 
> > > How to confirm this? Currently I cannot find any (case-insensitive)
> > > "MPAM" files in /sys, nor mpam string in /proc/cpuinfo, nor MPAM strings
> > > in `strace -v` (as it decodes some KVM ioctls) of qemu process.
> > 
> > If you can attach to the QEMU gdbstub of the VM, info registers will
> > dump ~everything.
> > 
> > If the value of ID_AA64PFR0_EL1.MPAM (bits 43:40) is nonzero then the
> > host KVM is erroneously advertising MPAM to the guest.
> 
> I don't find such register. There is what I get:

Thanks to ArmCpuInfo.efi I can confirm MPAM is advertised.

  Shell> ArmCpuInfo.efi
  ID_AA64PFR0_EL1  = 0x1100010011111111
  ...
  PFR0  | MPAM         | 43:40 |  0001 | FEAT_MPAM v1.0 implemented.

I prepared the kernel with Marc's patch (backport of 6685f5d572c22e10 to
6.6) and am waiting for the admins to boot it, hopefully today or tomorrow.

Thanks,


