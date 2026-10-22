Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823F3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwYRytOm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ks1JPK2i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=; b=HwYRytOm8PA2WBwMQs9GA7T0wx
	hskXod5e3TynPYNUIqsuirFeFo03inScJmd8D2kqbq7nFxlaYGQTnqIqqe6LlHTIzgt5f/4OykKny
	4t4RgftPfnTMAwixbY//gWz+dhxCkpNmcPwCfQNksRECqGtaod5W7FMTg1KMJgKBGlqeZunVwQT2P
	mMiGsWCGgxWYIyqJi+6xUgKBjHUJqWOSh4ghKlsYEDNxiy3JpHIohpqR/4Y4OEpk+2o2W2nGbHmaN
	GyfxaYRnJeGS9iXJOoYFy2R6jLCE0B4UfIbEtFrGS0OcRD+3U7JIlE2Ge1MyU4jeBisKhvX0Koxtp
	IWqZ7E3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsbF-0000000E9c6-0WEy;
	Thu, 22 Oct 2026 13:12:53 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsbC-0000000E9bE-2uCa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:12:51 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-825b40f8a26so1012587a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674768; x=1793279568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
        b=ks1JPK2iH7EUOOtdlhz8eAcXHe/4+mQ7BhBFbsOmyNqKPxz9MlXYNkAHptl2k/tJYh
         L5uJ2OpkxibxwBhogxlhtV+9BDl+l+KJFOD/KTuydDAyi32m4hxYiwGnmDMaG+5oCa+1
         S4a/Rs0qlts6fiFiUyJZcHYQTITpm2yjZHfMTkIyXPcn+nHRiesPzbILeLyH2LFuw1MW
         ajmPFI1/W4WhM3/YvZ8b1PBC6gY3Vs/Qs2rezOny/oSY/O2NZg05FwqTr3OGfe+7d1mH
         1UcUkfVzeadrzTfynqmyyzt3j/IBTCakkp3nWPslkG6nrgZfO5zdV+qayH7t1pyvwPDa
         EdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674768; x=1793279568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfYEKhh0NOwW5bByBsDPAiJ4npQywhU8FLsAEbKDB48=;
        b=XM88jQd1VoO+ku8I84coh1LGOI32ceUpf07BcQ0Tngmpmj2NRqBSci/fbpv9njPVrT
         LwgtfaAElP5nW0CKnSq+HYqiD/UMUmTgDklu8xE6AlMd+c6EY+02lRnwnGGggmaLdmeb
         NdZ/QXL4ooxmxfjDVeOAdtKJzwsn6o8WdjOO4u13/SniprcPmyydmR9/DD8MG0HYL/Et
         hNHMJbulPg8/+xKdcVgYmVKi8N0L3nZ2nHgL0PI4OGPGjefBvaoD4QWMxizFNxudEo9T
         EBs+blckdoElXgFN9zTN1JB8fersoOzs8C5J8/sT32vM7si0ZBiWEdi/LKV1BHt1/sfV
         KBow==
X-Forwarded-Encrypted: i=1; AKwUvBwJu4QwpKsmN17pJTwY9EDHjQ9UITgW+8TGBk2fR08Wdos+BjWiY4YLh7PPny4FfCX/ugITVjjnNA5aewAbRsfk@lists.infradead.org
X-Gm-Message-State: AFq9FYIDJgJNay+h1l4YhOvtaMN6vyADIXAwNlYUdjPWdg94hdQ5Db+A
	Kk0cFtLjUPkDpcdjCKCa3ujsecq3wnNMNWQ6VampJnDakoIkUGaXO0GA
X-Gm-Gg: AYBFou0ZdOs4s+BTxhvB5zJsvJxdIuw2DIozAHuCygnAX/SViytwF0HzEklhSy2n7V/
	jGWigmNp2US8lZ5ZU4NYvfbwUmZQgB86gzJgltAPtYNULg3z+34D61L0pinPiQenFRJs0fGM7A/
	HZfX1MNywY/l+iAyArxgxeRGhDhq2r2n7g1HKGl8HLqC59yn4LKzXBOc/wgDMDS65eDulxVQezc
	lLwT8CQN9ZcRTTD9k2es4GmlrxeLL6tycUX8waKcOo3g+0C67+EuCkRZjuMnwWtjUHmTZN7xsZk
	RNl0S+nGNu/QfIiMpW7pe/etr6woddHmSZ4R6jtOoa5qsMWXIu9oc7A4nlUclPkYgv2tsTgFMAW
	lU8KsF1kN+vuz/faGhNC1cspMOUndZ0FE8uC2Gtm3locl3rz/w6cp/m3khe4RoTtf7RJvmSSGH5
	OaxBbDH5/SA8+uEYB5CJ4E82qHmTgqZBNbmKe9cUVDK42My6uBrjpzkW8wvjo4PIDjWncRFUSQL
	NZI4LgWvOpzAxj74SxDhP2RZT7/u1IY4FahK2dzobJLLtL5IwuSOR8guxMjyc+bxLcpFZ29VgL+
	dABthRoFkgQjX+QyGToqlY1sYaLKkhaaClRFTQ==
X-Received: by 2002:a05:6808:30a6:b0:4b9:a88b:888e with SMTP id 5614622812f47-5535be9e63cmr3845871b6e.36.1792674768107;
        Thu, 22 Oct 2026 06:12:48 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b6da2902sm4259863b6e.11.2026.10.22.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:12:46 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 0/2] iommu: Propagate iova_bitmap_set() errors through read_and_clear_dirty
Date: Thu, 22 Oct 2026 06:10:13 -0700
Message-ID: <20261022131015.3281745-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_061250_733836_483AF80D 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a follow-up series on a6ec38d74c08 ("iommufd/iova_bitmap: Fail
GET_DIRTY_BITMAP when a bitmap page cannot be pinned"), which keeps the
first iova_bitmap_set() error in the iova_bitmap so the ioctl fails. As
Jason suggested, this series propagates the error up the call chain
instead.

Patch 1 makes iova_bitmap_set() and iommu_dirty_bitmap_record() return
an error, and makes the iommupt and io-pgtable-arm dirty walkers stop on
it before clearing the IOPTE. We only clear the dirty bit after it has
been recorded in the user bitmap, which prevents a failed
GET_DIRTY_BITMAP from losing the dirty state of the IOPTEs. This should
also address the case Andrea raised for the -EPROTO path: with this
series, an entry that did not fit stays dirty for the retry.

Patch 2 adds a corresponding selftest. It fails on the current for-next
and passes with patch 1.

Tested on x86_64 in a 2 vCPU QEMU/KVM guest with the iommufd selftest
(mock iommupt domain, CONFIG_DEBUG_GENERIC_PT=y): the new test is the
only change in outcome, with no WARN in dmesg.

Samarth Narang (2):
  iommu: Return iova_bitmap_set() errors from read_and_clear_dirty
  iommufd/selftest: Test GET_DIRTY_BITMAP with an unpinnable bitmap page

 drivers/iommu/generic_pt/iommu_pt.h     | 29 +++++++++-----
 drivers/iommu/io-pgtable-arm.c          |  5 ++-
 drivers/iommu/iommufd/iova_bitmap.c     | 18 ++++++---
 include/linux/iommu.h                   | 27 ++++++++-----
 include/linux/iova_bitmap.h             |  9 +++--
 tools/testing/selftests/iommu/iommufd.c | 50 +++++++++++++++++++++++++
 6 files changed, 110 insertions(+), 28 deletions(-)


base-commit: 04bcf84613346b973a8cc0c59238b6b5bc902688
-- 
2.53.0


