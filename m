Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D688CD690E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 07:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ol63r8yl5MaoQoPER9XPF0aTM0VUuk4PbGX6OycVC4=; b=AtkA9FoYl7dFDC54tlfNBO1Y/+
	oqqAZcQS0Nn/vVnrKwlXdNFLF4v/l3KSCxdmiZX418knsGENko6BeiTrl9BLQ7/Np7HDOtIU8IzKu
	LHxaAIEyAxWl21yHGzkCFtb5OAnchtCUs6wKPV2DT2DFdKvv4x0WZ+9ANYpXmrYM39v827QbTnxhp
	tEm/vDgvq284+TP4GA0a/W2b+wgg5HMq3f0yGjZJ24vYoCOsxaGRR7XLxzuJsgzjXkundIuaftQ53
	0mrJ2DUnN62vwxwrVy6rLffowkOhlixuGl03r64Fct5uCTMmczmr9gu2zIq5zNLLEeEx0beDYi0+I
	Nl3DTpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYbK-0000000ErFb-1mOF;
	Thu, 28 Nov 2024 07:06:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYaL-0000000Er82-27Eo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 07:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94F3E5C589B;
	Thu, 28 Nov 2024 07:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C63C4CECE;
	Thu, 28 Nov 2024 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732777508;
	bh=7p+kHIRd9QfLV7LfyNqKeWEEDS7FxPWKIAszTfZZYCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k8dJF6vt+nvtVR7W/pw6Ko8I8PmwLUo3s25IqjYTtWPcAZDsmQfzl9Rpl465Jntlv
	 OCi9x39sxVgL1GqUMpcuc53ylIC9T0c30Sjw4G2P91LM9eOU36peElmwi4ZWHBYnkv
	 WOjxGkZba77tP5U29PZjJXsTNW9ux0mW54zZMg9K8SHWY0Sd7nlpPkHRyIhDD3WLmZ
	 BtmqRUAmocnUHdtrZzWhhrD8RJe7MQS/jSis15moq1XxtkM10H6Q0lf5aU/ayo1pDp
	 F9naLE/LhjJ581iSPpm/s+1TRcZjzy7Rcbkg27xVS1cgVaqA1s0RDrX97S1JGihwNS
	 WDBQK3eeFkJDg==
Message-ID: <ffca115a-4c7e-4583-9da5-225587c41043@kernel.org>
Date: Thu, 28 Nov 2024 08:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-5-quic_vikramsa@quicinc.com>
 <a51b99a3-bfa3-42d7-ba6e-fed5b2c25646@kernel.org>
 <44dfaa83-b1b5-4bb9-908a-2409ae46c6fc@kernel.org>
 <993cea98-24bc-4f86-835f-099c5009c3b8@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <993cea98-24bc-4f86-835f-099c5009c3b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_230509_633619_01BEE439 
X-CRM114-Status: GOOD (  17.08  )
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

On 27/11/2024 21:33, Vikram Sharma wrote:
> Hi Krzysztof,
> 
> Thanks for your comments.
> 
> I used below tools on my changes and here are the results.
> 
> 1) checkpatch.pl :
> /scripts/checkpatch.pl 
> patches_camss_v6/v6-0001-media-dt-bindings-Add-qcom-sc7280-camss.patch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #18:
> new file mode 100644
> total: 0 errors, 1 warnings, 415 lines checked
> NOTE: For some of the reported defects, checkpatch may be able to
>        mechanically convert to the typical style using --fix or 
> --fix-inplace.
> patches_camss_v6/v6-0001-media-dt-bindings-Add-qcom-sc7280-camss.patch 
> has style problems, please review.
> NOTE: If any of the errors are false positives, please report
>        them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> For maintainer related warnings I cross-checked that MAINTAINERS are 
> already updated properly.
> Patch 2,3, 4 had zero errors and warnings.
> Patch 5 have same Maintainer Warnings.
> 
> For DT validation i am using these tools as per below link:
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> 
> 2) dt_binding_check :
> touch Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> result:
> *make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml 
> dt_binding_check*
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> */local/mnt/workspace/k2c_build/vikram/v6_submit/linux-next/Documentation/devicetree/bindings/net/snps,dwmac.yaml: 
> mac-mode: missing type definition -> Not related to this change.*
>    CHKDT   ./Documentation/devicetree/bindings
>    LINT    ./Documentation/devicetree/bindings
>    DTEX 
> Documentation/devicetree/bindings/media/qcom,sc7280-camss.example.dts
>    DTC [C] 
> Documentation/devicetree/bindings/media/qcom,sc7280-camss.example.dtb
> 
> 3) CHECK_DTBS:
> result:
> touch arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> touch  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> 
> *make CHECK_DTBS=y qcom/qcs6490-rb3gen2-vision-mezzanine.dtb*
>    DTC [C] arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb
>    DTC arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtbo
>    OVL [C] arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
> 
> To confirm if my tools are working properly. I tried inducing errors too.
> Till this point there were no issues reported by tools.
> 
> As per your comment I have added 'W=1' which gave 1 warning.
> arch/arm64/boot/dts/qcom/sc7280.dtsi:4429.24-4597.5: Warning 
> (simple_bus_reg): /soc@0/camss@acaf000: simple-bus unit address format 
> error, expected "acb3000"

This is the warning which we are not suppose to remind you more than once.


> 
> Till this point I missed to add 'W=1' as I was following the blog.  I 
> will address that and submit v7

Blog is just short instruction, you should refer to SoC maintainer
profiles in Linux kernel.



Best regards,
Krzysztof

