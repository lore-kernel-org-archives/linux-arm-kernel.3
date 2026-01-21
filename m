Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3766CD46950
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XXifxIzgcTJ3aqY5fFJg3+/NCrXj9uBQTF3nUjPP9c=; b=Bx9/fBiuZfAFVRfvdNY73CAhKF
	uj3jIgWXk7zCt+mpQa6KKfplPXikka4zwzfoCzYDWaecBFCrXxYuiE04kEb9A0fk894+vSeSKeGQI
	8aUwYOedjBDEe/e49fulAbM9eSHDR2u/ppXiG3rANV21tjGhgFAXB/8XK/A9LgofmLvlIHsIP75lB
	XZIWAIuQQzATozY53KPKm/P3n6RmMgW0LGRB738XCtHGLTlVAxCTR70BUF2n4cZy0Hxn77gQSY97r
	WJLTgnUggtD6Wut1sz3SyqO7Q3M7mTkiYmVHMxSck2d+jRfoprBFraSLeJnSp8L3Btxo/DIuVs2fi
	YYrEl/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaiI-00000005laY-1nkF;
	Wed, 21 Jan 2026 16:05:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaiF-00000005la2-2Zdx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00E8A434FC;
	Wed, 21 Jan 2026 16:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C317C116D0;
	Wed, 21 Jan 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011542;
	bh=+XXifxIzgcTJ3aqY5fFJg3+/NCrXj9uBQTF3nUjPP9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUn5CB4IDHqmXukCU9BcL26Tvfs2z2HQcgoOZ8LRzJonMdVZcU/eZXWSiWPRappxn
	 ZOiCU1bbToiOU2MroEzxliimiv3Pdoc2iN4ELl5E61Y5DZtgNfCk/knferG74NiWuU
	 napIpiKCyCo9VEhy0x1y6DDWS7nDGv3WaNs6xothT8Ra3LVzfkRregRCUC2xW2iEAt
	 HSYQ6z+qjgpEUWEsXrvQXmjBBKAiGoNfoDE6+cKOCg+zAp14ys+OaFww0eEWrhHdIP
	 yT/yEtNKoM6vtt1Bqwo5Qrkx7IMrTd74qeTCrxO+ZQ7A2qrU7srGVFwkZ4uywFL10z
	 esSnPABlYVSjA==
Date: Wed, 21 Jan 2026 16:05:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, robin.clark@oss.qualcomm.com,
	hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <02db754c-b689-45f0-92da-521e273f025e@sirena.org.uk>
References: <20260121141215.29658-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ChzoroEYYxNMitxq"
Content-Disposition: inline
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-Cookie: Eschew obfuscation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_080543_674085_8E13FBE4 
X-CRM114-Status: GOOD (  12.68  )
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


--ChzoroEYYxNMitxq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 03:12:01PM +0100, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().

This fixes the boot lockup on Juno for me:

Tested-by: Mark Brown <broonie@kernel.org>

--ChzoroEYYxNMitxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw+VAACgkQJNaLcl1U
h9C2Awf+JTlEPX5L1eRIkZ1G0xUwbjSgqn3cw2vE2R6ou1mn1B+Zg7AQrliouFA1
lhr4dlAVlvMhPb0Pj855r6Xr2F7UPxR3rX203ecrbXUQoCN/NjEZkIMBFGy4Cxpr
tvLQyKjpbijfqqPARYEke+46IlJyaykzK3175jQkx3z+tNXMfB84dbJXOntcTBwM
adtPwEAraVaenGkGmW22AkSE1WdKPItAwic6142MyHpJHEzwc3k1ssAFmHPWuV5h
lsdJpfidJto6uoI7BgDkZ7ufFYGgQQIQE82CG/l2lAVVlt6NtXRrzARRGlazDLSt
viADbl4xQiZLJW5dZwom6oP7pcoS6w==
=Sdwb
-----END PGP SIGNATURE-----

--ChzoroEYYxNMitxq--

