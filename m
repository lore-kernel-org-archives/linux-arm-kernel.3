Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A22C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1saP1T1nzHuCjyKVSUVS2boo2PeAl+CyeEndMT6M6qU=; b=10z35+Rdrne/HNeJA4u4TTgagO
	FNQjSx1UfQuw+6mlrCq+Hh1fPA2SrLFjabIwyganR0PTG5C6X9fPpkau+1AQuVn4WzjwkXeWj7zQt
	07w4HJqjfm6286CDc2XiqDA7W2ZJwNHyqdL4KGWf1Ke1upRa6CfgPoLTFxkVxoIjOF16o+1ALpICb
	VvsgufINDZVBUWDvc0l3WVBqU5feC3APIYh5vdPiqC7AhSxYCrx/TQAAzI1nQfvaRLBNO3JSrY9KP
	T4thWtZM2wCSGUh4rX+HaC4/X1HZ7nLZADMWUdRiNm6EbZc+o2WDjDYRt9JBCWcpklvWlMoUcnq4y
	7cLX7mdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuawm-00000006i3M-0YFz;
	Tue, 18 Mar 2025 17:41:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuav4-00000006hrY-39O2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 553D4A48CA1;
	Tue, 18 Mar 2025 17:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B1AC4CEE3;
	Tue, 18 Mar 2025 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319601;
	bh=qoLQwFpyolz3QhRAjnozqvOcSs62LeQ0H5auHHLjAS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9m1skF02kF6FLgsYcmawsXo4/NPefeN9w/jHmarRraWZRznDnWAHhHMY8QKa7ZXd
	 n3jCTwbNmtPnHiMT8E8N/4nFHK473Sl42Gaxcvh45R12tzpRJG0yT1zQXAuqaT0pXS
	 IojCmCYMruf6pjUQpyKMQnzQcNF48jo4iTEG9FEo18Uxy9FE+Dise2qdqts/iyD1o1
	 x3EdyLWa3QtQKwss7HHlizayTr1pEauF2FEbEJThoKG4GZyOBzqri3RewwwwatdEHn
	 qVyXpto+Yc/jnxgpLRr694eR56BdUpoZ3orCjIFXKDZ5KTDhs89GVDqBmhjjJ5pjiL
	 u3xY+nqu3Q7iA==
Date: Tue, 18 Mar 2025 12:40:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, Georgi Djakov <djakov@kernel.org>,
	James Clark <james.clark@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, Leo Yan <leo.yan@linux.dev>,
	devicetree@vger.kernel.org, coresight@lists.linaro.org,
	Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: qcom: qcom,rpm: add missing
 clock/-names properties
Message-ID: <174231959987.3278245.15510321850308863529.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-2-bcedd1406790@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-2-bcedd1406790@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_104002_855152_17F743C0 
X-CRM114-Status: GOOD (  10.12  )
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


On Tue, 18 Mar 2025 15:21:55 +0200, Dmitry Baryshkov wrote:
> Qualcomm MSM8660 and IPQ0864 platforms use additional clock for the RPM
> device. Document it in the schema.
> 
> Fixes: aa0c4b815045 ("mfd: devicetree: bindings: Add Qualcomm RPM DT binding")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


