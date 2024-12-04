Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E59AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieRLgjWf1f4VVJw0EwulfthB9XK2KV62XPC6h8BQG5k=; b=a/o2UXNLk3GIv/0KMe2ZLPywqV
	oWiue8bfJRIq5kG6O519ISAXsuCCeBwGYBKUH2mzSx3lHBkCfqmcepNDZmR80Vy+JridlMPlpIm+F
	94svvoN7ZDjdTGlX+G2rmhW19VLErdZXslWrheCOypkjBpPtUVk4MexBTgYRgZ8WcMXjbg6HVEh4m
	wYgst/DSfq8Mry8BJVLW+kJWXvN72eO4fa6lGhLGGwmQ8mO3zTc/aiR7ankGVUywYcCVx2NrGDC3Q
	/57xOk2MIkNTM1NyDo7ReZDgu5wHlok9kP96oksOrQRk01THLIcXj0fr9SbEMSWHQac+waOdCsU8G
	Vmyp86ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInt3-0000000CRF3-46Js;
	Wed, 04 Dec 2024 11:49:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tInry-0000000CQqz-3zpg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 11:48:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DA49FEC;
	Wed,  4 Dec 2024 03:49:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3B73F71E;
	Wed,  4 Dec 2024 03:48:35 -0800 (PST)
Date: Wed, 4 Dec 2024 11:48:26 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Z1BBirNWH1eaSKtr@pluto>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115011515.1313447-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_034839_087053_2B7A2ECF 
X-CRM114-Status: GOOD (  21.96  )
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

Thanks of clarifing this....may I ask why number of agents is reported
here too given that it is already exposed by Base protocol ?

Not really arguing about this so much, but you will end up having to maintain this
on 2 different protocols fw side...or are they not 'agents' in the SCMI meaning ?

Anyway, I'm fine with it, even though you dont seem to use this
anywhere.

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
> +
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
> +|                  |matches.                                                   |
> +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
> +|                  |is rejected by the algorithm string.                       |
> ++------------------+-----------------------------------------------------------+
> +
> +QCOM_SCMI_GET_PARAM
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x11
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
> +|uint32 param_id   |Serves as the token message id for the algorithm string.   |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buf[]      |Serves as the payload and store of value for the specified |
> +|                  |param_id and algorithm string pair.                        |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
> +|                  |by the chosen algorithm string and the result is copied    |
> +|                  |into buf[].                                                |
> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
> +|                  |matches.                                                   |
> +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
> +|                  |is rejected by the algorithm string.                       |
> ++------------------+-----------------------------------------------------------+

..missed this last time...so you should add here also a field describing
the reply buf right ? (as it happenns really in your code) something
like:

 ++------------------+-----------------------------------------------------------+
 +|uint32 buf[]      |Holds the payload of the result of the query.	 	 |
 +|                  |					                         |
 ++------------------+-----------------------------------------------------------+

Thanks,
Cristian

