Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lCZ7G6SNgZFbJUMgnsW3ETwHXQ8DNYKJ1VAQ7wa5jA=; b=myZiGqQp/LIC5Wk0T76h/uFy1e
	zeMmasU+caEB5wH9YWzp5oJdYuoK0UQeOAyNgDkUTgBQlKCY2JKgNbxUXAE4vCo8zmm0gbq081ZvR
	Pd1jxVMM/EN+gpSeO9GUUWnMhsuRcX+Su1i0KSIK69QbuVEwkulC2PNvKEZ/LYJOVeW6HNSe0DaAe
	uLBTVDKj9AFncVjF1z8UTEbNGUyDV+bs1JclN6nZbZeA/2DyxQMLm8jZ/4F/OK+jnT9wwrxly0IDy
	dvwYWXkKgrPFtCLZWTwyqze6YB+L59LqYDV4jAdCCJcAWKoLFNZP9bP3vv46oMuK28iolh/2A0JU5
	+VTtveiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJeW-00000002aZ8-1pqK;
	Tue, 04 Aug 2026 18:14:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJeV-00000002aYz-3n03
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:14:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2380D404BC;
	Tue,  4 Aug 2026 18:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC901F000E9;
	Tue,  4 Aug 2026 18:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867249;
	bh=0lCZ7G6SNgZFbJUMgnsW3ETwHXQ8DNYKJ1VAQ7wa5jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GP9Jyq3ImlxUyG5PYNCsX/FdyquDUqNk1pngO/aod7TeAvCCFRAJewoSsxhDux2X5
	 4HCBbcRJOWV0OOJEPztylPgD4K7AD2jcWRA1bmN8Xg5iv30oK/ycci2550YdctZS+/
	 ISj/4x+YVRyV8sUFDBhHGqO9tTDn8tWBIu2lBd7wd2u6sZTmyakyFarei0drXYxtFU
	 rhh79sTCrtpeih4TFD14i6oPOTPlYK9jB8mviph4j3sOSWVrH6Hupc0LLcv8H+7daL
	 Iq8DNV7dYbIbWbyntGnw1fD/xVDh0tf2qOoFxsn6E0x6VPn3j9oVE/jWizoX+in5VT
	 qe5RJHpat9bZQ==
Date: Tue, 4 Aug 2026 19:14:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: selftests: Check ID regs are immutable after
 a failed run
Message-ID: <7e660a4c-af62-4751-a8cf-49151054f0df@sirena.org.uk>
References: <20260804092421.1728880-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UnkPqelfwiKSm0sl"
Content-Disposition: inline
In-Reply-To: <20260804092421.1728880-1-fuad.tabba@linux.dev>
X-Cookie: QOTD:
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


--UnkPqelfwiKSm0sl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 10:24:21AM +0100, Fuad Tabba wrote:
> Add a set_id_regs case covering ID register immutability when a vCPU's
> first KVM_RUN fails after finalization but before

A couple of other things - there's plenty of other examples of these
problems in set_id_regs, I've got a series which I think mostly cleans
it up:

   https://patch.msgid.link/20260719-kvm-arm64-set-id-regs-aarch64-v6-0-724287f5f108@kernel.org

but probably best not to make the issue worse.

> +	if (!found) {
> +		ksft_test_result_skip("%s (no immutable ID reg field to test)\n",
> +				      __func__);
> +		kvm_vm_free(vm);
> +		return;
> +	}

All test result reports for a given test should use the same string when
reporting so that automation can figure out that results for a given
test from different runs correspond to each other.  It's better to print
a diagnostic message, then the ksft_test_result_() with the result for
the framework.

> +	TEST_ASSERT(r < 0 && errno == EBUSY,
> +		    "ID reg write after failed first run: r=%d errno=%d",
> +		    r, errno);
> +	TEST_ASSERT_EQ(vcpu_get_reg(vcpu, reg), val);

> +	kvm_vm_free(vm);
> +	ksft_test_result_pass("%s\n", __func__);

Mixing TEST_ASSERT() and ksft_test_result_ in the same test program also
interacts really poorly with automation, TEST_ASSERT() just kills the
entire program so no result is reported for the actual failing test and
any tests the program would attempt to run afterwards also vanish from
the results.  If the test program is using the kselftest framework to
report tests as this one is it should report the results via kselftest
framework.  A better pattern would be something like:

	if (r < 0 && errno == EBUSY) {
		ksft_print_msg("ID reg write after failed first run: r=%d errno=%d",
				r, errno);
		pass = false;
		goto out;
	}

...

 out:
	kvm_vm_free(vm);
	ksft_test_result(pass, "%s\n", __func__);

TEST_ASSERT() is a good fit for tests that are just one test case per
program, then it plays nicely with tooling since the tooling just
tracking the executable result and any output is diagnostic logging.

--UnkPqelfwiKSm0sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyK+sACgkQJNaLcl1U
h9BLFQf+M2EJkmtPKxPvAE1jYWYzT7FBTecWzsvhmXOcvfDOFM3DC9Mx06mhp3Xf
/8vRfb8xclnvXnepYxm43kzZCF8sfg7j7RHsumvyawkQe67rfgmKWr2XFuwgLIwi
Bs8qUQKvwH+6oN0HdRpCY7N2WXkvjmOHQeOb5AAM6QVnHIqk8xBaR4OpwCWeLmlF
IAk84krdI6Uns7W+2dhZwNFKNQGmV67595izCLGjPEZ79L1kNip1UfdaztYcgFPf
LczVv4t11khhG/KxYBnDIQHx4Fj0ph+iur2sNXP/ZRgt/wqEbSzj3FBr4pYMXWZm
pw+b7DT9DUuuBopgQmk/NbNAg096tA==
=SVXk
-----END PGP SIGNATURE-----

--UnkPqelfwiKSm0sl--

