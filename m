Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F60E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjEy0aw23/6E8gCN6l4+v6e28c6E01xkv9hb+E5Fl+A=; b=Qibq8bK7dEpL5PK6lLByfBi/sI
	/o6SP7MBirNM1hSPPyp+iMOfnWX3hsr/CzYvwE6/cjpyBSIgXgTQYnFZkcBNEcFsEgWHd66dHiDU7
	7COVwFDKjTdVyJRUGB06aiH7+9G5HXjkWNeOJ8uuGE09mAb77WXYGMBRzvKM/DDZVuvyRo2vDjObw
	rFzRyt32hXomwNpc9J6Gko47uktEP8xMHMyVPyNQO7o5oDbFObSQndZLtC68Tfkfdj8MxEd2n0wg0
	wgPbFDRiXoIrbOpYFcBjh0+b+S1/BL7XzMzO7mJEBe6a4uBfomRg8kD6q8MZdFozefdqDdWZRWU2T
	qtpVkMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEtm-0000000GmVW-3r9o;
	Thu, 05 Dec 2024 16:40:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEpF-0000000GlpL-2hhD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:35:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41ECC1063;
	Thu,  5 Dec 2024 08:36:05 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CD9A3F5A1;
	Thu,  5 Dec 2024 08:35:35 -0800 (PST)
Date: Thu, 5 Dec 2024 16:35:33 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <arm-scmi@vger.kernel.org>
Subject: Re: [PATCH V5 0/2] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z1HWVfIS-w0OXQHl@bogus>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115011515.1313447-1-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_083537_723429_3EBB6644 
X-CRM114-Status: GOOD (  19.67  )
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

On Fri, Nov 15, 2024 at 06:45:13AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling)
> through a mixture of pre-determined algorithm strings and param_id
> pairs hosted on the SCMI controller. Introduce a client driver that
> uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> to detect memory latency workloads and control frequency/level of
> the various memory buses (DDR/LLCC/DDR_QOS).
> 
> QCOM SCMI Generic Vendor protocol background:
> It was found that a lot of the vendor protocol used internally was
> for debug/internal development purposes that would either be super
> SoC specific or had to be disabled because of some features being
> fused out during production. This lead to a large number of vendor
> protocol numbers being quickly consumed and were never released
> either. Using a generic vendor protocol with functionality abstracted
> behind algorithm strings gave us the flexibility of allowing such
> functionality exist during initial development/debugging while
> still being able to expose functionality like memlat once they have
> matured enough. The param-ids are certainly expected to act as ABI
> for algorithms strings like MEMLAT.
> 
> Thanks in advance for taking time to review the series.
> 
> V4:
> * Splitting the series into vendor protocol and memlat client.
>   Also the move the memlat client implementation back to RFC
>   due to multiple opens.

Sorry if I missed the rationale for the split here from the previous
discussions, but I would like to see the DT bindings if any for all the
users first before I can merge this. I am happy to get this series reviewed
independently but my views might change looking at how it will be used as
I might get better idea looking at the users. I really don't like the
interface as well as the DT bindings that might be enforcing us to define.
I have given my initial comments there.

No need to respin it together immediately or even in future as along as
there is a reference for me to look at.

--
Regards,
Sudeep

