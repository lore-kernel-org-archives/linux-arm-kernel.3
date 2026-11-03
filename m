Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E42606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Cs+yQjK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJRA0mzY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KAx1cm6yWne+0gYptOITSpq6g181IgU4YzBAy/lnyOQ=; b=0Cs+yQjKO8VCXN
	NXEf1T2/hhfgjyQy+JBatkJP+wib5pwxd1TxIUVWxExAGT/KdL53t5pjRbqCXkkJxThLL4Zpim/QW
	IRwCC7h8rcfwRC56+qRiSVNZR0nfSdEOfR1pbVIFRh49xzEo2D4Ni3xctS87HHdha2g5Urgc8ZzFL
	JzEX923S8OtHm/91WJlYdly2eU0IPKGlTU7PCxskzBEux6okL7jyRmO7ITtfgsueaGqahJk2agW4a
	9ETr5XjttwehJ6qWZNf4dhkofbQBtix7MmpG6OpxQLKqlLXtETX3bCqLMs792ZLmbkBOJi/OH3fOU
	YEOQmIM5J2FJ6C7qVelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4PG-00000000t2f-3BgH;
	Tue, 03 Nov 2026 02:37:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4PD-00000000t2B-49MW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:37:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e942864693so20820765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673467; x=1794278267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAx1cm6yWne+0gYptOITSpq6g181IgU4YzBAy/lnyOQ=;
        b=bJRA0mzYKJi7y9K5CijXUeSirrKHqf46HwZADIgKQi3k8Yq8ErTFwDLXN0PhBjQTRf
         wvXdN7Le1tTBo8OF6mcW9kT/yXP/9wukOZTKZebYfigEcvl+mDHeC/OS9pZmmU94XMVy
         DSBXJ1XneB1k5FnwXczStJ0MS/JfgBY0XL2LIlw4W7N81l20PefXOQmFsVfm6M40Mywl
         IBeizKKDa02PnRmyStcJc1IjNkV+UR+9cItMK8kerHXu5FVPBKmxakGyddUrkMA0ZU6u
         oHC5DJVk+4ox/klB6W2Xsbkfdgzgf7Fv3xH5vH4X7Z8mExt8CqHIj6vTfZewVkGL3rvg
         KUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673467; x=1794278267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAx1cm6yWne+0gYptOITSpq6g181IgU4YzBAy/lnyOQ=;
        b=g4xgxk3lIRNTG7A2ilBqJMK5FS990cTxkqFM5Be/IO0PrQw+4u0qtkpAQGSJ7mqC9/
         Qy0jcBIgkmBKgUbrU+n/+ClrC6cKqwdN5z0BWvJmV3cy4BpzUkefhQXkdSIOZAOcCJNS
         cI+IVDxada4BCjn7odmYXnhjKSHDLDQ8dGdQWuHoadse28WDMbCCSJqB9Hcdkg2+SbNZ
         WrJ/g0C0d+jYTJ8qt8gSxb/k9B4i/MTIa3+fRbgMbWxZxFvqM0aIYiOy4HJrsAemZGrG
         YJF0RH6qTSmZ9dOYAlQQC2wwuVjnYpYn04mnPuJNrZqTuRWTPWWbT36OzRqZeVqRxAcL
         qX5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWd7OfWlPwFkcuQx2pPY5O0rWKwT4MZzQEdUAxHK93FkORV+xIglV/xTEESyMf8xqFNiPBmEnYxFhpVXzWb56e@lists.infradead.org
X-Gm-Message-State: APuU4Z+iEKeev2PAdKpAktoIsUlcJ3p49+LEoh3Bjt8Y83hd5yTN3rSy
	hbwpWF1A7Yp+ytedGCuZHmVUi75ISJxBGiz6R7ectw+WIv4DWTg4QAQ2
X-Gm-Gg: AYBFou0oPYyywRmrt+VMDy1Gb+n5FaX+7BzYq6GjF9qvHC07/0sqU+wQ/l/qOgEv5/B
	YDXLenyMA8dZITSxhufPV2dpwhv7izvZrYLUhvdn3WBzghKunqBrvOQIpvqcczQaoUqHVmi1Lp0
	S4CPKbC8eZckw4ofzg7hzwVuWToQ5uFI8MzYwJq/7Mmy3ls70/ZrtoFTB4wDJTvq4n+z0WcJCls
	2rEZowLFv+xXc5Yhpg4gMxUSdeYxP20JWXinTFgKlVt3biM27MXLIPIaVCKLbe1Pd/WXInTPchR
	7IJk8xfy91BdMW77Dj1i/2cXJGQCpEs7PSXXRtH6ebNLHvbD4V5bCpNKWzeVxvOCKgRQjimAR8L
	pivgKzcXamou1VWFGllElewbSRQ7AySHVEKHBkQpWgTDIWv+yIACXUCF6dVaF/T1FufOTcOHtEU
	Jfua2ZRJutxd6If+b7ilMgnmVWs8p1A3KrmTYdx37aY1TNAkC20a3UgvqPs7DNmQK0mmic/fU6k
	VfDo5RamUcUcElDejlZwrtSLfZkhFRZqt+s313Qv9LWoeY5a1O5VNOrUlwTciVgrD4ASR2nWoev
	hfeJEm2wHOMMEyiAc/IZQStQlEqYsE6cVw==
X-Received: by 2002:a17:902:fdad:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2eb3649422bmr128568295ad.21.1793673467085;
        Mon, 02 Nov 2026 18:37:47 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm33189015ad.61.2026.11.02.18.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:37:45 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Tue,  3 Nov 2026 10:37:42 +0800
Message-Id: <20261103023742.2624994-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_183748_100282_B7F1F202 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Ben,

Sorry to bother you again. I was looking at how the driver derives
mpam_pmg_max, and I think there is a similar blind spot:

mpam_msc_hw_probe() folds every MSC's MPAMF_IDR.PMG_MAX into the
global mpam_pmg_max, regardless of whether the MSC has any monitors.

Concretely, on our platform the DSU has no monitors and reports
PMG_MAX=1. Our memory controller MSC has monitors and currently
reports PMG_MAX=0, but if we later add PMG support and report
PMG_MAX=31, the global value would still be clamped to 1 by the DSU,
and resctrl would only expose 2 RMIDs per CLOSID instead of 32.

Should the convergence only consider MSCs that have monitors?
The PE-side value from MPAMIDR_EL1.PMG_MAX would still apply, as
that is the maximum PMG the cores can tag traffic with.

Thanks,
Ping

