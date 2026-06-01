Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454ACCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DND/VxlREnIMV/BHBmA7o3UorgoYPAYDa9JA71INeWY=; b=RtE1NKWhBznKMbUlCR9LMqqdN/
	7Jgvc6vJefuu3wFhV2NDCaV1Bd2zt4w5VFXNmP9XrQV1uBrbtGidUT40vlqEfxFv3XLTx/zUUNvyv
	y6zo8dtJWQNz5uJkLdzXIFCrooafbEgpUUzAHS7CoigixDhjyAkPm6CS9ohR5umZyf7uWS2BnsPdN
	mngBxOXTgydMIQhtsgOIcKf0wSH8gMoUrFHW1BAMB96Y4Uh9sDa33MWLvqjksCCFjkFjxSM7MN7Fb
	V4ETD7pizRDPpwQ3izbwRM0vqlMZoJFbg7OBRtROt+oluwb2bhISPmxBqVmGdII6SgBYk0RALCqgd
	e+hcOHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0C8-0000000AekH-0Frn;
	Mon, 01 Jun 2026 10:48:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0C6-0000000Aejy-40WA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DND/VxlREnIMV/BHBmA7o3UorgoYPAYDa9JA71INeWY=; b=G90FabTJVApzqe650va42nsXw2
	DGOia66ZkkkiWkclF72XbAVt4g+7Hk2t5Q9S24PE7AW5R9D+pFLikz3e6m+U7dLZX7QurRGKghJFa
	0WhyOUq4Nbf1+4Pa6Bxpxp49RSP2LMTTG/dCoDbC+zqIC+4B2PfwHlI2Ey/e1zJCJKv7e0Uf1Wp+2
	fK6L3esSECgSqE3/9hkLPIzyU6jpDiBZdNot+fE4gr8B+w8m3XfQXBmKSunlaNOgQhslEjqJwdKW2
	ywO5HqLhYIKYjuX/DVxEsIPPxCNkWNZsBGn8abpCMhdZqziNUIbIonyVPHXXiiBuRfaTQxGuylYY6
	IJ31VDPQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0C3-00000006S7z-0zBD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:48:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D7C1176B;
	Mon,  1 Jun 2026 03:48:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D2023F905;
	Mon,  1 Jun 2026 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780310905; bh=vq7v/eZo0978WXJgs9YTv2H2GgZImRyHXcQrp2ees5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pAJIFqJhF/tTwSYuujWia2xGW7MdCs5MYXG9HuSEV7fVkdK6ORU1xbE6eJluGBQik
	 V39B9fMAurHhqpKyTseAABX2HThb5zRLI/vb6myCiA0OMICZyYYjUqEAyllxMOpGN+
	 Uw31s4wnFLwOfftaFrkGXTEruaAhyOiO4EOAokoY=
Date: Mon, 1 Jun 2026 11:48:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Message-ID: <20260601104821.GM101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
 <20260529153200.GL101133@e132581.arm.com>
 <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_114828_130289_F2C0E574 
X-CRM114-Status: GOOD (  13.50  )
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

On Mon, Jun 01, 2026 at 10:08:55AM +0800, Yingchao Deng (Consultant) wrote:

[...]

>   I noticed that among the new sysfs knobs in this series, the
>   integration test registers (ittrigin[1-3], ittrigout[1-3],
>   ittrigoutack[1-3], ittriginack[1-3]) have no existing documentation
>   for their base (index-0) counterparts, which were added long before
>   this series.

Ah, thanks for pointing out the missed piece!

>   Two options for patch 5/5:
> 
>     (a) Document only the knobs whose base versions are already
>         documented (triginstatus[1-3] and trigoutstatus[1-3]).
> 
>     (b) Document everything in patch 5/5 — both the new indexed
>         variants and the previously missing base IT register entries.

Please use option (b). Could you fold the code piece below into patch 5?

Note, we cannot merge ittrigin and ittrigin[1-3] into a single entry
because they were introduced in different kernel versions.

@Mike, if any chance you could give a review on this?

---8<---

--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -134,6 +134,60 @@ KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of output trigger signals.
 
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itctrl
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Control integration mode.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchin
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the values of the CTCHIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchinack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Write) Write the value of the CTCHINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the values of the CTTRIGIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Write) Write the value of the CTTRIGINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchout
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Read or write the value of the CTCHOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchoutack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the value of the CTCHOUTACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Read or write the value of the CTTRIGOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the value of the CTTRIGOUTACK input.
+
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
 Date:		March 2020
 KernelVersion:	5.7

