Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E5C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Arr9fq/9qWdnW8VVEWTYJts59x5v3GrH8ffIDWrEkb8=; b=MNUD0Pmvw1oXmb3p8brKZKWezh
	jLPh91xrrL5FavDYe6tKbH2Y6ZfKBT/bjztYv0LvZNn/Y57Eu+W+W+SI+H9S/z78uoJY6kX9ncrPF
	OtA41zfpw8GEvpgNjEkf658MajO1XVzFTb5Fc6xw3jSAW20CEbCGX7TlzrTPgfbypM9xZzExsFl0D
	SLm/EuD7MWwYJ4m35lOnmCJD76BNjMQQVWvFmw3qx/1uBPdOzLpHsdYlQMYOHCa4RROD0O9aMJgBq
	VBUTsBKUnxUd7mWFSVqPRiX8WNUQwHu8geJ5iwP8+OADuCVdHcHCWEHqi9egaVwiKhawl0my9VpoQ
	mr0bEa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDc8-00000001TNc-2gU5;
	Mon, 14 Jul 2025 07:28:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCwd-00000001OEQ-0TYM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4234444131;
	Mon, 14 Jul 2025 06:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E441C4CEED;
	Mon, 14 Jul 2025 06:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752475546;
	bh=Qy1hfqEo2dMgMv0YIqJ7mPsIFK2YG8agMEQFgBf9GCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRvj2oObA6+JGOF4oIOjLEOKy+uoSWaXh5DELylrWEk4SoiumxqOXvVtQX4eRZAO7
	 XTJSjWGErNxiF2JDcd1ZsrtprHphsXbd74GpHtv2jkmjiSBNXylRjG2LY2r6mv22Vc
	 oqamtRF8KJWqfmmut8fm37FF2hb+HQrGO83xiEz8EAxa726EzOXXBfYtDiSLk92UTR
	 OIvRIJDdJ52NaJIk0beldr+KdhC23hdp8ckuG0PIxQHcxAOOcfd4or6QBNya7Kkfov
	 5FWurEZP8iK1OJRFay50oll0n4j3GZ3NGA3VYfaLEMT35mAD7uPOuo+IvoQDTiWN6D
	 XAfw6xU1LZhNw==
Date: Mon, 14 Jul 2025 08:45:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
Message-ID: <20250714-impressive-spiked-chicken-9fe06e@krzk-bin>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
 <20250711094031.4171091-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711094031.4171091-2-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_234547_207989_7E4B1F06 
X-CRM114-Status: GOOD (  18.06  )
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

On Fri, Jul 11, 2025 at 02:40:27AM -0700, Mao Jinlong wrote:
> Add new coresight-qmi.yaml file describing the bindings required
> to define qmi node in the device trees.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-qmi.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> new file mode 100644
> index 000000000000..601c865fe4d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-qmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm coresight QMI(Qualcomm Messaging Interface) component
> +
> +description: |
> +  Qualcomm Messaging Interface (QMI) is an interface that clients can
> +  use to send, and receive, messages from a remote entity. The coresight
> +  QMI component is to configure QMI instance ids and service ids for different
> +  remote subsystem connections. Coresight QMI driver uses the ids to init

So driver... Driver stuff is not accepted in the bindings.

> +  the qmi connections. Other coresight drivers call the send qmi request
> +  function when connection is established.
> +
> +maintainers:
> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,coresight-qmi

Don't send new versions while discussion is still going.

There is no need for this binding at all, it is not a coresight device.

> +
> +patternProperties:
> +  '^conns(-[0-9]+)?$':

Drop, why do you keep enforcing the node names? Look at other bindings.


Best regards,
Krzysztof


