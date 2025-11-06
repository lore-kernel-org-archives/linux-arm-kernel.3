Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43EDCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvpySRHgLIWKGb+sMO8FMNbde9Et/+YXOX6pluAwOOg=; b=KRJP/7WA4BStbjOQ5DKzdOG4Xj
	l8gy455PfVrzj32dh6JvEEniJuF9sTu4NHZjPAWq/qjutQMzZSSxL9A4WtYnflCwhnRx9KAsh/rH5
	Zdej9XPi059j+uMzbDtnFBp0Elg+8fJrf8JwIST80Tb6zqyjjbwaKMo2M3zfAZwkJBRw9JRG+9GW0
	CakpPSNVES+Yxrl8M5eZ+FqMyRiDPvuEvxfLUWAWyv1vYe+C7O8EAEfaHOEwOotcDGHlW3UynuNHO
	VR/Mf5sYp8QvttquKbbHpa27Wo1mTq0TGc5b1CdReG2FKL6GL91smww/U8VewCeP7p856u+2JrPG6
	LbJfpmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH13h-0000000Fhkl-39BA;
	Thu, 06 Nov 2025 14:33:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH13g-0000000FhkO-04xn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD22448B3;
	Thu,  6 Nov 2025 14:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53B2C19421;
	Thu,  6 Nov 2025 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762439631;
	bh=9FjKKSnEVIEhKwTItusx1yIHUqSaD65zlSGBhCdIHLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVwrIrX5FlWKMcZnaj2v+TPP1jfPV01Z/YKxg3cg1fMDkWVZzzdACPx+g2Rs2ywhP
	 9Bw8Sb/jhVSUjmdRGlJYxUOrXVQEu0D86+FFEw6qJ+rDDG2ZgCexzxJTk68ObQzzSi
	 cYQZ8s+TuZ544rgzxcNXsrYw7O/Fh7TnS18Y4EOcQPD28mlpnbAQ0T0yw7ICd407wo
	 mkFbZafRKnH20dvhdysR8sZQT3aRHkw3AeVr0Tlf8plV/CFpWdMWn1h5mXOoTBCjH+
	 ckERdaHaKl7dOTKgVL/vxCLbhOriIaTuyXa5fFux96U4++kISN9ZnwCWjoc7No6nEM
	 9lZdN287RFNVg==
Date: Thu, 6 Nov 2025 14:33:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com, yangyicong@hisilicon.com,
	yangyccccc@gmail.com
Subject: Re: [PATCH v3 1/1] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
Message-ID: <aQyxy3vCbk-Ux9Zp@finisterre.sirena.org.uk>
References: <20250922033010.4596-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JLHuGXexjAplQPnq"
Content-Disposition: inline
In-Reply-To: <20250922033010.4596-1-yangyicong@huawei.com>
X-Cookie: User hostile.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_063352_101723_EE20DA6C 
X-CRM114-Status: GOOD (  16.47  )
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


--JLHuGXexjAplQPnq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 11:30:10AM +0800, Yicong Yang wrote:

> index d72d6e5aa200..daa1af2e8204 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -89,6 +89,17 @@ void remove_cpu_topology(unsigned int cpuid);
>  void reset_cpu_topology(void);
>  int parse_acpi_topology(void);
>  void freq_inv_set_max_ratio(int cpu, u64 max_rate);
> +
> +/*
> + * Architectures like ARM64 don't have reliable architectural way to get=
 SMT
> + * information and depend on the firmware (ACPI/OF) report. Non-SMT core=
 won't
> + * initialize thread_id so we can use this to detect the SMT implementat=
ion.
> + */
> +static inline bool topology_core_has_smt(int cpu)
> +{
> +	return cpu_topology[cpu].thread_id !=3D -1;
> +}

I'm seeing build failures in -next on arm v5 and v6:

/build/stage/linux/drivers/perf/arm_pmu.c: In function =E2=80=98armpmu_regi=
ster=E2=80=99:
/build/stage/linux/drivers/perf/arm_pmu.c:935:24: error: implicit declarati=
on of
 function =E2=80=98topology_core_has_smt=E2=80=99; did you mean =E2=80=98to=
pology_core_cpumask=E2=80=99? [-Wimpl
icit-function-declaration]
  935 |         pmu->has_smt =3D topology_core_has_smt(cpumask_first(&pmu->=
support
ed_cpus));
      |                        ^~~~~~~~~~~~~~~~~~~~~
      |                        topology_core_cpumask
make[5]: *** [/build/stage/linux/scripts/Makefile.build:287: drivers/perf/a=
rm_pm
u.o] Error 1

The above function is inside a CONFIG_GENERIC_ARCH_TOPOLOGY guard, we
need a stub definition for architectures which don't have topology
support or for the users to have guards.

--JLHuGXexjAplQPnq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMscsACgkQJNaLcl1U
h9CXewf/VfZLUia31MZO5i8rEEeXPT9TloeqYOCq/4ddTUTEcEnjI0zXnwF6O/du
q4kuSAMvFgF9aeFTyIojLD9/EDJRiegU8ev5Kt89S5CKvAYsAvmxWWXjNe02/39e
+7IpHENO4CILwoXh4UQZCUgWCO9Df++8z03nivM3KE4SuE/1u5c6zrTDr+mh/JL1
rOJwEHsrNrRIQNzNDpguctcrkKwmqG93MOJLoxiu6eCWjMZeRFimchWMt/QvFV5U
RsbtZL8XJ60nBAqbasUvjxw6u1NRhUgm6bRfUpnY+G0xOI7hXavDUoqOLN4keqsB
5wDzLNqC2w3KA3iDaot5bM5whox8WQ==
=0YMK
-----END PGP SIGNATURE-----

--JLHuGXexjAplQPnq--

