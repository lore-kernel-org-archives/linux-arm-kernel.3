Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18236606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/HtOGMh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nuFNq2S6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=; b=g/HtOGMhSyCnA5
	9pPBUOwP/7bNDdXjkDN3GtuhJncGdKKtYZ2dljI8DbAEIDg9BztrGn3FoO/vl8R1uVp2/pqs17x4y
	YvYZmC5w9We1dZFPVre1frPVX+0BiyA1lz7zROVLIqpCBRbtouTb3efl35sX/OsBYyiorQa9b8ixH
	x5TpZBEu7M1ledpDdHwR890J70SpSrFK6ejq+dtb1hgFX5xXJ4mco1k2b/ghTSfoY3w3UY0DlL8MP
	0UpJguvVDVKt5EYC/vo2GIXhY8zYTmDMa+2fY/L5yCIxNW2KAsmPIBH+v07wEpgOrJUKOSCJhK90k
	I5IJldfW+HeLtVeZ3g1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW7N-00000004fxg-4Ahj;
	Wed, 04 Nov 2026 08:13:13 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW7L-00000004fwU-3mrN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:13:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so157973a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793779991; x=1794384791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
        b=nuFNq2S6du3CJAIkWFhsjbvjlQRDRtA2hVMm/etqfgVeOAddwXFMpCaxtn2VYV5s0Q
         Fo4RzQno7SO0oFYabvjHZ9b9cRDN34A1qNhrhw+oiwZtAas5ZukrOkswfqFXDTufojgW
         UjnUM/VboSarKhfZBOKC2n7qJ4BehC4Nxy+s2pVrtfF30kAbpN5LIQEmuI8U4aaGdCQO
         GRN92uaaCHX8Q8mR8Q/JUKBv2jy6JHAfzJychDT+oEUsc8fsJ8OyyFL/iREcvPrWtw97
         SRLNVgJPgvGsWP/DxqxIekX6LNbr8auZt6NkVho0LG9gA7/UVYLZFOkPpWAyMgIQAXOf
         wbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779991; x=1794384791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
        b=ajNIwPz1FvJL4qzReE6MuHNhm2rWGHFRMEWc0vJQTfVLJDe0AcsN0mmdNOSwgJlVNF
         a1dIbTvFYnV14Ie4Fw2Hj+H2+8eT+z0P+9oZYtYwbbLcMOPr3KhW7xI8GqVNNN8K9L7P
         E2cvYWs6JRT2Aom0e3ArJKxiVbH+smpG6PQUQ+QYMPknz59Rrpu2GYBULtNq+YZGw/xo
         BaUG9vij/P/Nh67AVUlt4BOwERF3vEdziMIkuBOvyo0dLE/lAAl3so1QnEBDN1baOuXB
         vDT1GEW1uBOmuLkPtL+v47MKmyLiFuWuIHclLBKaLj+V2SzzqJRxDj0IWm2ceQvTD6ZA
         5UJg==
X-Forwarded-Encrypted: i=1; AKwUvBw+eRL3L4PQTqilkXbP3uvF+tzr/pSUJ7fFp3GK8SfUw8jsB5X/wblHRSB402BckNg7KTS0dZ+IJ90o4gHcJYb4@lists.infradead.org
X-Gm-Message-State: APuU4Z+4peIWaroyWY22w94EEx2QTTULcogq6IWJO7gmTyi6j1QrRKB4
	mGVEwm9Yiz0mzw93oxfk5Kbf50r0GToz9CXxzN0djOTo1pANIB+I4J0Z
X-Gm-Gg: AYBFou2SJR9E8vdF8aN3N2MhT2/NJcSDoPx9Lu04Zah33au4U22OQCrtgPMVd01+uhh
	YPbRzbm14iNamZ5LsjXmOnfC3hJGQjmoi9dzA8pW3WhhjMz/RXpfXwzXXkbXxR5QvsbsqoRNw2r
	0WZIwMXGRW/4f/2PTdDQWWlQlvbZt+pfg+uYZt6nD9YJC5mdRLRn0D1rZEzkxnS/i85YEXcd5tW
	s77FHeRsVHd2AwyL7ZK+ZTvjeSZX5WrqcV1c4/63iYeDdM2DWuGoL3eMasQpmk5sujHV+eTK8ND
	T/pPE/oJJc80eeG5hs1JYtENW+cHpB6NCyemd3CR6s9JrPIci7r+3jvSVooy4K2BfsYJ8K4wdkk
	QBMLQdiO1Wsr2ZLSWz3oa8QS6jQcpLVdDbytZTb1t4MnKBPiB4qmF+rZ4VQ/SjkhbuWQbsEcKsx
	GZV3IJz9Y4nihmedoAY1ZT5D1c3Jpcf/ymbPwPf0jaKcgK6oPbQWwdsG4E1oV7cWprgCGlHzltC
	QOgesxe5SXPn15AGe/MLi9UTMCv2viql4Ea/A15mMMxZaqVAaHaYFFHEUOH5Y90Z5+e7dhuAQi8
	kvNCEUWp99G9K2H+k6K8tRbXtVM2a+mBpCRt3DMlzTYiei63jdj0UBg=
X-Received: by 2002:a17:90b:2dc5:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae897a5be6mr11780916a91.42.1793779990608;
        Wed, 04 Nov 2026 00:13:10 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm8423510a91.0.2026.11.04.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:13:10 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com,
	robh@kernel.org,
	james.morse@arm.com,
	ben.horgan@arm.com,
	sdonthineni@nvidia.com
Cc: andre.przywara@arm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Wed,  4 Nov 2026 16:13:02 +0800
Message-Id: <20261104081302.304667-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001311_950521_E0E35AA3 
X-CRM114-Status: GOOD (  11.56  )
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

Hi Yin, Rob,

> Changes in v4:
>   - Drop memory controller MSC patch (no concrete platform user).

We do have a concrete platform user for that patch.

On our SoC we have implemented an MPAM 1.1 compliant MSC on the DDR
egress path, which provides system-wide bandwidth QoS. The MSC is
described in the device tree with the "arm,mpam-memory-controller-msc"
and "arm,mpam-msc" compatibles, and this patch is what classifies it
as MPAM_CLASS_MEMORY so that it can be used through resctrl.

We have verified this on hardware with v3 of this series (patches
1-6) on top of a v7.4-rc1 based tree: the memory controller MSC
probes correctly from DT, resctrl exposes the MB resource backed by
it, and both bandwidth allocation (MPAMCFG_MBW_MAX) and the MBWU-based
mbm_total_bytes monitoring work for it.

So this patch is genuinely useful for us, and we would like to ask
you to reconsider dropping it. We are happy to help with testing, or
to provide more details of our DT description if that is useful.

Thanks,
Ping Li

