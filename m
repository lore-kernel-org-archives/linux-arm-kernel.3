Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D768D62613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ks9aOOnJV8ZvfT0lESW+Np17jMD5IyrJjVGDkF9d6CU=; b=BZhXUl9LUOgtLAbFyR23xF2Sj8
	CrGroi7O0MvjXQvheXrCHZLjmyf/qh+yTnNUWdrAziWfi7SsOL6Ox/Qa9XgDSH+woXl86Z5R2Pp9s
	5iT7GWMSc/hoCeVX82h340zRaKmYJhdeyt9CYMXlHOKqpGEuMmFDXXr+ls7N2QK7vdnhC2TFe1c/q
	I/iHt83aOomL37l6QKEv2q3qAABrvtxTv5NvnCBv51aQIyqCV0YQ/kdcZKLcee6j/S7KYGEJt0Mou
	buEsWYTygAu58z+dBsfjF3AvPTEVKc+OJkxY3lRfPQWlvF/0v+62Bt7cQon+Ag4cusDAHD59bdRlC
	7LsIAsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitYd-0000000725j-2W7X;
	Thu, 22 Jan 2026 12:13:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitYa-0000000724b-1Clz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:13:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A97831476;
	Thu, 22 Jan 2026 04:12:51 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B38FB3F740;
	Thu, 22 Jan 2026 04:12:55 -0800 (PST)
Message-ID: <d2ddbb72-30a8-44da-b761-876b2d37567e@arm.com>
Date: Thu, 22 Jan 2026 12:12:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org,
 will@kernel.org, joro@8bytes.org, robin.clark@oss.qualcomm.com,
 hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20260121141215.29658-1-dakr@kernel.org>
 <6oogrqe3n5sxtpdydjqo4ucwp7n3ipqoupxtekvzbnqd7dae3s@q22wc7fpbtya>
 <DFV3I3D5UIZP.38TNCAJWQGI3O@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <DFV3I3D5UIZP.38TNCAJWQGI3O@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_041300_402275_CDBCC17B 
X-CRM114-Status: GOOD (  11.09  )
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

On 2026-01-22 11:52 am, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 10:21 AM CET, Ioana Ciornei wrote:
>> The boot lockup was visible also on the NXP LX2160ARDB. This patch fixes
>> it.
> 
> Interesting, this means that qcom_smmu_impl_init() must be called on this
> machine, is this expected?

Yup, same as on the Juno boards and probably others - an Arm SMMU is 
present, which means if ARM_SMMU_QCOM is enabled then 
arm_smmu_impl_init() is going to offer it to ask "hey, is this one of 
yours that you might want to do something with based on your extensive 
and complicated match list that we don't want to maintain in the common 
impl code?", wherein qcom_smmu_impl_init() *should* return without doing 
anything at all as it's not a match...

Cheers,
Robin.

> 
>> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> #LX2160ARDB
> 
> Thanks for testing!


