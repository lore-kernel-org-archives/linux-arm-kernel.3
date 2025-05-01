Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B99C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy2Z23D4UX2pb4MGng/RS7Rc0DqXehjPgXYL1GZyHEA=; b=p9QocRIPduI/ruuKoRJkxKiQkD
	zyl+37nSlGSvBA0+GlBZov01T4sGlkcaAgM4WTQUqiZMWKgATAsCJC6rWOhEJksts6pBzZP2yvVxt
	Nshz3BWf7mt437K7Ry/PEtKZxJWIYp7twXNFk+eyb6lJuo+VX4B+LJMve8BQpzJlKKLjvseetx5Cn
	F30QlUZw7o2cwQtOIJ1Ul+xOp3ENr0nhayi4QbBESNL/vGJp/zwqPvoCyfOzwgauRAR/poqQWW8xz
	EQ79M+kQLTHzvJUFwA+KT7ZUixQKZBiaSat+cSWP288+gOVQqYDXr89pW3utY0FMnqyWHPH68EQ4F
	1xJd7yhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZLf-0000000GSfg-0mLp;
	Thu, 01 May 2025 19:13:31 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZGV-0000000GSBy-0kzP;
	Thu, 01 May 2025 19:08:12 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 2F84F2007A6;
	Thu,  1 May 2025 15:08:09 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Thu, 01 May 2025 15:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1746126489; x=1746133689; bh=uy2Z23D4UX2pb4MGng/RS7Rc0DqXehjP
	gXYL1GZyHEA=; b=gMWu11vIGwyUkebQS6FfJoMbvmG1K5I4PcYPfgos/+3IKTG9
	gplwSngSdL9b0tzDvioUBprhL4wfVkOmTpNtoAAODeB28Xg6R/kwHB7dvxSuftFL
	yhPHuhfnyZhbGy1Hk4LH0DS38ZnX4s0nqvPXJdj6j6YsCbSDjUNCmIVLH/A/20KP
	oo3/VMPCqW0WLap/EGtkYjtqLqADG6I7601JRBgJjC9L0IW/fnmqPmRfywBz38B2
	l4rECgxFIIXyjmPcKpJ3MKrLDuuogSY9AnqaHJ7N27iyCvQLDrLJO+Uzbvq2a1Ob
	z/jW7mFvVIaWGr7pr0l6vyW2GdTQ2Hejj4c04Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746126489; x=
	1746133689; bh=uy2Z23D4UX2pb4MGng/RS7Rc0DqXehjPgXYL1GZyHEA=; b=k
	RRWrsXtBP2dGvKqi4W7O8NcUE4T3criJTN4RNqnwM3jvVZB6DFHHOoJRSzF4WwTC
	zyfSgrVfEAEZo6Ar3KWwXFFgpo9OcSnMRAJNahqn3nlXJrX0g/PcOryetxJVwBdg
	bMvCV+WGJfrIwElsLCpZTQGf+AFh+vAPQIz7pR9L3B7fo46k+1htBqhXoVi3Nr6i
	iPfXM7t0uPbUxV6yQuN2xxuUHDxXOhwyx1GBr0m/YPvpPLJFGrE4r55Y1vhjLJkG
	EYbgK2ov6OqW9yBM/N3vWdDrYa4RmB3gucHV7PaTEJHhJOlijJtkhtTp35Hug9Lp
	KdTUch2CHWx/XAiNccw8Q==
X-ME-Sender: <xms:lMYTaGgjwoD9jvvLQF3kWWQqAITXOwX2J_Tz44npf0_rwZTz5vZWuA>
    <xme:lMYTaHCfTlr4IcDYYP9mfLiZVIcfetmb5w7EMXV6Z0z5aHP8l6w5d06NcLSmpdfDF
    y_HHxOzjxiGRzZWmjM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeegledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhorhhose
    eksgihthgvshdrohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdr
    tghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnh
    hosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhr
    ghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhope
    grohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigsehg
    hhhithhirdhfrhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilh
    drtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:lMYTaOHaWClXa7praEdCDETzg-YVo8ghBfqAEKgcYyCNv-z3uiOvlg>
    <xmx:lMYTaPTDyplPkZ6QrXRyRgI6CFJO6g9IDexaTEMgKEAyXB5CcIWOgQ>
    <xmx:lMYTaDxrliDpH1IiImjsat2Qz56tDsozwSqIgW3l_ha48UqBCKavYA>
    <xmx:lMYTaN4smmith_jw1KGBc7w4dLVQ7r3zWaP24jB2SlIhLdcRPVRmOw>
    <xmx:mcYTaH2ZstH58KGLmGnY3MmWQlgQtyVkrQuLwkep4LE-hnCp6R9N54B6>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6CE25BA0070; Thu,  1 May 2025 15:08:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5b013bf7ff4edb46
Date: Thu, 01 May 2025 21:07:44 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Stuebner" <heiko@sntech.de>, iommu@lists.linux.dev,
 "Janne Grunau" <j@jannau.net>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Joerg Roedel" <joro@8bytes.org>, "Kevin Tian" <kevin.tian@intel.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Matthew Rosato" <mjrosato@linux.ibm.com>, "Neal Gompa" <neal@gompa.dev>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Rob Clark" <robdclark@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Tomasz Jeznach" <tjeznach@rivosinc.com>,
 "Krishna Reddy" <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
 "Chen-Yu Tsai" <wens@csie.org>, "Will Deacon" <will@kernel.org>,
 "Yong Wu" <yong.wu@mediatek.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
Message-Id: <38706b77-4e58-4dfb-add3-814746f4a3c5@app.fastmail.com>
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that don't use it
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_120811_687166_49A030F5 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue, Apr 29, 2025, at 16:34, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 757d24f67ad45a..190f28d7661515 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -991,7 +991,6 @@ static const struct iommu_ops apple_dart_iommu_ops = {
>  	.of_xlate = apple_dart_of_xlate,
>  	.def_domain_type = apple_dart_def_domain_type,
>  	.get_resv_regions = apple_dart_get_resv_regions,
> -	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
>  	.owner = THIS_MODULE,
>  	.default_domain_ops = &(const struct iommu_domain_ops) {
>  		.attach_dev	= apple_dart_attach_dev_paging,

Reviewed-by: Sven Peter <sven@svenpeter.dev> # for Apple DART



Best,


Sven

