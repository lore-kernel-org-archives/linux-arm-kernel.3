Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36E6CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ngN4kxVQKLMv2TlOZWI2DrSijnc3KpLfGOwuclV4Snc=; b=ERlxAkzCRmYyXrCwKc+v+YE8Y9
	W3UE6CWwFqEcMKLBd769QvqE8IUncWL2yz5zVPtaichJih2CNYjZ+AM2n32kB4Y20DylxS10ja7+2
	2sZyrBTG5upDTYi06/KNFzquMIuItComcqU848/k2594V0//kV3mo5DFEr8crec0CMONAeM5yePw1
	aHTlm3m2nMUJzqh9P3P0+sxkADCJAH+y7Rx5wtSLFMM0TnfbyXbrANdhBK01Jj0LDaicxrw+QReDS
	ppAShop0xgqDGndDAiVUEbOWkPB2RZOfQnF2Y6fwVY3i/4oQhTL3gdTEARsw43OXcPZAlpJqpOASl
	eMyA2JSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyslN-0000000C02L-1rmM;
	Wed, 17 Sep 2025 14:04:01 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjs-0000000Bxl5-47kd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45e037fd142so55971095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758117745; x=1758722545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngN4kxVQKLMv2TlOZWI2DrSijnc3KpLfGOwuclV4Snc=;
        b=xwxaN2vwPJw8w0NOKLY99Xw+t1wFPjWW6YBcPoxViguE1MYflam5E4ThUzBa6N7vIt
         2iEoWuixIdETrMka8EbOAwVoEvI0q4qMqhEsJF16dW+KHTqEsVLqV9YUfuEz3bpNllWg
         HmYT2fRivZwNfThfv0J1paZQZ+ZC+SnRtM6JMHoDhTb7gGTlx4BYYHk3K7H350H95Lzd
         9Ws8NLRVreik+Zl2AsPh++uj2HVGCg5k+HR1iOVK3AS8YzVAF8eUWacHlsEAOlJGK6sb
         GpWUP3bPtSfehLr/uWyxNgmJ26+jBrRlmkyCA6oikgwG9s5rji+2db5QBlS72TTbZtvz
         kDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117745; x=1758722545;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngN4kxVQKLMv2TlOZWI2DrSijnc3KpLfGOwuclV4Snc=;
        b=LTkIfwExVil/jXiLy2Wk7k/BxCyaqVOjq9HVyTskJu4B2K71HyCWW7yTjIsltzkaSS
         YFBc3YaqGg5H08FsdmzUTfOuku8O/gA4/7HmlpGwtItE2MnLrZ6xkUPlqH2pL/XY22aZ
         PqmD+gaQDLF8sQyXFGoorhOEdZaljCwJID3RDXfYADN32PL8ltPMEcYZSgehDRsrkHVQ
         kDJkR5fQznIYnCpU6DEbQ9trJ4lS12BFZQZfuBou5Eq9gjMDK2uwoLUGInkrcDQ9JpZr
         X5lnO00FoCcD3c1jzUtByGYp6zuLvXTm2lW8d7uAqf3G929F8TbtQByV0Wi1QMxm7vQZ
         ChTw==
X-Forwarded-Encrypted: i=1; AJvYcCVD+ZdKPYpW7+CmIN2FTa0S2fLKW3MjKMfk+VCcw1XaCk3JEVWzaGvPMCjy2VpHjegEx9+JPM5Q4sJSJdR+bNwH@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3j88Mu69m6x/MVlREYaHmEq3jBsCBc4y9VZwhvzOZHUF81dg
	idjEuB/9hWQ+5xPLS6NU2yydSKqGkQbdLtwYctlY3jXZsDa7ckbgBbOwDCsxqvqIxRQkS+qffFy
	2a6RP5r7W8vqczg==
X-Google-Smtp-Source: AGHT+IFdG0Nhhw1O1UF5cygDkCqoxwKDzBO775bZilL9ZTcI8tzFDCdOk8xitUr+etVtXwIkoCMI0q6cwt5MfA==
X-Received: from wmtk6.prod.google.com ([2002:a05:600c:c4a6:b0:45b:89e7:5038])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354c:b0:45b:7aae:7a92 with SMTP id 5b1f17b1804b1-46205fa5930mr21477245e9.21.1758117745343;
 Wed, 17 Sep 2025 07:02:25 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:02:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917140216.2199055-1-smostafa@google.com>
Subject: [PATCH 0/2] Move io-pgtable-arm selftest to KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070229_074096_57D24E9E 
X-CRM114-Status: GOOD (  22.94  )
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

This is a small series to clean up the io-pgtable-arm library.

The first patch was originally part of SMMUv3 KVM driver support[1],
which was needed to factor out the kernel code from the io-pgtable-arm
library, and based on Jason=E2=80=99s suggestion this can taken out as a cl=
eanup
and to converge to kunit.

The first patch just moves the code to a new file with no other changes,
so it can be easier to review it with =E2=80=9C--color-moved=E2=80=9D

The second patch registers the test using kunit, and converges some of
the APIs, some notes about that:

Dealing with __init:
--------------------
At the moment, all the test code and data are part of the init section.
To avoid changing all the functions and data and removing them from the
init section, we can rely on the kunit =E2=80=9Ckunit_test_init_section_sui=
te=E2=80=9D
to keep the test in the init section.
That will make the results only available on debugfs (there is no
possibility to run them after boot) unlike the SMMUv3 tests for example
which can run on-demand.

As the of results are saved in the kunit structs, they can=E2=80=99t be tag=
ged
as __init_data, instead they are be tagged to __refdata to avoid the
modpost warning, as it=E2=80=99s guaranteed that kunit will only access the=
 results,
not the test after init.

Instead, we can remove the __init constraint, and be able to run the tests
on-demand, and possibly compile it as a module.

Granularity of tests:
---------------------
To make the series easier to review, the series changes the test to run in
kunit without making intrusive changes to the test itself.
It=E2=80=99s possible to refactor the tests to have smaller granularity (al=
though
I think that would make it less efficient as we might create the same io-pg=
table
config multiple times) and integrate them in kunit as multiple tests, that
change would be more intrusive, if you think that is the right approach,
I can add a couple of more patches re-writing the tests.

Other changes:
--------------
- Also, to make the test changes minimal, and fail messages similar, =E2=80=
=9CKUNIT_FAIL=E2=80=9D
  is used to fail all tests instead of using KUNIT specific assertions.

- Instead of using faux device, we rely on kunit_device_register()

- The WARN is removed when a test fails, as that doesn=E2=80=99t seem to be=
 a pattern
  used with kunit.


A failure at the test with the new implementation look as
[    2.115982]     # io_pgtable_arm_test_run: EXPECTATION FAILED at drivers=
/iommu/io-pgtable-arm-selftests.c:94
[    2.118381]     # io_pgtable_arm_test_run: selftest: test failed for fmt=
 idx 0
[    2.118501]     # io_pgtable_arm_test_run: cfg: pgsize_bitmap 0x40201000=
, ias 32-bit
[    2.118863]     # io_pgtable_arm_test_run: data: 3 levels, 0x20 pgd_size=
, 12 pg_shift, 9 bits_per_level, pgd @ 00000000a15afb2d


[1] https://lore.kernel.org/all/20250819215156.2494305-5-smostafa@google.co=
m/


Mostafa Saleh (2):
  iommu/io-pgtable-arm: Move selftests to a separate file
  iommu/io-pgtable-arm-selftest: Use KUnit

 drivers/iommu/Kconfig                    |   2 +-
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 223 +++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 243 -----------------------
 drivers/iommu/io-pgtable-arm.h           |  41 ++++
 5 files changed, 266 insertions(+), 244 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c

--=20
2.51.0.384.g4c02a37b29-goog


