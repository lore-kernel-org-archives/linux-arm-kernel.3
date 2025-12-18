Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1332CD6D229
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhgSGQYStNGcdPoB3dTlM/CB5TE2tva/NS/z3ptd3wM=; b=Fs5z/lwURhR9SMw4hTMjn4Zjx/
	2rekEiUIXGoBnA1jTugaXfp9x9yYQMFk2Dlpc5JbTCgOxRiRr5N6EgZUeyAMgdncKSV4x/BrHh1kb
	GwcP1LPEYdH5hC3ycDuEBhsJZZLC5GCN1NwHPrG2UMEja2e+386jmVJUaiKFvA37HVP7hm3bP+ikJ
	ld/Qlwec2MnIhCNXdA6i/6IjFfV1NXlxeCpyKpLXMxK2EoI7SfpkMlZaKVdSJ2fLe/ouxbTGVflGj
	H4J9BOPmabdICNHmdX64jsoyu4jQVeWDUOpVaQxm8KkZzneg98FkAHxktNeeGtLNJnizYRCqnoqEt
	4gCHCm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWES3-00000008ZTr-3nf9;
	Thu, 18 Dec 2025 13:53:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWERz-00000008ZSC-3M7e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:53:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1EC57C1A5AF;
	Thu, 18 Dec 2025 13:53:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4BEE606B6;
	Thu, 18 Dec 2025 13:53:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66249102F0B2D;
	Thu, 18 Dec 2025 14:53:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766066026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RhgSGQYStNGcdPoB3dTlM/CB5TE2tva/NS/z3ptd3wM=;
	b=qFohZZY8adtmwbRo28+tcgXOIuD5T9ZV6GmStiiS0ZAEXQPvVe9Zcnoe53YsCQv7j9c1kT
	pTrvVf3pcUkunP7HW/oQvdBg/Lk3nsGsCiYCx3SHIHn49cINe+SDypYYTUNdpwsJxK0JVh
	ocSroqcU2Nk7str55AMgKkPgbWDRxk2+yhvbttnAqOzQlGRqdP2i4+xde+ODjyK3Zpm5be
	ZSBh2N3dOdtUob6QOjlSHuVExl0oaNjoD8HBgFGaCPqRDPAFBwnRVvZxfM0UXeEISM/0Op
	YG/ULfUWn7tCLkV8LWmaP9dHfiDTFdsnlQ2sM6hNfJi3OczZvwptkZvMOkvVJQ==
Date: Thu, 18 Dec 2025 14:53:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Garg <sumit.garg@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <20251218135332f323fa91@mail.local>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_055352_332022_264213BA 
X-CRM114-Status: GOOD (  31.94  )
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

On 18/12/2025 08:21:27+0100, Jens Wiklander wrote:
> Hi,
> 
> On Mon, Dec 15, 2025 at 3:17 PM Uwe Kleine-König
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hello,
> >
> > the objective of this series is to make tee driver stop using callbacks
> > in struct device_driver. These were superseded by bus methods in 2006
> > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > methods.")) but nobody cared to convert all subsystems accordingly.
> >
> > Here the tee drivers are converted. The first commit is somewhat
> > unrelated, but simplifies the conversion (and the drivers). It
> > introduces driver registration helpers that care about setting the bus
> > and owner. (The latter is missing in all drivers, so by using these
> > helpers the drivers become more correct.)
> >
> > v1 of this series is available at
> > https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@baylibre.com
> >
> > Changes since v1:
> >
> >  - rebase to v6.19-rc1 (no conflicts)
> >  - add tags received so far
> >  - fix whitespace issues pointed out by Sumit Garg
> >  - fix shutdown callback to shutdown and not remove
> >
> > As already noted in v1's cover letter, this series should go in during a
> > single merge window as there are runtime warnings when the series is
> > only applied partially. Sumit Garg suggested to apply the whole series
> > via Jens Wiklander's tree.
> > If this is done the dependencies in this series are honored, in case the
> > plan changes: Patches #4 - #17 depend on the first two.
> >
> > Note this series is only build tested.
> >
> > Uwe Kleine-König (17):
> >   tee: Add some helpers to reduce boilerplate for tee client drivers
> >   tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
> >   tee: Adapt documentation to cover recent additions
> >   hwrng: optee - Make use of module_tee_client_driver()
> >   hwrng: optee - Make use of tee bus methods
> >   rtc: optee: Migrate to use tee specific driver registration function
> >   rtc: optee: Make use of tee bus methods
> >   efi: stmm: Make use of module_tee_client_driver()
> >   efi: stmm: Make use of tee bus methods
> >   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
> >   firmware: arm_scmi: Make use of tee bus methods
> >   firmware: tee_bnxt: Make use of module_tee_client_driver()
> >   firmware: tee_bnxt: Make use of tee bus methods
> >   KEYS: trusted: Migrate to use tee specific driver registration
> >     function
> >   KEYS: trusted: Make use of tee bus methods
> >   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
> >   tpm/tpm_ftpm_tee: Make use of tee bus methods
> >
> >  Documentation/driver-api/tee.rst             | 18 +----
> >  drivers/char/hw_random/optee-rng.c           | 26 ++----
> >  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
> >  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
> >  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
> >  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
> >  drivers/rtc/rtc-optee.c                      | 27 ++-----
> >  drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++
> >  include/linux/tee_drv.h                      | 12 +++
> >  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
> >  10 files changed, 164 insertions(+), 138 deletions(-)
> >
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > --
> > 2.47.3
> >
> 
> Thank you for the nice cleanup, Uwe.
> 
> I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in my
> tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git/
> 
> The branch is based on v6.19-rc1, and I'll try to keep it stable for
> others to depend on, if needed. Let's see if we can agree on taking
> the remaining patches via that branch.

6 and 7 can go through your branch.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

