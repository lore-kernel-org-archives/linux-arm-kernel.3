Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D026E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjXm7/mLl7FF0FGB7AAJEW5P+kixFDho+l77yWcWN3Y=; b=jBg9a9EPIJl5J1bQN4wc6pMceu
	ZfybPPC8XVW6sTE9BGBSCWUy2tzcrQeOFZff8jQzVz1/q2pTTf++BPMwgP04Fw9z/n+kUH/45T8aK
	ozwuIV5vV9RsX9UU+oSb22tJzA0xed/q4+RgnQXddTuEEZ5yvyYj8so74typ+WgmZmo8b7dTSLHlH
	tcujKy7byAODHhOWrx6dY7gGqTX4d4lZTYYhsr2p7a/HKiQBFjaicep2yrQk7/1CD9smzczTzknvM
	zYBfn4eVgaqhoJRD9Aj6BTuZf6povgC02gxTb6w3s3MAgTMGJ2VgoIhak298v8UMdQoARXfmTBJVg
	k/7lp68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJECh-0000000Gdn4-2zqL;
	Thu, 05 Dec 2024 15:55:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEAB-0000000GdQW-0fvI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:53:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 786971063;
	Thu,  5 Dec 2024 07:53:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3CDF3F5A1;
	Thu,  5 Dec 2024 07:53:08 -0800 (PST)
Date: Thu, 5 Dec 2024 15:53:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <arm-scmi@vger.kernel.org>
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Z1HMYt8kQ72rRMZ0@bogus>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115011515.1313447-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_075311_290236_077D171A 
X-CRM114-Status: GOOD (  28.26  )
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

On Fri, Nov 15, 2024 at 06:45:14AM +0530, Sibi Sankar wrote:
> Add QCOM System Control Management Interface (SCMI) Generic Vendor
> Extensions Protocol documentation.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v4:
> * Update the protol attributes doc with more information. [Cristian]
> 
>  .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
>  1 file changed, 211 insertions(+)
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> new file mode 100644
> index 000000000000..141bc932e30f
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> @@ -0,0 +1,211 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +===============================================================================
> +QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
> +===============================================================================
> +
> +:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> +
> +:Author: Sibi Sankar <quic_sibis@quicinc.com>
> +
> +SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
> +==================================================================================
> +
> +This protocol is intended as a generic way of exposing a number of Qualcomm
> +SoC specific features through a mixture of pre-determined algorithm string and
> +param_id pairs hosted on the SCMI controller. It implements an interface compliant
> +with the Arm SCMI Specification with additional vendor specific commands as
> +detailed below.
> +
> +Commands:
> +_________
> +
> +PROTOCOL_VERSION
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x0
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++---------------+--------------------------------------------------------------+
> +|Name           |Description                                                   |
> ++---------------+--------------------------------------------------------------+
> +|int32 status   |See ARM SCMI Specification for status code definitions.       |
> ++---------------+--------------------------------------------------------------+
> +|uint32 version |For this revision of the specification, this value must be    |
> +|               |0x10000.                                                      |
> ++---------------+--------------------------------------------------------------+
> +
> +PROTOCOL_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x1
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |Bits[31:16] Reserved, must be to 0.                        |
> +|                  |Bits[15:8] Number of agents in the system                  |
> +|                  |Bits[7:0] Number of vendor protocols in the system         |
> ++------------------+-----------------------------------------------------------+
> +
> +PROTOCOL_MESSAGE_ATTRIBUTES
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x2
> +protocol_id: 0x80
> +
> ++---------------+--------------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 attributes |For all message id's the parameter has a value of 0.       |
> ++------------------+-----------------------------------------------------------+
> +
> +QCOM_SCMI_SET_PARAM
> +~~~~~~~~~~~~~~~~~~~
>

I can understand the missing description for the above commands, but for the
list below, no. What does QCOM_SCMI_SET_PARAM do exactly ? All I can
understand is the syntax of the interface with below details. What is the
algorithm string ? Is it fixed or choice of the caller ? If fixed, can we
have that list here ?

> +message_id: 0x10
> +protocol_id: 0x80
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 ext_id     |Reserved, must be zero.                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 param_id   |Serves as the token message id for the algorithm string    |
> +|                  |and is used to set various parameters supported by it.     |

And how is it related to the algorithm string ? Sorry details please. Based on
the quality firmware we have seen so far, I will be more pedantic, you need to
be patient to make any progress and I don't want to deal with the Qcom
firmware mess with all these. I will make you specify every single detail and
the code will just be compliant with that. Anything else will be firmware bug
that needs to be fixed in the firmware. Sorry, I don't see any other approach
will make anyone's life easier here.

> ++------------------+-----------------------------------------------------------+
> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
> +|                  |algorithm string pair.                                     |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
> +|                  |by the chosen algorithm string.                            |
> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> +|                  |matches.

So there is a fixed list from the above statement IIUC. So kindly list them
here in this document. I may need to follow the last version but I would
prefer you to explicitly mention how is the MEMLAT protocol in the previous
version gets used here ? I just can't understand that from these description.

> +
> +QCOM_SCMI_START_ACTIVITY
> +~~~~~~~~~~~~~~~~~~~~~~~~
> 

What is this activity ? How will the firmware know what is that ? All possible
details please if there are all hidden in the buffer too.

-- 
Regards,
Sudeep

