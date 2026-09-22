Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D45C98305
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Subject:Cc:To:From:Message-Id:Date:Content-Type:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB4FZPFGZEQzYGYS86n3W200daWOvuyV72CbgzKsGHs=; b=FraYOUZ/E9pzF5c6h+UKvIfpaw
	79LEtxLFjvr5Iweh/ABz7uKDHz3LjrBOfzq6V3i2/E8eL3oop2QBzkW4Iw9BZ7CrL347cNRFfdEuX
	8IKPldh8ehAF7qJaRMDzc8sZq0A1c1y45J8XyT7QlnBPKT7RYYFS7tQFEkN1tc9hDL5f5X0ZSTuRx
	wtDdzt1tTvpVUFN3R8ken76aWPySFFbTniUviu4SWaJrGB56BUIfxXElsojw+kuy77FBRd0Y7Hgye
	KV6LBnrbDuEsmkCuHOsBovKGAbm8FBHkbA7NklzN4EWJPL3USV95kaEDj+SXRBMa3RwLy+fhZg+0+
	so40NNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vWn-00000004cIR-2bCc;
	Tue, 22 Sep 2026 08:07:01 +0000
Received: from out-207.mta0.migadu.com ([2001:41d0:1004:224b::cf] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vWj-00000004cG6-3IU3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:07:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cB4FZPFGZEQzYGYS86n3W200daWOvuyV72CbgzKsGHs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790064415; v=1; x=1790669215;
 b=Lvf9EUVmJhdRZQobQnfL0Rkgf4hnI5XohrOcCJbxr3bYMcUxXocm+zICEyADiWWJICZYnpcc
 t+DfaU8uJP/oIdb9FQJzIoELY3aURKIi2NEu9hASzWjqRXz079D5QULozg59Glblsfx5wtqEybb
 ZvlxYpHK12DA6kNqK1pVfESo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 426168b88e5d5557;
	Tue, 22 Sep 2026 08:06:55 +0000
X-Mizu-Trace-ID: 426168b88e5d5557
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 22 Sep 2026 16:06:50 +0800
Message-Id: <DLLOVHIKRXPY.3AGBAPAM8F9WV@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Sudeep Holla" <sudeep.holla@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.dev>
Subject: Re: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
In-Reply-To: <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
 <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>
 <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_010657_963276_09D51A7A 
X-CRM114-Status: GOOD (  13.88  )
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

--2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> Where is the associated bindings ? Am I missing to check it in the series
> or it is really missing ? It is essential to add any code using the bindi=
ng.

I left the binding out to get initial feedback on the topology model,
but I agree it should be available for review alongside the code.

The cpu-map binding lives in dt-schema. I have now opened a draft PR [1]
with the proposed dieN hierarchy. The PR also links back to this kernel
series.

> Also how does it align with ACPI implementation ? It is preferred to be
> in parity here, so we need some binding there as well IMHO.

This series does not implement ACPI die discovery and leaves die_id at
-1 on that path. I agree that DT and ACPI should describe the same
topology model.

RISC-V does not define topology fields in hart IDs. PPTT can describe
intermediate processor hierarchy nodes, but I could not find an explicit
die indicator in the ACPI 6.6 processor-node flags. Is there an existing
PPTT convention for identifying die boundaries that we should follow?

Would it be acceptable to add DT support first, keeping ACPI die IDs
unknown until that mapping is agreed, or should the ACPI mapping be
defined as part of this RFC?

Link: https://github.com/devicetree-org/dt-schema/pull/208 [1].

--=20
Troy Mitchell

--2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarI3GiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/dtgEAw8G9zoZFaHkE
oAhSnQKlX8ec/LwA/1LdZjuOaqjDmOsBAIqD7X1Vd3GQdkDDrnwDkXKuMRP0FRGz
9ZibisfJBz8N
=lRK8
-----END PGP SIGNATURE-----

--2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d--

