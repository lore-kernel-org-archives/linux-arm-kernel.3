Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14872D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ1qGcqrF9lKc9sQ8lIMjGFhM08aTV7SeBmpsBe/Ft4=; b=NK8qhusoJTKuYe3l1VAAE7hOZm
	oB30uNhfqhpM4fQCFFCpLGUnMgspsy7xgXXycubStT4NfLdLjynNXC0XzdC1cFX+ru7Lhq6BZWmUF
	AvyT/fU5v3lqtqqLq92kFeEsNPGe7QuZHIfrO+o94l3HrPeBfw+ykMy2Nur0yuW+LRhJVha+PBusd
	kEymD2G+Ll+r5wLNIcDWmkBqzLifLeGWRi887YVir6yB/jOq+/xGGmqRS38QecbAoErdAOo48WEit
	xrehTxGjFcIzktT1cZo0qZ+khyb5vxdLZaJo5lwyOiCZaaqObwd0v+FPHkpntv+OuALfHZxTb2N0x
	lFnpDocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LB1-0000000A6i5-1IsQ;
	Mon, 28 Oct 2024 08:32:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L9R-0000000A6V9-03xF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 08:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oJ1qGcqrF9lKc9sQ8lIMjGFhM08aTV7SeBmpsBe/Ft4=; b=nL68m2PdOhdqa/A322ZKIzncfD
	FowPb7mO1fCYEriUky2YaBp2voO++mK1UfM8r7dEaxcgsJb/LsesmL399PSQSFhbQkEWQYZEi7QYE
	vexT2/2EPBT/6MyZiEwQ9NBm4GWuB6du+3sKEuu0k//l4SdgWVFzhq90MraU3og4C9FC91VU1frbm
	0XBGtNs1qHTn3qmdXWw+sSmcOinJ9CbaTBblMfTeS3PywMjK3NgxusUhzNeodU8uh1U5C3ufufo0b
	po2j4tq0gU4MHWJ3wcUpeUv5LXD2f3OcqZxmKvqZ5qzeED+KqmN+HLsMBfcrW6KWeMvZt9vrIDGK6
	6voslnHQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L9N-00000009bUm-2Wql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 08:30:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECFA7497;
	Mon, 28 Oct 2024 01:31:23 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E64A3F66E;
	Mon, 28 Oct 2024 01:30:51 -0700 (PDT)
Date: Mon, 28 Oct 2024 08:30:44 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <Zx9LtHqjGEytU5kA@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_083057_861559_547C864E 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> 
> 

Hi Sibi,

one more thing down below...

> On 10/7/24 23:27, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> > > Introduce a client driver that uses the memlat algorithm string
> > > hosted on QCOM SCMI Generic Extension Protocol to detect memory
> > > latency workloads and control frequency/level of the various
> > > memory buses (DDR/LLCC/DDR_QOS).

[snip]

> > > +		}
> > > +		info->memory[info->memory_cnt++] = memory;
> > > +
> > > +		do {
> > > +			snprintf(name, sizeof(name), "monitor-%d", memory->monitor_cnt);
> > > +			struct device_node *monitor_np __free(device_node) =
> > > +				of_get_child_by_name(memory_np, name);
> > > +
> > > +			if (!monitor_np)
> > > +				break;
> > > +
> > > +			if (memory->monitor_cnt >= MAX_MONITOR_CNT)
> > 
> > Why do you need to limit it? Is it a protocol limitation or an
> > artificial driver limitation? Can monitors be allocated dynamically?
> 
> Yeah, they are limited to a max of 5 in firmware.

Similarly as I already commented elsewhere, in an SCMI-based platform
this is something you should be able to discover at run-time with a
query command of some kind (or using some bits of the existing cmds)
....so that you dont have this dependency on constants defined and
built into the platform fw....what if your fw evolves to allow more
monitors ?

Thanks,
Cristian

