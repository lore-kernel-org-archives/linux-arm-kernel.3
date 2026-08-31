Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AEBC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oe8jmr5wJN7KLSPGEqvKyY3zqWGyW9eAb4CvXKkR3QI=; b=UnN0Gx+OI/Owa7qiyMDQWI4DLZ
	Qf/P7AoVrmQK0/ZY8clMF/JtKPD5Qnw6btEw3F9U8xXfwqcOno7gOFMJCnDvrQ8VFXBuGhP4FxlPT
	GSOigMNMXNAGj9KByhFbeuVXnQkafXTEHwWsUPlPvmNAcvwKSUmpCUzfdo0ZAetQFS/f6uki8SZhs
	jdg9p2mSXQkvAH4AqgQrgDsEZyH+RkSVTq3XgzhKJYxvrMYxYp2FEZ4WZ+vcUDAcpGlBKZMiUZS4L
	jm0dj5aKyKGwVe+ERn38mRYxYtKSNzs5DKmIsloucG1/hJlcYKCwVhvqXxT7NDGY+a0pc0Wi3CtJh
	frYaUmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14Yx-00000009yAL-1B89;
	Mon, 31 Aug 2026 16:08:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14Yv-00000009y9s-03hr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D9AD602DA;
	Mon, 31 Aug 2026 16:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1A21F000E9;
	Mon, 31 Aug 2026 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192524;
	bh=oe8jmr5wJN7KLSPGEqvKyY3zqWGyW9eAb4CvXKkR3QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IG2rHHMdSTN5T8Tscue257j/AYBgXgO1vxmwCSmqSg74pg4cyIAD3KZqqZZ5F/vf3
	 GhA6an819fdRkrPVcO2o3+ze6mvGWzjCDCYUIO8WJBBfflsv5EbWGXPH8B9ES+7CmW
	 XcduBOBhwNnFQkax7JDbhpHVcf092j/rra+jFi358lz/wlIoIxXxconMXc6dWREAOs
	 Al1NetdMpSdv12gJe4+JFUAB9VcaG5CKYG3nBXEj0Q7Kx4AmEGmNlHLlYRaH23j+2M
	 /J/JMrHf8TzDwkjW/ECPDXPPO9VYlkV8/J9+m0TBhRcc02gwbqV/gzeWETTnnNMilh
	 6kw+b9BVMymqw==
Date: Mon, 31 Aug 2026 17:08:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm
 Maili SoC
Message-ID: <20260831-vitamins-skirt-735e194dfeab@spud>
References: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4L0kw3mIY27epMHI"
Content-Disposition: inline
In-Reply-To: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
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

--4L0kw3mIY27epMHI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--4L0kw3mIY27epMHI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWnBwAKCRB4tDGHoIJi
0qAMAQD9IJt2HJQVc1nSYV2G25O17O5UbEtMYtq8YRnyOeCKNgEArzf/fjuK1gPJ
Rvee7o08VRF2U8h487tRaY6R4mxJxw8=
=SZK1
-----END PGP SIGNATURE-----

--4L0kw3mIY27epMHI--

