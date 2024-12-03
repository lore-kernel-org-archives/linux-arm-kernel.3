Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52EAE74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/i9lfz5sCJkFQLxXFYdLwNLA0qoCYW2KkzeZVDwtlU=; b=T9V5mGyrMUft9heFUOM6QPhR/4
	af0J197HRdzrdoOpc/A76f47L+SBC40kCSjA7M7X7lZ7VcGIT4qI2/tj6RVHOVsqXB1ZAG/Q0zGgs
	FN2Lvy7LNYiqTBDGXsn3/YzZNKP0LWqn+BIuRkYjitSGeB2ToFBB1Wh8VCBhmEnAvubi23ZFhyPhb
	gyC1OLeWuLFqcCyixI2K5ly0195l3Z1J5T23/d5KvaLUjdd9YJJ+lrGG+AsGuPcaUiCPp528REgSe
	YIEOc1jrVjhcTtdk6HGv71FnZAMfkCfom9ZEGpMRUskPXe2U5bwTIqKLevwywcoS0XtWpx+mGcbRK
	/sZfcKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWCn-0000000ABBb-10Qx;
	Tue, 03 Dec 2024 16:56:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW9E-0000000AAVE-3pNG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47EF65C6993;
	Tue,  3 Dec 2024 16:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1E1C4CECF;
	Tue,  3 Dec 2024 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733244795;
	bh=n/0zLPb5Wfwf5ixhKJ0hEDqs+kdK/IJ6TEf/PR1iuOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YptYq9x8eFznxIF25GEkMXFyi7kalYe5TIcRjtkiQGIsQyv9nXlg40Kf6/MvqJwtb
	 4e+mPkX8FVCpzOFtzn3rn8GFQY6EystAGLzNQJgEOuV2r0k82cbiI5qoWBGwDJdFBf
	 dfJDG5JfqCA83eOe0zDRRTauC+3X5ivRKIMnqCVeZGCBt4nhSTpe0xXq8KZKf8aEx4
	 vGTKzuZuLvaeWibVCzU9CVBwuOC2RIgUUWGHxJvHnF7ia85B5G+D7KEve0pXfVveDA
	 a3fSUDOu1Lsvw071pEvsuCssZxMFQtgVs3W7vWlG4RMLYUmSWTowuIM7E1lKzPzGIp
	 TEL0WAZGdsQ7w==
Date: Tue, 3 Dec 2024 16:53:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64/signal: Consistently invalidate the in
 register FP state in restore
Message-ID: <f9e297ab-8325-4b48-b8fc-21486ff48cd2@sirena.org.uk>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-4-d853479d1b77@kernel.org>
 <Z08k6QsYRzO8+O4t@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hX1yMOOoh6B0Yabs"
Content-Disposition: inline
In-Reply-To: <Z08k6QsYRzO8+O4t@e133380.arm.com>
X-Cookie: Alimony is the high cost of leaving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_085317_033724_8F4142C0 
X-CRM114-Status: GOOD (  26.02  )
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


--hX1yMOOoh6B0Yabs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 03:34:01PM +0000, Dave Martin wrote:
> On Tue, Dec 03, 2024 at 12:45:56PM +0000, Mark Brown wrote:
> > When restoring the SVE and SME specific floating point register states we
> > flush the task floating point state, marking the hardware state as stale so
> > that preemption does not result in us saving register state from the signal

Now I think about it again this should probably be dropped from the
series, or at least ordered after the reenablement.

> > +	 * thread floating point state with preemption enabled, so
> > +	 * protection is needed to prevent a racing context switch
> > +	 * from writing stale registers back over the new data. Mark
> > +	 * the register floating point state as invalid and unbind the
> > +	 * task from the CPU to force a reload before we return to
> > +	 * userspace. fpsimd_flush_task_state() has a check for FP
> > +	 * support.
> > +	 */

> Maybe add a comment in fpsimd_flush_task_state() about why the
> system_supports_fpsimd() check is important?  It's not obvious there
> why we should ever be calling that function on non-FPSIMD systems.

There already is a comment in there about it?

> But would it be a good idea to stick a
> WARN_ON(!test_thread_flag(TIF_FOREIGN_FPSTATE)) at the start of the
> functions that rely on this?

As I mentioned in reply to one of your other messages I want to just gut
the whole API here and replace it with get/put functions for the state
which would include the get/put functions making sure they're paired
with each other.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--hX1yMOOoh6B0Yabs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPN3cACgkQJNaLcl1U
h9B40Qf/USE0v0sbO6fCh4oVL2BkT7MBvtv3GiKG3bKqv8rcKBrqefb39r32mr2b
YsoSkhYJH9EZH16B+f9i7gf4XmBbHBBAFU3sMicLJuuA12hPEss3iLw6C3XHW843
WUnmJQxmEe0i807I75qY1GflS6wPNP+2fgNw9lwxN+x9zfRsQptLX8h9LRhTrDB1
7sd3nY2tJ1t5BNMiXEsnlT4fS+DyEMPCgP2r+yZgxFV1gfM/h8Txr+OvUMNqN4EF
nThX1ZHx4KKIkrjsAod8Nlk9tAZMsDvTF6ZSv2PguRc+v02EwXB6icK5sbkU3KFv
ZkvisFiNqm6+JA6FcucI4pyUHbBIZw==
=zNbQ
-----END PGP SIGNATURE-----

--hX1yMOOoh6B0Yabs--

