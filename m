Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F372606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3MmvTIQd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUPUrnCv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PAsTokA7Hgc1ku+L2Oft5fOaAKv9i/M7eJ7+DNq9b9k=; b=3MmvTIQd21mbNI
	Qc6YppltvB7mXh96ZMSKl1z3eNDnoEDNLyLllzcBeX3HSwi2iCdvV6SUPKCB0YpavhlO3TZ363OPg
	CKf6WLwigbUpaVBWBnUv1Ex1bzFFb1/c7+8e4omS+UZEm/Yja8xbysRCtlpJdlH0eAeJV7tt3p2N6
	KJLBh8Sd/VeHLDzy97d+cM0X+aTUPxaU4elCzGNQgxwDwvFyVMmY/1Z7Ly/hvZ7Jd+WdTgu1YGYB2
	wBsXtMESylNOAPY5uUhuR8V4rj9Y8NrRsN/+o4wOF6mmDMB5KFdTF6tQiLZu34+g54YKVFrarbAWm
	ujhZ+mmPgn4PRDm16zYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrxM-0000000605E-3rGy;
	Wed, 28 Oct 2026 00:55:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrxK-0000000603K-0O3l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 00:55:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3567245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 17:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793148952; x=1793753752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAsTokA7Hgc1ku+L2Oft5fOaAKv9i/M7eJ7+DNq9b9k=;
        b=wUPUrnCvpVVgDdZe5OWbj+dFyLGFdso00mVcZAyl+pPmdNz9biKLz11PVExNUulIBq
         hw1bFQs+OczwRFl4J0gVm/OgcpMfmVYGP5LhQdlyYay3E5q5UML4QAN7C7CmgR7spcOt
         0zO2fwSXxEHjHGuFr8u6d8FP9dvsOJD1XBf47mUSxDjNGfeyrUi61uZ6LYlD0RQT+sZ+
         FJ85CbHvkhW2iKKl8DuRkYj2GnZk8RujOYj9rO5kRDy4jbPbIa/pvQoo6NmW6CIjjZr6
         yW+HvTqIu1ZCbzieZh5wlhLYSUe5ZFkBR7/e92teu+i97IVajC2IdFQ5LGPm06mvq+KX
         yJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793148952; x=1793753752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAsTokA7Hgc1ku+L2Oft5fOaAKv9i/M7eJ7+DNq9b9k=;
        b=o7oqwR6SHU8A2+OCBSlZnpjcDkIjOofDuJLVWr8XVC2r6O0Q8O/W/sajBhdpO5AzAw
         KVuqxD9BZEZP9fOyeZFoiMF7hpij5sRL3mKIB5Y2FD9zAzPc1tu1oufVae5bk4FeuEpm
         gAeKPDsWW36lRrfhwr8t+5V67rIZTMLTDEmMfZ5Z2DrYm/dZyAnqQmuOW8D0ZLhis9kL
         aiUR4YVCeGNnq4AGmD8Xi3RlZqIMu/cyHQUux3x9/CyqNC56hjlGXKN2hax2Mo4OG2zC
         083E2rUwoqwZL0RVGpXTUApfqFA2TSHNGHNdRx+Ji8ZWl+S3uwJuq4SIKx221sG1e6Yb
         EqKA==
X-Forwarded-Encrypted: i=1; AKwUvBz2MY/NNURnX9ZBVUo1gG/0nWlcpeDijGG47VSQe5Fa/XyKZU6ttdqCFB8DzZTWbDp9bswR5qre+mSo7L9Q+9Pc@lists.infradead.org
X-Gm-Message-State: AFq9FYJD1sEnINv67x5H5yTh5U4f/JqY89hTmHqoS9yIDtpkPHolu8vk
	7WRZhSmvdRutEkFscXLlCoYJG+NFKEDSokIHx7rkDCTSbgapENNgcqq8
X-Gm-Gg: AYBFou1SfdduVYxOMXJtk/9tPgbjZJeERpCgxVkdbWVSDPv7AEzEO7onX8Pq8OiCPcu
	MJIKze+wGCIPneg03/bOndGUtKmrmU4lQ6VNKG7T4/fe99KDI07L0GD/aM9ETF3hXlJ90qav09p
	kkgFcsuyxzYuYOUh3dwturA912bC9yAXRTr/Sxy0TrQjVB/WKSapkY7swy9rf+imkdG3kjSygAr
	BrNur+2NGAPpzc8Lootn+JC1XzlVA4R6/m5TQ6ic4KBsTyrijDICxWWaBnSI7d8X6m1Haj3fcOL
	cKEFYo2BeMwTl5FzxtGqgeb16OL0PkzNxvvREKNerCXw0O6FMOBBQg/BAOyDNMP7wyBqKPNitzT
	xKLJGpJ5NtvXCU8eRbPjgMTkefWFpZZKw5CzAtRTNRrfE5YOu4v4wFjKUGfu7wB+SbtYblXfaIl
	2bD4+tfhHffFCO+S2spWAhk0bHmwlhvY7qjzFup/zPt7zD8PbKgk+OIKZBprR+oDwqhWvZMUvvH
	D16GwZ2igtqODxl+8D8hlnmJu/blCf27eUV/AE2ju2oX1H4ANQvvqcnUVeUeMlh425CA4F3l2y8
	IM0uWko3zKsWYb0tcir1T0/yAj948pAOGGFPtJbE/BOAHUpJ9FcH4v07LN2nlu0Wus5apZLz/Ee
	WiBNt386DFEjYrVaG66JNm0H9oD/wh75ar/tLswk1qGWZPA==
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr14042925e9.15.1793148951455;
        Tue, 27 Oct 2026 17:55:51 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm25111999f8f.50.2026.10.27.17.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:55:50 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: iav@iav.lv
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com
Subject: Re: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is already valid
Date: Wed, 28 Oct 2026 00:55:48 +0000
Message-ID: <20261028005548.2399155-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016-h64-pcie-resume-tpvperl@iav.lv>
References: <20260911211559.207990-1-ehbello@gmail.com> <179196286749.38040.5597453767131590054.b4-reply@b4> <20261016-h64-pcie-resume-tpvperl@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_175554_193730_2EA07C20 
X-CRM114-Status: GOOD (  27.34  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 16 Oct 2026 01:21 +0300, Igor Velkov wrote:
> A data point from a Kobol Helios64 (RK3399, JMB585 on pcie0, ep-gpios as in
> the mainline DTS):
> - Enumeration at boot works with and without this patch.

Thank you -- this is the most useful thing anyone could have sent. It says
that on a second RK3399 board with the same endpoint chip the patch causes
no boot regression, and that your board does not have the failure I am
chasing. Both halves matter: the first is the thing I could not test, and
the second says the failure is not simply "RK3399 plus JMB585".

The boards differ in ways that could matter here: ROCK Pi 4 has
vpcie3v3-supply = <&vcc3v3_pcie>, which is regulator-always-on, and no 12V
supply; Helios64 drives pcie_power from a GPIO and feeds vpcie12v from
vcc12v_dcin. On your board the endpoint's rails may genuinely come up with
the probe rather than seconds earlier, which would make the sleep do what it
was written to do.

That distinction now has measurements behind it. I instrumented the driver
with two module parameters, one sleeping before the gpiod acquisition and
one in place of the existing msleep, plus a ktime delta across the two
gpiod_set_value() calls, so the PERST# pulse the endpoint sees can be set
and read on one kernel. On ROCK Pi 4C the pulse is 1 ms without the sleep
and 108 ms with it, and what decides enumeration is the pulse width alone:
delaying the assertion by 200 ms changes nothing, while 100 ms inside the
assertion fails every time (0 of 5). Since vcc3v3_pcie here is
regulator-always-on, Tpvperl is met in the failing configurations too, so it
cannot be the discriminator -- the wait being redundant is only why it is
safe to skip.

If your board genuinely powers the slot at probe, you would expect no
pulse-width sensitivity at all, which is consistent with it enumerating
either way. If you ever want to check that directly, the two-knob patch is
throwaway but small, and I am happy to send it off-list.

> - Resume from s2idle fails in rockchip_pcie_resume_noirq. On plain v7.3-rc7
>   with the mainline DTB, 13 cycles pass and the 14th fails [...]
>   On an Armbian kernel with this patch [...] the first resume ends in a
>   synchronous external abort in rockchip_pcie_rd_conf from pci_power_up.

Two things, one agreeing with you and one asking for more.

Agreeing: the failure happens on plain v7.3-rc7 without the patch, so it is
a pre-existing resume bug and not something this patch introduces. Your
conclusion that it does not depend on the Tpvperl wait is supported by your
own first measurement.

Asking: the with-patch run is on an Armbian kernel and the without-patch run
is on mainline v7.3-rc7, so the comparison is between two kernels, not
between two values of one condition. "First resume aborts" versus "13 cycles
pass" is a big enough difference that I do not want to attribute it to
either kernel without a same-kernel A/B. If you are willing, the cheapest
version is one kernel with the patch applied and the resume hunk neutered,
i.e. in rockchip_pcie_resume_noirq() replace

	rockchip->supplies_pre_enabled = rockchip_pcie_supplies_enabled(rockchip);

with

	rockchip->supplies_pre_enabled = false;

so the full wait is always performed on resume and only the probe path
differs. If your first resume then survives, the resume hunk is the problem
and I will drop it: the failure this patch is about is at probe, and the
resume re-evaluation came out of an automated review of v1 rather than out
of any measurement of mine. I would rather ship the narrow change that was
measured.

> - Plain v7.3-rc7 also hit an asynchronous SError during the bus scan at probe
>   in 1 of 4 boots.

That one I recognise. On ROCK Pi 4 a config read that gets no usable
completion comes back as an external abort rather than as all-ones, which is
why a non-responding endpoint takes the machine down instead of just failing
enumeration. Yours is during the bus scan on an unpatched kernel, so it
looks like the same root-port behaviour showing up independently of this
patch. If you have the log with the faulting address I would be interested,
but it belongs in its own thread rather than this one.

