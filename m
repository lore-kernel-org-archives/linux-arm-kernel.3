Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92886606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 22:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YcoQoU12;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sU4Z9/Jc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBDTgfDSGJbroG+YsfaGw3OJ2VJpPZaPJ8OxT16ARco=; b=YcoQoU12Jb6VF0m5cTRmhUUY33
	sUc6eCobabu4p1MDvKp1+FW8B43Y8gmKzSEpjHSveHAXxCbKGuB7OqQuonsftXTYzYdV74+ZmqoA6
	gfKEEFwf793A24zdO8okEaE5/xVAJCGPnyK71/O0Hn+ftt8fdUTSAs8G8x6MXebLAXcWTM4jioplY
	4m4NDp4q23qBRLKkCz7dqYiQOelEqjvdNrqm2sLiizBVw2mby3OihM9LsAt2Li4+y6QIvDBsPg72t
	ffhPrCiEeA78I/7pXq5rpFN59KNnfzT97H4mo7Jz3fVaMsD2tW1i4dYtLG8Ntl5/qlibd9YrasVnl
	Zk1ZTfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIJm-0000000AkRq-1PyI;
	Tue, 20 Oct 2026 22:28:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJIJj-0000000AkQz-2IEb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 22:28:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so649915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 15:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535301; x=1793140101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBDTgfDSGJbroG+YsfaGw3OJ2VJpPZaPJ8OxT16ARco=;
        b=sU4Z9/JcEFVT0Vkb+QQ6WTF5MUh7wkEt3yKo+cfsvJlYNgSWw7CAkTCINHCQlA3UXz
         IjjP1j5uhrDgEn8QPU1JrM+DC8o2cngOCSEaGtAf6ezbJkU65vquG9uZRQm2Q6xHh20l
         7kCcu3t9I1DWL9+MDeRlC1JaA0TAUYTwnoyI3WXB19KgiatwUDbMesti54RmyUOnce6Y
         /lf0FF0hOCz4rHQvmKZmpPNBPpFgRNfRcTSM7ry5AYMQEAE/uLOuDtt0qeqjKpmPKbUU
         S2ICCcJnEOMWMMJBOouZaCAqEp2A8JWhCu2gCrlC7py0TO27dzs+uEGA7nwEqAVJvJ1G
         KhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535301; x=1793140101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBDTgfDSGJbroG+YsfaGw3OJ2VJpPZaPJ8OxT16ARco=;
        b=lvmcJVjdfG4BoxRPLD1BCDicYOokIhMyWn0kxygg1s6yCEvX/eS0jWgpMc5+cX2Ezs
         BljNfguHlUT6DHv7Y4cXl/BA3+1XnlCineUvEg3/9fv+ezxGOr/kSo+tDz8vQxIxT+sG
         s087A5osds3u5nUlTjiCIBlHgY/L10Uul3YJrqdV6QMsms2rRcZVwPoucO07fvbMI76V
         iUsdBHEeMlN+k8rlvcnXcejRk7GiGU4iyhG3TjmolG6W2YC+8eWe6F+W17t1NSmG7oyv
         GPZ4m/xYptj6BCmkxEivO1kr/h8BNfZM9Byr4Tx3djY+Rz3mrzVCMIFQzkWkyB8Mnm2i
         04Ag==
X-Forwarded-Encrypted: i=1; AKwUvBx70qpfTl4Yl0kufV16h9BNkj1vWVOxlEAWc3kcTr5vegaBah7jff2tceSVYItmPdioU/5HWuAR3VbSBUK6Ad8D@lists.infradead.org
X-Gm-Message-State: AFq9FYKQgt5FEu/i5YdMQ0EKKzIg2pi9+OEApzw5xlcyEtL+WZ7oeLh8
	GVTCR3NzFPOT6DIrX4THSTK5VXOqdfavxVqGbCgFgy979QRKYHKFMGJE
X-Gm-Gg: AYBFou0DkImHmRWjgKGllPIZD+CrASLX8vJpOiXTETyOuqT8WdRNndtEGsna0it5r29
	JVwf00MGuWx5Fdjj/uXd9mMzJiFTFgQv0Gl9Tlple4+8c8pkQbct3sLw8CuyQq93px3bL1YPsHs
	+YB0iSDOV39652Pnt0vPWZ5YYoEvij3D3q9fuP5F4NiUPiz7QWxXPq279SHGxolZOydbQWks7nX
	TxlvAikJQOcP5ykMzJ3KMAgy0OCEjy2LpRWzwVxO724VHgi6qMACMe0sIEj8/Hrd/od959OHGJM
	vsfvlTxF9mbZkbeOWLfRKdl1jc9cEsH6e15ipWXKgVURi4umT6r0ttbeqg3L3tJWYLuN26qRMKc
	CUDE6gz7qIUejw4KRCy1iCJNQnBzIZHh4q1C9sxl8gNQM8oQQaq5cUWo4R+3kMIlqfJeINjJD7w
	AygjBiMyBsXu2WpH9aihfCZmxPE8FaKC0xUtrod8cXOVRzB2pjrhsecqHdOgdlf0jqi08kmDG0F
	+hoc76m8fbigxjSrLMMXeqlkzYXf2Yf3yh1kIuFK1tvx9WbjBK00Z1PjhHcL6F6CfbdoT4giA==
X-Received: by 2002:a05:600d:18:b0:4a1:df11:4594 with SMTP id 5b1f17b1804b1-4a1fdd20cafmr1618535e9.11.1792535300652;
        Tue, 20 Oct 2026 15:28:20 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm9661935e9.5.2026.10.20.15.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:28:19 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Tue, 20 Oct 2026 23:28:15 +0100
Message-ID: <20261020222817.1231643-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_152823_608833_FC1FD785 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW, is met.

Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
select conditional on arm64.

---
Julian Braha (2):
  firmware: smccc: provide stubs when discovery is disabled
  irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64

 drivers/irqchip/Kconfig   | 2 +-
 include/linux/arm-smccc.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.55.0


