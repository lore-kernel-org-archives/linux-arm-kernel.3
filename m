Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF72C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNZN5apO3ih+wp5yA8vfS7lu9ZPmepgW1CjLVvwrgaM=; b=TEmiB3Nz8+nsS2CWvi3aQhRtaP
	IcqZtO91U49qtUXlZHxXTW3Oe0h+1n26fbR/BXpR4i6ZQpSs9GSwSR+kM6WAxkkXmBhZcF+BRBYr+
	UUS1mIVslcLyra+hKijmJwZK4zAjdjE7VW3ceehuTWTC1kaJFvS87ukWJI7pJMC4MhBDlGChQ6UA2
	tsK32qSAGKCILC2HIUTJF099KF2KXYkEH345f4rM1ou1IDhzqyk/us/5E+242eY6oRaDb6pk04Adb
	qr9FlCHde2qIbHOW0hoeKYP5BPeLwILb1/V6BD7828s4SMS0AyBnuuHwtusmELQKuELKBFbrd5OlZ
	gCg5c3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SvE-000000020vK-1RwD;
	Fri, 04 Sep 2026 12:21:32 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SvB-000000020uM-0t2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:21:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MWnONv/mcSy1ZzvbBOJBF9sO7kdoah8czNuibP8g/Js=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788524485; v=1; x=1789129285;
 b=nzpy2CRsW44lFLcx0vqWN/MENVWD2ZVkBxTM2cXn66D2697UuZVjrH+n1olm63CojGTjRDzm
 XGKvFxDhiXIG4XzktTiqdFKH97sXoyapzyf0is1LPafX53Hyy2swNN6d11FnTOPtdywRoOUbdcq
 0vUuYLP2kZ48vCdjbooHXPlE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3a4516637a6444d3;
	Fri, 04 Sep 2026 12:21:25 +0000
X-Mizu-Trace-ID: 3a4516637a6444d3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so5632e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxB40zEynQM3+4vr27aGDn43gqqgVApu054tnfkmkBkmkM5q0qkaQ4K6qjZZFAcpC2dAx3wFvevB16AMgVD2VHk@lists.infradead.org
X-Gm-Message-State: AFuF++nzqvqoQUbGHsXAyOAvs6zO9K1sL8Iqx/fD6aYadn94TCA3o+bk
	/jTfporTtGbzzCqcR3Er2RwncJXSuRz+zLLerZhOxWXC9MU+4msKXlKBlb9T3xcQhivrCjXfvJa
	LOkNPsPOPRhGnhXZR88orL6/rzfFf/TXsZZjIqWWA
X-Received: by 2002:a05:6512:a348:b0:5b6:186e:682f with SMTP id
 2adb3069b0e04-5b6186e6924mr49450e87.0.1788524480459; Fri, 04 Sep 2026
 05:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org> <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
 <apqrky27mJmUV9UA@willie-the-truck> <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
In-Reply-To: <05f1e2f4-173a-4226-8c98-1452c20f0a47@sirena.org.uk>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 13:20:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx87SnshzrUF69hGTSA9JmjW9oKbx+GbKjx5W+gnWYRgg@mail.gmail.com>
X-Gm-Features: AcwNN1XeCRX4giVtMT6c-n59qRC6UqdpZVxqwiiImVnvjhpDgql12CaOGJS8YCo
Message-ID: <CA+EHjTx87SnshzrUF69hGTSA9JmjW9oKbx+GbKjx5W+gnWYRgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_052129_551927_3C381AC6 
X-CRM114-Status: GOOD (  22.07  )
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

On Fri, 4 Sept 2026 at 12:48, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Sep 04, 2026 at 12:29:23PM +0100, Will Deacon wrote:
> > On Fri, Sep 04, 2026 at 11:33:24AM +0100, Mark Brown wrote:
>
> > > What about pKVM, my understanding was that that is very much an ongoing
> > > concern and uses the nVHE hypervisor?  My expectation was that this
> > > would only ever get used in hVHE configurations when people enable pKVM
> > > on modern hardware, actual nVHE mode was mostly just carried along with
> > > that.
>
> > pKVM uses hVHE wherever it can nowadays, so I'm fine with only supporting
> > S1PIE on hVHE and VHE configurations if that's easier to maintain. We
> > just need to make sure that the failure mode for nVHE results in the
> > feature being gracefully disabled, rather than e.g. crashing or quietly
> > doing the wrong thing.
>
> I figure that if we're supporting hVHE it will end up less complicated
> to also enable nVHE, it reduces the potential for having bad or missing
> fallback paths for features downstream of S1POE.  It's not like it's a
> huge extra bit of code and it seems likely to save hassle down the line.

For pKVM there's no fallback path to get wrong: any CPU with S1PIE has
VHE, so pKVM runs hVHE on it, and a CPU without VHE has no S1PIE to
disable. I couldn't construct the protected nVHE plus S1PIE case under
QEMU at all.

Where I think it applies is kvm-arm.mode=nvhe on S1PIE hardware. That
boots, and it's the one configuration where the nVHE side of the patch
would run.

Cheers,
/fuad

