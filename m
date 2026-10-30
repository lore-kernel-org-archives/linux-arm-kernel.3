Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10624606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UO5IWomr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UJD397DA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ic/DznHWY6qYKyiKcZAzEYcjT1Csqaqbv7FtlV+91D8=; b=UO5IWomruss/6VRy3gi55FlBhn
	Jycrcdw3r02uzWIB5o9IkbjiCNJ4NpR7h7RMkOkufTmXuoLTnCcBapq1pfNOs/a8V2SvcAIXwk3Rb
	z6CzOidZWsQPRodzFutyEkm+1iQQzbPhxMy2kxeeFFeYTCTT6jJnnZHU6LRUrcIrwmJVZT1nFoEgl
	XwkEJvg4H9O9lkXRX3dYoENXGEN7rXbzHsQJgbz40CfEYoVphHO5BZo+snqB1kxS+b0hWidjXxTSu
	8Vf2FNVc7zfPt5josUAn/RpEUKP26V1eVyiwEcjNRW1BNT6ri74fi6SXxLJkc6Yp7QCzzFIVHf5sq
	wTsk9Siw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhGl-0000000B1Db-2fzf;
	Fri, 30 Oct 2026 07:43:23 +0000
Received: from out-11.mta1.migadu.com ([95.215.58.11] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhGh-0000000B1D8-3twb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:43:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ic/DznHWY6qYKyiKcZAzEYcjT1Csqaqbv7FtlV+91D8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793346194; v=1; x=1793950994;
 b=UJD397DAGzB7WG2IBio8AWzpHInDQct6iq5idWJfbz3lhm171lKD9mwTupI3MgBLVVtH/f2q
 mmRBVllq4jeJ1WfeVFs0JmhTJtXpclcGzejsJYxoXVmVwVHuASqgKYTjFtl8igzf6KoGZyAfe9u
 kBeFQtwDeCKk3ryoLmfLJ/5A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b1a6a5a1d4f47c29;
	Fri, 30 Oct 2026 07:43:14 +0000
X-Mizu-Trace-ID: b1a6a5a1d4f47c29
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so5996e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz5F8EHUNIKhK/FPivjmmCfLpR3nEEhmg4a/bJ29w+5TmjZvBqjuvOAL1MtiYz9a2PBlnJkpVWd133l4JNNwOue@lists.infradead.org
X-Gm-Message-State: AFq9FYK4N86nlSIFtXhruP+tLsECHiyAz8rhlDDsbTJMnG0A/0qQlTDL
	INo+apgxN1V6zJnp/dGeWLSKbjkWFMf5T1xegA/jeiolc83z/1FMinm5pTD+/88C0eHmBzn+6nh
	VW0ceQGeaRT8fU06c6kSmcxqov5RwAT9K8skse2o7
X-Received: by 2002:a05:6512:39ce:b0:5bf:dcd7:86d9 with SMTP id
 2adb3069b0e04-5bfdcd78993mr28332e87.16.1793346189429; Fri, 30 Oct 2026
 00:43:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-2-fuad.tabba@linux.dev> <auO3Kiykovvs279e@arm.com>
In-Reply-To: <auO3Kiykovvs279e@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 30 Oct 2026 07:42:33 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzvCAStFp4TOBJZ2dEi9GT_S0CW0i7HzB4Q_+qLbv5Uew@mail.gmail.com>
X-Gm-Features: AclHuK-iAV_pLdWc4hp6CdmUshGwwfxe2S4f_ErlrqMD7iHGLjhkPDfxfT1tlNg
Message-ID: <CA+EHjTzvCAStFp4TOBJZ2dEi9GT_S0CW0i7HzB4Q_+qLbv5Uew@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: Add override for ID_AA64ISAR1_EL1.LS64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_004320_374123_266742AF 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

On Thu, 29 Oct 2026 21:14:18 +0000, Catalin Marinas
<catalin.marinas@arm.com> wrote:
[...]
> However, does this need a plain cc stable? I assume you want it to go in
> with patch 3 but that one only goes as far as 7.0. Same cc stable in
> patch 2 which you may want to limit (or add both as dependencies to the
> cc stable in patch 3 when committing).

No, it doesn't. Patches 1, 2 and 5 are only there for patches 3 and 4,
so none of them need to go further back than 7.0.

Marc, Oliver, could the tag on all five patches become "Cc:
stable@vger.kernel.org # 7.0.x" when you apply them? I'll respin if
that's easier.

Thanks!
/fuad

