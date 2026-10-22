Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CF7606B426
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5Fi6sGH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sXaA7qR9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Z5cUY9Mri59TRv/H7HqmFuQUWT+VeCjs07XpBmB92yw=; b=P5Fi6sGHJYAW5VkB2p6YWj6o5u
	V9iZGobJyYLSS8pcZr5mJ0fREZr14x8BBLwZmk1udwh95rFfuEcu/nSl3BOwjn5U3yzdHGFx9c441
	EnFiOLaXGacod8sPcuiYrjrocNwn26vWscjK9vuKY9Cm5xHIxs+7+/GoaEJDGItGtC/miXA/KqJvx
	ZHka8cby64Y1lO9dxzg4CuLPblZVfFG6ZfwlkEMqI/mz0dY2GwDIZbXrRVFkngOlB9yyzUupJadQ5
	p6QMzeIOOeqw4CBCw8Nu2UiTAfrciZJjSnMipU2qIeRqGyXfp5+InKzaY7owElAhU1JDVZo6eC8PA
	xIUpPqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxfM-0000000EjDS-024y;
	Thu, 22 Oct 2026 18:37:28 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxfJ-0000000EjD6-37Gq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:37:27 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-98c78660542so119611241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792694244; x=1793299044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5cUY9Mri59TRv/H7HqmFuQUWT+VeCjs07XpBmB92yw=;
        b=sXaA7qR9wnhcLwlpTRXMh52id9RBXIzZ3s+DHv0DRJz1MxaqPTLi+yKGqVT3SubL4l
         JPsS9Q2k4djO/6J0X1PfzvxDB41lC9x4/zKD1B4zWcExEzn77mDi3dE6mtgOH2F30gKx
         jkrCn4bwBcPTbEkWiJWplRil80z9tLx+48sY4YPce5qZS8SEdvZfqrqSKSUt9+5yN0cI
         C9aMD6UDdd7f82L4DOo+4yDd0EWfcmhdv+YQyrJ21qx+rqhOenFFFSpS8+vllnqw/Izs
         ck4iZE+AL4rYDuo/RW5j8SdT+8hdULX1deblwC/9TPEDTY3vC1El+wCkqobATf1JfcSB
         szpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694244; x=1793299044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5cUY9Mri59TRv/H7HqmFuQUWT+VeCjs07XpBmB92yw=;
        b=M8+py6lluLegpgLzh4yFubQe1F8Hs7Jm9JlRI6yHFBOf/PNvQJBXPhql6LXQ/3q9zU
         TyQDvShA8fbAolSzNg3LwrfM5EeQHb9yehLvCXKFejc01oojonHn0tMX4iuNZyfscXeh
         MOy1FAQ8WFMa8Jb/gUiT50zIYgruJPCDt3VVy3Ca8+b8aYBNvdqS29m0MeotU9Jlurzf
         N75WCL2zNSXCRD20uTilwVKcUedBbnVIxWmTZiHwu7qQ4apUXB7B6oQaDzbmG/HvugKX
         3X4vw6t1X4eefPudgo/d6ZKCItd0h6+D9NDkS5XtIru+Jmggh6lv+PcxzL1b8gsIRrOZ
         z2jw==
X-Forwarded-Encrypted: i=1; AKwUvBz4mZx+33jE3Pa3UXsm8TPCNIFfO97H14e/rvv+5sC+DXaowdqZzEbyPi3JKF7sgUQWjaNdEWBDXb0S1nvlAU2w@lists.infradead.org
X-Gm-Message-State: AFq9FYJiY2drQskgPBY6M8KTy+vihKBSbxM0UklBdzPE6bK4FJrZPTHF
	zifIo9EuzCi6DSDw/gD55NNdCUJ2RVNPGgzi7f1slfvvhDZxTCmEvC7N
X-Gm-Gg: AYBFou27j0cSF9rGc8njZR82OtJfDkWG+hbsrTPOE7MFdmf+LDVhaCx9l5Ym7zcLIg7
	pGy1D9XSO1NaTQ2zT1yGQXThjR4aXqdMv2YpzR6a4WtEvqchn5XtM9GISe0v7FILQbVhmBu/FaR
	R9ojeWfWFXbfUuXssYp1m6s+tBlo7DfW2c3QoKWwCR4D2AfF0/Qpt87yd1Jih3qxrGK4qWWuqfI
	EqPg5OlyNVvTK8RuVyn5jLpc2MDUnhDQ1kWO8Mbpy8lOhu+zb4OzdDZIx+70SyWECR44N0zaqSZ
	m+Mx3nhd3Jryrjlqs6d03bMlY0wgIaj+ayUKEAQE2//cLMmpqNLz8KOxclpI/XY9Jd8dwImcTid
	7Bhav732x44HGtzf6Fg6NPLDRDr4yUyjwSVMExpkyjRRH2XT0wDVJUSp+SWU1z61g04BU50jsMt
	qgVaLBoYHrNWMBTvAOwAJfcvlGSS7HzplItC5gJCMJVESl/JZZXQvpH59qw9pcfJqsdVQr3Tvnk
	LaUKVqG79aG3dzj18gVDIKWK9LaIeI7DsJjbTAZI97mstL74CZ4e0yyEV/qTXLogc8KjK4uuKKm
	sgpBlULa1AShG9eeX4yz
X-Received: by 2002:a05:6102:358d:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7ccc33e4ea1mr127424137.25.1792694243526;
        Thu, 22 Oct 2026 11:37:23 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc2052f7dsm581623137.3.2026.10.22.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:37:23 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH 0/1] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 15:36:57 -0300
Message-ID: <20261022183658.58090-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113725_845108_85F35605 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: 1.2 (+)
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

This series contains a single mechanical conversion of the Acorn SCSI
card I/O helpers from ARM assembly to C.

The new acornscsi-io.h carries the prototypes for both helpers and is
included from acornscsi-io.c and acornscsi.c, replacing the
block-scoped extern declarations that the latter used to carry.  The
first argument is now typed as (void __iomem *), matching what
acornscsi.c actually passes; the assembly version had no C prototype,
so the original comment declaring that argument as unsigned int was
never enforced.

No functional change is intended for even-length transfers, which is
what all current callers use.  Odd-length transfers now no longer lose
the final byte.

Testing:
 - userspace unit test mocking readl/writel/writeb verified byte-exact
   equivalence with the original assembly for transfer lengths 0, 2,
   4, 8, 16, 32, 64, 100, 512 and 1000
 - cross-compiled for ARM with arm-linux-gnueabi on rpc_defconfig; the
   module links cleanly and nm shows both helpers as global text
   symbols
 - checkpatch.pl --strict reports 0 errors, 0 warnings, 0 checks
   (FILE_PATH_CHANGES ignored: drivers/scsi/arm/ is already covered by
   MAINTAINERS)

Breno (1):
  scsi: arm: Convert acornscsi-io.S to C

 drivers/scsi/arm/acornscsi-io.S | 116 ------------
 drivers/scsi/arm/acornscsi-io.c | 170 ++++++++++++++++++++++++
 drivers/scsi/arm/acornscsi-io.h |  15 ++++
 drivers/scsi/arm/acornscsi.c    |   3 +-
 4 files changed, 184 insertions(+), 137 deletions(-)

