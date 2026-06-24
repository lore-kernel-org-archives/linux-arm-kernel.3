Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5ADCDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIb9R7eOTXQ3L9z9i9MDpz2gfdRkQpGrhD1+tSfI5os=; b=HxLJj5LiQqdeco4B+nu8LqoMfl
	CEUtMeQauyVRKZJ6JbQ1qS9f4ns3vYIdUJjUdwqT3NAWZBgSitguqT1wejmoaOgVbAHQlja5zi2wz
	zPznTq3Qm6TxJRl5f9bdG1uUAdg2YWzYmxxGzwc4PXgyijSE2IwlCMTXQPNdaxb4NE+RRjBYVFdeJ
	XKE1emkZiCF6OsBvBzxIT2G8frf/w5O9W3T6w6CDp60FVayAITVayKl5l7NhPr7G7YCvB5KSbNOoA
	fdY+yE4eCKUFZI2Is394csSbYsgANJ/9bTXj7J4inslq/5+qSo/P4/x6xxVFq+mcmWJp2ZylIxkwk
	DSdYztoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNcV-00000007op6-1IBG;
	Wed, 24 Jun 2026 13:26:23 +0000
Received: from mail-24416.protonmail.ch ([109.224.244.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNcR-00000007ooL-2llc;
	Wed, 24 Jun 2026 13:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1782307573; x=1782566773;
	bh=wIb9R7eOTXQ3L9z9i9MDpz2gfdRkQpGrhD1+tSfI5os=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f2sejHT/WrS3zPqG/Iq9XEFBDxWynyuPFUJ25mgIiAxiwbD/aNM7z56IwOvNTa0nR
	 Y5g7F63y/jN6cgwYlftaw2XTy2sJhj/G17X7juo32bZ2b5lsFIEtb6pe0pgIuydBCA
	 89xsMu9F0phcow/MV64e2lbCs9A6j+oLpTmTS2sJjIesL41+Q1UshtSkA+6b+gCbFP
	 rwlV6PkYZm967+4L1H7Yuyz3RhO0RfESjr0HZPbSw42AuhPFg65LEKmjtSM8i/RbC4
	 YxM7sW1UEuR9SLsSn41NkWaQhm1uzFzZivQsFUKEbdMeeHrSR8y44skr1uq2awYt3S
	 yZC0lHiUXb/OQ==
Date: Wed, 24 Jun 2026 13:26:06 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
Message-ID: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
In-Reply-To: <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me> <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com> <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: df186333b5a853f68028d7d86cfc27a4db0a8a20
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_062620_394028_589CA138 
X-CRM114-Status: UNSURE (   8.16  )
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



On 6/23/26 7:03 AM, Konrad Dybcio wrote:
>> This is mentioned in the memory map description, but is not part
>> of it.
>>
>> I booted up a 8450 HDK and it doesn't even have MTE, so it's
>> probably valid
>=20
> i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
> trapping it.
Then, should device trees delete these memory regions on a case-by-case
basis, or be left as is?

Regards,
Esteban


