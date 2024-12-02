Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B619E69E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 22:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HFoDORCHcKDAxkFumGquCXueOfWiQJIno4F6rSRnSE=; b=clqUZ9Gi34nKTIJgnX65SIStJx
	S5fLUmUG/+YmQypm/EfgqJYPDqlgU4t5B8CrAO7wo6UJWkvwQHPihqZpIEYZRaUb7mkeBJXt6s8yw
	QHYdtdAl++fOadKu90OEjfMHrgvAsRRGdX9OtyyjrsD8K+F0ZBaZOtDcLyI83fBcGIo3Kr/YT8U6b
	5Be7s26R67qYKz92TRpzsua7kVvWafBPaP2kTrOgIx7nXQYtR9oh/e/fIhlhi/yozCrltmjVwR6Qz
	hJlcR70dW9zqF4TFJVJSoXYFGmRQPW1sP4EIKdX2em3n57JTW7wA+N/q+fIyXLaUotOYflq6km5Dk
	x7dUAK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIExr-00000007e8S-1XYk;
	Mon, 02 Dec 2024 22:32:23 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIEws-00000007e2O-1rcQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 22:31:24 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 3FBE572C8FB;
	Tue,  3 Dec 2024 01:31:19 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id 33FBF36D0178;
	Tue,  3 Dec 2024 01:31:19 +0300 (MSK)
Date: Tue, 3 Dec 2024 01:31:19 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, oliver.upton@linux.dev,
	mark.rutland@arm.com
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <86ser6t6fs.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143122_644640_C196E48D 
X-CRM114-Status: GOOD (  17.51  )
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

On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> On Mon, 02 Dec 2024 15:59:40 +0000,
> Vitaly Chikunov <vt@altlinux.org> wrote:
> > 
> > Marc,
> > 
> > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > >
> > > What the log doesn't say is what the host is. Is it 6.13-rc1 as well?
> > 
> > No, host is 6.6.60.
> 
> Right. I wouldn't be surprised if:
> 
> - this v6.6 kernel doesn't hide the MPAM feature as it should (and
>   that's proably something we should backport)

How to confirm this? Currently I cannot find any (case-insensitive)
"MPAM" files in /sys, nor mpam string in /proc/cpuinfo, nor MPAM strings
in `strace -v` (as it decodes some KVM ioctls) of qemu process.

> 
> - you get a nastygram in the host log telling you that the guest has
>   executed something it shouldn't (you'll get the encoding of the
>   instruction)

I requested admins of the box for dmesg output since I don't have root
access myself and nowadays dmesg is not accessible for a user.

> 
> Can you confirm these two things?

Also, I tried to reproduce on another Kunpeng box with slightly
different HiSilicon CPU (presenting to the system as Cortex-A72) and the
problem is not reproducible there.

While things are not resolved, is it possible to workaround the problem
with some QEMU option, kernel command line, config option, or a patch?

Thanks,

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

