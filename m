Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A98CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RqExeFNnNqA0vuUm3guhb78BQ6UMZX/BmhH/l+wuRQ=; b=Ddcu9Q7ifgEd+cCI2OMmNuxA5u
	sPVNoxap2lE7iMsjPEG8MFPCu1Xn3tJA0f0D9UODD85yQojbZ5rHtixNmsGCLKkdyA+LxdFdYnNHD
	dsVduilBgCmPazYF3pA2OsrgfsevMdeyBK2WKjNoBy54VEZ703hBj9xDkBu4oILG/mQuYX5lklpio
	U110lXxpMYL+ilSysx/4toCM6eMIgCVZW7xaAgikW4PuMbkWXsNo3/9PH6/q7szSVGp8U2pcA2l3M
	OC83RLygKNw5TEWtRmHWYHzSKzBZKoFrtvBtkj9eS9ev1qrFk9hEbqLC42qAmxatflLCe1sE46xmt
	Qz9Z3Jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbdw-00000002sPR-1oa4;
	Wed, 03 Sep 2025 00:46:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm5-00000002AXM-09m1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 21:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B50594427C;
	Tue,  2 Sep 2025 21:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7949DC4CEED;
	Tue,  2 Sep 2025 21:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756849364;
	bh=RjK40O1erbbu/Aaqtcd7wtn/XHEa2oLzQ1L+Jw/nrP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EoJlG6JbZMLwZp+m1BZbhMawCR/5RmCUTGA8njxZFmehPeIWW7JFgU3N3x+hw4LpG
	 OFd8vAkhr0x8OLlVta9zD5wf8H3Ubjf8Jf3f1vtYzyRuprlUcFKOyEkPVbYKb5VeQH
	 qbEXmxnF+sqcJQC3mdXguj0PYnkR+jPTfa6NbuU+/yBmjaAHHAcPZZ7CukyR/+/PNj
	 olac12OyMTg+qwOCnlM7HvFzIAr3zGA6X6dx/l8Y7JVYdwCIROCjFl6dtK+RjNo3el
	 bCQmg/ubnFasfzVUqGzpA8ydpEV513sGZfHTIC8E+3Ud0Tvou/MlqMu9K7CGaWuID9
	 XQKE8ByoWqfEA==
Date: Tue, 2 Sep 2025 16:42:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	James Clark <james.clark@linaro.org>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	devicetree@vger.kernel.org,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight
 documents
Message-ID: <175684936304.1217220.3167248149687349464.robh@kernel.org>
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_144245_126171_4481BDD4 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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


On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
> Update the OSS email addresses across all Coresight documents, as the
> previous addresses have been deprecated.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../sysfs-bus-coresight-devices-dummy-source  |  4 +-
>  .../testing/sysfs-bus-coresight-devices-tpdm  | 56 +++++++++----------
>  .../arm/arm,coresight-dummy-sink.yaml         |  2 +-
>  .../arm/arm,coresight-dummy-source.yaml       |  2 +-
>  .../bindings/arm/qcom,coresight-ctcu.yaml     |  6 +-
>  .../arm/qcom,coresight-remote-etm.yaml        |  4 +-
>  .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>  .../bindings/arm/qcom,coresight-tpda.yaml     |  4 +-
>  .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 +-
>  9 files changed, 42 insertions(+), 42 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


