Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E62C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKk5HSODtzWG1q/kzCrFVN4waV5AhaqyYTRb9Wd9pBA=; b=G6GdASW19fJYnuy2Ch4iydOaBf
	abQ9gG3G4evTJks3vyVR9qY/RZI5kTr/UqgUokyfzsPtNNffovLCYmeD3nJcZ49dEONUy0+piDUTL
	ouGTkDsO5kToFROsonwOSMVNQk5rvag2hFCUlmYDB83AD7bv57gHA9nHQjJGb2J7VcbZ+4ZyeRAPO
	d9jV79Gdy7EkuSBGSfB61QlFMkoY3KYThjLre5qKBr9/BWQTVGcO9nLcF7zYfbjaR4zgG0YyqcpVR
	r4IBuPKKPsLOkoYsSGpsYwE70FFIUdRqm4yhwZjx6lbsMyq2tfG1Lwmha+6WOf27zgSupB+FtEIv5
	NFpSS2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPf-0000000DV07-1OPw;
	Fri, 11 Apr 2025 11:19:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BXw-0000000DNh3-13Aa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:23:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9602761135;
	Fri, 11 Apr 2025 10:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC98C4CEE2;
	Fri, 11 Apr 2025 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744367019;
	bh=CeBdzRV91w3LrNeyTj22CoKGG0an90zsDGxRfFa9lXY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DQk5wyKgHVSXrUJHlHibUyuAVoAYSiapJvVn0MwGJ0YB4bN9quCCmjrwvTbyFPRyN
	 lLUCOXFd0bSAM/0kqK1DcqIH88t0awfJMPOJMoC3jl/kc5lOJZm4SdQl3WHSzz+e7W
	 xayICKeqKYCLAO5794cymNMeRCtBzrBOYJp91/7JCIHpJfcLgOT076WYGsiQ6ZqJm+
	 quW6BaZoML7nuzumD5R8PVUtQ4KpP5Q0wp1h2YDdFEV/lXsB7aG00vdE99kDof4b51
	 VNkD8jer7Q4lxS+sWFSO6wFf42SRc+YG2j39gqPSxDsTou879G+zaCztbcf9dYHGZr
	 ZjImiiv2qJLrQ==
Date: Fri, 11 Apr 2025 05:23:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 kernel@oss.qualcomm.com, coresight@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 linux-arm-kernel@lists.infradead.org
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250411-trace-noc-v3-1-1f19ddf7699b@quicinc.com>
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-1-1f19ddf7699b@quicinc.com>
Message-Id: <174436701568.2577511.18034852387802198634.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add device Trace Network On
 Chip definition
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


On Fri, 11 Apr 2025 16:57:52 +0800, Yuanfang Zhang wrote:
> Add a new coresight-tnoc.yaml file to describe the bindings required to
> define Trace Network On Chip (TNOC) in device trees. TNOC is an
> integration hierarchy which is a hardware component that integrates the
> functionalities of TPDA and funnels. It collects trace form subsystems
> and transfers to coresight sink.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.example.dtb: tn@109ab000 (qcom,coresight-tnoc): reg: [[0, 278573056], [0, 16896]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250411-trace-noc-v3-1-1f19ddf7699b@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


